Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DB9C4332F
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 13:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79282408DC;
	Tue,  8 Nov 2022 13:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79282408DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pt2lf-CgjzOw; Tue,  8 Nov 2022 13:27:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2CD0408B4;
	Tue,  8 Nov 2022 13:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2CD0408B4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7418D1BF39A
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 13:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32C338142D
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 13:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32C338142D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2hvb0IocrD87 for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 13:27:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB65C817D3
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB65C817D3
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 13:27:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3C46220009;
 Tue,  8 Nov 2022 13:26:58 +0000 (UTC)
Date: Tue, 8 Nov 2022 14:26:57 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221108142657.41aeebae@windsurf>
In-Reply-To: <20221107224105.461499-1-fontaine.fabrice@gmail.com>
References: <20221107224105.461499-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667914019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MXzpo6sN9lFlUWUOA/zbHEEixAbiJ1FOv3FudGto9g8=;
 b=nSQgN4z44fNDnDX2dvEuEzlk3Aj9hjK77X2O4jS0zvatVmoSdSaXoo9j4xATHZn+cyPUZu
 0Cv4/no0YmOb1hIsko4BMJkP49tkK3x6/NglNmT7beA8aOXcmvsoREy9DpzjOycQiYrVmx
 5oqYunBXeEV3HZLaYHdltoA8eMoJbYXF9UmHg1InbS6fhIWCQKgs69GDZ5rCGWEW195AkE
 9CpcR3VhNzqf4X8aGfNvN7z+OrnUwasQdBC50X+EKgDN/6mtEYSBT2iBvyfaFpKzYpjuCE
 hTi3jjklzuUZSOpk94u7v9WBJGhZAi+C/pWwOwl7UBfGwx+/deWXSXkzcn5rkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nSQgN4z4
Subject: Re: [Buildroot] [PATCH 1/1] package/libkcapi: disable -Werror
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
Cc: Tan En De <ende.tan@starfivetech.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  7 Nov 2022 23:41:05 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following musl build failure (disabling -Werror seems to be the
> only "solution": https://github.com/smuellerDD/libkcapi/issues/136):
> 
> lib/kcapi-kernel-if.c: In function '_kcapi_common_send_meta':
> lib/kcapi-kernel-if.c:212:12: error: unsigned conversion from 'long int' to 'long unsigned int' changes value from '-4' to '4294967292' [-Werror=sign-conversion]
>   212 |   header = CMSG_NXTHDR(&msg, header);
>       |            ^~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c789d43e71e6075e297bef58d888228a89055bbc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../libkcapi/0002-Add-disable-werror.patch    | 46 +++++++++++++++++++
>  package/libkcapi/libkcapi.mk                  |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644 package/libkcapi/0002-Add-disable-werror.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
