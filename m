Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1CCC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 08:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45F07408D6;
	Tue,  2 Jan 2024 08:53:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45F07408D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LUYdV5Y_G8Uq; Tue,  2 Jan 2024 08:53:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A94A408FF;
	Tue,  2 Jan 2024 08:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A94A408FF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8272A1BF5A6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 688FF606C6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 688FF606C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nsy4jvX00f_K for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 08:52:30 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78D3D60681
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 08:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78D3D60681
Received: by mail.gandi.net (Postfix) with ESMTPSA id CAD441BF205;
 Tue,  2 Jan 2024 08:52:28 +0000 (UTC)
Date: Tue, 2 Jan 2024 09:52:28 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102095228.178085f0@windsurf>
In-Reply-To: <20240101220601.8779-1-fontaine.fabrice@gmail.com>
References: <20240101220601.8779-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704185548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xsv5wLD7CmFMW2OIq/6rSAb2w+CcKvirXg14bz6rqSc=;
 b=XjXH6Cyp6Xw4ueJl3NvtlK8K3cWgS6DowOCguFVS3RK2Ejvcs43rnqVvvvaT1S2gV1iPf+
 TSZnhFb0LPykqkpIj5seFzXyPp9eD5Ll5HECGfpixOJgBopK5gsJaT+a5Et8npB1oIDAGX
 LArq3vgYCssfLmWbSkzrairG13qMObCVFcLHBduAEwis9EnRmTtNmY79ZUAUTgSNjU5q8g
 dEjVPjiU+ct4CvW19MvQHA1oOBIiNuLtSbIrm3Xt3qOFY9fAD5Nh5iLiu1o00p2nOhXEGt
 gmhxflXVRyHARplXGDr34oRJNlt1V3lv9JzmEdm5Qq07AREbHCBZiVLhQv5NYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XjXH6Cyp
Subject: Re: [Buildroot] [PATCH 1/1] package/libssh2: fix CVE-2023-48795
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

On Mon,  1 Jan 2024 23:06:01 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/advisories/GHSA-45x7-px36-x8w8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...o-fix-CVE-2023-48795-Terrapin-Attack.patch | 462 ++++++++++++++++++
>  package/libssh2/libssh2.mk                    |   3 +
>  2 files changed, 465 insertions(+)
>  create mode 100644 package/libssh2/0002-src-add-strict-KEX-to-fix-CVE-2023-48795-Terrapin-Attack.patch

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
