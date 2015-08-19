From: Jan Viktorin <viktorin@rehivetech.com>
Date: Wed, 19 Aug 2015 15:14:34 +0200
Subject: [Buildroot] [PATCH v1 0/2] Checking whether a certain CONFIG_* is
	set
In-Reply-To: <87lhd98twt.fsf@dell.be.48ers.dk>
Message-ID: <1439990076-10412-1-git-send-email-viktorin@rehivetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

this short patch series introduces a way how to check whether certain
CONFIG_* entries are set to an expected value in a selected .config
file. When building a package that requires a certain CONFIG_* to be
set (as in the case of xtables-addons), Buildroot can either force
to set the config or just error out a message.

I could not find any suitable mechanism for this in Buildroot (if there
is one, please give me a reference) so I propose a simple extension of
KCONFIG_*_OPT util macros. It is then implemented for xtables-addons to
check whether CONFIG_MODULES are set in the Linux Kernel .config.

Regards
Jan Viktorin


Jan Viktorin (2):
  pkg-utils: Define KCONFIG_ASSERT_OPT macro
  xtables-addons: test CONFIG_MODULES=y in the kernel

 package/pkg-utils.mk                     | 5 +++++
 package/xtables-addons/xtables-addons.mk | 5 +++++
 2 files changed, 10 insertions(+)

-- 
2.5.0
