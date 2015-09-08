From: Alex Potapenko <opotapenko@gmail.com>
Date: Tue, 8 Sep 2015 17:59:26 +0300
Subject: [Buildroot] EOVERFLOW fstat() error on cortex-A9 android when
 trying to load shared library
In-Reply-To: <20150908090719.GA14056@waldemar-brodkorb.de>
References: <CAF5aO=Ko183BGatMakjXot=EsnXbaodOHZPRmnMa8nqH=vZkEw@mail.gmail.com>
 <55EDA03A.2070302@mind.be>
 <CAF5aO=LYm6GYVXv0gJW9fS3A8JXMAeZwnEokG0Htpac4SZuJVQ@mail.gmail.com>
 <CAF5aO=LiY_3XBn+HgA8-nwJk51GQkgGQqbnpmdQoyS64zxDTWA@mail.gmail.com>
 <55EDAA89.20809@mind.be>
 <CAF5aO=+dvVTzhdJW7D7udiEmomAU_ZWTCSXF5OP0zcmhuHcUqQ@mail.gmail.com>
 <55EDF64F.7020707@mind.be>
 <20150908090719.GA14056@waldemar-brodkorb.de>
Message-ID: <CAF5aO=+gjgRuocbAvLicJWPkEkiiuUMFtTG6mDV-roq0cz-_fQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you for your responses, Arnout and Waldemar!


> Well, you're still top-posting... [1]

...

[1] https://en.wikipedia.org/wiki/Posting_style#Top-posting


Very foolish of me, I misunderstood the meaning of this notion. I now
understand what it means and will avoid doing so.

I would like to know if your nano configure says something like
> this:
> checking for _FILE_OFFSET_BITS value needed for large files... 64
> Is your filesystem on the Android device bigger than 2 GB?
> (where /opt and nano + libraries lives in)


Yes, looking at nano config.log reveals this:

> configure:5147: checking for _FILE_OFFSET_BITS value needed for large files
> ...
> configure:5204: result: 64


And /data partition that contains /opt is exactly 2 GB. Does this mean that
it is a 32 bit file system, while the toolchain uses 64 bit file system
interface? Will it work if I create an ext2 partition larger than 2 GB on
my memory card and mount it as /opt?

 It would help if you would have your phone's kernel config. Do you have it?


Unfortunately, no, I don't have the exact config used to build the kernel.
I know it was compiled from this source:
https://github.com/CyanogenMod/android_kernel_samsung_smdk4412

I ran `make exynos4_defconfig`, then manually selected arch (exynos4) and
mach (not sure I selected right, but that probably doesn't matter here).
See the result attached.

Thanks a lot!

-- 
Best regards,
Alex Potapenko
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150908/ea77de0e/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: kernel-config
Type: application/octet-stream
Size: 33757 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150908/ea77de0e/attachment.obj>
