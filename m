From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Oct 2013 18:09:47 +0100
Subject: [Buildroot] [PATCH v3 2/2] ModemManager: add new package
In-Reply-To: <1382962191-6274-2-git-send-email-yegorslists@googlemail.com>
References: <1382962191-6274-1-git-send-email-yegorslists@googlemail.com>
 <1382962191-6274-2-git-send-email-yegorslists@googlemail.com>
Message-ID: <526FEBDB.80307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/10/13 13:09, yegorslists at googlemail.com wrote:
[snip]
> +comment "modemmanager requires a toolchain with IPV6, LARGEFILE, WCHAR and thread support and the udev infrastructure"
> +	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || \
> +		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV

 We've standardized this type of comment into

comment "modemmanager needs udev and a toolchain w/ largefile, wchar, threads, IPv6"


 Regards,
 Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
