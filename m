From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Jan 2014 18:16:12 +0100
Subject: [Buildroot] full rebuild and errors
In-Reply-To: <52E4FA8C.7060109@gmail.com>
References: <52E4FA8C.7060109@gmail.com>
Message-ID: <52E6945C.40202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/01/14 13:07, Marco Trapanese wrote:
> Hello,
> I successfully compiled buildroot for Raspberry Pi following this guide:
>
> https://github.com/albertd/buildroot-rpi
>
> I had a problem with some applications (btw it was: EGL Error : Could not
> create the egl surface: error = 0x300b) and I read some users were able
> to solve just rebuilding buildroot.
> Thus, I issued:
>
> make cleanall

  I guess you mean

make clean all

?

>
> as stated in the documentation. But this time I get the following errors:
>
> /home/mark/dev/buildroot-rpi/output/host/usr/bin/ccache /usr/bin/gcc
> -std=gnu99   -O2 -I/home/mark/dev/buildroot-rpi/output/host/usr/include
> -L/home/mark/dev/buildroot-rpi/output/host/lib
> -L/home/mark/dev/buildroot-rpi/output/host/usr/lib
> -Wl,-rpath,/home/mark/dev/buildroot-rpi/output/host/usr/lib -o m4 m4.o
> builtin.o debug.o eval.o format.o freeze.o input.o macro.o output.o
> path.o symtab.o ../lib/libm4.a
> m4.o: In function `main':
> m4.c:(.text.startup+0x260): undefined reference to `version_etc'
> m4.c:(.text.startup+0x3ef): undefined reference to
> `emit_bug_reporting_address'

  This smells like it could be a ccache issue. Is it possible that you 
had a major upgrade to your compiler since the first time you made a build?

  Can you try with

make clean all BR2_CCACHE=

(or just edit your config to disable ccache).


  Regards,
  Arnout

> collect2: error: ld returned 1 exit status
> make[3]: *** [m4] Error 1
> make[3]: Leaving directory
> `/home/mark/dev/buildroot-rpi/output/build/host-m4-1.4.16/src'
> make[2]: *** [all-recursive] Error 1
> make[2]: Leaving directory
> `/home/mark/dev/buildroot-rpi/output/build/host-m4-1.4.16'
> make[1]: *** [all] Error 2
> make[1]: Leaving directory
> `/home/mark/dev/buildroot-rpi/output/build/host-m4-1.4.16'
> make: ***
> [/home/mark/dev/buildroot-rpi/output/build/host-m4-1.4.16/.stamp_built]
> Error 2
>
>
> Google doesn't help me on this.
> Do you have any idea why this happens?
>
> Thanks
> Mark
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
