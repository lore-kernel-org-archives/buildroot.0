From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Tue, 29 Apr 2014 12:53:13 +0200
Subject: [Buildroot] Two stages compilation
In-Reply-To: <CA+TH9Vns0mvj6X2UiP_Biu1bnG4Adwg+UFhfnN9Dm4W9AGLx1A@mail.gmail.com>
References: <CA+TH9Vns0mvj6X2UiP_Biu1bnG4Adwg+UFhfnN9Dm4W9AGLx1A@mail.gmail.com>
Message-ID: <535F8499.8070406@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo,

The point is here that for mono you have to define both a host package,
and a target package. For this you can look for the
"host-autotools-package" macro, and probably can get some ideas from
checking package/python/python.mk.

A couple of months back i was able to package mono for OpenWrt (which is
in this sense close to Buildroot), but i haven't finalized that project
(as it turned out that the target MIPS CPU is not totally supported by
Mono...). If you think it's useful, i can dig this out from the archive
and share the package definition with you. Please let me know if so.

regards
zgyarmati



On 29.04.2014 11:29, Angelo Compagnucci wrote:
> Hi List,
>
> I'm interested in porting mono package on buildroot. I aim to
> inclusion and offering to maintain it in the future, but I need a
> little bit of help.
>
> Mono compilation is in two stages:
>
> 1) Mono compiles the runtime for the target architecture. It means
> that in this step you produce an ARM mono naked virtual machine.
> 2) Mono compiles mono assemblies (c# libraries). This phase fails on
> my package, cause to compile assemblies you should have Mono for the
> host architecture, not the target one. So to compile assemblies you
> should use the x86 mono's version installed on your computer.
> Alternatively, if you don't want to install mono on your computer, the
> makefile can download a precompiled stripped version just to compile
> the assemblies, so the first phase is optional.
>
> I have the first phase running, so right now I can produce the ARM
> mono virtual machine correctly, than I have to manual recompile
> assemblies and transfer them to the target. I really want to make
> everything as automatic as possible.
>
> So in the second phase I should force buildroot to compile mono on the
> host environment and not the target one. How can I do this?
>
> Which is the advisable way to get the patch accepted?
>
> Thank you for your time!
>
> Angelo
>


-- 
br, 
Zoltan Gyarmati
mail: mr.zoltan.gyarmati at gmail.com
freenode nick: zgyarmati
