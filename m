From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Dec 2015 00:40:36 +0100
Subject: [Buildroot] [PATCH 1/1] fakeroot: build depends on libcap
In-Reply-To: <1449185456-5409-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1449185456-5409-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <5660D2F4.4000305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04-12-15 00:30, Ricardo Martincoski wrote:
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
>  package/fakeroot/fakeroot.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
> index 8bb9294..f3dc96e 100644
> --- a/package/fakeroot/fakeroot.mk
> +++ b/package/fakeroot/fakeroot.mk
> @@ -9,5 +9,6 @@ FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
>  FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20141005T221953Z/pool/main/f/fakeroot
>  FAKEROOT_LICENSE = GPLv3+
>  FAKEROOT_LICENSE_FILES = COPYING
> +FAKEROOT_DEPENDENCIES = host-libcap

 That should probably be HOST_FAKEROOT_DEPENDENCIES since we don't have a target
fakeroot (and probably never will have it).

 With that fixed:

 Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

>  
>  $(eval $(host-autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
