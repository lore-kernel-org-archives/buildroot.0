From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 11:19:17 +0200
Subject: [Buildroot] [PATCH v5 2/2] systemd: select fsck wrapper from
	util-linux
In-Reply-To: <1491796444-8672-1-git-send-email-casantos@datacom.ind.br>
References: <1491796444-8672-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <3eeb7e24-fcc2-8d75-e0e8-141eeaceab70@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-04-17 05:54, Carlos Santos wrote:
> Select the fsck required by systemd provided by util-linux. This
> prevents ending up with fsck from busybox, which is incompatible
> with systemd.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---

 The patch changelog is missing, which in this case would be relevant because...

>  package/systemd/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 0f54686..f5eb9d0 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -22,6 +22,9 @@ menuconfig BR2_PACKAGE_SYSTEMD
>  	select BR2_PACKAGE_UTIL_LINUX_BINARIES
>  	select BR2_PACKAGE_UTIL_LINUX_MOUNT
>  	select BR2_PACKAGE_UTIL_LINUX_NOLOGIN
> +	select BR2_PACKAGE_UTIL_LINUX_FSCK
> +	select BR2_PACKAGE_E2FSPROGS
> +	select BR2_PACKAGE_E2FSPROGS_E2FSCK

 In reply to my comment on v3 you wrote:

"Good point. I will submit a new patch set removing the selection of
e2fsprogs."

 Something went wrong? You changed your mind?

 Regards,
 Arnout

>  	select BR2_PACKAGE_KMOD
>  	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
>  	select BR2_PACKAGE_KMOD_TOOLS
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
