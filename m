From: Woody Wu <narkewoody@gmail.com>
Date: Mon, 9 Sep 2013 16:04:33 +0800
Subject: [Buildroot] A Bug: xserver_xorg 1.12.4
Message-ID: <20130909080432.GA2684@zuhnb712.ap.bm.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In 2013.08, build is using 1.12.4 version of xserver_xorg package.
However, I found there is bug in this version, which cause the options
parsing of kdrive modules is not correct.

I attached a patch file in the message (not sure what's the correct way
to commit buildroot package patches).


-- 
I can't go back to yesterday - because I was a different person then
-------------- next part --------------
--- a/hw/kdrive/src/kinput.c	2012-08-19 23:41:37.000000000 +0800
+++ b/hw/kdrive/src/kinput.c	2013-09-09 15:52:26.353042088 +0800
@@ -1055,7 +1055,7 @@
 
     if (strchr(string, '=')) {
         tam_key = (strchr(string, '=') - string);
-        key = strndup(string, tam_key + 1);
+        key = strndup(string, tam_key);
         if (!key)
             goto out;
 
