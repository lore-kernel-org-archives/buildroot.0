From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 06 Feb 2015 20:02:54 +0100
Subject: [Buildroot] [PATCH] qt5/qt5base: Fix build on MIPS without DSP
	support
In-Reply-To: <1423239139-56155-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Fri, 6 Feb 2015 16:12:19 +0000")
References: <1423239139-56155-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87zj8q982p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > The qt_memfill32_asm_mips_dsp function is only declared if
 > QT_COMPILER_SUPPORTS_MIPS_DSP is defined, so we can't reference it
 > unless the same macro is defined.

 > Backporting an upstream patch to fix this issue.

 > This is the error message:

 > qt-everywhere-enterprise-src-5.4.0-alpha/qtbase/src/gui/painting/qdrawhelper.cpp:
 > In function 'void qInitDrawhelperAsm()':
 > qt-everywhere-enterprise-src-5.4.0-alpha/qtbase/src/gui/painting/qdrawhelper.cpp:6843:
 > error: 'qt_memfill32_asm_mips_dsp' was not declared in this scope

 > Upstream commit:

 >   https://qt.gitorious.org/qt/qtbase/commit/2ca323ccd4f25f409eff8fc0c9804099b78c2bde

 > Fixes:

 >   http://autobuild.buildroot.net/results/254/254cf62bef8bc5d5ffe345d817d16aa9983baa15/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
