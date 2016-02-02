From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2016 16:21:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/psmisc: fix musl build
In-Reply-To: <1454242565-13780-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454242565-13780-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56B0C973.8070400@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31-01-16 13:16, Bernd Kuhls wrote:
> Add upstream commit fixing a build error not yet been found by the
> autobuilders:
> 
> pstree.c: In function ?get_threadname?:
> pstree.c:798:15: error: ?PATH_MAX? undeclared (first use in this function)
>      char path[PATH_MAX + 1];
>                ^
> pstree.c:798:15: note: each undeclared identifier is reported only once for each function it appears in
> pstree.c:798:10: warning: unused variable ?path? [-Wunused-variable]
>      char path[PATH_MAX + 1];
>           ^
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/psmisc/psmisc.hash | 1 +
>  package/psmisc/psmisc.mk   | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/package/psmisc/psmisc.hash b/package/psmisc/psmisc.hash
> index fd99edf..5e489ed 100644
> --- a/package/psmisc/psmisc.hash
> +++ b/package/psmisc/psmisc.hash
> @@ -1,2 +1,3 @@
>  # Locally computed:
>  sha256  97323cad619210845b696d7d722c383852b2acb5c49b5b0852c4f29c77a8145a  psmisc-22.21.tar.gz
> +sha256  4f1cb11c7182ad96e682ec50a2d9a6a22079a2b11dffde3bb3cb67823b679422  e7203c36a2a4dc10cd8268a5dc036fc9c2a73b6c.diff
> diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
> index cbdf4c6..2f83b7d 100644
> --- a/package/psmisc/psmisc.mk
> +++ b/package/psmisc/psmisc.mk
> @@ -6,6 +6,8 @@
>  
>  PSMISC_VERSION = 22.21
>  PSMISC_SITE = http://downloads.sourceforge.net/project/psmisc/psmisc
> +PSMISC_PATCH = \
> +	https://gitlab.com/psmisc/psmisc/commit/e7203c36a2a4dc10cd8268a5dc036fc9c2a73b6c.diff
>  PSMISC_LICENSE = GPLv2
>  PSMISC_LICENSE_FILES = COPYING
>  PSMISC_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
