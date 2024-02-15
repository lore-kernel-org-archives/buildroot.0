Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1312C4829E
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 17:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F46141E03;
	Thu, 15 Feb 2024 17:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CJQ0v1VvPiQ4; Thu, 15 Feb 2024 17:23:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0BD241E56
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0BD241E56;
	Thu, 15 Feb 2024 17:23:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CFBF21BF33D
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 17:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD8B1606B0
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 17:23:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zj8JnF4t6M_H for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 17:23:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 88B486069C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88B486069C
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88B486069C
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 17:23:37 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id afRHrMCtLa6zwafSQrcs5D; Thu, 15 Feb 2024 18:23:35 +0100
Message-ID: <8f65944f-3d15-4ef8-a53b-4b9c399537fc@benettiengineering.com>
Date: Thu, 15 Feb 2024 18:23:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kilian Zinnecker <kilian.zinnecker@mail.de>, buildroot@buildroot.org
References: <20240214233028.1226645-1-kilian.zinnecker@mail.de>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240214233028.1226645-1-kilian.zinnecker@mail.de>
X-CMAE-Envelope: MS4xfI4JKtzgMlFzXc4E5EFNPws9JoLopurQrt2/CFJ6NZHqUj0kyviGYAZmvGqUnjQplupSUZf9gm3loJdw594T0r5t0KnV4FF4qZSn0k6LKPVk//64mwlV
 BWzzAH5Ic9+s1G/y0pOukrx7oxgL8lE/cKTIuFdJVVIOi9yPlxAgcivqljmj8wPobAwldkogi12H6NXZi2aLp/HkoPrl4F7p+Gyw4+0reLpbPnmxgEqkwYJj
 jw7MsiRPWqNJPXwQogy0K+mxsbz8RsJzsbBaDUFqLWKSnQYu0oOkYFK1D/zC5mrpAgyyHAwD3uusNDLmH8sY89owUkS1TaOwCzb0Fx2EWGM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708017815; bh=+CuKRYEg+5lZq9LdR0PYfSG53vk2ZerxAlGpfapp+Sk=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=VNLy/1yw65HhDOJrfuv0ykWq+i4L1zcRkZjQYJOoiof3x6GftxUVZiSyisRZvdVQz
 qcZ+vrV0UauZnnIjrSvNSih+hoJ//YzZkagAMkcHJUhajgj/em4z9iCALlcgYPfnD9
 R50aqho6DBvxUjnWTHnahink5+GobXjwRyP96uRK4AWRPPTgIjwRtuCkKQijMTIgFE
 vrByHJxo3runAFvfaUE79h3XXzEqjINA9WDzhMO7H5MHBmW2aCqximTdn0UfpW3+oe
 BNzGem37gfNye8AxfScBS+FaQp4a1xdSV02u7KtjKVYuwSDb0NoDYmqZC/cqtEdb4i
 ivRp0B9a3FVdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=VNLy/1yw
Subject: Re: [Buildroot] [PATCH v4 0/3] Add board support for the
 BeagleV-Ahead
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
Cc: Robert Nelson <robertcnelson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Eric,

On 15/02/24 00:30, Kilian Zinnecker wrote:
> This patch series adds board support for the BeagleV-Ahead.
> 

please report changes per patch, not in cover-letter.
In cover-letter you can add like a summary but for patch-specific
changelog it must be found in the patches

Thank you!

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> v3 -> v4:
>    - Improved descriptions in commit messages
>    - Patch to alphabetize own DEVELOPERS entry
>    - Fix in package/xuantie-bins/Config.in: Spaces -> tabs
>    - Github helper and removal of superfluous variables in xuantie-bins.mk
>    - Added patch to disable CLOCK_ALLOW_WRITE_DEBUGFS in custom kernel
> 
> v2 -> v3:
> 
>    - Added brief description what the xuantie bin binaries are for
>    - Unrolled loop in XUANTIE_BINS_INSTALL_IMAGES_CMDS of
>      package/xuantie-bins/xuantie-bins.mk
>    - Added a second product page link to board's readme.txt
>    - Added URL to the product page to git commit message
>    - Dropped "_CUSTOM" from all "BR2_RISCV_ISA_*" in the board's
>      defconfig
>    - Add description to the board's readme.txt and defconfig  why GCC
>      v13 is chosen
>    - Added BR2_PACKAGE_HOST_DOSFSTOOLS to board's defconfig
> 
> v1 -> v2:
> 
>    - Added hash file for xuantie-bins package
>    - Now uses uEnv.txt for actual boot commands
>    - Removed extlinux.conf
>    - Removed superflous comments inside config files
> 
> Kilian Zinnecker (3):
>    Fix alphabetical order of DEVELOPERS file entry
>    package/xuantie-bins: new package
>    configs/beaglev_ahead: new defconfig
> 
>   DEVELOPERS                                    |  5 +-
>   board/beaglev-ahead/genimage.cfg              | 62 +++++++++++++++
>   board/beaglev-ahead/linux.fragment            |  2 +
>   ...01-Disable-CLOCK_ALLOW_WRITE_DEBUGFS.patch | 30 +++++++
>   .../0001-Overwrite-bootcmd-by-force.patch     | 30 +++++++
>   board/beaglev-ahead/post-image.sh             |  6 ++
>   board/beaglev-ahead/readme.txt                | 78 +++++++++++++++++++
>   board/beaglev-ahead/uEnv.txt                  |  4 +
>   board/beaglev-ahead/uboot.fragment            |  2 +
>   configs/beaglev_ahead_defconfig               | 46 +++++++++++
>   package/Config.in                             |  1 +
>   package/xuantie-bins/Config.in                |  8 ++
>   package/xuantie-bins/xuantie-bins.hash        |  2 +
>   package/xuantie-bins/xuantie-bins.mk          | 19 +++++
>   14 files changed, 294 insertions(+), 1 deletion(-)
>   create mode 100644 board/beaglev-ahead/genimage.cfg
>   create mode 100644 board/beaglev-ahead/linux.fragment
>   create mode 100644 board/beaglev-ahead/patches/linux/0001-Disable-CLOCK_ALLOW_WRITE_DEBUGFS.patch
>   create mode 100644 board/beaglev-ahead/patches/uboot/0001-Overwrite-bootcmd-by-force.patch
>   create mode 100755 board/beaglev-ahead/post-image.sh
>   create mode 100644 board/beaglev-ahead/readme.txt
>   create mode 100644 board/beaglev-ahead/uEnv.txt
>   create mode 100644 board/beaglev-ahead/uboot.fragment
>   create mode 100644 configs/beaglev_ahead_defconfig
>   create mode 100644 package/xuantie-bins/Config.in
>   create mode 100644 package/xuantie-bins/xuantie-bins.hash
>   create mode 100644 package/xuantie-bins/xuantie-bins.mk
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
