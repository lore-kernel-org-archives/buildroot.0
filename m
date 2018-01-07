From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 23:45:29 +0100
Subject: [Buildroot] [PATCH v6 3/4] m68k_cf5208: suffers from gcc 64735
In-Reply-To: <1515068911-21112-4-git-send-email-heyleke@gmail.com>
References: <1515068911-21112-1-git-send-email-heyleke@gmail.com>
 <1515068911-21112-4-git-send-email-heyleke@gmail.com>
Message-ID: <20180107234529.6f31ced4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  4 Jan 2018 13:28:30 +0100, Jan Heylen wrote:
> From: Jan Heylen <jan.heylen@nokia.com>
> 
> so add it to the list of BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> 
> Identified experimentally by using exception_ptr with m68k_cf5208 and
> looking at the value of ATOMIC_INT_LOCK_FREE. ATOMIC_INT_LOCK_FREE = 1,
> so the issue is present. Also verified that gcc 7.x fixed it also for cf5208.
> 
> Signed-off-by: Jan Heylen <jan.heylen@nokia.com>

I've applied, after slightly tweaking the commit log:

    toolchain: m68k coldfire is also affected by gcc bug 64735
    
    Verified experimentally by using exception_ptr with m68k_cf5208 and
    looking at the value of ATOMIC_INT_LOCK_FREE. ATOMIC_INT_LOCK_FREE=1,
    so the issue is present. Also verified that gcc 7.x fixed it also for
    cf5208.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
