From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 22 Feb 2014 23:42:46 +0100
Subject: [Buildroot] [PATCH v2 0/6] Add toolchain knob for NPTL
In-Reply-To: <1392757744-29984-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 18 Feb 2014 22:08:58 +0100")
References: <1392757744-29984-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ob1yrcpl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > This is v2 of the NPTL patch series. Changes since v1:

 >  * Made the comment string "NPTL" instead of "NPTL threads", as
 >    suggested by Thomas De Schampheleire.

 >  * Rebased on top of the next branch.

 > Original cover letter:

 > We have a growing number of packages that need pthread functions only
 > available when the NPTL implementation is used. But at the same time,
 > we have several architectures (AVR32, ARC, Blackfin and Xtensa) that
 > don't support NPTL.

 > This set of commits adds a new hidden toolchain config knob named
 > BR2_TOOLCHAIN_HAS_THREADS_NPTL, and uses it in four packages: three
 > were already having special conditions to more-or-less detect the
 > availability of NPTL, and one package (qt5) which fixes an autobuilder
 > failure.

 > Thomas

 > Thomas Petazzoni (6):
 >   toolchain: introduce a toolchain knob for NPTL
 >   docs/manual: indicate how to handle BR2_TOOLCHAIN_HAS_THREADS_NPTL
 >   rt-tests: use BR2_TOOLCHAIN_HAS_THREADS_NPTL
 >   sconeserver: use BR2_TOOLCHAIN_HAS_THREADS_NPTL
 >   tvheadend: use BR2_TOOLCHAIN_HAS_THREADS_NPTL
 >   qt5: needs NPTL threads

Committed series to next with the minor tweak Arnout suggested for patch
1, thanks.

-- 
Bye, Peter Korsgaard
