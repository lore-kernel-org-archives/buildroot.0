From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 12 Mar 2014 12:56:18 +0100
Subject: [Buildroot] host-fakeroot archive not sourced any more?
In-Reply-To: <532033B2.9030903@freescale.com>
References: <532033B2.9030903@freescale.com>
Message-ID: <CAAXf6LXkv15AhY+2GaBG6pxgs0TpgX3SiY_EQP1Se4X5P2SwDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 12, 2014 at 11:15 AM, Vincent Stehl?
<vincent.stehle@freescale.com> wrote:
> Hi,
>
> FYI it seems buildroot will not source host-fakeroot archive correctly any
> more when told to 'make source', with some configurations.
>
> This behavior can be seen for example on recent commit
> 1ea6d850891bb4d936bcf1bddbf5432b819d5785, with the following commands:
>
>   $ rm -fr ..config.tmp .config .config.old output dl/*fakeroot*
>   $ make qemu_arm_vexpress_defconfig
>   $ make source
>
> In this case, fakeroot_1.18.2.orig.tar.bz2 is not fetched.
>
> After bisect, it seems this behavior started with commit 'a248775 Makefile:
> add support for top-level parallel make'.
>
> A quick fix for 1ea6d850891bb4d936bcf1bddbf5432b819d5785 is to revert, in
> that order:
>
>   cf53e15 Makefile: remove BASE_TARGETS variable
>   fbb3b86 Makefile: ensure system is built ...
>   d4c0c64 Makefile: fix target-finalize rule
>   a248775 Makefile: add support for top-level parallel make
>
> ...and fakeroot archive is downloaded again.
>

Vincent: thanks a lot for the report and the analysis!

Fabio: what is your suggestion here?

Thanks,
Thomas
