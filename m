From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Jul 2011 00:45:03 +0200
Subject: [Buildroot] [PATCH v2] libnss: Add new package.
In-Reply-To: <CAFbHwiTz-KPomDTeSsn_s2Ax+YrT=Mo3r_udBs1Aig=Hv1EYrg@mail.gmail.com>
 (Will Newton's message of "Fri, 8 Jul 2011 14:27:30 +0100")
References: <CAFbHwiTz-KPomDTeSsn_s2Ax+YrT=Mo3r_udBs1Aig=Hv1EYrg@mail.gmail.com>
Message-ID: <87tyatwya8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> NSS is the Network Security Services library developed as part of
 Will> the Mozilla project. It provides similar functions to OpenSSL but
 Will> allows MPL, GPL and LGPL licensing.

Committed with minor tweaks, thanks.

 Will> +define LIBNSS_INSTALL_STAGING_CMDS
 Will> +	$(INSTALL) -m 755 -t $(STAGING_DIR)/usr/lib/ \
 Will> +		$(@D)/$(LIBNSS_DISTDIR)/lib/*.so
 Will> +	$(INSTALL) -m 755 -d $(STAGING_DIR)/usr/include/nss
 Will> +	$(INSTALL) -m 644 -t $(STAGING_DIR)/usr/include/nss \
 Will> +		$(@D)/$(LIBNSS_DISTDIR)/public/nss/*
 Will> +	$(INSTALL) -m 755 -t $(STAGING_DIR)/usr/lib/ \
 Will> +		$(@D)/$(LIBNSS_DISTDIR)/lib/*.a
 Will> +endef
 Will> +
 Will> +define LIBNSS_INSTALL_TARGET_CMDS
 Will> +	$(INSTALL) -m 755 -t $(TARGET_DIR)/usr/lib/ \
 Will> +		$(@D)/$(LIBNSS_DISTDIR)/lib/*.so
 Will> +	$(INSTALL) -m 755 -d $(STAGING_DIR)/usr/include/nss
 Will> +	$(INSTALL) -m 644 -t $(STAGING_DIR)/usr/include/nss \
 Will> +		$(@D)/$(LIBNSS_DISTDIR)/public/nss/*
 Will> +	$(INSTALL) -m 755 -t $(STAGING_DIR)/usr/lib/ \
 Will> +		$(@D)/$(LIBNSS_DISTDIR)/lib/*.a
 Will> +endef

s/STAGING_DIR/TARGET_DIR/

-- 
Bye, Peter Korsgaard
