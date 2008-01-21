From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 22 Jan 2008 00:57:25 +0100
Subject: [Buildroot] Problems using buildroot.
References: <47952A27.5060801@aurigae.demon.co.uk>
Message-ID: <031901c85c89$c95f2570$040514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



>I have a couple of problems using buildroot :-
> 
> 1) the location of the fakeroot packages seems to have changed, 1.8.x 
> seems to no longer be on debian's site, I downloaded 1.9 and renamed it, 
> and the extracted dir and that seemed to compile ok.
> 
> 2) I can't get coreutils to build properly, it keeps barding out with :-
> 
> In file included from mbchar.h:157,
>                  from mbchar.c:22:
> ./wchar.h:41:12: error: empty filename in #include
> In file included from mbchar.c:22:
> mbchar.h:242: error: expected ')' before 'wc'
> make[3]: *** [mbchar.o] Error 1
> make[3]: Leaving directory 
> `/net/aurigae/home/afra/Src/BuildRoot/buildroot/build_i386/coreutils-6.9/lib'
> make[2]: *** [all] Error 2
> make[2]: Leaving directory 
> `/net/aurigae/home/afra/Src/BuildRoot/buildroot/build_i386/coreutils-6.9/lib'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory 
> `/net/aurigae/home/afra/Src/BuildRoot/buildroot/build_i386/coreutils-6.9'
> make: *** 
> [/net/aurigae/home/afra/Src/BuildRoot/buildroot/build_i386/coreutils-6.9/src/vdir] 
> Error 2
> 
> Any clues as to what might be wrong ?
> 
> coreutils compiles correctly outside of buildroot, as the same user on 
> the same machine.
> 


You need a toolchain with WCHAR support.
Remove the toolchain, and set the WCHAR in menuconfig
Best Regards
Ulf Samuelsson
