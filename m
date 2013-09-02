From: Gwyll Gwyllin <gwyll@gwyll.eu>
Date: Mon, 2 Sep 2013 19:45:45 +0200
Subject: [Buildroot] host-icu No rule to make target
In-Reply-To: <522428DB.20700@mind.be>
References: <2ACF8D649627456A8677BE38BC2E4484@tux.local>
 <522428DB.20700@mind.be>
Message-ID: <4FDC073976954A55AAB1E76C952F364F@tux.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

thank you for your time.
Mean while i was removed the whole buildroot and i've started a fresh
compile from a different source.
I can not tell the version of this package, but it looks much better. It has
only small errors like couldn't find source package at the given URL ... a
symlink already exists ... etc.

I try this.

Thanks,
Gwyll

----- Eredeti ?zenet ----- 
From: Arnout Vandecappelle
Sent: Monday, September 02, 2013 7:57 AM
To: Gwyll Gwyllin
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] host-icu No rule to make target


  That seems to be a bug in the ICU build system: in
source/stubdata/Makefile the TARGET variable is only assigned to in the
ENABLE_STATIC, so in the other case it inherits from the environment.

>  In that case,
> the compile stops at iproute with this error:
> /bin/sh: xtables: command not found

  Somehow your iproute2 configure failed to find PKG_CONFIG. It seems
that buildroot is missing a dependency on host-pkgconf, but it is anyway
only used for tc which should only be built if iptables is selected and
iptables has a dependency on host-pkgconf.

  Can you check in output/build/iproute2-3.7.0/Configure what is the
value of PKG_CONFIG and of TC_CONFIG_XT? And can you check if
BR2_PACKAGE_IPTABLES is enabled in your buildroot config?


  Regards,
  Arnout
