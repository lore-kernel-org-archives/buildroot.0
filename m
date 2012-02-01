From: Warlich, Christof <christof.warlich@siemens.com>
Date: Wed, 1 Feb 2012 16:41:03 +0100
Subject: [Buildroot] External Toolchain: Calculation of SYSROOT_DIR in
 toolchain/toolchain-external/ext-tool.mk wrong?
In-Reply-To: <CAAXf6LV7xoqmU5rtYy=6AnhDObq5y9d_Lv626RN8E7Eg+Ri9Hw@mail.gmail.com>
References: <4666169C600DD24C84F509DC90790D5007629FD2B5@DEMCHP99E75MSX.ww902.siemens.net>
 <CAAXf6LV7xoqmU5rtYy=6AnhDObq5y9d_Lv626RN8E7Eg+Ri9Hw@mail.gmail.com>
Message-ID: <4666169C600DD24C84F509DC90790D5007629FD63A@DEMCHP99E75MSX.ww902.siemens.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Thomas,

> How is this toolchain built?

I can't say as I got the toolchain from another department. 

> Or more importantly, how is it packaged?
> 
> Isn't this problem simply caused by the fact that the root of your
> packaged toolchain is already inside 'usr/', instead of just above it?
> 
> In my case, I build a crosstool-ng toolchain with buildroot. I then
> package it by going to output/host and tarring the entire usr/
> directory. This way, the toolchain has a structure like (stripped):
> 
> usr/lib/gcc/
> usr/lib/gcc/powerpc-unknown-linux-gnu/
> usr/lib/gcc/powerpc-unknown-linux-gnu/4.4.3/
> usr/lib/gcc/powerpc-unknown-linux-gnu/4.4.3/include/
> usr/lib/gcc/powerpc-unknown-linux-gnu/4.4.3/include/stdfix.h
> ...
> usr/sbin/
> usr/libexec/
> usr/libexec/awk/
> usr/libexec/awk/pwcat
> usr/libexec/awk/grcat
> usr/libexec/gcc/
> usr/libexec/gcc/powerpc-unknown-linux-gnu/
> usr/libexec/gcc/powerpc-unknown-linux-gnu/4.4.3/
> usr/libexec/gcc/powerpc-unknown-linux-gnu/4.4.3/install-tools/
> usr/libexec/gcc/powerpc-unknown-linux-gnu/4.4.3/install-tools/fixinc.sh
> usr/libexec/gcc/powerpc-unknown-linux-gnu/4.4.3/install-tools/mkheaders
> ...
> 
> I think your problem would be fixed if you change the way you package
> the toolchain.

Anyhow, the fix suggested by Thomas Petazzoni covers both :-).

> Of course, if this toolchain came to you pre-packaged, it may be
> better to fix buildroot to find everything automatically.

:-)

Cheers,

Chris
