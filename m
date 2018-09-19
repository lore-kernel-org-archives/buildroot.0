From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Sep 2018 23:00:08 +0200
Subject: [Buildroot] [PATCH 1/1] ipsec-tools: needs host-bison
In-Reply-To: <20180915095906.11558-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 15 Sep 2018 11:59:06 +0200")
References: <20180915095906.11558-1-fontaine.fabrice@gmail.com>
Message-ID: <87o9ctp5if.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Making all in racoon
 > /bin/sh ../../ylwrap cfparse.y y.tab.c cfparse.c y.tab.h `echo
 > cfparse.c | sed -e s/cc$/hh/ -e s/cpp$/hpp/ -e s/cxx$/hxx/ -e
 > s/c++$/h++/ -e s/c$/h/` y.output cfparse.output -- yacc -d
 > ../../ylwrap: line 176: yacc: command not found
 > make[5]: *** [cfparse.c] Error 127

 > Fixes:
 >  - http://autobuild.buildroot.org/results/88c8bba943300df98b428646387c240f4522f40a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/ipsec-tools/ipsec-tools.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
 > index ddae9a75f3..8672272538 100644
 > --- a/package/ipsec-tools/ipsec-tools.mk
 > +++ b/package/ipsec-tools/ipsec-tools.mk
 > @@ -9,7 +9,7 @@ IPSEC_TOOLS_SOURCE = ipsec-tools-$(IPSEC_TOOLS_VERSION).tar.bz2
 >  IPSEC_TOOLS_SITE = http://sourceforge.net/projects/ipsec-tools/files/ipsec-tools/$(IPSEC_TOOLS_VERSION)
 >  IPSEC_TOOLS_INSTALL_STAGING = YES
 >  IPSEC_TOOLS_MAKE = $(MAKE1)
 > -IPSEC_TOOLS_DEPENDENCIES = openssl flex host-flex
 > +IPSEC_TOOLS_DEPENDENCIES = openssl flex host-flex host-bison

Hmm, shouldn't this use BR2_BISON_HOST_DEPENDENCY /
BR2_FLEX_HOST_DEPENDENCY instead?

-- 
Bye, Peter Korsgaard
