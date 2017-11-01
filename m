From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Nov 2017 14:40:41 +0100
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <CAHXCMMKsPg-DZW385VWMgUQmtngB_L9ALJqJiuZPj2Oz9g0uJQ@mail.gmail.com>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf>
 <CAHXCMMKsPg-DZW385VWMgUQmtngB_L9ALJqJiuZPj2Oz9g0uJQ@mail.gmail.com>
Message-ID: <20171101144041.05df6b0b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Nov 2017 11:17:33 +0100, Samuel Martin wrote:

> >>     mips64el |                opencv-2.4.13.3 | NOK | http://autobuild.buildroot.net/results/b27d324331f6e351e95dd4742f4d0a50af60c590 |
> >>     mips64el |                opencv-2.4.13.3 | NOK | http://autobuild.buildroot.net/results/44ed0be0bd94028b7b37e7bf21233adc1753d94b |  
> >
> > CMake Error at cmake/OpenCVCompilerOptions.cmake:21 (else):
> >   A duplicate ELSE command was found inside an IF block.
> > Call Stack (most recent call first):
> >   CMakeLists.txt:437 (include)
> >
> > Should be easy to fix. Samuel, do you think you will find some time to
> > have a look at this?  
> 
> I was about to check on these failures when the abo were off for
> maintainance yesterday.
> Hopefully I should have time to look into this by the end of the week.

Thanks!

> >>         bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/78e033fe9f43845581a5d87b21a8451f67520e44 |  
> >
> > /usr/lfs/v0/rc-buildroot-test/scripts/instance-2/output/build/openobex-1.7.2/lib/obex_transport_sock.c:(.text+0x5f6): undefined reference to `accept4'
> >
> > Not sure what's going on. accept4() not wired in Linux or uClibc for
> > Blackfin? Something else? Waldemar, could you have a look?
> 
> I have a pending patch for openobex,.
> It seems accept4 is not available in uclibc for blackfin architecture [1].
> Grepping at the git log, similar issues were fixed by disabling the
> package on blackfin target.
> 
> 
> Regards,
> 
> [1] https://cgit.openadk.org/cgi/cgit/uclibc-ng.git/tree/libc/sysdeps/linux/common/bits/kernel-features.h#n452

This is weird, because even major architectures like ARM are not listed
as part of the architectures that have accept4. But I don't even see
this __ASSUME_ACCEPT4 used anywhere.

Waldmear ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
