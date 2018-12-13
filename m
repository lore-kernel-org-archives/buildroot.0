From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 22:12:12 +0100
Subject: [Buildroot] [PATCH] package/libpam-tacplus: fix compilation
 with GCC 8
In-Reply-To: <20181211112113.21648-1-casantos@datacom.com.br>
References: <20181211112113.21648-1-casantos@datacom.com.br>
Message-ID: <20181213221212.5dcafde0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Dec 2018 09:21:13 -0200, Carlos Santos wrote:
> GCC 8 demands that the size of the string copied by strncpy be smaller
> than the size of the destination to keep space for the trailibg '\0'.
> This causes a compilation error in pam_tacplus, so add a patch already
> sent uptream to fix it.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/da6d150e470046c03c5f7463de045604e15e4a30/
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
>  ...0002-Fix-compilation-of-tacc.c-with-GCC-8.patch | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/libpam-tacplus/0002-Fix-compilation-of-tacc.c-with-GCC-8.patch

Applied to master, thanks. Please submit the patch upstream. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
