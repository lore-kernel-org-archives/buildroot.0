From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Apr 2017 00:05:29 +0200
Subject: [Buildroot] [PATCH v6 2/2] systemd: select fsck wrapper from
	util-linux
In-Reply-To: <1491824995-19670-2-git-send-email-casantos@datacom.ind.br>
References: <3eeb7e24-fcc2-8d75-e0e8-141eeaceab70@mind.be>
 <1491824995-19670-1-git-send-email-casantos@datacom.ind.br>
 <1491824995-19670-2-git-send-email-casantos@datacom.ind.br>
Message-ID: <b0de90ac-b30e-7bf1-5693-0afd73376834@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-04-17 13:49, Carlos Santos wrote:
> Select the fsck required by systemd provided by util-linux. This
> prevents ending up with fsck from busybox, which is incompatible
> with systemd.
> 
> Change-Id: I61cfc9b8925169b2678ac911fcd5a4eb5d92c425

 The Change-Id shouldn't be there, since we don't use gerrit.

 Otherwise:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
> [there were no v1, v2]
> Changes v3
>   - Select e2fsprogs + e2fsck
> Changes v3->v4
>   - Remove selection of e2fsprogs + e2fsck
>   - Clean-up commit message
> Changes v4->v5
>   - Screwed-up everything, reverting the chances made in v4
> Changes v5->v6
>   - Restored changes made in v4.
>   - Restore the patch changelog.
> ---
>  package/systemd/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 0f54686..478cc10 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -22,6 +22,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
>  	select BR2_PACKAGE_UTIL_LINUX_BINARIES
>  	select BR2_PACKAGE_UTIL_LINUX_MOUNT
>  	select BR2_PACKAGE_UTIL_LINUX_NOLOGIN
> +	select BR2_PACKAGE_UTIL_LINUX_FSCK
>  	select BR2_PACKAGE_KMOD
>  	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
>  	select BR2_PACKAGE_KMOD_TOOLS
> @@ -61,6 +62,11 @@ menuconfig BR2_PACKAGE_SYSTEMD
>  	  - libgcrypt package will add support for journal sealing and
>  	    DNSSEC verification in resolved.
>  
> +	  Notice that systemd selects the fsck wrapper from util-linux
> +	  but no particular fsck.<fstype> is selected. You must choose
> +	  the apropriate ones (e.g. e2fsck, from the e2fsprogs package)
> +	  according to the system configuration.
> +
>  	  http://freedesktop.org/wiki/Software/systemd
>  
>  if BR2_PACKAGE_SYSTEMD
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
