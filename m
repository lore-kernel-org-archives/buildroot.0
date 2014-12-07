From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 22:10:01 +0100
Subject: [Buildroot] [PATCH] xserver_xorg-server: disable libunwind on
 MIPS with 32-bit pointers
In-Reply-To: <1417778222-19910-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1417778222-19910-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141207221001.35d74fc8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 5 Dec 2014 11:17:02 +0000, Vicente Olivert Riera wrote:
> libunwind support in xorg-server is not only broken for MIPS64 n32 but
> for all MIPS variants with 32-bit pointers. The reason is exactly the
> same one. libunwind defines a uint64 variable to store the words. Then,
> xorg-server casts that variable (64-bit) into a pointer (32-bit), and
> the compilation fails:
> 
> backtrace.c:98:13: error: cast to pointer from integer of different size
> [-Werror=int-to-pointer-cast]
> 
> Related:
>   https://bugs.freedesktop.org/show_bug.cgi?id=79939
> 
> Fixes:
>   http://autobuild.buildroot.net/results/87b/87be2c95957f9925c1258812e536df72689fc5da/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
