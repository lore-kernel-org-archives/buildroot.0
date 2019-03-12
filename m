From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Tue, 12 Mar 2019 11:21:07 +0100
Subject: [Buildroot] why qt5webengine dependencies?
Message-ID: <0464fb6c-4e64-4608-611d-91d115a87fb0@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi Gael,

why does qt5webengine in buildroot have a dependency on
* udev:
I apply the following patch and create /dev/shm at runtime, which works
out just fine. At least a build-depencency is questionable, isn't it?
--- a/src/core/config/linux.pri
+++ b/src/core/config/linux.pri
@@ -8,7 +8,7 @@ gn_args += \
     use_gnome_keyring=false \
     use_kerberos=false \
     linux_use_bundled_binutils=false \
-    use_udev=true \
+    use_udev=false \
     use_bundled_fontconfig=false


* OpenGL backend:
I'm yet to test this, but Qt webengine semms to support building with
"no-opengl" since 5.8! And there's QT_WEBENGINE_DISABLE_GPU at runtime,
so...


My question is: why the dependencies?

thanks,

                                martin
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3616 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190312/40348415/attachment.bin>
