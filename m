From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Aug 2014 19:02:54 +0200
Subject: [Buildroot] [PATCH] pkg-perl: fix build of perl XS packages
In-Reply-To: <1408042199-28433-1-git-send-email-francois.perrad@gadz.org>
References: <1408042199-28433-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140815190254.13946336@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Thu, 14 Aug 2014 20:49:59 +0200, Francois Perrad wrote:
> Set OPTIMIZE in order to avoid the use of the host $Config{optimize} value
> which could cause breakage when cross-compiling for the target.
> 
> See discussion in http://lists.busybox.net/pipermail/buildroot/2014-August/104129.html
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/pkg-perl.mk | 2 ++
>  1 file changed, 2 insertions(+)

This patch breaks the build of certain packages:
http://autobuild.buildroot.org/results/1a4/1a40923db4ba518001786b02d1d4ad2cf2bf7086/build-end.log.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
