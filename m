Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3192DCD3447
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 10:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F55041B77;
	Fri,  8 May 2026 10:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ey8X7aWFjv93; Fri,  8 May 2026 10:32:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53EC241B44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778236341;
	bh=lUcjGoBmT3ELHhkCb5+Mbq8eaJlRSUec4hznw3SsfqY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DkjY/L6rxiwhCcXYVSapeI9zCToraUwZryqILCK2Hn/461a7aRabrCughLqidXXZC
	 sj9wlpHBuJfty3NmqxaeicSQFzTYZRkqE2ZbVxOphavHk9puJ2WbnSD1jx4TD5csH6
	 AYlvCXIPQCU0+VPh9a0u+0xwfFNn3RwDyiRD9Pq/OjzU8fX1WvEfz8vjgctvAW2Fhg
	 vAVYGte+Zrfm2qGFtT7GuHyzgZOKiYrUQHXkPWNYCwq1PEWzLRDH7v4WLi6Ip/tdB+
	 EpfmvsavLNYvcX6EfCutFerR4s05CB56xUHGF8WC970lxzCWwC37srAz1g2ZCcPP9h
	 lWFg6358Lldhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53EC241B44;
	Fri,  8 May 2026 10:32:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4169C317
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32CD6615BC
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6oJWS45Gn8SF for <buildroot@buildroot.org>;
 Fri,  8 May 2026 10:32:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 93788615B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93788615B8
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93788615B8
 for <buildroot@buildroot.org>; Fri,  8 May 2026 10:32:18 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2b45cb89f7eso12195235ad.0
 for <buildroot@buildroot.org>; Fri, 08 May 2026 03:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778236337; x=1778841137;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xMZZt5aT0YCCrG3mspmDbEnFcPOEbFlAxTuzHTkhdHk=;
 b=g55aSev3a2JAwOCD9WhyWRcIvGBNkjqBdkgYE1PwhQ3Ihcd8f8+DC+E3d3BVNF6PS/
 PjHom1Fm5dquQkqkEXypAp08XolVmlIKej/PWNDvdV6mwsYmz3egOAQFcbecIpSoH4e5
 LWLuGv/YJOxlPdg3t/GN9AEMbc7fVZX7od8yqScfsp9Byjdp4ZamHqdNTrlV0HjKPSMG
 yQiqNl8mHQ23bzIIUpoMEE8eXJzFfWe25XT6pLnV6WBEpeklmPldtkDYIYLyp2K28Pm0
 2lIu+xGPslzSJxnaxa3d3AyxICdmS9KviIqNO5z7e3IxBrx06sSmFzUQ2D6c5SVc1Nld
 E8Ig==
X-Gm-Message-State: AOJu0YygBi8tCrrqQ1QDdStf0v+umBXlx4NtmedY6QIrA9/DFrbYLgz1
 aZqbdu++wpHBvV0XxYoQlYMyNJ5Inr9sizogHuhJFZvHVeJyBAE2q6QibmxiiObb
X-Gm-Gg: Acq92OEFJtIzaLFWeq+SbVLp7i8frnqpLUmEC1PGI3h5SvRiLVhmSqq6XIBvsymFJwf
 1DDvfA7MvKsJ52PTaoZhhDd23MaY/dk9yTmNnYfzkgcvbz5EfhMXfMoKh7/3XKLgR7ba8kEYwxj
 o8wyyCCMc83+nTjNt5hZ0ZIHnnhxpG3L87l9MaufvnfvqY6372DrX8j3QhMxj6GrN+63jMB78xY
 hn6du13imIPeeKES6xQmTKE4uzfuVcVCC8z7dx2prwjyOqvb1g0yMxlJSfFDIMDcdcnNuc3eYqq
 h2OyXy8N8ZtVh307KfYDrUcRa0V22GFzo/khw9s1odVJd4UQexsgjatx+kh9ABFEke0kpcuznsq
 ivouKdOp71RH1guDdijmxmnvkw4zpn6AXdwEtwHc3utUBKM7oJx2/JWdhrI4pV2XTCfXfAckH/z
 JuHylhOukorZM8hetjLgKcCIq86lbah2Bmi5I5ankV+MmstNdtDrcuhVyZDwg=
X-Received: by 2002:a17:903:90b:b0:2ba:9e1c:7cbb with SMTP id
 d9443c01a7336-2ba9e1c7e18mr95884985ad.34.1778236337239; 
 Fri, 08 May 2026 03:32:17 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:4064:4e33:456:d996:1796:c8f2:159c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2baf1eac3afsm18998145ad.71.2026.05.08.03.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 03:32:16 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri,  8 May 2026 16:00:05 +0530
Message-ID: <20260508103009.463932-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508081010.250838-1-chakrabortyshubham66@gmail.com>
References: <20260508081010.250838-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778236337; x=1778841137; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xMZZt5aT0YCCrG3mspmDbEnFcPOEbFlAxTuzHTkhdHk=;
 b=Ybmdmu/lR/ABACgp3Piw9UPPb2a/xfSyxPMrlExnlBtHwYi/V15JKJTH/4lIl24oUC
 k0RV8vaAI9LoyCbggNvEigIVt+6eCrWqCySJU2GqOYumBufZTeqW8JzpYpIVn0wNKqhI
 OP1ud0IuGwq5LIhUUpRmi50AaJkJaxjwrNQjHWD2oPD46HzwGovacRJs3na39BNGggsl
 ynKrXTEgeIeHamBKjsLTt8WFkg5PleEskrCtFJy5kuoqebsmxcyIfi63GI8nTXoxeFfh
 QaWFKka1VjdfSTHW9ra7tWH5Fk1ErOFpy/q76EuhLMnRu0qlrLx8kKSVI2LTzG5hyvVh
 rQ0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Ybmdmu/l
Subject: [Buildroot] [PATCH v2 0/2] package/htop: bump to version 3.5.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series updates htop to version 3.5.1 and adds myself to the
DEVELOPERS file.

Changes v1 -> v2:
  - Removed redundant "Key changes" from commit message (Marcus)
  - Updated Changelog link to point to the file (Marcus)
  - Fixed "Sined-off-by" typo in the DEVELOPERS commit

Shubham Chakraborty (2):
  package/htop: bump to version 3.5.1
  DEVELOPERS: added Shubham Chakraborty for htop

 DEVELOPERS             | 1 +
 package/htop/htop.hash | 4 ++--
 package/htop/htop.mk   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
