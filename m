From: Chris Zankel <chris@zankel.net>
Date: Sun, 10 Nov 2013 21:33:16 -0800
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131109191543.414f5694@skate>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <20131109191543.414f5694@skate>
Message-ID: <52806C1C.7010206@zankel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 11/9/13, 10:15 AM, Thomas Petazzoni wrote:
>
>>      xtensa |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/0315c117986f3aac8c0719d744cb47ee03738ee9/
> [ 58%] Building C object libhfs_iso/CMakeFiles/hfs_iso.dir/record.o
> ../libusal/libusal.a(scsi-remote.o):(.literal+0xe0): undefined reference to `valloc'
>
> Chris, can you have a look at this one, since it's apparently a
> Xtensa-specific problem?
Looks that Baruch already found the issue (cdrkit has a very similar issue):

> cdrkit has not see a release in more than 3 years. There are probably other
> packages making use of the obsolete valloc() routine, so I guess we want to
> enable UCLIBC_SUSV2_LEGACY anyway.

I haven't seen a patch yet, so will also work on it and should have it soon.

(I'm a bit surprised to get all those errors as binutils currently 
doesn't build. Are you using an older toolchain, or are these packages 
not dependent on the final binutils build?)

Thanks,
-Chris
