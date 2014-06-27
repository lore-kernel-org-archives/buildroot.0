From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 27 Jun 2014 13:04:01 +0200
Subject: [Buildroot] [PATCHv2] bmon: bump to version 3.2
In-Reply-To: <1403805999-3011-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 26 Jun 2014 15:06:39 -0300")
References: <1403805999-3011-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8761jmmx5q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > And add license information, homepage and switch upstream source.
 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/bmon/Config.in          | 14 +++++++++++---
 >  package/bmon/bmon-curses.patch  | 26 --------------------------
 >  package/bmon/bmon-gcc4.patch    | 36 ------------------------------------
 >  package/bmon/bmon-nolibnl.patch | 24 ------------------------
 >  package/bmon/bmon-nostrip.patch | 12 ------------
 >  package/bmon/bmon.mk            | 23 ++++++++---------------
 >  6 files changed, 19 insertions(+), 116 deletions(-)
 >  delete mode 100644 package/bmon/bmon-curses.patch
 >  delete mode 100644 package/bmon/bmon-gcc4.patch
 >  delete mode 100644 package/bmon/bmon-nolibnl.patch
 >  delete mode 100644 package/bmon/bmon-nostrip.patch

 > diff --git a/package/bmon/Config.in b/package/bmon/Config.in
 > index 9f0dfa7..6aeca54 100644
 > --- a/package/bmon/Config.in
 > +++ b/package/bmon/Config.in
 > @@ -1,10 +1,18 @@
 >  config BR2_PACKAGE_BMON
 >  	bool "bmon"
 >  	depends on BR2_INET_IPV6
 > +	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 >  	depends on BR2_USE_MMU # fork()

It no longer uses ipv6 or calls fork(), so these can be dropped (but it
fails to link statically as libnl doesn't pull in -lpthread).

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
