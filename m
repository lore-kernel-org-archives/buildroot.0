From: Espen Frimann Koren <espenfk@gmail.com>
Date: Tue, 8 Oct 2013 10:43:17 +0200
Subject: [Buildroot] Qt 5.0.2 with OpenSSL
Message-ID: <CA+csPL7n8=fX7LLyLE4uS4s4uXHTYoLyNVm66b6_Dj0k3N+p-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

When both BR2_PACKAGE_QT5BASE_NETWORK and BR2_PACKAGE_OPENSSL are set,
something fails in the linking of libQt5Network.so that is related to
OpenSSL. I do not have time to figure out why, but suggest the following
change so that you do not have to compile Qt with OpenSSL support even if
you include OpenSSL in your build:

In package/qt5/qt5base/Config.in:

if BR2_PACKAGE_QT5BASE_NETWORK
config BR2_PACKAGE_QT5BASE_OPENSSL
  bool "use openssl"
  depends on BR2_PACKAGE_OPENSSL
  default BR2_PACKAGE_OPENSSL
  help
    This option toggles use of OpenSSL in Qt5

And in package/qt5/qt5base/qt5base.mk:
Change BR2_PACKAGE_OPENSSL to BR2_PACKAGE_QT5BASE_OPENSSL (around lines 113
and 114)

Sp1
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131008/9d1b9c63/attachment.html>
