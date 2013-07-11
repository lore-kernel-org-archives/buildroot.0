From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Thu, 11 Jul 2013 11:20:52 +0200
Subject: [Buildroot] Issue with iconv_open and Linaro toolchain
Message-ID: <51DE78F4.9050705@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

My problem was first to find out why my QT (forX11) applications reported
the famous errors at startup:

QIconvCodec::convertFromUnicode: using Latin-1 for conversion, 
iconv_open failed
QIconvCodec::convertToUnicode: using Latin-1 for conversion, iconv_open 
failed

After some diving into the code and some qemu strace stuff, too, I found 
out that the
problem is due to the fact that iconv_open tries to open :

/usr/lib/arm-linux-gnueabihf/gconv/gconv-modules.cache

The /usr/lib/arm-linux-gnueabihf does not exist at all on the target, 
but only in the sysroot.
Copying it manually solves the issue, but I do not feel comfortable with 
having a piece
of the toolchain path on my system...

What is your point of view about this ? What would be the right way to do ?

Thanks
Thierry
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130711/3b404969/attachment.html>
