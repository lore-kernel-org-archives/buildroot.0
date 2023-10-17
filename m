Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC2BCDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 14:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CC2041E7C;
	Tue, 17 Oct 2023 14:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CC2041E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lnb1PkJY9o7N; Tue, 17 Oct 2023 14:33:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B29941E30;
	Tue, 17 Oct 2023 14:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B29941E30
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A2D521BF300
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 14:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C3CD60E34
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 14:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C3CD60E34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3pDooQgtfbwt for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 14:33:16 +0000 (UTC)
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D096760BC6
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 14:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D096760BC6
Received: from [192.168.50.220] ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id sl8BqFqnN28c7sl8Bqe5RL; Tue, 17 Oct 2023 16:33:11 +0200
Message-ID: <63190f4c-7dcf-406f-a1fc-d3086ba278d9@benettiengineering.com>
Date: Tue, 17 Oct 2023 16:33:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Michel Alex <Alex.Michel@wiedemann-group.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <AS1P250MB0608A1D64A9F21ED90E72429A9D6A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <AS1P250MB0608A1D64A9F21ED90E72429A9D6A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
X-CMAE-Envelope: MS4xfCLRNQXzes+5eYgDwxwPVYOC741vRgsLUE1pR5AIdPXLlBnEs3or29+UdqmLGh5Lx576ZjCVnamsoXWGrmwfRNnAML97K4rtyTcym6NNiXPtETWTN9iG
 ZKU4bx6E5T9ylQKNFDCwgGV9KA+OJ02h3L0MqOPKXvyfMirTun2MLpfyLELbweGpWLHT8mnun873IflgIhiBNsPKTzb9EfbgYSdQL8PxKj6qMSzwtJTmQ7Py
 0SWLJ3L09dWpYG1xGkGE5B8r6NH88h24pm64yBA2TbI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1697553191; bh=Q5TbKmUwKm/vgc9HXJGE3xgJBWLDJbQFy4ToWSqhHH0=;
 h=Date:MIME-Version:From:Subject:To:Content-Type;
 b=jxDYEsWLVV47GxQfqB15rJCwl4GxmDYjIZZ4DeC8YKRiI5aSmxl/eUjj3HZOZeNnD
 wZjKbVUYGo6t1asqQ1nCVdBMU1ILK0RIY4mqBKprhcIhMTduomrrA9iVNNhdlvJkhg
 2OtKvz+VYG7ULLQYW4SlmY8nzgYOUwHW/p13bjdFBZ2yhakvhLzYlzc3lKbp7tK4m7
 D6d1RgLqqNxCvrA1GR1BUOdte/sG8nXlwh3ztgwOKeL8ra6XOebLJGa7Gg0JYqJONH
 ERaiDC5G3TO3LVjopySu1QFVH80sfAh8DZ4OqFDM9npyU6dC2uJ1qD4epnVdZqDw4Q
 mpKM8NuBgnadw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=jxDYEsWL
Subject: Re: [Buildroot] Need help for adding a cargo package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michel,

Il 17/10/2023 15:53, Michel Alex ha scritto:
> Hello,
> 
> I want to add zenoh-c package  (see https://github.com/eclipse-zenoh/zenoh-c)  to buildroot and need some support.
> 
> It is a rust package and, according to the readme file of the zenoh-c, it must be cross-compiled using cmake infrastructure.
> 
> I added new .mk file with following content:
> 
> ZENOH_C_VERSION = 0.10.0-rc
> ZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(ZENOH_C_VERSION))
> ZENOH_C_LICENSE = EPL-2.0
> ZENOH_C_LICENSE_FILES = LICENSE
> ZENOH_C_SUPPORTS_IN_SOURCE_BUILD = NO
> ZENOH_C_INSTALL_STAGING = YES
> 
> In order to build it for my ARM target, I have to specify the arm linker in the RUSTFLAGS environment variable as well as to provide the arm-unkown-linux-gnueabihf target as option for cargo build command:
> 
> 
> ZENOH_C_CONF_ENV = RUSTFLAGS="-Clinker=arm-linux-gnueabihf-gcc -Car=arm-linux-gnueabihf-ar"
> ZENOH_C_MAKE_ENV = RUSTFLAGS="-Clinker=arm-linux-gnueabihf-gcc -Car=arm-linux-gnueabihf-ar"
> 
> ZENOH_C_CONF_OPTS = -DZENOHC_CUSTOM_TARGET="arm-unknown-linux-gnueabihf"

All the 3 lines above should be automatically passed by cargo 
infrastructure that you choose below...

> $(eval $(cmake-package))

...by changing to cmake-package to cargo-package.

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas

> 
> How can I make this cargo specific variables be automatically generated by buildroot, so that this package can be built for other targets too?
> 
> Thanks in advance
> Alex
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
