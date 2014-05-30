From: Xh Xiao <xxiao8@fosiao.com>
Date: Fri, 30 May 2014 09:13:29 -0500
Subject: [Buildroot] openssl and cryptodev engine
Message-ID: <CAOMv6XyrqkUSw1ya+fSfrk=vUYREapTBcZwhuEJ1fjff0WCSBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I selected openssl and cryptodev-linux at menuconfig

after a successful built, I noticed the key file to build cryptodev-linux
which is shared between cryptodev-linux and openssl is different, the file
name is enc_cryptodev.c, they really should be identical I think.

plus, enc_cryptodev is not built to a library, i.e. libcryptodev.so,
without that the crytodev engine can't be really used by openssl.

xxiao
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140530/1329c9b8/attachment.html>
