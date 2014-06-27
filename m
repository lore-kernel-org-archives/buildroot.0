From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 27 Jun 2014 13:10:07 +0200
Subject: [Buildroot] [PATCH] radvd: fix build against older glibc
In-Reply-To: <1a59aac7dfd575b3e69757613aec44950b7ebb47.1403854230.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 27 Jun 2014 10:30:30 +0300")
References: <1a59aac7dfd575b3e69757613aec44950b7ebb47.1403854230.git.baruch@tkos.co.il>
Message-ID: <87oaxelib4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > clock_gettime() requires -lrt when linking against glibc older than 2.17.
 > Fixes:
 > http://autobuild.buildroot.net/results/e07/e07dd9a82ae4c8778b6901b9bd777f5affb9293a/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 >  package/radvd/radvd.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
 > index 5958d9145b0f..8d95703a9aab 100644
 > --- a/package/radvd/radvd.mk
 > +++ b/package/radvd/radvd.mk
 > @@ -8,6 +8,7 @@ RADVD_VERSION = 1.13
 >  RADVD_SOURCE = radvd-$(RADVD_VERSION).tar.xz
 >  RADVD_SITE = http://www.litech.org/radvd/dist
 >  RADVD_DEPENDENCIES = host-bison flex libdaemon host-flex host-pkgconf
 > +RADVD_CONF_ENV = LIBS=-lrt

Committed with the description why added just above this line, thanks.

-- 
Bye, Peter Korsgaard
