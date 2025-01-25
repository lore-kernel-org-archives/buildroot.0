Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F98C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 11:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 390F881FD3;
	Sat, 25 Jan 2025 11:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8g_yramJkfyW; Sat, 25 Jan 2025 11:49:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F10381FD8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F10381FD8;
	Sat, 25 Jan 2025 11:49:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32C4C1183
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 11:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 206A540E52
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 11:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VN0GwdpWMg13 for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 11:49:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 92D9341443
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92D9341443
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92D9341443
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 11:49:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E0FC613F86E;
 Sat, 25 Jan 2025 12:49:04 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58784])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 12:49:04 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 12:49:04 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <e3929210-5754-4794-93b7-262539f36552@gmx.de>
References: <20250123144032.1429434-1-fiona.klute@gmx.de>
 <e194f1d1813c5be0c9d4a4e95076c0f1@free.fr>
 <e3929210-5754-4794-93b7-262539f36552@gmx.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <09c86a1a2555b414b4a168ec288354a1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737805747;
 bh=QUKyeQa1aoHbr+UC9sQea1BnBJ0jKOWsdWPNum+jHZI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ks059iQD5cCgrXZ3oVXNf5gseoYdvnJCmr7KfMzdhlQAy5Qjlv0pt2cFpIn3b12LS
 dMG2qg+tm+/8Kwcd9eubqQem8A9XE6yntFBgqW0olEnlRlqJbqQs8NdduCaQRabXtk
 renpJT99BWjfxPlKz7GIS9E6DnENv2k2sLh3OTNavZxc3LzEHHMlCCqx4KhW3qB4rj
 Hsxv/JyblW/UqZ3Jp/66IFbBeVqrv1ma7oX1nflsDi4yGOZ2q92XikzUdfCQHU3F9y
 m615Z7tr0a6cy/8F9DWVTefHUyTMdLLFU5Hj+N3/Ya3Im3qz6u1nl/lDeX6xBP8FuC
 BAqVNnUQXGSwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ks059iQD
Subject: Re: [Buildroot] [PATCH 1/1] package/panel-mipi-dbi-firmware: new
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona,

On 24/01/2025 22:03, Fiona Klute wrote:
> Hi Julien!
> 
> Am 24.01.25 um 21:05 schrieb Julien Olivain:
>> Hi Fiona,
>> 
>> Thanks for the patch!
>> 
>> On 23/01/2025 15:40, Fiona Klute via buildroot wrote:
>> [...]
>>> diff --git a/package/panel-mipi-dbi-firmware/panel-mipi-dbi-
>>> firmware.mk 
>>> b/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.mk
>>> new file mode 100644
>>> index 0000000000..c3a9fa7afc
>>> --- /dev/null
>>> +++ b/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.mk
>>> @@ -0,0 +1,35 @@
>>> +################################################################################
>>> +#
>>> +# panel-mipi-dbi-firmware
>>> +#
>>> +################################################################################
>>> +
>>> +PANEL_MIPI_DBI_FIRMWARE_VERSION =
>>> 1cbd40135a8c7f25d7b444a7fac77fd3c3ad471e
>>> +PANEL_MIPI_DBI_FIRMWARE_SITE = https://github.com/notro/panel-mipi-
>>> dbi.git
>>> +PANEL_MIPI_DBI_FIRMWARE_SITE_METHOD = git
>>> +PANEL_MIPI_DBI_FIRMWARE_LICENSE = CC0-1.0
>>> +# license info is directly in the only source file
>>> +PANEL_MIPI_DBI_FIRMWARE_LICENSE_FILES = mipi-dbi-cmd
>>> +
>>> +PANEL_MIPI_DBI_FIRMWARE_DEPENDENCIES = host-python3
>> 
>> The script mipi-dbi-cmd does not seem to depend on extra host python
>> modules. See:
>> https://github.com/notro/panel-mipi-dbi/blob/main/mipi-dbi-cmd#L15
>> 
>> Do you think we could use BR2_PYTHON3_HOST_DEPENDENCY instead? See:
>> https://gitlab.com/buildroot.org/buildroot/-/commit/
>> b98062f7301bc72d2a59cca733f36525405d3bb9
>> 
>> This could save the time of the host-python compilation, in some 
>> situation.
>> 
>> What do you think?
> In principle that should work, but as far as I can see I'd have to add
> some logic to search the Python interpreter in that case:
> $(HOST_DIR)/bin/python, python3, or python?
> 
> I suppose the elegant solution would be to store the detected
> interpreter in a make variable from
> support/dependencies/check-host-python3.mk, and the host-python3 one
> otherwise. I can add a patch to do that, but the naming scheme varies
> between the other check-host-* files. Would PYTHON3 be acceptable, or
> should I use BR2_PYTHON3? Something else?
> 
> Or would it be acceptable to just use "python3" and break in the 
> (likely
> rare) case someone only has "python"? I don't really like that option.

My understanding of PEP 394:
https://peps.python.org/pep-0394/
is that a system with the "python" binary alone could only be a old
Python 2 interpreter (which would not be sufficient and would build
a host-python3).

Then, the "mipi-dbi-cmd" script is executable and correctly starts
with "#!/usr/bin/env python3", which needs a "python3" binary in
the PATH.

So I believe it would work to have:

PANEL_MIPI_DBI_FIRMWARE_DEPENDENCIES = $(BR2_PYTHON3_HOST_DEPENDENCY)

Then calling the script with:

PATH=$(BR_PATH) $(@D)/mipi-dbi-cmd ...

Anyways, this point is an optimization detail, so I'll apply the
patch as is and let decide if it is worth improving that in a
follow up patch.

> Best regards,
> Fiona

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
