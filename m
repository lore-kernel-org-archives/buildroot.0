From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Aug 2017 23:24:37 +0200
Subject: [Buildroot] [PATCH 1/2] cc-tool: pass -latomic in LIBS
In-Reply-To: <20170820133416.11231-1-thomas.petazzoni@free-electrons.com>
References: <20170820133416.11231-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170823232437.64b5b82a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Aug 2017 15:34:15 +0200, Thomas Petazzoni wrote:
> Just like -lpthread was passed in LIBS, -latomic should also be passed
> in LIBS. In order for this to work, we however need to first fix
> cc-tool's Makefile.am so that it does not overwrite LIBS.
> 
> This is the first part of fixing the build of cc-tool in a static
> linking scenario on SPARC, i.e to fix:
> 
>   http://autobuild.buildroot.net/results/ed9f2524d0ccef318ff1bc99e5dea980111de989/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Note: I believe that the -lpthread conditionally added to LIBS when
> static linking is useless now. Indeed, the two C libraries that
> support static linking (musl and uclibc) now have a single libc
> library, so -lpthread is not needed. Glibc does not support static
> linking.

I've applied both patches to master. The cc-tool patch has been merged
upstream already (so I adjusted the patch description). No feedback from
upstream on the boost.m4 patch though.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
