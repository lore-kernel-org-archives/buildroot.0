From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Nov 2019 13:01:51 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-11-06
In-Reply-To: <6d4b57b9-90c8-c2ba-9703-0a456b2dec9f@gmail.com>
References: <5dc3c4b8.1c69fb81.ff4f2.2a4cSMTPIN_ADDED_MISSING@mx.google.com>
 <6d4b57b9-90c8-c2ba-9703-0a456b2dec9f@gmail.com>
Message-ID: <20191109120151.GO3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2019-11-09 11:40 +0100, Romain Naour spake thusly:
> >   mips64el   |        host-llvm-9.0.0         | http://autobuild.buildroot.net/results/d3aa03ca7085727d0794228178c7744859900137
> 
> This is weird since mips is not (yet) supported by Buildroot's llvm package (see
> BR2_PACKAGE_LLVM_ARCH_SUPPORTS).
> 
> host-llvm dependency seems trigged by another package at Makefile level without
> being llvm/clang at Kconfig level.
> 
> Yann, the issue seems related to qt5tools for Qt 5.12 [1].
> Since it now depends on libclang, BR2_PACKAGE_QT5TOOLS_QDOC_TOOL must depends on
> BR2_PACKAGE_LLVM_ARCH_SUPPORTS (at least).

This is a serious limitation in the host-llvm package, then.

qt5tools wants llvm to build a tool (namely, qdoc) for the host, not
the target. So it should not be bothered by whatever the target is.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
