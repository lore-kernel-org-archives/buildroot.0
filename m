From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 21:59:03 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/brltty: explicitly check if
 ioperm is available
In-Reply-To: <20171229140641.13882-2-mlang@blind.guru>
References: <20171229140641.13882-1-mlang@blind.guru>
 <20171229140641.13882-2-mlang@blind.guru>
Message-ID: <20171229215903.15ae85a3@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Dec 2017 15:06:41 +0100, Mario Lang wrote:
> ioperm, inb and outb are i386 specific functions usually
> not available on non-PC archs.  Check if ioperm is available before
> trying to use it.
> 
> Patch cherry-picked from upstream, can be removed when 5.6 is out.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/f09974f2ba24319e55e578ece34bb2e7e8bb3c43
>   http://autobuild.buildroot.net/results/7d502f280c46f0d1e2678140f9117fcc59bc2d7b
> Signed-off-by: Mario Lang <mlang@blind.guru>
> ---
> v2 fixes commit message and adds forgotten dependency on host-autoconf.

Like for PATCH 1/2, I've moved the patch back into package/brltty/,
since a per-version sub-directory is not needed. I've also added a
comment in the .mk file about why we're doing autoconf, and not an
autoreconf.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
