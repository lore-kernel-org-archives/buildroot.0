Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB91606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fRY3/GGw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sloGPSmr
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F40D81544;
	Fri, 23 Oct 2026 18:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qrBKRYkmRHXL; Fri, 23 Oct 2026 18:18:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B64A18150F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779509;
	b=elM9DFIB6UFTlRTpN4rX4vtBIG6/8srEZcuCWIVAeeL4LKkvB5s1N1mlee85/Dbf4MP0
	 QZwoaO/XeJvR1ASI/Qdx/nRsanolUfAQF1y9FMsvfXMCwmS6w7QspI6XB02EcNrnDX9tI
	 cdBvJecrv2s6rqYBi7VbgCOJZY5jZEmcNVxePqWIhsdHf4qzHvIlkVVfuoEBDBwv8P+ga
	 jzgKPveaORiJNLseri2jiAO1XhqBpu7oHV+mjWipbGY651/vXAk+bQ9+d/R0y+m+fAQSz
	 E0L2XWjxJPIK3XfqOTHjI/jxfrmjW35DarQxwpEqCXdGFvESFYYHHCp5R7SrxxK26Dg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779509;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+RlyPN+CgGO+sD6QT9x9S4zHYfqezMLRwoKRfBmQbwc=;
	b=F7cLwMjkH2nCIkeut5KTUmDr/pN0Nzcy9/WGDmWjiErWRu4porawWDW0gv+7PIQg8duC
	 lC1llw+bisnDu9n3+QxRMNkyCXvxvUNWRjCyQUxsXWK5FHvzegYaArWAYSaDlTunkSYHN
	 OhmM93hZIcWc9eb7MhrADieaDiR9pPVC7lnKSpBpFfTyUl522dO9dcsePdMVyfLWYwYpq
	 igAmwDCpFZlwtUDj4uzdjyuya1Ku6AojsiSyplSqaCjxxrOfegca3Y5mo0pYlepW3B6c8
	 3MZ1cDPn1uFTZznOmL3LuprAU7htLO06N6VrFH1utkfOEO5R4irs555JFr6ED1yAbIA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779509;
	bh=+RlyPN+CgGO+sD6QT9x9S4zHYfqezMLRwoKRfBmQbwc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=fRY3/GGwekeFPeX5xiZP5KPbAzdnfPCdFDG/A6J67FPStcc8GkfXrmjfiqVHFJG4R
	 32nQpqZKAke9wFWj6u5NdYvm4lRX6X30olLuIcJv3XcK9nsyxXwLtQXGDzew1jicUM
	 CVWltWVVfkxEM2Hl/WrKqk+nAe9wPgvOKHnrJDUXJHF+bXoX4H1bIUGrf3cNJqGm+5
	 TPYxHU49RabTcv1+0tWIXXuZmptH9zmb+Wv0RMnL/Kl5qxTpj9zy8askEx+hf2mxy5
	 K9aUfWL60yxg9oOrD1yplep7pjycs6mtWnjMPqDUJyfj7dpfv79qnTTTNqbFc9LWm4
	 RJ5fQb4ynOreA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B64A18150F;
	Fri, 23 Oct 2026 18:18:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20F9A12C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12AB440913
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wbgPOrE2Pwj for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 156CC4082E
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c29"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779505;
 b=jCEjPomGRW6aIOWIjmuwFcLGixT+QJ52OeG2Q2cCA7tm3jQrMr3r1CTXWOgxCDWUIzZ9
 jpe4Xj3JaHpP8C+oezOHlaPOOwQf0p7iIQ81+VAZ+U/uuIpO1pgUboL4+9+P+eM8LSA+Y
 iGa9y3WJG5cj0DUQx4fSFTcfn5NiJgrX+kpjVPVFdFpH6hgKSSyzYrlcEqtqHA/3mvflm
 W2H6vWMM9LL/+Tk+L+1ODFMIPuTHqFbeJHJf91qSfXafBgG4QIbBCiMevFj32KdCSmzew
 c1juTEMkdfrA7OjIfCzyt4LkC7QJ0BFO9cDJJLYIlk2Mu2FzRdH4Sb1ibD2wq7SOXog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779505;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=LJQtpHn8iudIDen1+snU+v5m4QYPsRRBQ6XlhFbgMJA=;
 b=F2UTP3yQKCv27IlCpsy+LwkFyYhb3S3cwdZknECLAMxkRxVL55ZXwCfFgTK7vSw9TxNL
 VpspYR+yTMmKSVQRh4pAmKgFd0jEIfb4qJmVSlLe42YBar5U9tMs5RXIy3YAqJ0w4bo5X
 N4Cf2tBezE3tXjM52XspyKOAGAQCDNnFj4x2C2TwVoi/hLXsnD92+9hmk3+5NC3L6ZUeD
 BGaGptA9Dbzo65BVyKLqUGzH1sf3eFchr8URG/n7Zpf2Ngd+tTd00/AL8Wo9oHLRHctrm
 yY54Zi1DX7azJVuyLGGoHG4YgjXLe5xKgbamH1e6qshTnQ/rBhw2789a0TSH9pfMwEQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=sloGPSmr; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c29"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c29; helo=mail-oo1-xc29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=sloGPSmr
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 156CC4082E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:24 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-6fbf1ba31fbso401314eaf.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779503; x=1793384303; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=LJQtpHn8iudIDen1+snU+v5m4QYPsRRBQ6XlhFbgMJA=;
 b=sloGPSmrA/kiNSZH9h8RbTY4Vs26fgKLxpY9hTCF2mNPfgCRADuWbGqe6X0ja1f7ty
 myvVyrhChgjfkWnYurqD5QKgeZxpKiUMWdC2WWwY8VJr+/KGkP9/6/KOxG8i0sv03PUe
 tHXWmyerKiqaDgxkD9ZL+U0hH0MtVOn+0oyKUA8GbskjV3j0FqhQlcFHt9KJYQDE8SoA
 1XZOVAilQZS2wTzxWARpCxRj9rXtvlF2/uZ/q+0bBSYyAgZ+nZlymhLrZcgdOk1151lQ
 9Y+Pn3VrgRzcGA4UQhK4ld/TvU9yiRdMPED0yDbL7AR1ldKFuFmZ0JFrJgsDzSFT+cT5
 5jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779503; x=1793384303;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LJQtpHn8iudIDen1+snU+v5m4QYPsRRBQ6XlhFbgMJA=;
 b=hW6ctyQd1qYvAjXtvUxIWN4KswrLH0F9jq+eqF/P1a3jv2CKVJIu0I1HFCw7LhbNe6
 dlGPwZtKmSr7ZnsMFpMeWkrTCavlmw9Po8gMg+hV9scN9qFPZe8lBXMf9pdxWhGp4riO
 q6b21W0TwYmJqogicJB84WkdIgGkXpKTBFiKCrmKH/rrxIX/rWja89M82ecGehrtPf2D
 OYtbNxhK5Kq1xBKjOL7inu/tLv4pgX/RPbYU7oanXgN7k/P+z0IUpNImxmDm16mwPe7a
 TkGCtlMnriwV1sRhDgbbW0nUHFzu0YUmrOK5fkKemao5/IwnqeT1tfeQkCje6iRXbg2h
 y1cw==
X-Gm-Message-State: AFq9FYJZsS8o/C1Z+v/c8U6Ll2TrLCoqnj4RIRBNtL9MOOxC4v9wZy5q
 vI1ciWSRN5Zz7h2EaeEUAia0PoywjanqwvZ/FbwbInQFcMKuxua19zwARQdcrA==
X-Gm-Gg: AYBFou3SFuQMTY8RMBslUpwVAzCOzdCWw04WcLwDSIk0bC1WXU9xccY9s73WWI8p0/b
 FWpLfxBDugzb8zBRtzajgaSAt781eQvMIAZRoIuQVeanZkkSvJMJhXf8AsnolycGKDsNf2eYSgg
 l6/+qhzYgfrmlNKUVGoAz/Ybh5n4fjc8Ht+7yXl/y31HCXLHLbwwtMweu39JjMcOoF0ic45jpN6
 bIUwqmKgWDG9pDxS1j8QYT+kJUL5vTx3vVjcu+7Q0QLKqSlzSPHhFLLPDe3CLo5FpLg0h/0f5mK
 TlTDrvAYw9apNQQ0eY1tJ174GelD2lTFlaDUP9kZWeH8oi2jOGW83JMyBemL3OaasrO6vgnBlXA
 NhEEsjPy0tSEgOYB7CDmlrj6LEcRLH3KWowQNdAPnTV8lK47cb7do2Ge9vjOQccYqPT6oQzXUX4
 pNhcOUTVXv6Twi/Z3UmdGzsvBGyJzOHN46hsqOqHrrpW0fa2dom8e3TaCzcRVXiaphPtgbhMBWv
 DdlwmHu9Tk+lhxhI10Z1Ez0UQcZrehgtGQucgcg/pV/WCQPhfAZB6D+LQobN2Ywj4fa8TNx8aZ6
 5PttAnnLQfdRXZ4sKyXmmu+nJMrM4NS2+BRu+TOxSc8ywjU4WRnZAwd6xzWttpAy8+QMC2FFMEo
 8IqIzoow/cbTyn/52a0x9bp1nHYPiSDj5TXDKbHtTHETKSCbdf4svHplGlVIKn9PRWX2vzAOeBY
 KmCa0Cvschi3/mTDTH/SSfKxw=
X-Received: by 2002:a05:6820:821:b0:6e1:b850:8c31 with SMTP id
 006d021491bc7-70b88a8eb59mr2309922eaf.54.1792779503245; 
 Fri, 23 Oct 2026 11:18:23 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:20 -0600
Message-ID: <20261023181818.920329-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-autobahn: bump to version 26.10.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 724045a52e..50cac991bf 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  2958a002f07a91d6ac8c0ce3ac50764e  autobahn-26.10.1.tar.gz
-sha256  0acc00895d4d3b06b55e4c945592d426033062c989ca2910749777a855faa27a  autobahn-26.10.1.tar.gz
+md5  cca33159d2dca5f56c7210a3f7a98200  autobahn-26.10.2.tar.gz
+sha256  6c69fca89106567060941c5568e67a5369738813d883db4e3d62b76f0a2c497e  autobahn-26.10.2.tar.gz
 # Locally computed sha256 checksums
 sha256  ff61657bfe1984c96d932fc0423268097b4b588bc57d47c26e8d680250d6c76d  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 97ec7b1b0e..4ef83e33bd 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 26.10.1
+PYTHON_AUTOBAHN_VERSION = 26.10.2
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/df/e0/f0a9218a299f0d79feaaf62042812629bb7fa0c1fd6d044a6068ee7f5c79
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/e5/84/8ea0607facb3c97a3beae3c767213fc716f9ab2f157570dc5aeba1174730
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
