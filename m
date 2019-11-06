From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Nov 2019 15:56:06 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/fakeroot: test for SYSV IPC
 support
In-Reply-To: <20190917035815.1750-1-matthew.weber@rockwellcollins.com> (Matt
 Weber's message of "Mon, 16 Sep 2019 22:58:14 -0500")
References: <20190917035815.1750-1-matthew.weber@rockwellcollins.com>
Message-ID: <87zhh9caux.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > fakeroot can be built to either use SYSV IPC or TCP for message passing.
 > A bug was discovered where Microsoft Windows 10 Services for Linux
 > doesn't include support for SYSV IPC MsgQ.  This patch adds support to
 > detect this case and automatically build fakeroot to use the TCP
 > transport instead (It is assumed a TCP transport would definitely have
 > more overhead then MsgQs so the default wasn't changed to TCP).

 > Fixes
 > https://bugs.busybox.net/show_bug.cgi?id=11366

 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: Jean-Francois Doyon <jfdoyon@gmail.com>
 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > ---
 > Changes
 > v1 -> v2
 > (Orig http://patchwork.ozlabs.org/patch/1130987/)
 > [Yann
 >  - Cleaned up commit log to be clear of the intent of this patch.  TCP
 >    IPC has other use cases but those don't apply to this fix and don't
 >    need to be included.
 >  - Verified concurrent use of TCP IPC are using ephemeral ports
 >  - Respining the orig patchset including runtime determination of
 >    enabling support instead of making it default.

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
