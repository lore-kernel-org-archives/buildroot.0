From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Aug 2013 09:56:23 +0200
Subject: [Buildroot] [PATCH 12/12] toolchain: improve mudflap support
In-Reply-To: <521EE7C3.3050003@mind.be>
References: <1377671731-28656-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1377671731-28656-13-git-send-email-thomas.petazzoni@free-electrons.com>
 <521EE7C3.3050003@mind.be>
Message-ID: <20130829095623.75c46268@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 29 Aug 2013 08:18:43 +0200, Arnout Vandecappelle wrote:

> > WARNING WARNING: this currently doesn't result into a working system,
> > even with just Busybox. Busybox init crashes with "/sbin/init: symbol
> > lookup error: /lib/libmudflapth.so.0: undefined symbol:
> > main". According to
> > http://gcc.gnu.org/ml/gcc-help/2008-03/msg00165.html  it is caused by
> > -Wl,--gc-sections (which is used by Busybox), but even after removing
> > it, it still doesn't work. I don't personaly have much interest in
> > mudflap support, so as I couldn't get it to work easily, my suggestion
> > would be to drop support for it entirely, unless someone steps up to
> > fix this issue.
> 
>   I would drop the option to enable -fmudflap globally, but keep the 
> option to build mudflap support in the internal toolchain. As you wrote 
> in another mail, mudflap is a debugging tool and not really a hardening 
> tool like SSP.

I also agree with this. Gustavo, are you fine with this?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
