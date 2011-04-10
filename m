From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Apr 2011 16:36:39 -0700
Subject: [Buildroot] uclibc vs glibc
In-Reply-To: <BANLkTikSPG0y+0BnAxNrPedQLHWwFbAMEw@mail.gmail.com>
References: <BANLkTikSPG0y+0BnAxNrPedQLHWwFbAMEw@mail.gmail.com>
Message-ID: <20110410233639.GA14655@sakrah.homelinux.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On (10/04/11 16:08), Charles Krinke wrote:
> I have a quesiton on a different subject and that is the difference between
> uclibc and glibc from the MPC8323ERDB target viewpoint.
> 

they are entirely different root file systems. 

> Here is what I think I know:
> 1. The toolchain is independent of the notion of uclibc vs glibc.
> 2. Several of the .so files in /lib on the target will be different between
> uclibc and glibc.
> 3. An application needs to be compiled with the static (or dynamic)
> libraries pertinent to glibc or uclibc with appropriate header files to
> expect it to run on the target.
> 
> Questions:
> 1. Which .so files on the target are different? ld, libc, libstdc++ only, or
> others?
> 2. Are the differing files on the target going to have the same names behind
> their softlinks
>  like ld.so.1->ld-2.11.1.so for instance?
> 3. Can I configure the CodeSourcery toolchain to produce a rootfs with
> either uclibc or glibc and if so, what might be some of the steps?

Try using -muclibc or -mglibc options.
> 
> -- 
> Charles Krinke

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
-Khem
