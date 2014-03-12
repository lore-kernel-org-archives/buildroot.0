From: Jeremy Kerr <jk@ozlabs.org>
Date: Wed, 12 Mar 2014 11:49:09 +0800
Subject: [Buildroot] [PATCH 03/10 v2] package/ncurses: Remove duplicated
 library install code
In-Reply-To: <1394595957.564990.873226929317.3.gpush@pablo>
References: <1394595957.564990.873226929317.3.gpush@pablo>
Message-ID: <531FD935.6030703@ozlabs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

> -	$(if $(BR2_PREFER_STATIC_LIB),,cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/usr/lib/)
> -	$(NCURSES_INSTALL_TARGET_PANEL)
> -	$(NCURSES_INSTALL_TARGET_FORM)
> -	$(NCURSES_INSTALL_TARGET_MENU)
> -	$(NCURSES_INSTALL_TARGET_PROGS)
> +	$(NCURSES_INSTALL_TARGET_LIBS)

Hmm, looks like I went overboard with deleting lines here; we still need
NCURSES_INSTALL_TARGET_PROGS.

Updated patch coming.


Jeremy
