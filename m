From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 Mar 2012 21:53:43 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain: add option to enable
	AI_ADDRCONFIG support in uclibc
In-Reply-To: <1331159898-25350-2-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Wed, 7 Mar 2012 23:38:17 +0100")
References: <1331159898-25350-1-git-send-email-s.neumann@raumfeld.com>
 <1331159898-25350-2-git-send-email-s.neumann@raumfeld.com>
Message-ID: <871uoy3lm0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Some packages need ifaddr.h which is only included in uclibc if
 Sven> UCLIBC_SUPPORT_AI_ADDRCONFIG is selected. Make this configurable
 Sven> as a buildroot option so that those packages can select it.

 Sven> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_INET_ADDRCONFIG),y)
 Sven> +	$(SED) 's,^.*UCLIBC_SUPPORT_AI_ADDRCONFIG.*,UCLIBC_SUPPORT_AI_ADDRCONFIG=y,g' $(UCLIBC_DIR)/.oldconfig
 Sven> +else
 Sven> +	$(SED) 's,.*UCLIBC_SUPPORT_AI_ADDRCONFIG.*,UCLIBC_SUPPORT_AI_ADDRCONFIG=n,g' $(UCLIBC_DIR)/.oldconfig
 Sven> +	$(SED) '/.*UCLIBC_SUPPORT_AI_ADDRCONFIG.*/d' $(UCLIBC_DIR)/.oldconfig
 Sven> +	echo "# UCLIBC_SUPPORT_AI_ADDRCONFIG is not set" >> $(UCLIBC_DIR)/.oldconfig

Why the complication and not just something like:

 $(SED) 's,^.*UCLIBC_SUPPORT_AI_ADDRCONFIG.*,#  UCLIBC_SUPPORT_AI_ADDRCONFIG is not set,g' $(UCLIBC_DIR)/.oldconfig

We'll also need to add the option for external toolchains, but I can do
that, thanks for doing the patch.

-- 
Bye, Peter Korsgaard
