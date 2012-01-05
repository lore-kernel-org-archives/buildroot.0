From: =?iso-8859-1?B?SmFubmUgSORtZWVuYWhv?= <jannehameenaho@hotmail.com>
Date: Thu, 5 Jan 2012 12:47:50 +0300
Subject: [Buildroot] Buildroot source directory
Message-ID: <DUB105-W14CD6E2D85878E0DB9DBD8CD940@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,
I've got a Buildroot makefile issue with Mercurial repository. Here's the makefile that get's the whole repository, but this prodtest module needs only /my-device/prodtest folder. How do I show Buildroot to use that folder? I don't mind that the whole repo comes along to tar, I just want to use that certain subfolder.
############################################################### prodtest##############################################################PRODTEST_VERSION    = defaultPRODTEST_SITE_METHOD = hgPRODTEST_SITE	   = http://hg.my.lan/trunk/my-device
define PRODTEST_BUILD_CMDS
	$(MAKE) -C $(@D) 			\		CC="$(TARGET_CROSS)"		\					endef

$(eval $(call GENTARGETS,package,prodtest)) 

Br,Janne H 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120105/383a6c77/attachment.html>
