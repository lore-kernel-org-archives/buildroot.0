From: Daniele Salvatore Albano <d.albano@gmail.com>
Date: Mon, 10 Aug 2009 19:59:03 +0200
Subject: [Buildroot] Yaboot doesn't build
In-Reply-To: <94D3F226-C067-4F83-8F86-17BF467035B7@earthlink.net>
References: <94D3F226-C067-4F83-8F86-17BF467035B7@earthlink.net>
Message-ID: <159a01660908101059s7342e945t52b8092fe74155a9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Actually, ext2fs doesn't copy headers to staging dir so yaboot,
probably, can't find the necessary header.

If you are missing a .h file you can try to apply this patch
https://bugs.uclibc.org/show_bug.cgi?id=531

that add support to export e2fsprogs headers to staging dir

Otherwise, if ld reports about missing lext2fs try to add
$(TARGET_LDFLAGS) to the make file of yaboot and/or add related paths

2009/8/10 Steve Bennett <sablists@earthlink.net>:
> Hi all!
>
> Am trying to build a PowerPC boot CD with buildroot, and YABOOT doesn't seem
> to build in the latest buildroot. ?I get the following error:
>
> lib/strstr.c: In function 'strstr':
> lib/strstr.c:79: error: label at end of compound statement
>
> After some research, I discovered that problem had been corrected quite a
> long time ago in the next version (1.3.14 - the current stable version) of
> YABOOT. ? There appear to be a number of other important changes and fixes
> in 1.3.14, so I went into the package folder and changed the make file to
> pull in version 1.3.14 instead.
>
> This time, it compiled, but then couldn't link because 1.3.14 no longer
> builds it's own personal copy of libext2fs - it's expecting to link to it
> from the local system. ? (link parameter is -lext2fs) ? This library is part
> of the e2fsprogs package, so I tried adding that, but it's added to the
> target, not to the toolchain, and it appears yaboot is looking for it in the
> toolchain, so that continues to fail. ?I'm not exactly sure how to add it to
> the toolchain -- it doesn't appear to be quite as straightforward as adding
> a package to the target.
>
> Is that the right approach here, or am I missing something? ? Anyone care to
> nudge me in the right direction as to how to accomplish this?
>
> Thanks,
> -->Steve Bennett
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Daniele Salvatore Albano
Consulente Informatico
http://www.phpsoft.it
http://www.dacci.it

Servizi:
- Sviluppo in C# e PHP
- Installazione e Amministrazione sistemi Ubuntu, CentOS e Fedora
