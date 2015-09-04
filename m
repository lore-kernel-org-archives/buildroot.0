From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 04 Sep 2015 13:15:55 +0200
Subject: [Buildroot] [PATCH 0/4 v3] core/pkg-kernel-config: ensure linux
	supports modules (branch yem/kernel-module)
In-Reply-To: <cover.1441284678.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Thu, 3 Sep 2015 14:54:19 +0200")
References: <cover.1441284678.git.yann.morin.1998@free.fr>
Message-ID: <87io7qmo44.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Hello All!
 > This series fixes two standing issues with the way we handle packages
 > that build kernel modules:

 >   - first, the current check is broken, because $(LINUX_DIR) should be
 >     double-$ed, as it is used in a macro from an infra,

 >   - second, it is currently possible to (try to) build such packages
 >     without the kernel config havong CONFIG_MODULES set.

 > NOTE: The tree is currently *broken* for any package that uses the
 > kernel-module infra. The release is broken, too.

 > So, these three patches fix that:

 >   - introduce a new internal variable to tell the kernel to enable
 >     support for modules, LINUX_NEEDS_MODULES, that should be set
 >     whenever a package wants to build a kernel modules, and is
 >     automatically set by the kernel-module infra,

 >   - the (broken) check is no longer needed so removed,

 >   - a few packages that build kernel modules without using the
 >     kernel-module infra are fixed to manually set that variable.


 > Thanks to Peter for suggesting the solution, and to No? and Jan for
 > their previous attempts that eventually led to this series.

Committed series, thanks.

-- 
Bye, Peter Korsgaard
