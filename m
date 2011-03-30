From: bbj17 at gmx.de <bbj17@gmx.de>
Date: Wed, 30 Mar 2011 18:08:53 +0200
Subject: [Buildroot] fix for package/config/util.c
Message-ID: <20110330160853.179520@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

here is the correct diff:


 diff -Naur  package/config/util.c.old package/config/util.c
--- package/config/util.c.old   2011-03-30 17:37:08.016057639 +0200
+++ package/config/util.c       2011-03-30 17:42:26.911184273 +0200
@@ -35,12 +35,12 @@
        char *ret;
        if (len < 1)
                return NULL;
-       ret = malloc(len);
+       ret = malloc(len+1);
        if (!ret) {
                printf("Out of memory!");
                exit(1);
        }
-       memset(ret, 0, len);
+       memset(ret, 0, len+1);
        i = j = 0;
        if (strncmp("BR2_", in, 4) == 0)
                i += 4;


-- 
NEU: FreePhone - kostenlos mobil telefonieren und surfen!			
Jetzt informieren: http://www.gmx.net/de/go/freephone
