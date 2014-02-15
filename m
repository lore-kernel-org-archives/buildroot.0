From: Frank Bergmann <bergmann@rosho.de>
Date: Sat, 15 Feb 2014 08:27:26 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAAEAJfBHZ_4hSWN+boCRCvxJbFC1+T_WN=Dv3oVM2yz0z=t5JQ@mail.gmail.com>
References: <20140214073009.1D7E6102637@stock.ovh.net>
 <20140214101241.27857b9e@skate>
 <CAAEAJfBHZ_4hSWN+boCRCvxJbFC1+T_WN=Dv3oVM2yz0z=t5JQ@mail.gmail.com>
Message-ID: <52FF16DE.90809@rosho.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 14.02.2014 14:15, Ezequiel Garc?a wrote:
> On 14 February 2014 06:12, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>>>       nios2 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/780c3388e408ae6479e824711b1c02fdbd34bef4/
>>
>> No idea what this error means. Ezequiel ?
>>
>> /home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.7.3/../../../../nios2-linux-gnu/bin/ld: /home/test/test/2/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/crt1.o: undefined reference to symbol '_gp'
>> /home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.7.3/../../../../nios2-linux-gnu/bin/ld: note: '_gp' is defined in DSO /home/test/test/2/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/libgpg-error.so.0 so try adding it to the linker command line
>>
>
> As Peter said, some issue with the compiler. This is too much for me :-)

What about the hint the linker gives in the line after the error ?
Link the binary with the additional LDFLAG '-lgpg-error' build the 
binary (but I have not run-time tested the result). This is also the 
advise from libgcrypt:

   $> libgcrypt-config --libs
   -lgcrypt -ldl -lgpg-error

I guess this is an unlucky accident: libgpg-error exports a 
symbol/function named '_gp' that could lead one to think it's about the 
global pointer from the nios2.

> Adding nios2 support in the internal toolchain is on my (increasingly
> long) TODO list.

That's fine. Is there a public repository for early testing ?

With regards,
Frank Bergmann.
