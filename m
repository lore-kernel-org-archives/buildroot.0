From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 23:08:08 +0200
Subject: [Buildroot] [PATCH 3/5] pkg-download: allow ssh URLs
In-Reply-To: <1465917079-30473-3-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614151017.GG3060@hermes.click-hack.org>
 <1465917079-30473-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1465917079-30473-3-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160615230808.4c1e063b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Jun 2016 17:11:17 +0200, Gilles Chanteperdrix wrote:

> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index a0f694d..5f7a155 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -225,7 +225,7 @@ define DOWNLOAD_INNER
>  	fi ; \
>  	if test -n "$(1)" ; then \
>  		case "$($(PKG)_SITE_METHOD)" in \
> -			git) $($(3)_GIT) && exit ;; \
> +			git|ssh) $($(3)_GIT) && exit ;; \

There has already been a question from Yann on a previous iteration of
this patch, which hasn't been answered:

"""
What about Hg URLs that can also start with 'ssh://' ?
"""

Indeed, I don't see why a ssh:// URL should necessarily reference a Git
repository. And there's no explanation about this decision in the
commit log.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
