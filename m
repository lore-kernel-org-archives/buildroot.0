Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783ADC48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 19:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ED91606E2;
	Sun,  3 Mar 2024 19:15:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bOMft4XBpl5q; Sun,  3 Mar 2024 19:15:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E78F606E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E78F606E7;
	Sun,  3 Mar 2024 19:15:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9ACFE1BF863
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 19:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 951224078A
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 19:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ncPDinPvfBbb for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 19:15:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0598B40779
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0598B40779
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0598B40779
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 19:15:22 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33ddd1624beso2379072f8f.1
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 11:15:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709493321; x=1710098121;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=waptmZqVTrcBOLKOl99Ucd9ODeIXtshl7jnOHaLuy0M=;
 b=jEJKw4+l4lUL9X/ISzU/mwd2jrOz4a0gztlKtNxb4CeeR4NR4zMkxRmhOQfcw51Ftr
 lJ9hDxSFuPkxFqx/AXUDiNJJmClwiXprzIIPsSmXSh26IKdsETv4BcHiOldm0hoIzJ+N
 xGK60efAdq9VLxGXaBnD2F+IBnzZP0Ih6KxXCjTryEiqFtfjkWRElRmiPbcMsLQFDqDG
 lNNO9TqTn0jsT7s5WhHijbya4J73R4dJFYWNmh1HWUzZOeUuTCQeCArCsYVg8D55gB+D
 9Im+b+CL43JIrfs4u5UX4ywlcv/oiuOnBvs1CV74GI61f8fRqmfIhQYrXW2HSyI5Rz2A
 YoHA==
X-Gm-Message-State: AOJu0YzZeO6E7FApb6ewAxf1bhqo3pACfC1R51osXBqvAO1Gwt2vubo4
 lR79puiEkCI/uLbV30d8jxIospVzHd2evDRoxDuSZtOpxEgnlD5B
X-Google-Smtp-Source: AGHT+IGimFhDosxWAejzjIrhtJZ6NqgDT5o1tOpuJcgdEUgsLV5akGPhjpC7AgYB/2lVsMWkxc+A8A==
X-Received: by 2002:a5d:6d4e:0:b0:33d:8c9d:419 with SMTP id
 k14-20020a5d6d4e000000b0033d8c9d0419mr7129045wri.24.1709493320600; 
 Sun, 03 Mar 2024 11:15:20 -0800 (PST)
Received: from [127.0.0.1] (pd9fafdb0.dip0.t-ipconnect.de. [217.250.253.176])
 by smtp.gmail.com with ESMTPSA id
 bj12-20020a0560001e0c00b0033db0bbc2ccsm10794187wrb.3.2024.03.03.11.15.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Mar 2024 11:15:20 -0800 (PST)
Date: Sun, 3 Mar 2024 20:15:18 +0100 (GMT+01:00)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <9d1d9889-37db-4cf2-91d6-8ac202e7afb5@gmail.com>
In-Reply-To: <20240303181859.1103815-1-fontaine.fabrice@gmail.com>
References: <20240303181859.1103815-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Correlation-ID: <9d1d9889-37db-4cf2-91d6-8ac202e7afb5@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709493321; x=1710098121; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=waptmZqVTrcBOLKOl99Ucd9ODeIXtshl7jnOHaLuy0M=;
 b=BMKBh9tAUmPU9vv9js7zqrhEoHrnDlnBSafLscfhcaaJ8vYnrMyNrS4I+ZyPYKEmbY
 eHuhz7AeAEvELO1VsG1DsQOVoFYy5V5p1XX6M1cobfOq/IUBs9rtArWgU5upnmBIcQ+/
 1XlbxMXAncaq189Vx2p+zfxpSdVLndUu36Ndz6X0+eAW4W5ZG2KRbmOEBauuvL2yoeaD
 gWNvoA3yM+4zVODS7CyjNPPiZ8Zpo3Q3itcBLM7LSppqFB7yBl3rtYE1w9b8gmLUep63
 B6v40bED80E9Lb0FshbtHbAMF89ekZDu682GCne33l2SpfrCBZcU9H7LGE3M+2l6/fFZ
 3DVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BMKBh9tA
Subject: Re: [Buildroot] [PATCH 1/1] package/shadow: disable on uclibc
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmFicmljZSwKSSB3b3VsZCBhZGQgYSBjb21tZW50IHRvIHRoZSAiZGVwZW5kcyBvbiIgbGlu
ZSwgd2hpY2ggbGlzdHMgdGhlIGZ1bmN0aW9ucyB0aGF0IGFyZSBtaXNzaW5nIGluIHRoZSB1Y2xp
YmMgdG9vbGNoYWluLCBsaWtlIHJlYWxsb2NhcnJheS4KCkkgd2FudGVkIHRvIGZpeCB0aGlzIGJ1
aWxkIGlzc3VlIG5leHQgd2Vlay4gVGhhbmtzIGZvciB0aGUgcGF0Y2guIDopwqAKClRoYW5rcywK
UmFwaGFlbCBQYXZsaWRpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
