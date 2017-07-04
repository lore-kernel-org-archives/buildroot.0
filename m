From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 23:59:27 +0200
Subject: [Buildroot] [PATCH 031/100] git: use the new gettext logic
In-Reply-To: <20170704144920.12318-32-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
 <20170704144920.12318-32-thomas.petazzoni@free-electrons.com>
Message-ID: <89181a7b-28f3-13e2-d715-70e54eb59f4a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-17 16:48, Thomas Petazzoni wrote:
> This commit switches to use the new gettext logic, which involves
> using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
> on gettext/host-gettext.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/git/git.mk | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/package/git/git.mk b/package/git/git.mk
> index 9cc88dd..23ace0f 100644
> --- a/package/git/git.mk
> +++ b/package/git/git.mk
> @@ -9,11 +9,7 @@ GIT_SOURCE = git-$(GIT_VERSION).tar.xz
>  GIT_SITE = https://www.kernel.org/pub/software/scm/git
>  GIT_LICENSE = GPL-2.0, LGPL-2.1+
>  GIT_LICENSE_FILES = COPYING LGPL-2.1
> -GIT_DEPENDENCIES = zlib host-gettext

 You dropped the host-gettext dependency, was that intentional?

 Regards,
 Arnout

> -
> -ifeq ($(BR2_PACKAGE_GETTEXT),y)
> -GIT_DEPENDENCIES += gettext
> -endif
> +GIT_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  GIT_DEPENDENCIES += openssl
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
