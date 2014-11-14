From: Mathieu Slabbinck <matty.slabbinck@gmail.com>
Date: Fri, 14 Nov 2014 10:24:58 +0100
Subject: [Buildroot] Source download overwrite
Message-ID: <CAOFH_kEf-xur6tPGZb8rhA=211gK=Ww4tS0HRVpOe6KA-WEQMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm looking for a way to overwrite the internal download system of buidroot
for a specific homebrew package.

The goal of the package is to download multiple files and install them
accordingly.
LIBFOO_SITE contains the common part of the download link. For example
ftp://myftpserver.mydomain.com/libfoo/.

Then I'd like to have a pre-install hook that downloads some specific files
from that url, for example
- ftp://myftpserver.mydomain.com/libfoo/file1.deb
- ftp://myftpserver.mydomain.com/libfoo/file2.rpm
- ftp://myftpserver.mydomain.com/libfoo/file3.someExtension

This all works fine, but the package still tries to fetch
ftp://myftpserver.mydomain.com/libfoo/.tar.gz because of the internal way
of working of buildroot.

So how can I overwrite this method or disable it?

Kind regards,

Mathieu
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141114/a6b7c01b/attachment.html>
