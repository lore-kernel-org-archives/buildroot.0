Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D586D606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 11:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=P1NPkShF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eLldXnVW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A78AD6079D;
	Fri, 30 Oct 2026 11:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z-Hbu7F9dFc0; Fri, 30 Oct 2026 11:40:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A8DB460679
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793360452;
	b=FLzNLYCqs5WYZ3T/iKxYIS+Lk8cJ6/7v9VICkY/NRMLEhdza/YcyKkFHBll1Tc58Fh5I
	 6OBgh+gMdpZkLIHZ79hNLfU/w8mv6Q6brm1BxEvtCEpbJcMxUbaL892zzjelSya59MCjf
	 Ca2ZYJolkNqKb77wU4qNnNnv/c6HN90Qh79HHSjTLO2cz8Jf4nnSYpFQygm5ydgFMlyfw
	 jkqIJfAA5CcKcX6ncBlizQIJ6uKshfCLYKB+dpB78RPSDUv6tA+almnQmOeRjpTW6+qVL
	 54vwaPhGzL2iX91/k0toWrKkm/49qxd0gOykwmzwHXUn0uhnDsnoAyFZJJynhblDiIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793360452;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=KI6FIFzZ0y1v3Foqs54IsvyPD7vHPWcCIdsfcLWhDzk=;
	b=HVliRUaN56kH7fwv4eRIFa2VAZ5TU7IQHyDZzm8n83+fKIotLzV2sixhRZ5Hm8kMlyUX
	 Rc/usVog1FUr0UT4o9YEWsiF1fph+qKOMXTdEMKcFZG60vN5oGFBBnR+isPlfJomReP4O
	 7MkXdqVDPm5k8/knuEZDzmP58AF/KESGZuhhb3KI7WJBdEIm7zoLI7I5kkGRgr/PejxwS
	 82MuoBs01AZaQiqJDAGyoukjZNFg6SbZNaFHAGWesuhJBDQ0SguebFsVHfDv0uhsoPuSN
	 /jImYaGFXR8lq/AH29RJN3WKh+D5ltjswqjq8df6fUUuttQQUGdCI7CU1W7nHVhkubw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793360452;
	bh=KI6FIFzZ0y1v3Foqs54IsvyPD7vHPWcCIdsfcLWhDzk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P1NPkShFcSQEvZuntWIAVQwNGtboBYENqtM9eL4Q9plVE+UCrVEKgoYS8zOXYzuui
	 OI8avvN0+w2LvbEjvKducNb8aVX+zXp7478VFahonP5J6wqdEISiDue44120uleIEN
	 9EIP7gDRpKmF6/y18nNOSkckRBZrSaXJm0Kn4wzZQHf2kYjAfJf0nHWp8TPIRj5c+j
	 pUVLeLLrOUjSbVJCoGfGzgDCbh7fpltCZVKFDxt4swg5/mKhfP++hobyr/oOZ6TgMz
	 05X1VHaZzUZYtDG8GV2d+tSrnitbkCQVPxbdAz1wXTsg2EKI8hvE/RsilcVaKMJNjR
	 DLVtg5Wu6Nj3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8DB460679;
	Fri, 30 Oct 2026 11:40:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC52B4BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C27CA810E2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hJIr6dY3EXvk for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 11:40:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B3B8A810DA
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793360450;
 b=pcBYNs0mnMHBsjQdZMoHFDC08RWMg9WaAcDWzaONHYAjEKQAZUatIOzUgELqYHJQN/EY
 dSYr1vEYnlNrMB3lgZSvai66CwrtMT34OTveo2El1X7b08dwvvgPzts1uMKCLvfN/6CLe
 NCQCnqHIglNWyuNvrTwN8CKFpFKau4z9UpXx2miyA7oxq8WlCCU7M+JEGAU+42KuuAa9J
 1H/IsIIDvLykmwoFemQtZ/fm4AuoiDV7xqQqljvBcbujkqbJmX4f+gm7ESA6z4PPP/Ak6
 AFgNW6yHGr2SklVqTMtz6h5BOtRCXsP0bvK4g79dx5nMhWkMhnaWR061Xkf/Dbq264w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793360450;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=02ZO7bq95sFKzJEoOmRwU9NB8eXwpdInIMxEV1Z5dRY=;
 b=QYWG3ZFv32CQXTO7ADRO6NjiDTkh7w5gmnJe/on27fQaQ2/B359Qt6JazCJhPv8v+cGU
 bzy6uY0xSXp8iHXiH9+DG2EYtL7IkuYMJaId/16DQrCyv9GLZgZ4MckPy0P8NoqEabskL
 SRsnaaS5mh8eds5MxHDCIiCTonZ2w3jTEQfDN/dDVGlFTJGV8v0OO/UtUL7ZR1wcBPX/n
 7Q0RMSIsGeKR80YnMJM5HklC8AsnTfxdJ+5FwhnURG09gOylsDBtBTDZU5wFzU5W9IG7Z
 j1jIhU0CSXfBeciXOiWMQssjY3JqgZ+SXTDv9DBK+T98rOho/3Jb6v/fY5C0GPvzFBw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=eLldXnVW; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=eLldXnVW
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3B8A810DA
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:40:49 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so3474095e9.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 04:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793360447; x=1793965247; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=02ZO7bq95sFKzJEoOmRwU9NB8eXwpdInIMxEV1Z5dRY=;
 b=eLldXnVWQ10uhW5WMEOyf1oa/vaBGbQCpgWJdLJeJydktg8gd0NW1rj95KwO6z2q04
 HGfN4C3rAz2kQkLDb2M6ipYMmjN4X/nN/AwerUj45OsecLnQCFYwDNHhVXiF5FpcaG00
 /bRRv8hx3K4wMYMUVwMsI+IeVLLYn1FOrbyFL7tvmgSPmj3825v6m+/oxI/YQOUPP3yI
 Rwvn30Y9ZUkzNaNY1qsvjrO5r9/ZE3gw6s4HZaj8BWIm7PtoT6A5GsZGxrVVd76datr3
 s9m8pe609hC0cJ0cMzGDmxEAR6kXV4GvltifRy0XKI/rc8TpWT7+Xs2SAbvgn5E6SFDC
 9Uow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793360447; x=1793965247;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=02ZO7bq95sFKzJEoOmRwU9NB8eXwpdInIMxEV1Z5dRY=;
 b=Htf6reGRsCXqmayDy/O7hq0bntOdUG8rstCQmHHQKFBn5jbbWTotvoRQkMx6r/AX9x
 NzieKWsiwuk7KNVaJpYm1a7S9AgJR5xCKoo6jddnnxL6/lEi8XK9oQxzFdKi8ZhP4Xjl
 IWQR4kWHXNdi1FtoCJbtvJqsGlANwQOFXR8IcP491sBjh0p7Slc4CxpEz7jwR8B57y96
 zV1D9aPFJNm5Rq9GAkUaAXAwNrd0I1m4mSAeT6FGAIr4+gHCsmIhsOQJsA1VNQWDvc0j
 93ol+bZ515SSV+PljxGZEqmwjRJ7aXTCKehUNssSWDacH+0xd0b5VEMk6PvTqZYBshF1
 HBuw==
X-Gm-Message-State: AFq9FYLJwam/k3QkFdcqrTtKVPvY1x4Zk62imiut17RFbf85jHppsN8t
 6xpYgthpwT9pnx4giZPG2MqCdGH/aLwfYdJDvruqjlOJCkJqzpYQb9tR6Oj3xQ==
X-Gm-Gg: AYBFou0vULec7lRjzkZMnGnCfxt3YzJ7ehXSKyJ75wI4hpCVryH81AAR73/iOp95GHS
 YC4MUpcHkd807xoa9UPP7jMPdE4x4ATcwWmLIs9YSZ7d3/WD3INxz5pXBBwLtkqKqqO90UqjqM4
 STwVOtVUFajWD/Z1x2Dh8SHB5kH6FTPoUAvi4o4Ii2eoofb+/r5JGLputgko09FsRDLWEHUcXev
 MghEo57GZJbknAOOIOit7lqNr09SfKecf788ye9kWmwINnHWT1j3kKwq81oz3nUw3Ro7qHJe8nq
 7BnfJWijf3QCrth09+HkP6RItuX9Xc5J5j55S2M1PhPjFHCG05APQvD7Tb3gXV2ifIN79E90Jje
 PcJwrPjZ4j48UgUWHQVO4cDsCDRiCLO7mvozkO5VnZ5nZUhP4oYF4ZWYHEmROvrzyxinq9uU6oM
 ZZ63T32qYQymAYMjm0GjY/4OCkE1HTEQgyfVHH4dbzoXdd++jG/YL7U4JYxF7J76qwxm4/8PE1X
 G8kdJ+nqa8OPb7c0VcwuiO+LQMejV1McGcPJE5DqAfVxtk7PEXB3S7HfecIGIgN6kkctRWJjnpZ
 Mo4WitByr6JOnV2Y7PJ3r+Ppuf7LgVWw4uC7ksx4K6yqvLQdIUEBlw==
X-Received: by 2002:a05:600c:630d:b0:4a1:fae2:a8ab with SMTP id
 5b1f17b1804b1-4ac150b38abmr41183125e9.3.1793360447305; 
 Fri, 30 Oct 2026 04:40:47 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71a4d404sm3227388f8f.5.2026.10.30.04.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 04:40:46 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 30 Oct 2026 12:40:39 +0100
Message-Id: <20261030114039.2909636-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/qpdf: bump to version 12.4.2
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release notes:
https://github.com/qpdf/qpdf/releases/tag/v12.4.2

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/qpdf/qpdf.hash | 4 ++--
 package/qpdf/qpdf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qpdf/qpdf.hash b/package/qpdf/qpdf.hash
index 81bee9e58c..dad4fbeb5b 100644
--- a/package/qpdf/qpdf.hash
+++ b/package/qpdf/qpdf.hash
@@ -1,5 +1,5 @@
-# From https://github.com/qpdf/qpdf/releases/download/v12.3.2/qpdf-12.3.2.sha256
-sha256  6cba2f9f2cd887d905faeb99e0e51a307b217920d1bbf3e9cfbb2e8178a2deda  qpdf-12.3.2.tar.gz
+# From https://github.com/qpdf/qpdf/releases/download/v12.4.2/qpdf-12.4.2.sha256
+sha256  8a58af5b6141319287c1883bec8bd1bd545b7567b7fc5e6ce5d25a1c85f36397  qpdf-12.4.2.tar.gz
 # Locally computed:
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
 sha256  fb929ac30decb4dc3a2eea2bec6c43296a797c5d2d602deb3784ee39430583d5  Artistic-2.0
diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index c11b42f60c..659204de6f 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QPDF_VERSION = 12.3.2
+QPDF_VERSION = 12.4.2
 QPDF_SITE = https://github.com/qpdf/qpdf/releases/download/v$(QPDF_VERSION)
 QPDF_INSTALL_STAGING = YES
 QPDF_LICENSE = Apache-2.0 or Artistic-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
