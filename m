From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 20 Jun 2012 07:54:25 +0200
Subject: [Buildroot] build root error with LSF
In-Reply-To: <CAKHsGF=r=Hi+22z9vbAJULOsHtv-b8Td_1ymTexUey7Co5rmAg@mail.gmail.com>
 (rajeesh rarankurissi's message of "Wed, 20 Jun 2012 11:16:49 +0530")
References: <CAKHsGF=r=Hi+22z9vbAJULOsHtv-b8Td_1ymTexUey7Co5rmAg@mail.gmail.com>
Message-ID: <87d34usf3i.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "rajeesh" == rajeesh rarankurissi <rajeesh.thinkpalm@gmail.com> writes:

Hi,

 rajeesh> Hi Jacmet,
 rajeesh> I am working with buildroot .
 rajeesh> while compiling I am facing a problem with LSF in uClib
 rajeesh> this is the error message .. ..any patches are available for this
 rajeesh> issue ....I am using 2012.02 version build root .

 rajeesh> us-unwind-tables -c
 rajeesh> /home/rajeesh/DEV/buildroot/output/toolchain/gcc-4.7.0/libgcc/crtstuff.c
 rajeesh> -DCRT_BEGIN
 rajeesh> In file included from
 rajeesh> /home/rajeesh/DEV/buildroot/output/toolchain/uClibc_dev/usr/include/stdio.h:28:0,
 rajeesh>                  from
 rajeesh> /home/rajeesh/DEV/buildroot/output/toolchain/gcc-4.7.0/libgcc/../gcc/tsystem.h:88,
 rajeesh>                  from
 rajeesh> /home/rajeesh/DEV/buildroot/output/toolchain/gcc-4.7.0/libgcc/crtstuff.c:62:
 rajeesh> /home/rajeesh/DEV/buildroot/output/toolchain/uClibc_dev/usr/include/features.h:219:5:
 rajeesh> error: #error It appears you have defined _FILE_OFFSET_BITS=64.
 rajeesh> Unfortunately, uClibc was built without large file support enabled.
 rajeesh> In file included from

Did you perhaps change the BR2_LARGEFILE option without running make
clean?

If not, please provide your .config file.

-- 
Bye, Peter Korsgaard
