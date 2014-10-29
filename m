From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed, 29 Oct 2014 17:25:15 +0100
Subject: [Buildroot]  grub2 fails at installation with BR2_STRIP_none=y
Message-ID: <CAJtjsKZFOvwEBOMJS7EZjABn7Ah2sb7_rzm=zQ=Zyia3rscUwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In grub2-*/grub-core/Makefile.core.am, they use $(STRIP) with the -o option.
Since $(STRIP) is replaced by true in case of BR2_STRIP_none, it fails
to find kernel.img.

I'm not sure what should be done to fix this error :
- implement another command that detect the -o option and do a cp
instead of nothing.
- fix every package that uses the -o option of strip

-- 
Johan
