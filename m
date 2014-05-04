From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 May 2014 23:24:44 +0200
Subject: [Buildroot] [PATCH 1/1] cups: move localstatedir from /usr/var
	to /var
In-Reply-To: <1398214149-1914-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Tue, 22 Apr 2014 20:49:09 -0400")
References: <1398214149-1914-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87siopi6eb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > Prior to commit f64a1b850fc897357040bb4c58b6e5e50e71e094 ("cups:
 > convert to autotargets"), cups was explicitely configured to
 > put its modifiable single-machine data under /var.  After that
 > commit, the --localstatedir was not specified, so it remained at
 > it's default value, "PREFIX/var" - making cups use "/usr/var".

 > Using /var to store state files seems preferable to /usr/var,
 > as /usr might be read-only on some systems.  This patch
 > re-introduces the --localstatedir specification to build cups
 > to use /var.

 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
