From: Markos Chandras <markos.chandras@gmail.com>
Date: Wed, 28 Aug 2013 12:45:58 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20130828090812.43a7f849@skate>
References: <20130828063005.74A7952C1BE@lolut.humanoidz.org>
 <20130828090812.43a7f849@skate>
Message-ID: <CAG2jQ8iVzb4P=6fZ5sdbBW7JkCCRhGALU-RjJcUJ_JxC8seTBQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 28 August 2013 08:08, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
>>   mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/fab819eee4002a9c392c48c1ebaca5c5b6555567/
>
> (cd .libs/libdirectfb_dummy.a.tmp && /home/test/test/2/output/host/usr/bin/mips64el-unknown-linux-gnu-ar x ../../.libs/libdirectfb_dummy.a)
> /home/test/test/2/output/host/usr/bin/mips64el-unknown-linux-gnu-ld -o libdirectfb_dummy.o -r .libs/libdirectfb_dummy.a.tmp/*.o
> /home/test/test/2/output/host/usr/bin/mips64el-unknown-linux-gnu-ld: .libs/libdirectfb_dummy.a.tmp/dummy.o: ABI is incompatible with that of the selected emulation
> /home/test/test/2/output/host/usr/bin/mips64el-unknown-linux-gnu-ld: failed to merge target specific data of file .libs/libdirectfb_dummy.a.tmp/dummy.o
> /home/test/test/2/output/host/usr/bin/mips64el-unknown-linux-gnu-ld: Attempt to do relocatable link with elf64-tradlittlemips input and elf32-ntradlittlemips output
> /home/test/test/2/output/host/usr/bin/mips64el-unknown-linux-gnu-ld: final link failed: File in wrong format
>
> Still the same problem of mixing MIPS ABIs, because DirectFB is calling
> "ld" directly and not "gcc" to do the link.
>
> I had proposed a solution in
> http://lists.busybox.net/pipermail/buildroot/2013-June/073399.html and
> http://lists.busybox.net/pipermail/buildroot/2013-June/073400.html, but
> Markos Chandras said that the upstream package should rather be fixed
> to use gcc instead of ld for linking. So I guess we should fix DirectFB here.
>

I will work on this and fix it properly. I will also submit a patch upstream.

-- 
Regards,
Markos Chandras
