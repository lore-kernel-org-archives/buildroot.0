From: Willy Lambert <lambert.willy@gmail.com>
Date: Tue, 11 Dec 2012 16:09:46 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <CAKvQZ_2MzciYPnYw0rCv_pzhHTzOS+vn=sry7nubtHd+sha3cw@mail.gmail.com>
References: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
 <CAKvQZ_0BrzUShzUyvM50CVabtw5BUM=1CupzD0-R1mfBuc3Adg@mail.gmail.com>
 <87d2yhsoh8.fsf@dell.be.48ers.dk>
 <CAKvQZ_1KXZcriA+RTjaz1=15UEUahu=Qvq5ovA7GeVvwDyxmVw@mail.gmail.com>
 <878v95skvm.fsf@dell.be.48ers.dk>
 <CAKvQZ_2MzciYPnYw0rCv_pzhHTzOS+vn=sry7nubtHd+sha3cw@mail.gmail.com>
Message-ID: <CAKvQZ_3sog-JnwOYiJWE6a8eCk-LcjSZ-txr0Z_AHTiC8NnRgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/12/10 Willy Lambert <lambert.willy@gmail.com>:
> 2012/12/10 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>>> "Willy" == Willy Lambert <lambert.willy@gmail.com> writes:
>>
>> Hi,
>>
>>  >> I don't think so. I just did a:
>>  >>
>>  >> make at91sam9263ek_defconfig && make
>>  >>
>>  >> Without any problems. What exactly did you do?
>>
>>  Willy> make.
>>
>> With what configuration? 'make' with a clean tree will just run
>> menuconfig for you.
>>
>
> Yes, so I just quit it so it leaves the default config (which seems to
> have a problem with large file)
>
>>  Willy> just make after having DL latest stable version few days ago from a
>>  Willy> tgz. Doing a make menuconfig don't change anything, and as far as I
>>  Willy> can remember, menuconfig was telling us about this problem (something
>>  Willy> depending on largefile).
>>
>> Did you perhaps forget to run 'make clean' after changing something in
>> your toolchain configuration?
>
> I'm quite sure I did it (make clean + make distclean + rm ccache). But
> to be sure I'll retry from zero tomorrow.

I did this again from another machine
(silvie at silvie-VirtualBox:~/buildroot-2012.11$ uname -a
Linux silvie-VirtualBox 3.2.0-34-generic-pae #53-Ubuntu SMP Thu Nov 15
11:11:12 UTC 2012 i686 i686 i386 GNU/Linux)

In short :
wget buildroot, tar -xf, make, a menuconfig pops, I exit and save
config, make, wait a bit ... and it fails with the above error about
large file system.

So I'm sure now that the default config has a problem with largefiles.
I'm sorry I'm too new to investigate further. Should I open a bug
ticket ?

I did not try other versions of gcc as proposed by Berns. But my gcc
version is :
ard at ard-host(10.0):/opt/buildroot/output/host/usr$
./x86_64-buildroot-linux-uclibc/bin/gcc --version
gcc (Buildroot 2012.11-svn2-dirty) 4.6.3
I wonder about the "svn2-dirty" tag.


>
> I'm not blocked I already have my root image (with large file
> enabled), I'm currently setting up qemu to test it, our remark is just
> that default config seems dummy.
>
>>
>>  Willy> (and BTW, hi all, I'm new with buildroot).
>>
>> Welcome!
>>
>
> Thanks !
>
>> --
>> Bye, Peter Korsgaard
