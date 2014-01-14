From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 Jan 2014 14:54:37 +0100
Subject: [Buildroot] [PATCH 2/2] package: unification of use $(subst
	[._-], [._-], $(<PKG>_VERSION)) macro
In-Reply-To: <1389695458-19578-2-git-send-email-jerzy.grzegorek@trzebnica.net>
 (Jerzy Grzegorek's message of "Tue, 14 Jan 2014 11:30:58 +0100")
References: <1389695458-19578-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <1389695458-19578-2-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <87fvoqy8gy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jerzy" == Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net> writes:

 > Currently, there are five packages which use 'subst' macro to change their version.
 > * Three of them (ebtables, icu, perl) use this macro "in place" :

 >    EBTABLES_SITE = http://downloads.sourceforge.net/project/ebtables/ebtables/ebtables-$(subst .,-,$(EBTABLES_VERSION))

 >    ICU_SOURCE = icu4c-$(subst .,_,$(ICU_VERSION))-src.tgz

 >    PERL_CROSS_OLD_POD = perl$(subst .,,$(PERL_CROSS_BASE_VERSION))delta.pod
 >    PERL_CROSS_NEW_POD = perl$(subst .,,$(PERL_VERSION))delta.pod

 > * Two of them (boost, libnss) use an additional variable :

 >    BOOST_FILE_VERSION = $(subst .,_,$(BOOST_VERSION))
 >    BOOST_SOURCE = boost_$(BOOST_FILE_VERSION).tar.bz2

 >    LIBNSS_SITE_VERSION = $(subst .,_,$(LIBNSS_VERSION))
 >    LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(LIBNSS_SITE_VERSION)_RTM/src

 > * Additionally two packages (duma, rings) doesn't use it at all :

 >    DUMA_VERSION = 2_5_15
 >    DUMA_SITE = http://downloads.sourceforge.net/project/duma/duma/2.5.15

 >    RINGS_VERSION_MAJOR = 1.3.0
 >    RINGS_SUBDIR  = rings-v_1_3_0

 > This commit makes changes to use 'subst' macro "in place", in all of them.

 > Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
 > ---
 > v2:
 > - add rings package
 > - rebase on master

Committed, thanks.

-- 
Bye, Peter Korsgaard
