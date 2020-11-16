From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 17:19:13 +0100
Subject: [Buildroot] [PATCH] package/openntpd: needs host-bison
In-Reply-To: <b1b574df250b1e34cd750b809a8409b9b182f51e.1605525509.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 16 Nov 2020 13:18:29 +0200")
References: <b1b574df250b1e34cd750b809a8409b9b182f51e.1605525509.git.baruch@tkos.co.il>
Message-ID: <87a6vh5l6m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Build fails when no yacc alternative is installed.
 > Fixes:
 > http://autobuild.buildroot.net/results/1ba8e339cbb5646663d0bf4e158d89e54433b242/
 > http://autobuild.buildroot.net/results/a00a53d6635c64e72c50d4841658155de5380110/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 >  package/openntpd/openntpd.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
 > index f2eaee7efd46..9076f3ddda4e 100644
 > --- a/package/openntpd/openntpd.mk
 > +++ b/package/openntpd/openntpd.mk
 > @@ -8,6 +8,7 @@ OPENNTPD_VERSION = 6.2p3
 >  OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
 >  OPENNTPD_LICENSE = MIT-like, BSD-2-Clause, BSD-3-Clause
 >  OPENNTPD_LICENSE_FILES = COPYING
 > +OPENNTPD_DEPENDENCIES = host-bison

Can we not use $(BR2_BISON_HOST_DEPENDENCY) instead?

-- 
Bye, Peter Korsgaard
