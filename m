From: Darcy L. Watkins <dwatkins@tranzeo.com>
Date: Fri, 26 Feb 2010 13:35:20 -0800
Subject: [Buildroot] Buildroot 2010.02 "echo foo"
In-Reply-To: <D61182AC8012EA4EBC531B3AF23BE10992A96A@tranzeo-mail2.12stewart.tranzeo.com>
References: <D61182AC8012EA4EBC531B3AF23BE10992A96A@tranzeo-mail2.12stewart.tranzeo.com>
Message-ID: <1267220120.28886.99.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think this should fix it ....


--- buildroot-2010.02_arm/package/dosfstools/dosfstools.mk.theorig	2010-02-26 06:52:48.000000000 -0800
+++ buildroot-2010.02_arm/package/dosfstools/dosfstools.mk	2010-02-26 11:12:54.000000000 -0800
@@ -32,8 +32,7 @@ $(DOSFSTOOLS_DIR)/.built : $(DOSFSTOOLS_
 	$(STRIPCMD) $(DOSFSTOOLS_DIR)/$(DOSFSLABEL_BINARY)
 	touch $@
 
-$(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY): # $(DOSFSTOOLS_DIR)/.built
-	echo foo
+$(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY): $(DOSFSTOOLS_DIR)/.built
 	cp -a $(DOSFSTOOLS_DIR)/$(MKDOSFS_BINARY) $@
 	touch -c $@
 

... and don't revert any of the other changes.


On Fri, 2010-02-26 at 11:11 -0800, Darcy Watkins wrote:
> I see ?echo foo? in output of make just before it breaks because it
> wants to copy mkdosfs from dosfstools before having built the package.
> 
> I see the ?echo foo? and make dependency commented out in recent patch
> and commit wrt dosfstools package (in dosfstools.mk).
> 
>  
> 
> Was this debug intended to be removed before the release?
