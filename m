From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 23:04:49 +0200
Subject: [Buildroot] [PATCH] uclibc: proper thread default on m68k and
 Microblaze
In-Reply-To: <1470414941-29826-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470414941-29826-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160807230449.7a3d62c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  5 Aug 2016 18:35:41 +0200, Thomas Petazzoni wrote:
> Traditionally, Buildroot has a default of enabling thread
> support. However, with the current construct of the thread choice in the
> uclibc package, the m68k and microblaze architecture end up with no
> thread support as the default.
> 
> In order to avoid having to explicit a more complicated "default" value
> for the choice, we take a simple approach:
> 
>  - The "none" choice is moved at the end of the list, so that it is not
>    selected as the default unless there is really no other thread
>    implementation available.
> 
>  - We make NPTL the default thread implementation.
> 
>  - On architectures where NPTL is not available, the NPTL option will
>    not be available, so Kconfig will automatically fallback to
>    linuxthreads.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/uclibc/Config.in | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Applied to master, after taking into account Yann's comment.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
