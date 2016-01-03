From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jan 2016 21:47:08 +0100
Subject: [Buildroot] [PATCH v3] Makefile: drop ldconfig handling
In-Reply-To: <1451683419-18398-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 1 Jan 2016 22:23:39 +0100")
References: <1451683419-18398-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k2nqo0fn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The ldconfig handling in the main Makefile is utterly broken, as it
 > calls the build machine ldconfig to generate the ld.so.cache of the
 > target. Unfortunately, the format of the ld.so.cache is architecture
 > specific, and therefore the build machine ldconfig cannot be used
 > as-is.

 > This patch therefore simply drops using ldconfig entirely, and removes
 > /etc/ld.so.conf.d/ from the target skeleton. The idea is that all
 > libraries that should be loaded by the dynamic linker must be
 > installed in paths where the dynamic linker searches them by default
 > (typically /lib or /usr/lib).

 > This might potentially break a few packages, but the only way to know
 > is to actually stop handling ldconfig.

 > In order to be notified of such cases, we add a check in
 > target-finalize to verify that there is no /etc/ld.so.conf file as
 > well as no /etc/ld.so.conf.d directory.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
