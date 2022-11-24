Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD8DC43219
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 21:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BC2940017;
	Thu, 24 Nov 2022 21:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BC2940017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yxinSaMBAZR2; Thu, 24 Nov 2022 21:16:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8249840610;
	Thu, 24 Nov 2022 21:16:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8249840610
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3DEF81BF311
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0309882235
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:16:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0309882235
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hDh7snyqo8lq for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 21:16:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36A408222F
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36A408222F
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 21:16:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1063E1C0006;
 Thu, 24 Nov 2022 21:15:57 +0000 (UTC)
Date: Thu, 24 Nov 2022 22:15:57 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20221124221557.4a18a2a9@windsurf>
In-Reply-To: <20221124102144.16833-1-neal.frager@amd.com>
References: <20221124102144.16833-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669324558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/g30/k5JMSX1yP6stXqbkqyBA+yrDImcgDm2+GdHXM=;
 b=ME86V0oPvXzwGLHg0TVdkI2tWVBYYsK/FRHAFaU4+udScLOayfRRVsh17rLa0mqs0qbpf6
 VuER0by5Ydj3TfMDQw2P7NevIQueRI/UQNDhGX+s3ZBfrgaEdngGl1+Mj6uie+tyCzizsM
 cSdRIeLvFsFSK1rmeNut3s+lsdxIHiP2GmzNQ9HEeq4g0S+YGF2/WpVwbn0DkKWJ44dgZo
 2DN1N9gQqnvnZOjUScwfkwA32otpy38oOyiHlIlPkGHS/77dr3cxJjm1+1ZMZT1lkL7MsD
 g+jiVOe2YsWPMjOKLQCT4AREGGQWN3X4y3W6ag5JnU2BXB8YpFx9NTkUHNLY3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ME86V0oP
Subject: Re: [Buildroot] [PATCH v6 1/2] package/versal-firmware: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: michal.simek@amd.com, kris.chaplin@amd.com, terry.oneal@amd.com,
 luca.ceresoli@bootlin.com, Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 24 Nov 2022 03:21:43 -0700
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> This patch adds support for downloading versal microblaze firmware binaries.
> These are necessary for booting Xilinx versal devices.
> 
> The location of these binaries is temporary, and will soon be added to the
> Xilinx firmware repository.  The temporary location is using the same free
> distribution license as the Xilinx firmware repository.
> 
> Once these files are available on the Xilinx repository, this package will
> be updated to the new location.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

I wanted to apply this... but there is a serious licensing issue I
believe, see below.


> diff --git a/package/versal-firmware/Config.in b/package/versal-firmware/Config.in
> new file mode 100644
> index 0000000000..122ef02175
> --- /dev/null
> +++ b/package/versal-firmware/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_VERSAL_FIRMWARE
> +	bool "versal-firmware"
> +	depends on BR2_aarch64
> +	help
> +	  Pre-built firmware files for Xilinx Versal boards.
> +
> +	  https://github.com/nealfrager/buildroot-firmware
> +
> +if BR2_PACKAGE_VERSAL_FIRMWARE
> +
> +config BR2_PACKAGE_VERSAL_FIRMWARE_VERSION
> +	string "versal firmware version"

Drop "versal" here: this option appears indented under
"versal-firmware", so repeating "versal" is not needed.

> +	default v2022.2

Quotes around v2022.2

> +config BR2_PACKAGE_VERSAL_FIRMWARE_BOARD
> +	string "versal board name"
> +	default vck190

Same comments here.

> +	help
> +	  Name of Versal target board.
> +	  Used for installing the appropriate firmware boot.bin.
> +
> +endif # BR2_PACKAGE_VERSAL_FIRMWARE
> diff --git a/package/versal-firmware/versal-firmware.mk b/package/versal-firmware/versal-firmware.mk
> new file mode 100644
> index 0000000000..cb36d1e045
> --- /dev/null
> +++ b/package/versal-firmware/versal-firmware.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# versal-firmware
> +#
> +################################################################################
> +
> +VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
> +VERSAL_FIRMWARE_SITE = $(call github,nealfrager,buildroot-firmware,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))

Use $(VERSAL_FIRMWARE_VERSION) here

> +VERSAL_FIRMWARE_LICENSE = "Xilinx-Binary-Only or GPL-2.0-or-later"
> +
> +VERSAL_FIRMWARE_LICENSE_FILES = LICENSE

I really don't understand how this repository code can be under
GPL-2.0-or-later. The GPL implies that source code is available as the
GPL explicitly states that the software should be provided under its
"preferred form of modification", which a closed source binary
definitely is not.

So when the LICENSE file says:

COPYRIGHT TEXT:
---------------

The files distributed with this project are provided in binary form under the following free and
permissive binary-only license; source files are not provided.  While the following free and 
permissive license is similar to the MIT open source license, this it is NOT the MIT open source 
license or any other OSI-approved open-source license.

Copyright (c) 2022 Xilinx, Inc

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and 
associated documentation files (the "Software"), to deal in the Software without restriction, including 
without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or 
sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject 
to the following conditions: 

The above copyright notice and this permission notice shall be included in all copies or substantial 
portions of the Software. 

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT 
NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Files:
kv260/kv260_pmufw.elf
zcu102/zcu102_pmufw.elf
zcu106/zcu106_pmufw.elf
vck190/vck190_plm.elf
vck190/vck190_psmfw.elf
vck190/vck190_vpl_gen_fixed.pdi

---------------------------------------------------------------------------------------------------

COPYRIGHT TEXT:
---------------
Copyright (C) 2010 - 2022 <Xilinx, Inc> This program is free software; you can
redistribute it and/or modify it under the terms of the GNU General Public
License as published by the Free Software Foundation; either version 2 of the
License, or (at your option) any later version. This program is distributed in
the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details. You should have received a copy of
the GNU General Public License along with this program; if not, see
<http://www.gnu.org/licenses/>

SPDX-License-Identifier: GPL-2.0 /

Files: 
kv260/kv260_pmufw.elf
zcu102/zcu102_pmufw.elf
zcu106/zcu106_pmufw.elf
vck190/vck190_plm.elf
vck190/vck190_psmfw.elf
vck190/vck190_vpl_gen_fixed.pdi

The first part somewhat makes sense, but the second part certainly does
not make sense. If those binary files contain GPLv2 code, providing
only the binaries is a violation of the GPL.

So I'm sorry, but this needs to be fixed up before we can consider
applying this package.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
