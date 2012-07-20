From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 23:39:12 +0200
Subject: [Buildroot] [PATCH 4/5] libglib2: define
 __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4
In-Reply-To: <1342646260-11203-5-git-send-email-s.neumann@raumfeld.com>
References: <1342646260-11203-1-git-send-email-s.neumann@raumfeld.com>
 <1342646260-11203-5-git-send-email-s.neumann@raumfeld.com>
Message-ID: <20120720233912.4a6bb4ea@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 18 Jul 2012 23:17:39 +0200,
Sven Neumann <s.neumann@raumfeld.com> a ?crit :

> On ARMv5 atomic operations are not actually available as inlines
> but libgcc does still provide them as functions. Trick glib into
> using the functions instead of using the mutex-based fallbacks.
> 
> This should probably be platform-dependant. The inline functions
> are available for ARMv6 and above and probably for other platforms
> as well. Please advice on how to fix this properly.
> 
> Without this change performance of atomic operations is horrible
> on ARMv5 systems.
> 
> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>

But isn't the compiler supposed to define
__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 by itself?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
