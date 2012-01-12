From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 Jan 2012 23:47:42 +0100
Subject: [Buildroot] strace doesn't compile on x86_64
In-Reply-To: <4EF89684.8070401@gmail.com>
References: <4EF879B6.8080902@gmail.com> <4EF89684.8070401@gmail.com>
Message-ID: <201201122347.42661.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 26 December 2011 16:45:08 Wojciech Zabolotny wrote:
> Additionally to analyze my problems with udev, I had to compile strace.
> It didn't compile "out of the box" leading to error:
> 
> /usr/local/wzab/asus_amd/buildroot-2011.11/output/host/usr/bin/x86_64-unknown-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I./linux/x86_64 -I./linux   -Wall -pipe -Os  -fPIC -DPIC -D_LARGEFILE_SOURCE 
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -MT file.o -MD -MP -MF .deps/file.Tpo -c -o file.o file.c
> file.c: In function 'printstat64':
> file.c:1046:16: error: storage size of 'statbuf' isn't known
> 
> To compile it I had to comment out the line 1010 in file.c:
> // #if !defined HAVE_STAT64 && defined LINUX && defined X86_64
> and corresponding line 1040:
> //#endif

 Yes, I noticed that as well...  strace should be configure'd (and 
compiled) without the -D_LARGEFILE64_SOURCE flag.  But I'm not sure
how to handle it cleanly so I never got around to try to patch it.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
