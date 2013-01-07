From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Tue,  8 Jan 2013 00:01:17 +0200
Subject: [Buildroot] new <pkg>_CONFIG_FIXUP variable
Message-ID: <1357596078-7762-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides new variable called <pkg>_CONFIG_FIXUP.
It's purpose is to fix wrong prefixes of $(STAGING_DIR)/usr/bin/*-config file(s)
that many library packages install after staging installation phase.

Some packages provide multible *-config files.

So as suggested by Thomas Petazzoni and Gustavo Zacarias this 
variable can be feeded multible files.

All filenames are relative to $(STAGING_DIR)/usr/bin

Example:

DIVINE_CONFIG_FIXUP = divine-config

or:

IMAGEMAGICK_CONFIG_FIXUP = Magick-config Wand-config

Regards
Stefan
