From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 22:40:26 +0200
Subject: [Buildroot] [PATCH] pinentry: fix build issue with gcc 5.x
In-Reply-To: <1471701636-30275-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1471701636-30275-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160820224026.50f346ee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Aug 2016 16:00:36 +0200, Thomas Petazzoni wrote:
> pinentry currently fails to build with gcc 5.x, because it uses some
> functionality from std::string that requires C++11 without passing the
> appropriate -std= value. We fix this by passing a proper -std= option
> when gcc >= 5.x. Note that this can be removed once pinentry is bumped
> to the newest version (currently 0.9.7) because they no longer use
> std::string in the Qt part.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/6ea64f692acaebc4d58f3371c632b5121500f17e/
>   (and many, many similar build failures)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> One-beer-granted-to: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/pinentry/pinentry.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
