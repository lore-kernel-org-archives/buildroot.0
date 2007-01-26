From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 26 Jan 2007 21:37:18 +0100
Subject: [Buildroot] [PATCH] Updated "local" patch to avoid duplication
	w	package/customize
Message-ID: <1169843838.30887.5.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here is a new version of the "local" patch to avoid the
believed duplication with "package/customize"


Author:	Ulf Samuelsson
Date:	2007-01-26

Log:
Move the customization feature to the top level for easier maintenance.
The user would copy the contents of his/her own local directory
structure into the "local" directory, 
overwriting "local/Config.in" and "local/Makefile.in"
The contents of "local/root" is copied into the "$(BUILD_DIR)/root"
after it is created from the template.

-----------------------------------------------------------------------
1) Remove "package/customize/*"
2) Remove include of "package/customize" from package/Config.in

3) Create "local" as replacement for "package/customize"
4) include "local/Config.in" from top Config.in
	No configurations options in this patch
5) include "local/Makefile.in" from top Makefile
	No actions in this patch

6) Make a "local/root/etc" directory
7) Create a "local/root/etc/boardname" file from $(BR2_BOARDNAME)
   to ensure directory structure is there with at least one useful file.
   (BR2_BOARDNAME is created in top Config.in -also in previously    
    submitted BSP patch)
8) Copy "local/root" (if present) $(BUILD_DIR)/root after the template
is created

9) "local/*/*.mk" is included by top Makefile
10) "local/dummy/dummy.mk" created to ensure there is at least one *.mk

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
	local/root/etc/boardname	- contents = "board"
	local/dummy/dummy.mk
	-package/customize/Config.in
	-package/customize/customize.mk


Best Regards
Ulf Samuelsson


-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-local.patch
Type: text/x-patch
Size: 6215 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070126/2421c693/attachment.bin 
