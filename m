From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Jul 2017 02:24:54 +0200
Subject: [Buildroot] [PATCH] package/skeleton: remove legacy mkdir
In-Reply-To: <1483477263-15610-1-git-send-email-yann.morin.1998@free.fr>
References: <1483477263-15610-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <95d16d2e-ab8e-0209-9b9c-f1a7b8d62305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-01-17 22:01, Yann E. MORIN wrote:
> We've had this mkdir, in various forms, for aeons. It dates back to
> the inception of Buildroot, at the dawn of ages, when the toolchain
> support was still nascent. Evolution had it morph from /include, to
> a tuple-prefixed directory and a symlink there-to, then back to the
> /include directory, to the final /usr/include directory we've had
> for the last 9 years.
> 
> Anything that wants to install headers is supposed to be creating
> that directory beforehand; we don't need this legacy mkdir now.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 Since in your skeleton rework series, *some* skeletons *don't* create this
directory, I've applied to master, thanks.

 Regards,
 Arnout

> 
> ---
> OK, we can keep it, just for nostalgia; I just felt like writing some
> prose tonight. ;-)
> ---
>  package/skeleton/skeleton.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> index 1000161..e65ef61 100644
> --- a/package/skeleton/skeleton.mk
> +++ b/package/skeleton/skeleton.mk
> @@ -107,7 +107,6 @@ define SKELETON_INSTALL_STAGING_CMDS
>  	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/lib
>  	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/bin
>  	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/sbin
> -	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include
>  	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(STAGING_DIR))
>  	ln -snf lib $(STAGING_DIR)/$(SKELETON_LIB_SYMLINK)
>  	ln -snf lib $(STAGING_DIR)/usr/$(SKELETON_LIB_SYMLINK)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
