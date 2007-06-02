From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 2 Jun 2007 12:32:47 +0200
Subject: [Buildroot] ALSA tools for build-root
In-Reply-To: <46613FBE.7080709@teamboyce.co.uk>
References: <46613FBE.7080709@teamboyce.co.uk>
Message-ID: <20070602103246.GL12010@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 02, 2007 at 11:00:30AM +0100, Rod Boyce wrote:
>All,
>
>I have also added alsa-tools to build-root and attached is the patch.  
>These tools have a lot of dependencies that I am not using the tools 
>that build fine for me I have defaulted to 'default y' in the Config.in 
>file, all tools that depend on X, GTK, or some other library I am not 
>using I have set 'default n' there are also tools that are going to 
>require a custom target that my makefile does not do anything with these 
>are all commented out in the config file.  The makefile is quite simple 
>I have a macro that creates a target for each simple selected tool the 
>tools are selected from the configure script this was the simplest way I 
>could think of doing the simple targets for this tool set.  I have not 
>looked at what is needed for the more complicated targets and I don't 
>plan on using then.  But I have left them in for the next to make the 
>job easier for the next person hopefully.
>
>Regards,
>Rod Boyce

>Index: package/alsa-tools/alsa-tools.mk
>===================================================================
>--- package/alsa-tools/alsa-tools.mk	(revision 0)
>+++ package/alsa-tools/alsa-tools.mk	(revision 0)
>@@ -0,0 +1,134 @@
>+#############################################################
>+#
>+# ALSA Tools
>+#
>+#############################################################
>+ALSA-TOOLS_VERSION := 1.0.14rc3
>+ALSA-TOOLS_SOURCE := alsa-tools-$(ALSA-TOOLS_VERSION).tar.bz2
>+ALSA-TOOLS_SITE := ftp://ftp.alsa-project.org/pub/tools/
>+ALSA-TOOLS_DIR := $(BUILD_DIR)/$(patsubst %.tar.bz2,%,$(ALSA-TOOLS_SOURCE))

Also, i'm curious where you picked up this notion of setting the
FOO_DIR.

The established way is a simple
FOO_DIR:=$(BUILD_DIR)/foo-$(FOO_VERSION)
