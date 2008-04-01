From: Hebbar <gururajakr@sanyo.co.in>
Date: Mon, 31 Mar 2008 17:10:25 -0700 (PDT)
Subject: [Buildroot] [patch] directfb: ignore errors in target-clean target
Message-ID: <16400908.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

At present, directfb-clean fails if directfb directory doesnt exist. Below
patch corrects the same

--- package/directfb/directfb.mk_orig   2008-03-31 03:15:30.000000000 -0400
+++ package/directfb/directfb.mk        2008-04-01 17:33:58.000000000 -0400
@@ -108,7 +108,7 @@ directfb: uclibc jpeg libpng freetype li
                $(TARGET_DIR)/usr/lib/libdirectfb.so

 directfb-clean:
-       $(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DIRECTFB_DIR)
uninstall
+       -$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DIRECTFB_DIR)
uninstall
        -$(MAKE) -C $(DIRECTFB_DIR) clean

 directfb-dirclean:


Regards
Gururaja
-- 
View this message in context: http://www.nabble.com/-patch--directfb%3A-ignore-errors-in-target-clean-target-tp16400908p16400908.html
Sent from the BuildRoot mailing list archive at Nabble.com.
