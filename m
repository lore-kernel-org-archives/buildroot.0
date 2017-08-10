From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 01:09:06 +0200
Subject: [Buildroot] [Patch v7 03/10] rustc: expose host variant in
 menuconfig
In-Reply-To: <20170723081206.7774-4-eric.le.bihan.dev@free.fr>
References: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
 <20170723081206.7774-4-eric.le.bihan.dev@free.fr>
Message-ID: <e8960546-f98a-39cb-1d78-082b64d31471@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-07-17 10:11, Eric Le Bihan wrote:
> Now that one provider is available for rustc, expose the host variant in
> menuconfig.

 This doesn't need to be split up from the first patch that introduces the
virtual package: that patch doesn't introduce any visible Kconfig symbol so
including is already doesn't hurt. And *not* including it is completely pointless.

 Regards,
 Arnout

> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/Config.in.host | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index c5a852b..ab24081 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -39,6 +39,7 @@ menu "Host utilities"
>  	source "package/qemu/Config.in.host"
>  	source "package/raspberrypi-usbboot/Config.in.host"
>  	source "package/rauc/Config.in.host"
> +	source "package/rustc/Config.in.host"
>  	source "package/s6-rc/Config.in.host"
>  	source "package/sam-ba/Config.in.host"
>  	source "package/squashfs/Config.in.host"
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
