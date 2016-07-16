From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 14:16:08 +0200
Subject: [Buildroot] [PATCH 2/3] package/rt-tests: bump to 1.0
In-Reply-To: <6212cf57-3d62-614d-4188-3afb603e76a7@gmail.com>
References: <1468522869-3887-1-git-send-email-romain.naour@gmail.com>
 <1468522869-3887-2-git-send-email-romain.naour@gmail.com>
 <20160715150422.5da4a111@free-electrons.com>
 <6212cf57-3d62-614d-4188-3afb603e76a7@gmail.com>
Message-ID: <20160716141608.26171c7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Jul 2016 13:58:07 +0200, Romain Naour wrote:

> I noticed a build issue with this new version of rt-tests [1] due to local
> syscall number definition for the new kernel deadline scheduler on some
> architectures. Upsteam added __NR_sched_setattr and __NR_sched_setattr
> definition for common architectures (x86, x86_64, arm) and tile if not already
> defined [2].
> 
> Maybe instead of adding missing syscall number, we can avoid building rt-tests
> with toolchain compiled with too old kernel headers (i.e
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_14)
> 
> Thoughts ?

We can do that and then see if some people using older kernels complain
that rt-tests are not available for them.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
