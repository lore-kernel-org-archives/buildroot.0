From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Mar 2013 01:04:16 +0100
Subject: [Buildroot] 2013.02: sysvinit-2.88 build failure undefined
 reference to -lcrypt
In-Reply-To: <CAG0mjpsiXECXSfAC2_K5GfwMhC76Tws-yw9ygst=_EMRAZG4tA@mail.gmail.com>
References: <CAG0mjpsiXECXSfAC2_K5GfwMhC76Tws-yw9ygst=_EMRAZG4tA@mail.gmail.com>
Message-ID: <513FC280.5040008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/12/13 10:37, Roland Uuesoo wrote:
>
> Sysvinit doesn't build on the following system:
>
> Buildroot: 2013.02
> OS: Ubuntu 12.10 x64
>
> The problem looks very similar to this....
> http://buildroot-busybox.2317881.n4.nabble.com/Bug-2401-New-sysvinit-2-86-fails-to-build-on-MIPS-because-is-missing-lcrypt-td6901.html
>
>
> Compile output is basically the same as the link above:
> sulogin.c:(.text+0xf94): undefined reference to `crypt'
>
> As I understand the problem is this...
>
> sysvinit's makefile can't find libcrypt.a and doesn't add -lcrypt to
> sulogin.c linker options.
>
> On 64bit ubuntu the libcrypt.a is located at
> /usr/lib/x86_64-linux-gnu/libcrypt.a

  Wow, it looks like this one has been lingering around ever since 
7e2bf630 in December 2010...

  It looks like the LCRYPT variable is no longer working. I'll cook up a 
patch, but can't really test it since the included makefile works for me.

  If my patch works, please reply to it with

Tested-by: Roland Uuesoo <rolandu@gmail.com>


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
