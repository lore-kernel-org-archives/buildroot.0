From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 29 Mar 2012 19:37:09 -0300
Subject: [Buildroot] [PATCH 5/7] psmisc: bump to version 22.16
In-Reply-To: <87sjgrdq3g.fsf@macbook.be.48ers.dk>
References: <1332987903-12378-1-git-send-email-gustavo@zacarias.com.ar>
 <1332987903-12378-5-git-send-email-gustavo@zacarias.com.ar>
 <87sjgrdq3g.fsf@macbook.be.48ers.dk>
Message-ID: <90ff39765efa093002706980f59b4233@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-29 19:01, Peter Korsgaard wrote:

>>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
>
>  Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>
>  Gustavo> +# Don't force -fstack-protector
>  Gustavo> +PSMISC_CONF_OPT = --disable-harden-flags
>
> We have a BR2_TOOLCHAIN_BUILDROOT_USE_SSP, so we shouldn't disable if 
> we
> know the toolchain supports it.
>
> Other than that it looks good - Committed, thanks.

Yes, however the support is incomplete, we aren't copying libssp for 
external toolchains and we're doing --disable-libssp for the internal 
too so it's better to disable it altogether until that's fixed (i recall 
there was a bug or email reporting it).
Regards.
