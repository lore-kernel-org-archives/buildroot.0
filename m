From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Mar 2012 12:55:21 +0200
Subject: [Buildroot] [PATCH 5/7] psmisc: bump to version 22.16
In-Reply-To: <90ff39765efa093002706980f59b4233@zacarias.com.ar> (Gustavo
 Zacarias's message of "Thu, 29 Mar 2012 19:37:09 -0300")
References: <1332987903-12378-1-git-send-email-gustavo@zacarias.com.ar>
 <1332987903-12378-5-git-send-email-gustavo@zacarias.com.ar>
 <87sjgrdq3g.fsf@macbook.be.48ers.dk>
 <90ff39765efa093002706980f59b4233@zacarias.com.ar>
Message-ID: <87fwcqe4ti.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 Gustavo> +# Don't force -fstack-protector
 Gustavo> +PSMISC_CONF_OPT = --disable-harden-flags
 >> 
 >> We have a BR2_TOOLCHAIN_BUILDROOT_USE_SSP, so we shouldn't disable
 >> if we know the toolchain supports it.
 >> 
 >> Other than that it looks good - Committed, thanks.

 Gustavo> Yes, however the support is incomplete, we aren't copying
 Gustavo> libssp for external toolchains and we're doing
 Gustavo> --disable-libssp for the internal too so it's better to
 Gustavo> disable it altogether until that's fixed (i recall there was a
 Gustavo> bug or email reporting it).

It is true that we don't have SSP support in external toolchains, but
BR2_TOOLCHAIN_BUILDROOT_USE_SSP isn't enabled for those, and for
internal toolchains we do enable the SSP support in uClibc, so those
should afaik be OK.

So I think the commit is OK as is.
-- 
Bye, Peter Korsgaard
