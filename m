From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 May 2016 23:26:04 +0200
Subject: [Buildroot] [PATCH 1/5] package/nginx: fix libxslt support
In-Reply-To: <1462793343-20234-1-git-send-email-martin@barkynet.com>
References: <1462793343-20234-1-git-send-email-martin@barkynet.com>
Message-ID: <20160513232604.348f29fe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  9 May 2016 12:28:59 +0100, Martin Bark wrote:
> Change to using pkg-config to find libxslt and it dependencies.
> 
> This Fixes:
>  http://autobuild.buildroot.net/results/382699bbed15f598625b9296e464d1349ef559f8
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  ...bxslt-conf-allow-to-override-ngx_feature_.patch | 42 ----------------------
>  ...0004-auto-lib-libxslt-conf-use-pkg-config.patch | 31 ++++++++++++++++
>  package/nginx/nginx.mk                             |  7 ++--
>  3 files changed, 35 insertions(+), 45 deletions(-)
>  delete mode 100644 package/nginx/0004-auto-lib-libxslt-conf-allow-to-override-ngx_feature_.patch
>  create mode 100644 package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch

I've applied your 5 patches to the master branch, thanks for doing this
work around nginx, much appreciated.

I have two comments though:

 1/ Could you submit the nginx patches upstream? We currently have 8
    patches on nginx, and it would be really good to reduce the size of
    this stack of patches.

 2/ We normally don't number the patches on packages, i.e we don't want
    the patches do have "PATCH x/y" in their title. Since the nginx
    patches already had a numbering, I applied your patches as-is. But
    as you can see now, this numbering is meaningless (which is why we
    don't want it in the first place). A follow-up commit removing this
    numbering would be good.

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
