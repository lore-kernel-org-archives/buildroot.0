From: Ossy <ossy1980@gmx.net>
Date: Fri, 18 Jun 2010 23:05:31 +0200
Subject: [Buildroot] [git commit master 1/1] uClibc: 0.9.31.config:
 enable UCLIBC_SV4_DEPRECATED option
In-Reply-To: <20100618114218.78624816CD@busybox.osuosl.org>
References: <20100618114218.78624816CD@busybox.osuosl.org>
Message-ID: <4C1BDF9B.7000106@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Maybe it's known, but it is not only SV4_DEPR. I was forced to activate 
"OBSOLETE BSD SIGNALS" too. SV4 is not sufficient for a successful build.

xfsprogs/Config.in:
"Note that xfsprogs needs a toolchain with UCLIBC_SV4_DEPRECATED and 
UCLIBC_HAS_OBSOLETE_BSD_SIGNAL enabled"

uClibc-config:
UCLIBC_HAS_OBSOLETE_BSD_SIGNAL=y

Kind regards,
Marcus

>
 > -# UCLIBC_SV4_DEPRECATED is not set
 > +UCLIBC_SV4_DEPRECATED=y
> Needed by xfsprogs.
>
> Signed-off-by: Peter Korsgaard<jacmet@sunsite.dk>
> ---
