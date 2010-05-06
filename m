From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Thu, 6 May 2010 17:56:38 +0100
Subject: [Buildroot] Commit "Remove BR2_GNU_TARGET_SUFFIX and compute
	GNU_TARGET_NAME"
In-Reply-To: <20100506180631.3333594c@surf>
References: <i2h32a6c48b1005060824nb4df8741p655241e4ce1b0f7e@mail.gmail.com>
	<20100506180631.3333594c@surf>
Message-ID: <l2j32a6c48b1005060956vd07c3636u1e6105bcc2b5466c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 6, 2010 at 5:06 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> On Thu, 6 May 2010 16:24:58 +0100
> Quotient Remainder <quotientvremainder@gmail.com> wrote:
>
> >
> http://git.buildroot.net/buildroot/commit/?id=65e80a0b0bf275e0ffdbb611706bec4b1b4719b1
> >
> > This patch would seem to prevent Codesourcery toolchains from working.
>  They
> > use "arm-none-linux-gnueabi-*" (no $(LIB) part).
> > I suppose you can't take everyone into account but was just curious to
> know
> > if this was taken into account.
>
> The GNU target name is distinct from the toolchain prefix. For external
> toolchains, the toolchain prefix is still configurable using the
> BR2_TOOLCHAIN_EXTERNAL_PREFIX configuration option.
>
> If you have any issue, could you post the corresponding build log
> and .config file ?
>
>
The problem occurs at the configure stage of gdb (target):

checking build system type... i686-pc-linux-gnu
checking host system type... Invalid configuration
`arm-unknown-linux-glibcgnueabi': machine `arm-unknown-linux' not recognized

This is passed from the gdb.mk file to ./configure using the
REAL_GNU_TARGET_NAME variable, which gets its value from GNU_TARGET_NAME, as
calculated by the patch I'm highlighting.
Maybe this should be made conditional on not using an external toolchain?

I will provide .config and build output if required but don't think it is
necessary, let me know if I am wrong on this.  (Also is an attachment OK?
 .config is over 14 KiB).
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100506/af076517/attachment.htm>
