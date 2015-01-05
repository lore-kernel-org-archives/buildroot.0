From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jan 2015 21:09:11 +0100
Subject: [Buildroot] [PATCH] janus-gateway: add a patch to use
 -Wunused-but-set-variable only when available
In-Reply-To: <20150104174102.GB31970@free.fr>
References: <1420392439-16055-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150104174102.GB31970@free.fr>
Message-ID: <20150105210911.57f282cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 4 Jan 2015 18:41:02 +0100, Yann E. MORIN wrote:

> Granted, for us Buildroot, that has virtually zero-impact, because the
> expanded code would be about the same you wrote. But if we want to
> upstream anything, better be using the state-of-the-art solution. ;-)
> 
> But anyway, why don't you simply write:
> 
>     AX_CHECK_COMPILE_FLAG([-Wunused-but-set-variable],
>         [GCC_WARN_UNUSED_BUT_SET=-Wunused-but-set-variable])
>     AC_SUBST([GCC_WARN_UNUSED_BUT_SET])
> 
> Also, as discused on IRC: add a comment in the .mk stating that
> AUTORECONF is needed because we also touch the autostuff.

Thanks for your comments. I adjusted my patch according to your
comments and applied it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
