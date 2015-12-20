From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 13:58:58 +0100
Subject: [Buildroot] [PATCH] package/nut: disable libltdl (and
 nut-scanner) for static-only
In-Reply-To: <1450548656-16506-1-git-send-email-yann.morin.1998@free.fr>
References: <1450548656-16506-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151220135858.56065e2f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 19 Dec 2015 19:10:56 +0100, Yann E. MORIN wrote:
> nut-scanner needs libltdl, a wrapper around dlopen/dlsym. This does not
> really make sense on a static-only build.
> 
> Disable use of libltdl in static-only builds; this disble nut-scanner.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/d8e/d8e769709681b1965f36eb5c27f71f3a1f5adcf1/
>     http://autobuild.buildroot.org/results/6e4/6e403642069093389acbeeccd7030b76d4ab68be/
>     http://autobuild.buildroot.org/results/fa4/fa4c647ce58b91b863d8de5bf9d44b2060a1cf1c/
>     and so many others...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/nut/nut.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
