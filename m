Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EBEC46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 13:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBCE740A45;
	Tue, 26 Dec 2023 13:16:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBCE740A45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kV8SoH9qpl5k; Tue, 26 Dec 2023 13:16:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7F4B409C4;
	Tue, 26 Dec 2023 13:16:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7F4B409C4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE8D11BF489
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5A3181336
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 13:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5A3181336
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cdBzo9cOzLgs for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 13:14:07 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 870E88132C
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 13:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 870E88132C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09A701BF203;
 Tue, 26 Dec 2023 13:14:03 +0000 (UTC)
Date: Tue, 26 Dec 2023 14:14:03 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231226141403.7a8874dc@windsurf>
In-Reply-To: <20231226113428.32609-1-fontaine.fabrice@gmail.com>
References: <20231226113428.32609-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703596444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHXrjVgKqI1jdCWHBvePlafDwTkBHEkJsyKwYpSwZiM=;
 b=kmhwpJSVcKVD+VXswrmFPazcEKNJs8vLhWYREXIuwByDMdgm1SXGEuAB0S356HzyCd0Duo
 KcL8+5i2e9rqMp6AHvqkmHZkMA3m0edRoXu/Do8ounbF34UwENMtePnM6GG7gndM2J6uDc
 zwIV8MkcQRJ7VfVqnaEcMf6hKkh/fTRDhL8JhhMLfgPy3DLFzDR7uilJ5w+1rc4GqyCOQ1
 7i2qDtevgClF7eKYB5ONtc01TewxTIBBi8Liknidxa7A/ZSoM9DpqX8RcR5ABMWb1u4a9u
 pIdGztefcDyt6yBBPFZ5Z/Uox798zONI9gZ27dov+tW08brkPFWwo3jyKqdrCA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kmhwpJSV
Subject: Re: [Buildroot] [PATCH 1/1] package/cjson: security bump to version
 1.7.17
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Dec 2023 12:34:28 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Fix null reference in cJSON_SetValuestring (CVE-2023-50472)
> - Fix null reference in cJSON_InsertItemInArray (CVE-2023-50471)
> 
> https://github.com/DaveGamble/cJSON/releases/tag/v1.7.17
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cjson/cjson.hash | 2 +-
>  package/cjson/cjson.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
