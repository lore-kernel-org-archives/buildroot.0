From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 04 May 2012 22:46:10 +0200
Subject: [Buildroot] [PATCH v2] ccache: allow dynamic selection of cache
	directory
In-Reply-To: <962414f85797a188de79.1333738037@beantl019720>
References: <962414f85797a188de79.1333738037@beantl019720>
Message-ID: <4FA44012.8040008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/06/12 20:47, Thomas De Schampheleire wrote:
> -define HOST_CCACHE_FIX_CCACHE_DIR
> -	sed -i 's,getenv("CCACHE_DIR"),"$(CCACHE_CACHE_DIR)",' $(@D)/ccache.c
> -	sed -i 's,getenv("CCACHE_COMPILERCHECK"),"none",' $(@D)/ccache.c


  On second review, a better implementation would be to replace the first
sed by

sed -i 's,getenv("CCACHE_DIR"),getenv("BUILDROOT_CACHE_DIR"),' $(@D)/ccache.c


  Then you no longer need the wrapper script at all.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
