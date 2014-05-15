From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 May 2014 09:51:47 +0200
Subject: [Buildroot] [PATCH] libunwind: add patch to fix behavior for
	ARM < v6
In-Reply-To: <20140514204712.GK4096@tarshish>
References: <1400017657-12704-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140514204712.GK4096@tarshish>
Message-ID: <20140515095147.202e1f63@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 14 May 2014 23:47:12 +0300, Baruch Siach wrote:

> > +-# Don't link against libatomic_ops for now.  We don't want libunwind
> > +-# to depend on libatomic_ops.so.  Fortunately, none of the platforms
> > +-# we care about so far need libatomic_ops.a (everything is done via
> > +-# inline macros).
> > +-#
> > +-#  AC_CHECK_LIB(atomic_ops, main)
> > ++  AC_CHECK_LIB(atomic_ops, main)
> 
> For the sake of reproducibility shouldn't we add libatomic_ops to libunwind 
> dependencies when libatomic_ops is enabled?

Yes, you're right! I'll send a patch for that.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
