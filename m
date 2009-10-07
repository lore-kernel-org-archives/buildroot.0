From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 7 Oct 2009 23:18:21 +0200
Subject: [Buildroot] [PATCH] cut down on implicit rule searches
Message-ID: <20091007211821.GJ23847@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The subject says it all, info make explains it in detail.
Please install.

PS: obviously reduces the amount of time make wastes trying to
match pattern rules which we don't have nor need.

PPS:
`-r'
`--no-builtin-rules'
     Eliminate use of the built-in implicit rules (*note Using Implicit
     Rules: Implicit Rules.).  You can still define your own by writing
     pattern rules (*note Defining and Redefining Pattern Rules:
     Pattern Rules.).  The `-r' option also clears out the default list
     of suffixes for suffix rules (*note Old-Fashioned Suffix Rules:
     Suffix Rules.).  But you can still define your own suffixes with a
     rule for `.SUFFIXES', and then define your own suffix rules.  Note
     that only _rules_ are affected by the `-r' option; default
     variables remain in effect (*note Variables Used by Implicit
     Rules: Implicit Variables.); see the `-R' option below.

PPPS: (excerpt only for _one_ attempted match that is avoided with that patch)
@@ -413,149887 +413,2023 @@
 Updating makefiles....
  Considering target file `target/device/Atmel/arch-avr32/arch-avr32.mk'.
   Looking for an implicit rule for `target/device/Atmel/arch-avr32/arch-avr32.mk'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.o'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.c'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.cc'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.C'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.cpp'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.p'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.f'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.F'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.r'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.s'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.S'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.mod'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.sh'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk,v'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk,v'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Trying implicit prerequisite `target/device/Atmel/arch-avr32/s.arch-avr32.mk'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Trying implicit prerequisite `target/device/Atmel/arch-avr32/SCCS/s.arch-avr32.mk'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.o'.
-  Looking for a rule with intermediate file `target/device/Atmel/arch-avr32/arch-avr32.mk.o'.
-   Avoiding implicit rule recursion.
-   Trying pattern rule with stem `arch-avr32.mk'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.c'.
-   Trying pattern rule with stem `arch-avr32.mk'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.cc'.
-   Trying pattern rule with stem `arch-avr32.mk'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.C'.
-   Trying pattern rule with stem `arch-avr32.mk'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.cpp'.
-   Trying pattern rule with stem `arch-avr32.mk'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.p'.
-   Trying pattern rule with stem `arch-avr32.mk'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.f'.
-   Trying pattern rule with stem `arch-avr32.mk'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.F'.
-   Trying pattern rule with stem `arch-avr32.mk'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.r'.
-   Trying pattern rule with stem `arch-avr32.mk'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.s'.
-   Trying pattern rule with stem `arch-avr32.mk'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.S'.
-   Trying pattern rule with stem `arch-avr32.mk'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.mod'.
-   Trying pattern rule with stem `arch-avr32.mk.o'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.o,v'.
-   Trying pattern rule with stem `arch-avr32.mk.o'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.o,v'.
-   Trying pattern rule with stem `arch-avr32.mk.o'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.o'.
-   Trying pattern rule with stem `arch-avr32.mk.o'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/s.arch-avr32.mk.o'.
-   Trying pattern rule with stem `arch-avr32.mk.o'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/SCCS/s.arch-avr32.mk.o'.
-   Trying pattern rule with stem `arch-avr32.mk'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.c'.
-   Looking for a rule with intermediate file `target/device/Atmel/arch-avr32/arch-avr32.mk.c'.
-    Avoiding implicit rule recursion.
-    Avoiding implicit rule recursion.
-    Trying pattern rule with stem `arch-avr32.mk'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.y'.
-    Trying pattern rule with stem `arch-avr32.mk'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.l'.
-    Trying pattern rule with stem `arch-avr32.mk'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.w'.
-    Trying pattern rule with stem `arch-avr32.mk'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.w'.
-    Trying pattern rule with stem `arch-avr32.mk.c'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.c,v'.
-    Trying pattern rule with stem `arch-avr32.mk.c'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.c,v'.
-    Trying pattern rule with stem `arch-avr32.mk.c'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.c'.
-    Trying pattern rule with stem `arch-avr32.mk.c'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/s.arch-avr32.mk.c'.
-    Trying pattern rule with stem `arch-avr32.mk.c'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/SCCS/s.arch-avr32.mk.c'.
-    Trying pattern rule with stem `arch-avr32.mk'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.y'.
-    Looking for a rule with intermediate file `target/device/Atmel/arch-avr32/arch-avr32.mk.y'.
-     Avoiding implicit rule recursion.
-     Avoiding implicit rule recursion.
-     Avoiding implicit rule recursion.
-     Trying pattern rule with stem `arch-avr32.mk.y'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.y,v'.
-     Trying pattern rule with stem `arch-avr32.mk.y'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.y,v'.
-     Trying pattern rule with stem `arch-avr32.mk.y'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.y'.
-     Trying pattern rule with stem `arch-avr32.mk.y'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/s.arch-avr32.mk.y'.
-     Trying pattern rule with stem `arch-avr32.mk.y'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/SCCS/s.arch-avr32.mk.y'.
-    Trying pattern rule with stem `arch-avr32.mk'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.l'.
-    Looking for a rule with intermediate file `target/device/Atmel/arch-avr32/arch-avr32.mk.l'.
-     Avoiding implicit rule recursion.
-     Avoiding implicit rule recursion.
-     Avoiding implicit rule recursion.
-     Trying pattern rule with stem `arch-avr32.mk.l'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.l,v'.
-     Trying pattern rule with stem `arch-avr32.mk.l'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.l,v'.
-     Trying pattern rule with stem `arch-avr32.mk.l'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.l'.
-     Trying pattern rule with stem `arch-avr32.mk.l'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/s.arch-avr32.mk.l'.
-     Trying pattern rule with stem `arch-avr32.mk.l'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/SCCS/s.arch-avr32.mk.l'.
-    Trying pattern rule with stem `arch-avr32.mk'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.w'.
-    Looking for a rule with intermediate file `target/device/Atmel/arch-avr32/arch-avr32.mk.w'.
-     Avoiding implicit rule recursion.
-     Avoiding implicit rule recursion.
-     Avoiding implicit rule recursion.
-     Trying pattern rule with stem `arch-avr32.mk.w'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.w,v'.
-     Trying pattern rule with stem `arch-avr32.mk.w'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.w,v'.
-     Trying pattern rule with stem `arch-avr32.mk.w'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.w'.
-     Trying pattern rule with stem `arch-avr32.mk.w'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/s.arch-avr32.mk.w'.
-     Trying pattern rule with stem `arch-avr32.mk.w'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/SCCS/s.arch-avr32.mk.w'.
-    Trying pattern rule with stem `arch-avr32.mk'.
-    Rejecting impossible implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.w'.
-   Trying pattern rule with stem `arch-avr32.mk'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.cc'.
-   Looking for a rule with intermediate file `target/device/Atmel/arch-avr32/arch-avr32.mk.cc'.
-    Avoiding implicit rule recursion.
-    Avoiding implicit rule recursion.
-    Trying pattern rule with stem `arch-avr32.mk.cc'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.cc,v'.
-    Trying pattern rule with stem `arch-avr32.mk.cc'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.cc,v'.
-    Trying pattern rule with stem `arch-avr32.mk.cc'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.cc'.
-    Trying pattern rule with stem `arch-avr32.mk.cc'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/s.arch-avr32.mk.cc'.
-    Trying pattern rule with stem `arch-avr32.mk.cc'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/SCCS/s.arch-avr32.mk.cc'.
-   Trying pattern rule with stem `arch-avr32.mk'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.C'.
-   Looking for a rule with intermediate file `target/device/Atmel/arch-avr32/arch-avr32.mk.C'.
-    Avoiding implicit rule recursion.
-    Avoiding implicit rule recursion.
-    Trying pattern rule with stem `arch-avr32.mk.C'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.C,v'.
-    Trying pattern rule with stem `arch-avr32.mk.C'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.C,v'.
-    Trying pattern rule with stem `arch-avr32.mk.C'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.C'.
-    Trying pattern rule with stem `arch-avr32.mk.C'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/s.arch-avr32.mk.C'.
-    Trying pattern rule with stem `arch-avr32.mk.C'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/SCCS/s.arch-avr32.mk.C'.
-   Trying pattern rule with stem `arch-avr32.mk'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.cpp'.
-   Looking for a rule with intermediate file `target/device/Atmel/arch-avr32/arch-avr32.mk.cpp'.
-    Avoiding implicit rule recursion.
-    Avoiding implicit rule recursion.
-    Trying pattern rule with stem `arch-avr32.mk.cpp'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.cpp,v'.
-    Trying pattern rule with stem `arch-avr32.mk.cpp'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.cpp,v'.
-    Trying pattern rule with stem `arch-avr32.mk.cpp'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.cpp'.
-    Trying pattern rule with stem `arch-avr32.mk.cpp'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/s.arch-avr32.mk.cpp'.
-    Trying pattern rule with stem `arch-avr32.mk.cpp'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/SCCS/s.arch-avr32.mk.cpp'.
-   Trying pattern rule with stem `arch-avr32.mk'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.p'.
-   Looking for a rule with intermediate file `target/device/Atmel/arch-avr32/arch-avr32.mk.p'.
-    Avoiding implicit rule recursion.
-    Avoiding implicit rule recursion.
-    Trying pattern rule with stem `arch-avr32.mk'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.web'.
-    Trying pattern rule with stem `arch-avr32.mk.p'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.p,v'.
-    Trying pattern rule with stem `arch-avr32.mk.p'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.p,v'.
-    Trying pattern rule with stem `arch-avr32.mk.p'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.p'.
-    Trying pattern rule with stem `arch-avr32.mk.p'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/s.arch-avr32.mk.p'.
-    Trying pattern rule with stem `arch-avr32.mk.p'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/SCCS/s.arch-avr32.mk.p'.
-    Trying pattern rule with stem `arch-avr32.mk'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.web'.
-    Looking for a rule with intermediate file `target/device/Atmel/arch-avr32/arch-avr32.mk.web'.
-     Avoiding implicit rule recursion.
-     Avoiding implicit rule recursion.
-     Avoiding implicit rule recursion.
-     Trying pattern rule with stem `arch-avr32.mk.web'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.web,v'.
-     Trying pattern rule with stem `arch-avr32.mk.web'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.web,v'.
-     Trying pattern rule with stem `arch-avr32.mk.web'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.web'.
-     Trying pattern rule with stem `arch-avr32.mk.web'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/s.arch-avr32.mk.web'.
-     Trying pattern rule with stem `arch-avr32.mk.web'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/SCCS/s.arch-avr32.mk.web'.
-   Trying pattern rule with stem `arch-avr32.mk'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.f'.
-   Looking for a rule with intermediate file `target/device/Atmel/arch-avr32/arch-avr32.mk.f'.
-    Avoiding implicit rule recursion.
-    Avoiding implicit rule recursion.
-    Trying pattern rule with stem `arch-avr32.mk'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.F'.
-    Trying pattern rule with stem `arch-avr32.mk'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.r'.
-    Trying pattern rule with stem `arch-avr32.mk.f'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.f,v'.
-    Trying pattern rule with stem `arch-avr32.mk.f'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.f,v'.
-    Trying pattern rule with stem `arch-avr32.mk.f'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.f'.
-    Trying pattern rule with stem `arch-avr32.mk.f'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/s.arch-avr32.mk.f'.
-    Trying pattern rule with stem `arch-avr32.mk.f'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/SCCS/s.arch-avr32.mk.f'.
-    Trying pattern rule with stem `arch-avr32.mk'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.F'.
-    Looking for a rule with intermediate file `target/device/Atmel/arch-avr32/arch-avr32.mk.F'.
-     Avoiding implicit rule recursion.
-     Avoiding implicit rule recursion.
-     Avoiding implicit rule recursion.
-     Trying pattern rule with stem `arch-avr32.mk.F'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.F,v'.
-     Trying pattern rule with stem `arch-avr32.mk.F'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.F,v'.
-     Trying pattern rule with stem `arch-avr32.mk.F'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.F'.
-     Trying pattern rule with stem `arch-avr32.mk.F'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/s.arch-avr32.mk.F'.
-     Trying pattern rule with stem `arch-avr32.mk.F'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/SCCS/s.arch-avr32.mk.F'.
-    Trying pattern rule with stem `arch-avr32.mk'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.r'.
-    Looking for a rule with intermediate file `target/device/Atmel/arch-avr32/arch-avr32.mk.r'.
-     Avoiding implicit rule recursion.
-     Avoiding implicit rule recursion.
-     Avoiding implicit rule recursion.
-     Trying pattern rule with stem `arch-avr32.mk'.
-     Rejecting impossible implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.l'.
-     Trying pattern rule with stem `arch-avr32.mk.r'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.r,v'.
-     Trying pattern rule with stem `arch-avr32.mk.r'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.r,v'.
-     Trying pattern rule with stem `arch-avr32.mk.r'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.r'.
-     Trying pattern rule with stem `arch-avr32.mk.r'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/s.arch-avr32.mk.r'.
-     Trying pattern rule with stem `arch-avr32.mk.r'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/SCCS/s.arch-avr32.mk.r'.
-   Trying pattern rule with stem `arch-avr32.mk'.
-   Rejecting impossible implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.F'.
-   Trying pattern rule with stem `arch-avr32.mk'.
-   Rejecting impossible implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.r'.
-   Trying pattern rule with stem `arch-avr32.mk'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.s'.
-   Looking for a rule with intermediate file `target/device/Atmel/arch-avr32/arch-avr32.mk.s'.
-    Avoiding implicit rule recursion.
-    Avoiding implicit rule recursion.
-    Trying pattern rule with stem `arch-avr32.mk'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.S'.
-    Trying pattern rule with stem `arch-avr32.mk.s'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.s,v'.
-    Trying pattern rule with stem `arch-avr32.mk.s'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.s,v'.
-    Trying pattern rule with stem `arch-avr32.mk.s'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.s'.
-    Trying pattern rule with stem `arch-avr32.mk.s'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/s.arch-avr32.mk.s'.
-    Trying pattern rule with stem `arch-avr32.mk.s'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/SCCS/s.arch-avr32.mk.s'.
-    Trying pattern rule with stem `arch-avr32.mk'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.S'.
-    Looking for a rule with intermediate file `target/device/Atmel/arch-avr32/arch-avr32.mk.S'.
-     Avoiding implicit rule recursion.
-     Avoiding implicit rule recursion.
-     Avoiding implicit rule recursion.
-     Trying pattern rule with stem `arch-avr32.mk.S'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.S,v'.
-     Trying pattern rule with stem `arch-avr32.mk.S'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.S,v'.
-     Trying pattern rule with stem `arch-avr32.mk.S'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.S'.
-     Trying pattern rule with stem `arch-avr32.mk.S'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/s.arch-avr32.mk.S'.
-     Trying pattern rule with stem `arch-avr32.mk.S'.
-     Trying implicit prerequisite `target/device/Atmel/arch-avr32/SCCS/s.arch-avr32.mk.S'.
-   Trying pattern rule with stem `arch-avr32.mk'.
-   Rejecting impossible implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.S'.
-   Trying pattern rule with stem `arch-avr32.mk'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.mod'.
-   Looking for a rule with intermediate file `target/device/Atmel/arch-avr32/arch-avr32.mk.mod'.
-    Avoiding implicit rule recursion.
-    Avoiding implicit rule recursion.
-    Trying pattern rule with stem `arch-avr32.mk.mod'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.mod,v'.
-    Trying pattern rule with stem `arch-avr32.mk.mod'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.mod,v'.
-    Trying pattern rule with stem `arch-avr32.mk.mod'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.mod'.
-    Trying pattern rule with stem `arch-avr32.mk.mod'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/s.arch-avr32.mk.mod'.
-    Trying pattern rule with stem `arch-avr32.mk.mod'.
-    Trying implicit prerequisite `target/device/Atmel/arch-avr32/SCCS/s.arch-avr32.mk.mod'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Rejecting impossible implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.c'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Rejecting impossible implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.cc'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Rejecting impossible implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.C'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Rejecting impossible implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.cpp'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Rejecting impossible implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.p'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Rejecting impossible implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.f'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Rejecting impossible implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.F'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Rejecting impossible implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.r'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Rejecting impossible implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.s'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Rejecting impossible implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.S'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Rejecting impossible implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.mod'.
-  Trying pattern rule with stem `arch-avr32.mk'.
-  Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.sh'.
-  Looking for a rule with intermediate file `target/device/Atmel/arch-avr32/arch-avr32.mk.sh'.
-   Avoiding implicit rule recursion.
-   Trying pattern rule with stem `arch-avr32.mk.sh'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/arch-avr32.mk.sh,v'.
-   Trying pattern rule with stem `arch-avr32.mk.sh'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.sh,v'.
-   Trying pattern rule with stem `arch-avr32.mk.sh'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/RCS/arch-avr32.mk.sh'.
-   Trying pattern rule with stem `arch-avr32.mk.sh'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/s.arch-avr32.mk.sh'.
-   Trying pattern rule with stem `arch-avr32.mk.sh'.
-   Trying implicit prerequisite `target/device/Atmel/arch-avr32/SCCS/s.arch-avr32.mk.sh'.
   No implicit rule found for `target/device/Atmel/arch-avr32/arch-avr32.mk'.
   Finished prerequisites of target file `target/device/Atmel/arch-avr32/arch-avr32.mk'.
  No need to remake target `target/device/Atmel/arch-avr32/arch-avr32.mk'.
  Considering target file `target/device/Atmel/arch-arm/arch-arm.mk'.
   Looking for an implicit rule for `target/device/Atmel/arch-arm/arch-arm.mk'.
-  Trying pattern rule with stem `arch-arm.mk'.
-  Trying implicit prerequisite `target/device/Atmel/arch-arm/arch-arm.mk.o'.
[snip rest]
-------------- next part --------------
diff --git a/Makefile b/Makefile
index bbd49d4..f18e4f5 100644
--- a/Makefile
+++ b/Makefile
@@ -458,6 +458,9 @@ endif
 	.config.cmd
 	$(MAKE) -C $(CONFIG) clean
 
+# Cut down on implicit rule searches.
+# The childs we'll spawn will have this filtered out, of course.
+MAKEFLAGS+=--no-builtin-rules
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
diff --git a/package/Makefile.in b/package/Makefile.in
index 0a70ab4..14ec290 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -6,8 +6,8 @@ HOSTMAKE=$(MAKE)
 endif
 HOSTMAKE :=$(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
 
-MAKE1:=$(HOSTMAKE) -j1
-MAKE:=$(HOSTMAKE) -j$(BR2_JLEVEL)
+MAKE1:=MAKEFLAGS=$(filter-out --no-builtin-rules,$(MAKEFLAGS)) $(HOSTMAKE) -j1
+MAKE:=$(subst -j1,-j$(BR2_JLEVEL),$(MAKE1))
 
 #########################################################################
 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
