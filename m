Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6D3C3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 19:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C58981779;
	Sat, 20 Jul 2024 19:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JR13Ts-7JyAG; Sat, 20 Jul 2024 19:49:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F8F2817AC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F8F2817AC;
	Sat, 20 Jul 2024 19:49:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B53E21BF5F8
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 19:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF4F86074E
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 19:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Prf81DIsuDV for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 19:49:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=frank-w@public-files.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C09260749
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C09260749
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C09260749
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 19:49:44 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.156.75] ([217.61.156.75]) by web-mail.gmx.net
 (3c-app-gmx-bs02.server.lan [172.19.170.51]) (via HTTP); Sat, 20 Jul 2024
 21:49:42 +0200
MIME-Version: 1.0
Message-ID: <trinity-6ec563fa-da3b-425d-9184-a34393e6d9b5-1721504982908@3c-app-gmx-bs02>
To: Frank Wunderlich <frank-w@public-files.de>
Date: Sat, 20 Jul 2024 21:49:42 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <trinity-5c5ad72e-281b-4354-bf44-2eae6f8ae579-1721478860307@3c-app-gmx-bs02>
References: <trinity-5c5ad72e-281b-4354-bf44-2eae6f8ae579-1721478860307@3c-app-gmx-bs02>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Y+QYw/SM0ZYA1z4mesgOkeqwBakAVlpyTBg2XWoWJKG+v/j/LnyYvksfn1SyXMRT+zFFb
 xlY7HU4YSVby6VmH1EIyu/SYRZI9LMXrepi7bmJr7e/U6k0UHccetxz0NglqMO2ZpnSbyDa4CUx6
 5i2uxM/UwkNzOupDktBlVB1GQ1vXs5oNYDeJB78jHSfSZFCOHZlCSqqSEX4meX0785d+oIz6ycKN
 jUoJAqH4xF0pZzLpp31FMre/A46+qPIeT3SVArO/Cduo8H8rnNVV3TYDWcm6WBCEuNyAMwgKU0pl
 W8=
UI-OutboundReport: notjunk:1;M01:P0:8B26pwy+dno=;k5Ahov7cl58X4yIkKKjwjHLb6gS
 fZUfWgF7/KFFIcVJq6GYzOkszRG9cO3bj64+bSPLlm9b3bHEWHSgROXJGUeOY9kuwjIcVbbSI
 Z59gvNWz7J+4lnWwx5uvYYcLB0Ihn9qZzCuQlbrBey45I/7cxscrqHkHXoaXlMJ8syZkImB/U
 98rMPQV1/i/jMg0ic4ftKaNP9FeQvolNI/ABs4W/9kjpbnFfpNBKU+2K8C+/qOneyWGGh47y+
 9VZSHWEHK6WLe2GHxBhlso0PNi2wjn9Tx+4EdM5ygjGQsFZCPrArHqMSzmG03fsWbJ1jJgCne
 J/PezP0BdBGpemHxunYv7dKVL4eXo0fQjJS1eMf+8YWiOQ2FRZRvbmGXZGOQziVMLPgCD3SCC
 O1iOAKl6c0FzGrDxmwV8I7AtfPUlQ6xkbR4O2ptYhMN2bIl7KjgMQ///q2d9PEHeCf791bHIL
 wPX+bG/Gg6HW7dCGeaQAlGGBc+XW3VeXCuRVQod76DKikVLsoNh4FGPrq6Pyhzg2gac6NBRNJ
 nceOkZPl3F2fPR0Qi7/bBog2DBiaZ7y8HkKWTNky3uut6dnduWrv3VksAyKdOXbmo7g+puq7N
 Vmf8rcVSPZy0qAXGuHHhcFHkX3a8Q5QfIwGDgK2FV441lfto0sjLHqX+7ZoDGsdftzdEK2U31
 UcneUjFlzgi+DZOpS+w+2tC45N/74+6lhGcGsT8tpw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=public-files.de; 
 s=s31663417; t=1721504983; x=1722109783; i=frank-w@public-files.de;
 bh=/KuUFpw0Bdq0oM+hzjkab9VACyNwZpKPM8UtzT0IM/s=;
 h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
 Content-Type:Date:In-Reply-To:References:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=NjChOv+CGF89ZwL3UKXZ7o+vIE4U+cZ8baWJERDIVLFXVLbV5BRhpXEZgQKTdm2y
 /aaBhQ4vMJIJ+MEctP47RlerjZLsfIVATlqntYrrgNQrPnAgpwAV7VVoad98BuKgU
 2yncvskoU+ZjYdWb35TJ6k9zaVFbelRAo6fWQ8A/VeZ3PxVtn+1kwixAYS5l0weTG
 4T96qZAMb4KZqxpfeWPG4PPVLWLJqNmQinZCNN0FI0QY/X7vuqZXbgPb271EH+4JX
 AR3yTZBxT+Lm0Ly0KAdoAKaDVAAlicugLUnju7r7A2KTpTKDNFz/CL4uoeWCC8Hg2
 OPuplav61iEgbufC7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=public-files.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=public-files.de header.i=frank-w@public-files.de
 header.a=rsa-sha256 header.s=s31663417 header.b=NjChOv+C
Subject: Re: [Buildroot] lvm2 seems to require systemd
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Frank Wunderlich via buildroot <buildroot@buildroot.org>
Reply-To: Frank Wunderlich <frank-w@public-files.de>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi

in the meantime i tried to add systemd (which i want to avoid due to size and complexity)

BR2_PACKAGE_SYSTEMD=y
BR2_INIT_SYSTEMD=y

but hang on this:

Found CMake: /media/data_ext/git/buildroot/output/per-package/systemd/host/bin/cmake (3.28.3)
Run-time dependency libbpf found: NO (tried pkgconfig and cmake)
Run-time dependency mount found: NO (tried pkgconfig and cmake)

output/build/systemd-254.13/meson.build:1188:11: ERROR: Dependency "mount" not found, tried pkgconfig and cmake

tried installing libmount-dev pkgconf-bin libbpf-dev on my building-machine without success

also tried without BR2_INIT_SYSTEMD, which compiles good, but the error below is on running bootup (before login)
so i guess i need systemd as init, but maybe i'm wrong

regards Frank


> Gesendet: Samstag, 20. Juli 2024 um 14:34 Uhr
> Von: "Frank Wunderlich" <frank-w@public-files.de>
> An: buildroot@buildroot.org
> Betreff: lvm2 seems to require systemd
>
> Hi,
>
> i try to build a buildroot (2024.05) initrd with lvm2 support
>
> so basicly added these options:
>
> #to select BR2_PACKAGE_HAS_UDEV
> BR2_PACKAGE_EUDEV=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_LIBBLOCKDEV=y
> BR2_PACKAGE_LVM2=y
>
> build is fine, but i see this while bootup:
>
> [    3.665010] udevd[1520]: failed to execute '/usr/bin/systemd-run' '/usr/bin/systemd-run --no-block --property DefaultDependencies=
> no --unit lvm-activate-vg-nvme /usr/sbin/lvm vgchange -aay --autoactivation event vg-nvme': No such file or directory
> done
>
> i see the physical volume, but logical volumes are disabled
>
> # pvscan
>   PV /dev/nvme0n1p5   VG vg-nvme   lvm2 [<1.79 TiB / <1.78 TiB free]
>   Total: 1 [<1.79 TiB] / in use: 1 [<1.79 TiB] / in no VG: 0 [0   ]
> # vgscan
>   Found volume group "vg-nvme" using metadata type lvm2
> # lvscan
>   inactive          '/dev/vg-nvme/var' [10.00 GiB] inherit
>
> and so i cannot mount the logical volume
>
> # mount /dev/vg-nvme/var /mnt
> [  281.006375] /dev/vg-nvme/var: Can't lookup blockdev
> [  281.011279] /dev/vg-nvme/var: Can't lookup blockdev
> [  281.016202] /dev/vg-nvme/var: Can't lookup blockdev
> [  281.021080] /dev/vg-nvme/var: Can't lookup blockdev
> mount: mounting /dev/vg-nvme/var on /mnt failed: No such file or directory
>
> any ideas?
>
> regards Frank
>
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
