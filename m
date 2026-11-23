Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2E0606A32A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 22:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dX/jqPSR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R8YMVNJG
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AC6440765;
	Mon, 23 Nov 2026 22:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8RFPjE7877F; Mon, 23 Nov 2026 22:00:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 37DA940757
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795471230;
	b=YJeyFoIXdIWuTrdmMkuIVzB8faFxfXUqaYnrkQQkFmwh+GUfzyGIxD9PjKy1MauUtgxQ
	 aw/Xl1x29D88QpfXFSea5ytuHZyCX5LT51h0ZJXAkq9L0W9fRuotHiTkhaK2v6lOMyujK
	 OBo3VRrPB3UvYsaGy4mzeNs9Dwhytu5SuciDlgfybj/rTEoluRjZRfBNgf3U16GnPW7Xf
	 4pJvOI/ZqadSYb16KXxDNHnTj2U2ogJZJcr/Kpf715yEWw+8ieqsyoCp0619ubxlA5Fic
	 vAPjBywKq9dae7K1PBP/2v0LmduUoZR8iqTYniOWdU4h7+WryOzs4FobFsWpeEfASwg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795471230;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=RulQsy70QSWjxOwhor8WjZi9DFxcsKuXDzuKjTTSBXc=;
	b=WuXW8uN+lV4JSJs9IEA0HoTb+lHQXpH8hv8IWDo+fzhgwx4sITjwQQVtko4ad6Z55h8p
	 wyvBO6Jm3gc6CHwaC2RwSGTvIoWWn05k2PoBWdTfZefEZRg67NXfIO9vZ/mPr1LUEEBmB
	 rzcP2vfxLyiJvT71yG4MaLHnGYLExZU/ZsmDJuo2oNdLTcuqMcjBeKzeFfdSOWH52qqLD
	 CegL/YcQwjD6J+J/J/LRIs63oLS4fEOkyyKzdX95FpQsi9l5+kHHhkvb/qgZlU3Kleli9
	 2OdbQPPO04/M9/6l5jCTkD3pZ1SSC8lWjGh5gJd/BNm6kWtGZNcAdagAPdCdLVSr3CQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795471230;
	bh=RulQsy70QSWjxOwhor8WjZi9DFxcsKuXDzuKjTTSBXc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dX/jqPSRAcDhOuFsH8v70W7h9r13+hgx/j/9KaJbzOjho8XvqG99HBmUiOE3xVF+G
	 MlFMQZZrQVzy/i2pMt9qxCUSj8QbusEyu9aBQBrqkrXvahSEqPFTna7+7b1sdaWo5H
	 DRiW+a7M0x5EgXIDYR/qMBfqO4emQ+aKwMo9m+a+4kSoUmpaUmXaycZZmxeW+0u/sl
	 XRxoYbzXQWOMk/7B1SDC/dc0wft63KBfHu6Qt22O3HnpNUpd/OFQYApSs8triFK5J/
	 Kd1bH+0ZW7aX3HfBdu9yq2Jf11cCrKArLsMrJ5O0NPiDLXnJ5m/OUrhaex4f72tKuu
	 Rjre5eUhXoabw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37DA940757;
	Mon, 23 Nov 2026 22:00:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 64925260
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 22:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6286380F3E
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 22:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfqpWAAjtSsK for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 22:00:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5629980F3D
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=R8YMVNJG
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5629980F3D
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 22:00:24 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so49414665e9.1
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 14:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795471223; x=1796076023; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kTOqW1cFjtcTnMioaMOMqwXABEIWjo+zYwD9ltzxMoU=;
 b=R8YMVNJGX8RDkqKAefKxfb8kg/3JAS7Do12ILtPfqaWuMo75iV1rc/d9bet3XlQVzw
 X+v27f4seIZ7PBoeN/sL+1gOIcLRLCa8seZ6En/oBK9mUCri4CO5KVC11EPeoVVEkdKQ
 hLOzPWBt3oZ96Z4kuxR6F5yPFDvynEctWoGQvX0gpyN+4ABmLZVCWkkgnM304PVB8Wm9
 XH5xBqQKp3voy0tPCbSewC1yD0PDz4riZgwGSI1DjOU63ff0V/+DlpVnPcsRZLD/Z9y+
 Zc6aj5M0V9ZL2b0QvmN0ePTcrPQutib4l6CBs2LYPR1oXVRCt5mIVMx5ExcGq2+2j1mq
 YYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795471223; x=1796076023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=kTOqW1cFjtcTnMioaMOMqwXABEIWjo+zYwD9ltzxMoU=;
 b=utI33JMieYo3pCJhg6hoGEvGiITmUBNpDTSV/QME2gdgNj5dpdii6+h9SyrgKPj+fm
 stiflc4QbaT20dW39y+2o8UkBkLql19oafbX/KN8R4mtFLam064CiRZViUGLrFemgZyW
 sEGwK0NP+BAci3tIh8dqZ/WlIJw/ZWwDY8Pn9C2vROAXhJWN/PZzEpiynbECb+NW9cfB
 /K7Je8VHCcicyZbgCTbPwRIRHONh9MjG3lLYfrwP2di6QvyTETkl46w2jifLA5EZO9KC
 gqbhxUF3IDHdV/63uzsBw1/OeEoksgGU1JQ/TPTsci8HHYoU9KMATk+5pVjQILGlXT1j
 Uu0A==
X-Gm-Message-State: APuU4Z/ClZpycFwkhKWoV7PN4MtPF0FLqBnIcqSzOTlY03GULOzCKU52
 c1uJ0aUkrAa/qMGmO6lkxHI743015RjKpheXZ+ulQ0PvGrTEUkRfeHG/l24sHi8i
X-Gm-Gg: AZFdTZcCpMZ+Un0N3g3LsxX0LiUr3AlSLfHDVMRjgwRpfgLX81EfKOMQHW5FTxLJ1ze
 FmJEL0q2LD5NYbVrbCIIUu7t8pQXjuqJRxVSHOvN9VsTrRyHbjRslyS610iUn0+u2cdGiJFkKYd
 07vAu/5SvUgOYmELgaBnR5bR4W+r6gc66T0d8ri3gvUajlmjkhnQqifZS79zq+L5RGBbTS6sklP
 1RBgW5QlABzOXc+vF9hrTqRo0RAXyUD8FLaDvioalKZ4Ppcs5YkrMDOBYu/0G+rpAQ9wjmJMpGu
 X8Dt13hgwEDcbW3qjjJd/HbHiPob335U+TprFu9PfEPzlQV7YxWfWBzHZgl1wX8QP8Ph3zRVcVa
 O1Nzoh4XEYC0QbiJdgT+Kf+BFW1AWMmmWGr9hCDbwu9nynfVgVmBdTRF3gvySkgGkxIMFfhczrc
 08Y6HOBZtLrm/OBYTJjBQDnlU0CVmxS7yvC/kiQrYEcKuTHZ4/2+jGOkn6y+WrP5vzzNMvRlkjH
 hG82Inju7nt+SI0FmGfeZny17tj3QnmW727/mbeFoW6bvBOlx0DbTJvn0eSfznJ5af1RRZ/6gAV
 zPZ79oZ3kn9N1CqjxJyRoC+zVhrsIsI5lYxsFrMlNF5KoGaSX6OPyzhacU3AS3QP+UYFKgzT
X-Received: by 2002:a05:600c:828e:b0:4a2:526b:d40f with SMTP id
 5b1f17b1804b1-4bb88785898mr272757075e9.0.1795471223041; 
 Mon, 23 Nov 2026 14:00:23 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb906635c7sm205310275e9.2.2026.11.23.14.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 14:00:22 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Nov 2026 23:00:16 +0100
Message-ID: <20261123220017.3955658-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123220017.3955658-1-angelo.compagnucci@gmail.com>
References: <20261123212022.3748880-1-angelo.compagnucci@gmail.com>
 <20261123220017.3955658-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 3/4] package/qt6/qt6languageserver: drop
 stale hash
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Baxiche Su <baxiche@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

qt6languageserver has a hash for LICENSES/Qt-GPL-exception-1.0.txt.
Upstream removed this file in 6.10.0. The package does not list it in
its _LICENSE_FILES, so the hash is never checked. Drop it.

2025.02.x has qtlanguageserver 6.8.5, which still has the file.

Backport to: 2026.08.x

Fixes: 05cd38635a1c2a8e6c44170b5eae8488b0c7a104 ("package/qt6: bump version to 6.11.1")
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - new patch, split from "package/qt6: drop hashes of removed license
    files": only 2026.08.x needs it [Thomas Petazzoni]
  - add the "Backport to:" line

Changes v1 -> v2:
  - add Fixes: tags [Thomas Petazzoni]
  - say in which version each module dropped the file

Supersedes v2 (in part): https://patchwork.buildroot.org/project/buildroot/patch/20261123212022.3748880-1-angelo.compagnucci@gmail.com/

 package/qt6/qt6languageserver/qt6languageserver.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qt6/qt6languageserver/qt6languageserver.hash b/package/qt6/qt6languageserver/qt6languageserver.hash
index cb91c6fea5..f4b0727a54 100644
--- a/package/qt6/qt6languageserver/qt6languageserver.hash
+++ b/package/qt6/qt6languageserver/qt6languageserver.hash
@@ -8,4 +8,3 @@ sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENS
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
 sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
-sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
