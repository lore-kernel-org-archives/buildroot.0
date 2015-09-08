From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 8 Sep 2015 11:07:19 +0200
Subject: [Buildroot] EOVERFLOW fstat() error on cortex-A9 android when
 trying to load shared library
In-Reply-To: <55EDF64F.7020707@mind.be>
References: <CAF5aO=Ko183BGatMakjXot=EsnXbaodOHZPRmnMa8nqH=vZkEw@mail.gmail.com>
 <55EDA03A.2070302@mind.be>
 <CAF5aO=LYm6GYVXv0gJW9fS3A8JXMAeZwnEokG0Htpac4SZuJVQ@mail.gmail.com>
 <CAF5aO=LiY_3XBn+HgA8-nwJk51GQkgGQqbnpmdQoyS64zxDTWA@mail.gmail.com>
 <55EDAA89.20809@mind.be>
 <CAF5aO=+dvVTzhdJW7D7udiEmomAU_ZWTCSXF5OP0zcmhuHcUqQ@mail.gmail.com>
 <55EDF64F.7020707@mind.be>
Message-ID: <20150908090719.GA14056@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Arnout Vandecappelle wrote,

>  And the kernel ABI is compatible of course.
> 
>  Hm, you're running 2.6.36 headers against a 3.0 kernel... Normally that
> shouldn't be an issue, but maybe there are some LARGEFILE related changes that
> are not entirely ABI-compatible - or perhaps it's a uClibc bug to not do this in
> an ABI-compatible way. I see in fs/compat.c that cp_compat_stat() can return
> -EOVERFLOW if the inode is 64 bit while the syscall is 32 bit. But since the
> toolchain is LFS I don't see how this could happen...

I would like to know if your nano configure says something like
this:
checking for _FILE_OFFSET_BITS value needed for large files... 64

Is your filesystem on the Android device bigger than 2 GB?
(where /opt and nano + libraries lives in)

best regards
 Waldemar
