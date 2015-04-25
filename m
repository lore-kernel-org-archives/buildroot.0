From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 11:25:27 +0200
Subject: [Buildroot] [PATCH v2 1/1] gtest: update recipe to use autotools
In-Reply-To: <553952BF.1040402@mind.be>
References: <CAHkwnC-cZpP5m5009NiLZM07+t8CFSYVxqTBmNuXEA-x9mGwLg@mail.gmail.com>
 <1429734568-20489-1-git-send-email-casantos@datacom.ind.br>
 <20150422224620.7abefdb2@free-electrons.com>
 <871078529.576418.1429788227635.JavaMail.zimbra@datacom.ind.br>
 <553952BF.1040402@mind.be>
Message-ID: <20150425112527.6c790a91@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Carlos,

On Thu, 23 Apr 2015 22:14:55 +0200, Arnout Vandecappelle wrote:

> # gtest-config is only generated when gtest is built with autotools,
> # so generate it manually here.
> define GTEST_INSTALL_CONFIG
> 	sed 's/@PACKAGE_TARNAME@/gtest/;\
> 		s/@PACKAGE_VERSION@/$(GTEST_VERSION)/;\
> 		s/..../' \
> 		$(@D)/scripts/gtest-config.in \
> 		> $(STAGING_DIR)/usr/bin/gtest-config
> endef
> GTEST_POST_STAGING_INSTALL_HOOKS += GTEST_INSTALL_CONFIG

I've implemented this solution, see commit:

  http://git.buildroot.net/buildroot/commit/?id=39186b5f5ac61c72d4b3d3088b7facbfd739abfa

I test that the generated gtest-config returns sane values, but I
didn't test with a real program using gtest obviously.

Carlos, can you let us know if that works for your use case?

Thanks a lot,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
