Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD81606A324
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 09:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=L+nhg28t;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FozTauZ+
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED44440748;
	Mon,  2 Nov 2026 09:13:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zl_QENv9f-Ct; Mon,  2 Nov 2026 09:13:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2853B40706
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793610790;
	b=cDUC3iq1VSTEvp01qiU07JcEytOSWDw2qNHcyJFtNYIjMO+bZwXdGBzwY5Iz0XrVDo2C
	 vNR2HynWJwsK/BsoGz4NzSzHVNkWmDxoaRqfq493FcSO0F0tUyNQs59zp88ibedPV/53e
	 6j2ilRLrXqiAJZdgUSnOwxi3BwEpAARopNCinjTx1N9qpHvGrM1uitjptWNTaj8TnhLLF
	 PAl8bZyOSgIQwLz6dZUjE0yYup66uRwKvsxc+b+AF7URiPK2Dtovm23e82/U0OHYQw7Sb
	 F8WdZM4UyIo/yRklnlTjhL4bCR3eODsAX9GzBXT/Y1fmmf2T/4zvEXBmJvf0VbccrcA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793610790;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=p2+jgIECBE2nktZmpN5FkBUkR0OBWZLcbTSIFL2q77I=;
	b=A3Hr/EAkzRIaK/Nfoj/6pK8FXLoJ7kYBxJusKwiLm2ibmrdMr0xLmp55W0tDfjj5zq9S
	 02tnVyjHHYmEAb+dCVmb0HxY2tE8/S/kOa0L6XeZ6wdz/eAz9u5GJRVzoBYZj8zoyAE5s
	 EkTlpkvOmmW/I1HSgESyVv9mGFsO5GEl0xtc0IHOGoRTRHVrWrmfy89toiPvThHb8cxT/
	 jNL2+fhK/QqK9SzIV9kZNFZaEp8nh8qdgW82X7nMfqAL0l4+BfpV5GfoyNbsefT/pQLXZ
	 NzVVlLoWYoysemNPARf2UV3DLCzlNKcZCJ79739bEe9XPXh+U2OSpJp/LvydpfIXvaA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793610790;
	bh=p2+jgIECBE2nktZmpN5FkBUkR0OBWZLcbTSIFL2q77I=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L+nhg28tljND0G5d3bCdqFowQc7uxanhfOa1/Vk329QPQkHrCtTRuMDmpd9TjsctE
	 vpWw4ejykbN+a0Z5NR2RYHN6ySf/Sw9qvx/2MAqOfNriWI4ecFXyobHK4gnK2ERz8d
	 18HUG8DLrebWPPHkKpa5zQXnBeHzjrtjNRIL/VdrGyf/8vWCIEOykaScYL+DoLmhDv
	 tknxMu8sFH5Vg9Z0ugiooGieClE5hluw7iJpkEsoJgUTAGbtRN3i4qmMh4PbvKU3Pl
	 QWMH6z4UioEhj+6i05dNwBnJGCTd23gpOrjUTK3L4b+rw3+XYhuhA7X/DOxXQN4UWe
	 Hkj3dVAxSGuKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2853B40706;
	Mon,  2 Nov 2026 09:13:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9699C156
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 09:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 887EF60769
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 09:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBXU9J-z8sAW for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 09:13:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B8FD260778
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793610788;
 b=bUzR4JVfeZnF6cBxVRXRP++OUY6mLyhcaB1tKBZfrOY0oqgio1+iFcZPmHfsYFA5Tp9l
 eHMpuATIDYFL7+5e7xdUMBgZb3xGErmy260lr2bIMafJCf/gYNAgRF4Foe6eeSqDksy4J
 M2aSLQBQpUEy1iLm/dm554YAJ2xSOoqPic3uSsfWeYYt5HsGIjF4UHoKC4NJmB+M9O8ba
 CWPGHcBvot+nM1AeDSU/Tyxm3r2Za7+iUQo8g+8s7Xs2Fy1fmz5wGFzrGJjkkgw7ZxywS
 qm6/u0hGvBbRkPM/DIzXgMDNz5Uy7R0wQOJCrVbsVWYVg3xMIB9EEELbPL9O1B36BJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793610788;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=LecaLyKxKpld9SQcFzKiL0Vjl9zVHpQlqKenhxjFdRI=;
 b=pb6OMthOYFxFzxXcM+j6LweILSTmQxiw/P8wY8RL8NnqTJtSi+VN4VuQ7K8Jh+QlT9Ka
 82dXQTSNHL704MhJ4krvoGT8r5C8rEum4UU3ttIpPQ3FM9y3Ia2r/9A7aq8zW+Ya5jis1
 C6YGZqw5xhlRKII9Sh+1TyeKvOIyRKk+ka5z1NtUX9r6D7IHFsQDYqtd9BylUp5JBQpNk
 Q8WrAwznpF4v9Co3gfqtGDL5YeR51xm38hXQ2joEXNQ8+NHBTZt7Lc8YKBkGULW0Pi2dF
 nd4zdoLkXWZUNIKNPawbNh25znbQyhRQtV5ongJzzmZ5KayAH6aJtNRyUFE8G4ME4Aw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=FozTauZ+; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=FozTauZ+
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8FD260778
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 09:13:07 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a20a37703bso20908535e9.1
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 01:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793610785; x=1794215585; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=LecaLyKxKpld9SQcFzKiL0Vjl9zVHpQlqKenhxjFdRI=;
 b=FozTauZ+IepE9+WTyVE1G7NYlovGaEjXU0TRoLzPzj1OFvomOI7QO/qwlWQXrrRW+v
 KfklORP8aSohQaVWyXHxa8/EQFiUeLbJWYdNOwFyyod1ST2I7UX2zsPUp4sdV5pz5KR9
 7dD9Z2uMzG84vtwgGr4pxN5kIyqhlWzJqm6NTTev39NslRtR1SkTjIB9ZB0O1p245eJ2
 NAiEh6+WlOWnkQJ6HxDgvR7DuLHE0MittRdajSFuKn/lBqNuqmFqdAXCoX7tkQcGg63y
 zz50lHGxnmX1rLSdQ9w/z3eYaSFOi6kuogSyu3HyHHlbz4zkI4e2i4TrnPlGx4t/AuEK
 qs0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793610785; x=1794215585;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LecaLyKxKpld9SQcFzKiL0Vjl9zVHpQlqKenhxjFdRI=;
 b=mXTwGKQ/pbdq960v5UpQnLLIi6ibzivIHRQsri/w62VAWkIv4gcga1ABIeFtJITkWb
 TTntAJwJhiDWJzrkx/FV59PffYL+xQf5WSXlKPoPmGDg1t2aGoI2nj1evvSVio0thg45
 JxmS/GN8PiO+he2NcQNxGpnqSMcUFLoI54qMubRpsnCRn4rT1+emmob6sUOrTtMD2Gl8
 vMzaSa21ejykTqPZ605nUkKdMEtNsMqDYquTUxUsw3EkCrm3meVAgGYlWNPi8Der3dMP
 B/W/DV0Np0Dgfd/yrhkP3paKBlG9XoW+LCZQzHp2aoRLvb3cO+Jz3cAHbwqfwVJDvLwa
 22NQ==
X-Gm-Message-State: AFq9FYI3+Tzt1XKXlT/AZasQd3pQIWYhc+UelyDQBfPd/S3WYYjOGej1
 qammatlGybxP19ZktkIz+6U2/pmiErPLmKYUEHM1ND+lYy4Fax4WBIaxCgTsOg==
X-Gm-Gg: AYBFou3G7WFz+ENtQskI6eatQunW1ORAuzhFsY8uZd/bDXCF/IX4yhbtzVgkSRdXMJ8
 TgaT3tsUc7wo3k8Il3PXhatM4yDPjvQW9sYSXRqWM0KkQdwXXDye1uH06cqEteHYkO42Bz5K9Pb
 b39xiVWTmQ51qO1CKcll+GzDP5iBQOy3+j/rW7jyW2uhM6Wj7QCzjJ6E6OtVUS5hAVnJI41qIqu
 CW9/XU6Bo2Zx+WikliM785qBbIqWBehOykx50De6RQ2jvAKdCRJXByYkcGzcqRlo2bxuLLH8yJ1
 +kOC4aesLTzUA5c7KOzln9wSagmTkGYSpDvL8rGTTof3dOMJ2dxdR8EmZgmF18ISUq3qrYU0qVz
 t3871I+WIr0btgwmXdzQCpZNRCirqnbtcP/ET7YfSIEk/5RhuTPNr8yKlvMy7L9aZsNTk5IKxCg
 gFFUL4Lo8DmuZFMEe1ZTCZJwaf9UKS7xzeLx2iCYTzQFTljpAJQiWNUb5l154wgu7k08eLfLlgs
 cxBJxrd6L7qiRzkXtKxcvc1PkeNACs0MxP9v757GL3OHsiXe5l5GuzseOWsLeYTeJkpfsAQXQnd
 ReMA3tnwfE/smmYMJ+sItiMRat+Zw10GBsVMSunS81kYlWeXnIMJ3mmH/ge0kHYEhX0J75/z5m0
 =
X-Received: by 2002:a05:600c:8b61:b0:4a2:1398:dd05 with SMTP id
 5b1f17b1804b1-4ac17752ee4mr201440775e9.16.1793610785135; 
 Mon, 02 Nov 2026 01:13:05 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa7f3229dbsm324505045e9.1.2026.11.02.01.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 01:13:04 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon,  2 Nov 2026 10:13:03 +0100
Message-Id: <20261102091303.2148013-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] DEVELOPERS: add Angelo Compagnucci for qt6
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I already maintain the qt5coap, qt5knx and qt5mqtt modules, and I'm
going to follow their Qt6 counterparts and the qt6 package as well.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b9dd41f01..d6ed6b2b1a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -255,6 +255,7 @@ F:	package/qpdf/
 F:	package/qt5/qt5coap/
 F:	package/qt5/qt5knx/
 F:	package/qt5/qt5mqtt/
+F:	package/qt6/
 F:	package/rtl8723ds/
 F:	package/rtl8723ds-bt/
 F:	package/sam-ba/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
