From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Jun 2012 01:13:33 +0200
Subject: [Buildroot] [RFC/PATCH 3/4] busybox: ensure
 $(BUSYBOX_BUILD_CONFIG) is writable
In-Reply-To: <1340031743-29694-4-git-send-email-ntl@pobox.com>
References: <1340031743-29694-1-git-send-email-ntl@pobox.com>
 <1340031743-29694-4-git-send-email-ntl@pobox.com>
Message-ID: <4FE2591D.7050707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/18/12 17:02, Nathan Lynch wrote:
> If $(BUSYBOX_CONFIG_FILE) is read-only, the sed fixups to
> $(BUSYBOX_BUILD_CONFIG) fail.
>
> Signed-off-by: Nathan Lynch<ntl@pobox.com>
> ---
>   package/busybox/busybox.mk |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 1d988f8..50a612f 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -115,7 +115,8 @@ endef
>   endif
>
>   define BUSYBOX_COPY_CONFIG
> -	cp -f $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_BUILD_CONFIG)
> +	cp -f $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_BUILD_CONFIG)&&  \
> +		chmod u+w $(BUSYBOX_BUILD_CONFIG)

  Just put it on two lines, without the && \ connector.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
