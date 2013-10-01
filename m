From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 01 Oct 2013 12:56:45 +0200
Subject: [Buildroot] [PATCH 1/1] package: fix github download URL
In-Reply-To: <1380195788-32432-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1380195788-32432-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <524AAA6D.8000103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/26/13 13:43, Jerzy Grzegorek wrote:
> diff --git a/package/cpuload/cpuload.mk b/package/cpuload/cpuload.mk
> index e0b8ccf..d00c3a4 100644
> --- a/package/cpuload/cpuload.mk
> +++ b/package/cpuload/cpuload.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>
> -CPULOAD_VERSION = v0.3
> -CPULOAD_SITE =http://github.com/kelvincheung/cpuload/tarball/$(CPULOAD_VERSION)
> +CPULOAD_VERSION = 0.3
> +CPULOAD_SITE =https://github.com/kelvincheung/cpuload/tarball/v$(CPULOAD_VERSION)
>   CPULOAD_LICENSE = GPLv2

  Not that it's a big deal to me, but I don't agree with the concept of 
this change. The meaning of this URL is that you export a certain tag 
from a git repository. It is conceptually not the same as a release 
tarball that a project creates. Therefore, I think the VERSION should be 
exactly the same as the tag name, so that it stays as close as possible 
as what we would have if we used the git site method.


  Also you change the URL to https here. With the recent problems with 
https URLs that we've seen on the autobuilders recently, I wonder if this 
is a good idea?


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
