From: Jonathan Bowman <bowmanjd@gmail.com>
Date: Mon, 24 May 2010 21:02:11 -0400
Subject: [Buildroot] Patch for zip and tar/lzma extraction
Message-ID: <AANLkTillAlWKQ-Ib9xq8Jr-Adf1xS3a6oTM-SQ5-Rzkn@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I have attached a patch that allows sources to be lzma-compressed
tarballs or zip archives, in addition to the bzipped and gzipped
tarballs currently allowed in generic and autotools-based package
makefiles.

Would someone be able to review this?

I am new to git, new to buildroot, and new to collaborative
open-source etiquette, so have at me if I am off in any of these
areas.

I have also attached a patch that adds cyassl (a lightweight
crypto/ssl library written in C, supposedly openssl-compatible) as an
optional library. I have not tested it thoroughly, and it may not be
useful at all. I only include it in case you are interested in using
it to test the zip download/extraction process. Strangely, the yassl
project (http://yassl.com/) does not provide tarballs, only zip files,
hence my need for the included zip-xz patch (the lzma stuff was added
just because it was easy to do and seemed relevant given the growing
popularity of lzma -- it is totally unrelated to the zip extraction
issue).

Regards,
Jonathan
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-zip-xz.patch.gz
Type: application/x-gzip
Size: 1940 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100524/697abd29/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-cyassl.patch.gz
Type: application/x-gzip
Size: 862 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100524/697abd29/attachment-0001.bin>
