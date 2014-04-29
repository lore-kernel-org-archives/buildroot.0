From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 29 Apr 2014 11:29:14 +0200
Subject: [Buildroot] Two stages compilation
Message-ID: <CA+TH9Vns0mvj6X2UiP_Biu1bnG4Adwg+UFhfnN9Dm4W9AGLx1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi List,

I'm interested in porting mono package on buildroot. I aim to
inclusion and offering to maintain it in the future, but I need a
little bit of help.

Mono compilation is in two stages:

1) Mono compiles the runtime for the target architecture. It means
that in this step you produce an ARM mono naked virtual machine.
2) Mono compiles mono assemblies (c# libraries). This phase fails on
my package, cause to compile assemblies you should have Mono for the
host architecture, not the target one. So to compile assemblies you
should use the x86 mono's version installed on your computer.
Alternatively, if you don't want to install mono on your computer, the
makefile can download a precompiled stripped version just to compile
the assemblies, so the first phase is optional.

I have the first phase running, so right now I can produce the ARM
mono virtual machine correctly, than I have to manual recompile
assemblies and transfer them to the target. I really want to make
everything as automatic as possible.

So in the second phase I should force buildroot to compile mono on the
host environment and not the target one. How can I do this?

Which is the advisable way to get the patch accepted?

Thank you for your time!

Angelo

-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
