Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67E3606C926
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=f5yOZWmi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KIzzV5DZ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00F6660854;
	Wed,  4 Nov 2026 21:00:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UlwHaJOiwtIP; Wed,  4 Nov 2026 21:00:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 318056080B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826037;
	b=JoTHXL0TTZXrd7xtp7SLffd1Zxgfh1heU8284D9WZt5AJWtaAuPDizpVZ4HG/+o6/LDo
	 aZPccK2Gd88Ls2uSrlWX73G9Wm7LOEdpzWOuWr/mxHvBvJyk4+KoL1j0Q+KKu01Fk543T
	 8Cz9bRCprcbgTX8fpntRS7/ZirFQXBwvaehvcn4X7KjRiDk19jXm/3E6/KklQTO8Qc4Eb
	 SEw6RkdLpJUUcgtwnDHHE8vy4H1C/LNxBY8ai/FmSbtzZoVZ4Jv2lbvqt3sYQVRGFhFho
	 48wB+FpTbswzZEMYsq4MDaX/IjCYyhydlD2q3GKjN0tBe4mBG48FSXmyVq65Q0MmJmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826037;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=seQD7VVR29IUQDa6fsBVOZLe/nVBbEJjjGQxTkG8Gdk=;
	b=m4Li1V/2I81d5S8DRkhYDs48cA5UjsnkuXyClW43Ui+CGJrDty3C27UVBpWlbYhOODMU
	 zGlI8NsXUYI3NwyF+PUov6xlXfLKm5E1mAllz7nG5Pu5foC+a1x8DeTaNdB233rJJanQX
	 4IL419I4Arv9H5e29LOiFPMjrL6yllo+VVAwhhBmLaUPYUvUCHoPaA3oTwfNPl+gnZqN8
	 D3fF5Ia3l7x4wIbMl+XGL4B/bkiUWy/SQB5XDAyc2hYDyfSXOPBAUUxvOinr2agYUMtc6
	 7GYdQTanIm2ErTuJ9zmqXOh5lI8raXIHsZhcgFdDXVw8MOPB6b1JAQxZuKFS2ufCgdQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826037;
	bh=seQD7VVR29IUQDa6fsBVOZLe/nVBbEJjjGQxTkG8Gdk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f5yOZWmiP1Nzms2EXFuGqnOKDTOAVC/pLO+pYk2iiwP9r/qL2L3R+uPO6W+DFUjtJ
	 GpyLMjMDugucUcHq2SKhepMgRgT84+OH7/MAjrbMroBeZcLhlMKH05cIn4XnRz7O+Z
	 cOn//3kdXhhGkJYeIOStFo+VJIhRWt7+b3ht/1AGoobFzQwMFMQ7qbmStnb4qGsqFp
	 g0t38F5da9sFz3QhfPmpr41/hMHHtts2MsJ4fotRn9yeynPnNz7Ky7fMH/V8VlMnyh
	 ZnnNsc5b8tvfj1NKIszRLNqq5x9l92/0Uztf7iT7fAg4szmJx1OMconWygPw8d4PM/
	 KeVx8Msc31Lvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 318056080B;
	Wed,  4 Nov 2026 21:00:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 112A431F
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9AF0408BC
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Ka0stcDAFCI for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:00:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CC470408D2
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=KIzzV5DZ
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC470408D2
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:00:32 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so897520f8f.3
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 13:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793826030; x=1794430830; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=l0xON/V/ug10d6XvdT7WMPTbRC36Yi7+U+v7kRlGT8o=;
 b=KIzzV5DZBGCRcDxgfcJKs4X62ORVVPe3TKhtOQ/YRYSZTVxMZ+uKMOM6v762gTOnLd
 qzKyC9+xvOJWmbULdjIfo+5fR76K/ScEqBSMseDUmVcagxm7M44xTJnAw4Yk1ixqHA7f
 Ns2NWpPJzKjY8bCgZB4kQAxzRaegrmvfWTtZwzfPccUgQjRQe8iihvPOjmlo80owoPVT
 0YdS8ACUVJpVvCTpQWRr6CWBLey1zrEti0vCiny+vru4HQ6Yd++Asx5BwJEBWrxyH2dm
 PJoctSprNiwUvyu0yMBV9ilcwDlpjYLzv5ZOSONJb3+p0+6puLlvAkRDwDs/lWnjEvT4
 ZriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793826030; x=1794430830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=l0xON/V/ug10d6XvdT7WMPTbRC36Yi7+U+v7kRlGT8o=;
 b=RkRsPinKVkFUQ7yhw+EkgyjOxUaGIJBKigML4HT+g3HiXdCE1h353y1fq32sBMCYf+
 VDgpzWUnsKYr6lc6QT1QxlCcIQ9wolj+o/PsRRZfwZoZXs7PvR5A1qA3PLgyvEWevK4j
 hLi02IGGGUZMjn63m4MyV/bStrfz9TknFx0e3F8mcz2t1H+jRdGbiD2xa8kO6s+WuEW5
 c7duZau0a5vy2ztR8iTc69sqUHnRD5aAgTz3RkSsgKP3+FpvYPqAYvbqz9tzUhfWdwIp
 EiUQ86eJ7rLXnYntOgM5qcGewx1uHd6lAGimufdM25lZ3L3N2rOhd4wYEyEkQBD+ohr1
 B16A==
X-Gm-Message-State: APuU4Z9ex9NusuHiaNRQJKv6PvpzRJyvstgp9b2hbBHTUBJy7eMlinNH
 r70mh6VA0An+peOxlZqA//TOgQjEUR/bBTmYMIY68877cTF8oYp7Sc0+thNpCA==
X-Gm-Gg: AYBFou0aCKDsUomYWF4zsVOV2xkpPYtbzCs9Zj5wXxNDCTSADUMnEnb6K+6cO96c0B9
 nlZosIm9fEGxVOZygwLVwVaONgGFNdfrWlGycVr4s4HGyjTptyJ8sItsyDrXZbLnpy4Mjn47lw3
 ZLuyQKx1gXm9rxrilGWsUggr89k30t9yZ8nL9ZK58FGXvGdpuHKeJfJPBiib3g3xA50pot0ZcQL
 IoCLiUE0qujEG7wGintUwMwSMNiZn46uIlbozxNMuVEr+t7+n7lGV9MdPqOvMMEY1CI6WxAQ0Bd
 D+SGKe7LtR2diWKhuTqPyeWhtFPrhADQ5NiYubdgruMDQNCJH8vx44DEPleRB+wsbEe5RPUToUd
 4G2JGAmxyV2/d/gYS0FM0Yi49Nh+6D+Kc9W9FWp+sAq25LpPCemPXVd+RJg+PY47BNwlzww44kW
 R17WSHdHIN2TRrUStmNckPHOn/VilJ0rKpDsFVWDYR1IL+jxd8uh779Crda3IhVk0VQCFTJlaSt
 jnv85JsG4QQw11symaSXIPuA2CJjnZA6T/L+QdaA2pIMIqRgxoqQGvnkfHLIPDm4CKZUOaodo0Q
 WY8TvgtWfOl5zO0iZLeenjBsPp0nzJyd+nTB0MmWdZd3pTur3Okj9g==
X-Received: by 2002:a05:6000:22c4:b0:48f:bf3c:1631 with SMTP id
 ffacd0b85a97d-48fbf3c185bmr7294637f8f.21.1793826029956; 
 Wed, 04 Nov 2026 13:00:29 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fec8d8734sm6100414f8f.20.2026.11.04.13.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 13:00:29 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed,  4 Nov 2026 22:00:16 +0100
Message-Id: <20261104210019.3509258-6-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104210019.3509258-1-angelo.compagnucci@gmail.com>
References: <20261104210019.3509258-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/8] website/download: fix the git clone box on
 phones
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The git clone command is shown in a single line input, which cuts it
on narrow screens, without any hint that it continues.

Show it in a span styled as the input instead, truncated with an
ellipsis when it doesn't fit. The copy button still copies the whole
command, as clipboard.js copies the text of the element.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/download.html | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 0a47106921..2482c0a26a 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -141,8 +141,7 @@
       <p>To grab a copy of the repository use</p>
 
       <div class="input-group">
-	<input class="form-control" id="giturl"
-	       value="git clone https://gitlab.com/buildroot.org/buildroot.git" type="text" readonly>
+	<span class="form-control text-truncate" id="giturl">git clone https://gitlab.com/buildroot.org/buildroot.git</span>
 	<button class="btn btn-secondary" type="button" data-clipboard-target="#giturl"
 		data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-trigger="manual" data-bs-title="Copied!">
 	  <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13">
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
