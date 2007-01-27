From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 27 Jan 2007 22:20:07 +0100
Subject: [Buildroot] [PATCH] yet another update to the "local" patch
Message-ID: <1169932807.5798.1.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author:	Ulf Samuelsson
Date:	2007-01-27

Log:
Move the customization feature to the top level for easier maintenance.
The user would copy the contents of his/her own local directory
structure into the "local" directory, 
overwriting "local/Config.in" and "local/Makefile.in"
The contents of "local/root" is copied into the "$(BUILD_DIR)/root"
after it is created from the template.
Update $(TARGET_DIR)/etc/hostname from BR2_BOARDNAME
Update $(TARGET_DIR)/etc/issue from BR2_ISSUE


-----------------------------------------------------------------------
1) Remove "package/customize/*"
2) Remove include of "package/customize" from package/Config.in

3) Create "local" as replacement for "package/customize"
4) include "local/Config.in" from top Config.in
	No configurations options in this patch
5) include "local/Makefile.in" from top Makefile
	No actions in this patch

6) Make a "local/root/etc" directory
7) Create a "local/root/etc/hostname" file from $(BR2_BOARDNAME)
   to ensure directory structure is there with at least one useful file.
   (BR2_BOARDNAME is created in top Config.in)
8) Copy "local/root"  to $(TARGET_DIR) after the template is created

9) "local/*/*.mk" is included by top Makefile
10) "local/dummy/dummy.mk" created to ensure there is at least one *.mk
11) Define $(BR2_ISSUE) used to create a login banner

Modified:
	Config.in
	Makefile
	local/Config.in
	local/Makefile.in
	local/root/etc/boardname	- contents = "board"
	local/dummy/dummy.mk
	-package/customize/Config.in
	-package/customize/customize.mk

Changeset
	Config.in
	Makefile
	local/Config.in
	local/Makefile.in
	local/root/etc/hostname
	local/root/etc/issue
	local/dummy/dummy.mk
	-package/customize/Config.in
	-package/customize/customize.mk


Best Regards
Ulf Samuelsson
