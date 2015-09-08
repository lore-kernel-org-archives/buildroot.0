From: Alex Potapenko <opotapenko@gmail.com>
Date: Tue, 8 Sep 2015 18:29:07 +0300
Subject: [Buildroot] EOVERFLOW fstat() error on cortex-A9 android when
 trying to load shared library
In-Reply-To: <55EEFDA1.6070104@mind.be>
References: <CAF5aO=Ko183BGatMakjXot=EsnXbaodOHZPRmnMa8nqH=vZkEw@mail.gmail.com>
 <55EDA03A.2070302@mind.be>
 <CAF5aO=LYm6GYVXv0gJW9fS3A8JXMAeZwnEokG0Htpac4SZuJVQ@mail.gmail.com>
 <CAF5aO=LiY_3XBn+HgA8-nwJk51GQkgGQqbnpmdQoyS64zxDTWA@mail.gmail.com>
 <55EDAA89.20809@mind.be>
 <CAF5aO=+dvVTzhdJW7D7udiEmomAU_ZWTCSXF5OP0zcmhuHcUqQ@mail.gmail.com>
 <55EDF64F.7020707@mind.be>
 <20150908090719.GA14056@waldemar-brodkorb.de>
 <CAF5aO=+gjgRuocbAvLicJWPkEkiiuUMFtTG6mDV-roq0cz-_fQ@mail.gmail.com>
 <55EEFDA1.6070104@mind.be>
Message-ID: <CAF5aO=LPauPtHe2EeYmBQ-2BQjcL+POfZVHAWxaujQ01vMmQKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>  The -EOVERFLOW suggests the reverse: it's a large filesystem and we're
> making a
> 32-bit syscall.
>  However, since we're building with LARGEFILE (which is forced in current
> buildroot), all syscalls should be largefile syscalls so this issue should
> not
> occur...
>  However, in your 2015.08 config, I see you're using a custom uClibc
> config.
> You're not turning off any largefile options there, are you?


That custom config is the config from 2015.02. I upgraded the toolchain to
use gcc-5.2.0 (Buildroot 2015.08) from gcc-4.9.2 (Buildroot 2015.02), but
didn't want to re-build entire feeds, so have done this for compatibility.
If it was forced back in 2015.02, it should be OK.

Thanks

-- 
Best regards,
Alex Potapenko
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150908/ea96b67e/attachment.html>
