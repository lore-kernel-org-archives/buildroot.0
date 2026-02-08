Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7087EEF06E1
	for <buildroot@archiver.kernel.org>; Sun,  8 Feb 2026 17:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D3C3403F8;
	Sun,  8 Feb 2026 17:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lHRKbMfmCJLm; Sun,  8 Feb 2026 17:41:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B299140340
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770572505;
	bh=AR/ojy4rAdszMrKx2701kuWzRJ4hy+1saci1COAB/I4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e0ZiViWWc9yTKMZWVubPxN2uMMTuIJBS48HbY2ZbC/SU9RFXURWMHScB/koXCM/Wa
	 pw5lTjMQAp5ojLJm0HZhjMqq1dSfVHmhj2lraoP63PJyXEZ80MvCZCy/ZNAqkcciiS
	 3DAA6NkQpwCPyDgjGWbVKzoVnDkbxKO3HPhb7ZHLDlmofNqIoX2EUXuy+CrnCv1G2L
	 w3tW0vrbwx0xsGmWN0bgXKDBjHphWB4Rj4g7wLk1tYm3jyuA3Py36+3R6zTBrXBCE6
	 XcOTw39+iDmtw5SH8a0XXRDehPoYSb1pjeweIoAhzzRdgS+6HIBd72N5HGgAG4UGCe
	 VL0/LgzeGAWig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B299140340;
	Sun,  8 Feb 2026 17:41:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 057A6219
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 17:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E796A4033C
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 17:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id muj4v_JnCtPi for <buildroot@buildroot.org>;
 Sun,  8 Feb 2026 17:41:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1EC6640305
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EC6640305
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1EC6640305
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 17:41:43 +0000 (UTC)
Received: from L30177.local (unknown
 [IPv6:2a01:e0a:2af:22b0:3dda:3232:dd20:cc27])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3E2AB13F8A7;
 Sun,  8 Feb 2026 18:41:40 +0100 (CET)
Date: Sun, 8 Feb 2026 18:41:39 +0100
To: buildroot@buildroot.org
Cc: Romain Naour <rnaour@gmail.com>
Message-ID: <aYjK01lual_ALCFX@L30177.local>
References: <20260208173627.881651-1-vjardin@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260208173627.881651-1-vjardin@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770572501;
 bh=8/BZd9qSRrWrPlvKz1R5xiwXrBdJPTV53RzBts5fMBg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rBv2IYwlUfaMUhw+YWhRshVz5j8G0OHI3utBpXUWwGRt9EAWQxEP3Bd+G81trwMDx
 r6ie5Ea/sHczJcGDVW84j7eF/hIXL6SD8MBZvXrk7GDjefWbwYaDsKBdAEnUMrfe/d
 Exl78iA0yZI2+aZeODg2nQe8LqDr6jHNkMeaF9jfxGKQtNkAEFpGv748461pi2mi0u
 zo+aQRKXfFGHtz3iXCpuJJ0XIkR5L5cI/zK3uI9EmFFa0AzodEYC0LwG14t4lZ8uPu
 GZ08iu1GW6zaA/EzqxhQ3/A4MEP5cZ4nC6XnQjzlRHA6FZhi7QX+y6tS2nr01KDVPf
 a+5euw4/KuSWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rBv2IYwl
Subject: Re: [Buildroot] [PATCH v2 0/2] new packages: rpmsg-utils and
 rpmsg-echo-test
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

> Add two new packages from the OpenAMP system reference examples [1]:
> rpmsg-utils and rpmsg-echo-test.

The gitlab CI on this serie is avaiable at:
  https://gitlab.com/vjardin/buildroot/-/pipelines/2312959013

best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
