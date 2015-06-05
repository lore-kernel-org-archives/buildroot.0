From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Jun 2015 13:36:35 +0200
Subject: [Buildroot] Valgrind on buildroot
In-Reply-To: <55706138.8161b40a.6051.ffffccd2SMTPIN_ADDED_BROKEN@mx.google.com>
 (John OSullivan's message of "Thu, 4 Jun 2015 15:30:58 +0100")
References: <55706138.8161b40a.6051.ffffccd2SMTPIN_ADDED_BROKEN@mx.google.com>
Message-ID: <876172mloc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "John" == John OSullivan <john.osullivan@cloudiumsystems.com> writes:

 > Hi,
 > I have been trying to get valgrind working on a buildroot 2013.05 arm board.

2013.05? Any reason you are not using 2015.05?

A quick grep in the valgrind source I see references to fixes bugs
related to this:

NEWS.old:124528   FATAL: aspacem assertion failed: segment_is_sane
NEWS.old:126722   assertion: segment_is_sane at m_aspacemgr/aspacemgr.c:1624

(Those numbers refers to issues on http://bugs.kde.org).

Testing with 2015.05 I cannot reproduce this issue (with
qemu_x86_defconfig and default external toolchain).

-- 
Bye, Peter Korsgaard
