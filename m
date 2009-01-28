From: loody <miloody@gmail.com>
Date: Wed, 28 Jan 2009 22:27:21 +0800
Subject: [Buildroot] bfd lib include Error while build elf2flt
In-Reply-To: <87bptsx7lz.fsf@macbook.be.48ers.dk>
References: <3a665c760901270846y7ccc4adak9c49fbc82618bfa0@mail.gmail.com>
	<87iqo0zocz.fsf@macbook.be.48ers.dk>
	<3a665c760901270907o4aa2d8a5m86645cb9a844308f@mail.gmail.com>
	<87bptsx7lz.fsf@macbook.be.48ers.dk>
Message-ID: <3a665c760901280627l6bc36856q3a7bce95a89d61e7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2009/1/28 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "loody" == loody  <miloody@gmail.com> writes:
>
>  loody> do you mean zlib1g-dev?
>  loody> I use ubuntu and I have followed the instructions on the
>  loody> website,http://docwiki.gumstix.org/Buildroot_on_Ubuntu, to update this
>  loody> package as below.
>
> Could you give svn trunk (after r25086) a try? It builds for me now.
>
> --
> Bye, Peter Korsgaard
>
Hi:
thanks for your suggestion.
it works now.
But would you please tell me how to transform an elf to FLAT?
I googled the web and there are 2 methods seems work.
1. arm-linux-uclibcgnueabi-gcc -Wl,-elf2flt -o hello.flt hello.c
but my toolchain says:
arm-linux-uclibcgnueabi/bin/ld.real: error: no memory region specified
for loadable section `.plt'
collect2: ld returned 1 exit status

2.  arm-linux-uclibcgnueabi-elf2flt -v -s 32658 -o hello.flt hello.o
but it says:
TEXT -> vma=0x0 len=0x24
DATA -> vma=0x0 len=0xc
ERROR: text=0x24 overlaps data=0x0 ?

If some successfully use above methods to transform elf to flat,
please let me know.
Sincerely Yours,
miloody
