From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Sep 2012 23:26:40 +0200
Subject: [Buildroot] [PATCH] Disable database support in linux-pam
In-Reply-To: <1347442051-24329-1-git-send-email-golubovsky@gmail.com>
References: <1347442051-24329-1-git-send-email-golubovsky@gmail.com>
Message-ID: <5058E710.6060404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/12/12 11:27, Dmitry wrote:
> Due to the conflicts with default Berkeley DB configuration, disable
> database support in linux-pam: pam_userdb is not built.
>
> Signed-off-by: Dmitry<golubovsky@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  This is fixing autobuilder issues, right?  I think Peter commits
faster if you add a link to an autobuilder failure :-)


  Regards,
  Arnout

> ---
>   package/linux-pam/linux-pam.mk |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
> index 48cb073..08b5cf9 100644
> --- a/package/linux-pam/linux-pam.mk
> +++ b/package/linux-pam/linux-pam.mk
> @@ -12,6 +12,7 @@ LINUX_PAM_CONF_OPT = \
>   	--disable-prelude \
>   	--disable-isadir \
>   	--disable-nis \
> +	--disable-db \
>   	--disable-regenerate-docu \
>   	--enable-securedir=/lib/security \
>   	--libdir=/lib

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
