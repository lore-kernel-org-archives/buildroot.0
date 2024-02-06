Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D081BC48286
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 08:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60A1A40351;
	Tue,  6 Feb 2024 08:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60A1A40351
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8SIbf51jdwIi; Tue,  6 Feb 2024 08:56:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0B7440330;
	Tue,  6 Feb 2024 08:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0B7440330
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 659141BF2BC
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 08:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EBBF60E09
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 08:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EBBF60E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PEnrGxx3ZGvE for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 08:56:00 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 749BD60BF4
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 08:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 749BD60BF4
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5114b1e8819so3141221e87.1
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 00:56:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707209758; x=1707814558;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4u03kbFOr5eK5cbWLXyg/NOs/n+PQIUgr0FTbeb8sTI=;
 b=SqSbCooKv3vKZ62UzE9h+fhc74Rnut6nfvgLR1/4S3DLObz6cyrPLo6e0lz1PCpAYc
 2T/z7v2UrWGRPrgLSnhXTKoh03BwEPKCSjPuHbmcti9/4NrDoLbwLbTOPr9j+0aZq8lL
 LppBXC6IpQDhv+rdTPLeS+r3f7vHzD56G43Ve4uvy4ef42F5Vi4Hyy2DHrUuDP5fFg1H
 B622AjrQuCqcrEDL1L0yu1x6chHlxe/NrcZdeu++/jzI/uPj9BozLpcBOQgwabgqTDN3
 8TGWhH6bWiHtuC2tCZTYNP7I/OAO3OAVD5IcTh69p3nDTr5OCVVgTKIz4hlOXKR68yzd
 iLpg==
X-Gm-Message-State: AOJu0YzZYRJK4tdFoqn0a1mYGJnLp2jZfmiKdadGJlmAFQ5dG68Lxvaf
 vEjnovmG9AYr1E1SufNf0aoH7zZUrQW7bbdUNivMdXA/CM5e6NZE3O+fm7Ju
X-Google-Smtp-Source: AGHT+IHqcXlfP5iFPEUfL+4SFLlousZSTIVaPSmjjdFUOG+YOyvKZHYyZ3T8KwUjx00QcJ3ZUiQh4g==
X-Received: by 2002:a19:4f4e:0:b0:511:610f:4ec3 with SMTP id
 a14-20020a194f4e000000b00511610f4ec3mr62676lfk.53.1707209757781; 
 Tue, 06 Feb 2024 00:55:57 -0800 (PST)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 f18-20020a0565123b1200b005115edd71c9sm97306lfv.165.2024.02.06.00.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 00:55:57 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 10:00:48 +0100
Message-ID: <20240206090048.2214719-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707209758; x=1707814558; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4u03kbFOr5eK5cbWLXyg/NOs/n+PQIUgr0FTbeb8sTI=;
 b=REntLGTLSR3AjMcHo1WA+gi0gba4Imbj9r6W8LgCARWNBa2sBh4qcV4AyvqZdDNxVM
 OXOYy+Zkjeh10FmZvdWIQm6FGnq2Oa0NFWx9Vz+ElHCpTBmvsBVPsn4fkfVex9Pfk9RO
 8Jbsin+zbfxlrQ9Oz97gidLv1nc+opGRMb2+LVWbh7f0utEGZXY1mgi6NKHZcGbzMROQ
 oCqdrFWnWPrc+5GRiO6X9ndh7WXMh8UXGviw0IqHXoiEreLnrASfcPJdv+c4VoSk8x93
 aMhy/Oas1fLc7b9IZYmDyP7mEe5cNSe4Q/Rx+oAoUgBgDLt5aZ/EdJtGYcqcKh/KVTT/
 Tr9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=REntLGTL
Subject: [Buildroot] [PATCH] package/makedevs: describe the recursive type
 in the README
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The recursive type is described everywhere else, so add it to
the README as well.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/makedevs/README | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/makedevs/README b/package/makedevs/README
index 70844bf802..6c583609a5 100644
--- a/package/makedevs/README
+++ b/package/makedevs/README
@@ -26,6 +26,7 @@ where name is the file name,  type can be one of:
 
       f: A regular file
       d: Directory
+      r: Directory recursively
       c: Character special device file
       b: Block special device file
       p: Fifo (named pipe)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
