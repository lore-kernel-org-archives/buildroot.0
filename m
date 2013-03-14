From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 14 Mar 2013 09:37:38 +0100 (CET)
Subject: [Buildroot] [PATCH] change default location for local.mk to
 $(CONFIG_DIR)
In-Reply-To: <513FA25B.5030908@mind.be>
Message-ID: <872634236.491763.1363250258384.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
>   But $(CONFIG_DIR) is not a good location then... $(CONFIG_DIR) is
> $(TOPDIR) if doing in-tree build, and $(O) if doing out-of-tree
> build.
> When you delete your out-of-tree dir, local.mk will also be gone...
> 

when you build out-of-tree, you want your config to be in the O= 
directory (that's the whole point of O= as I understand it) so when 
you remove that directory you loose your .config and thus all your 
customisation. It makes sense to have local.mk there too, since 
it's also customisation. But maybe I am missing something and that's 
not the point of O= 

but in that case, what is the recommanded way of not having the .config 
in $(TOPDIR) ? is that not what I am supposed to do ? how can I save my
.config in a git repo if I have to keep it in $(TOPDIR) which is already
a buildroot repo ?

I don't want to commit my .config in the buildroot repo because if I
want to upstream my changes to $(TOPDIR) at any point, the changes to
.config will be mangled in the middle. My philosophy is that $(TOPDIR)
changes should only be potentially upstreamable stuff...


>   I also don't really like the idea that with a defconfig, the build
> result will be different when you change the O= command line
> parameter.
> 

again, I might misunderstand the point of O= but I thought that was the
very idea behind it... have multiple projects sharing their $(TOPDIR), 
maybe their dl/ subdirectory, but not their .config

there is no risk of accidentally using an incorrect O= since O= is only
used for initialisation. After that, there is a makefile in $(CONFIG_DIR)
that properly redirect you 


> 
>   Regards,
>   Arnout
> 
> 
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR
> Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> 
