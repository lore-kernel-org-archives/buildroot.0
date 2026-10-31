Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2F7606A31E
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WO0a4n/m;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XHKGzvSf
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EDB160613;
	Sat, 31 Oct 2026 17:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vzUOSgSfPx7I; Sat, 31 Oct 2026 17:42:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 70A3D6061B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793468574;
	b=RFrgNKUbG3bNWv7YvtAIigcUh3ddybYSoyvHpTH6G60KpSW573FmMdre91VfFAK+BiHr
	 sVabGDPLJpOQhba/kvxRS6tuORkHQDCPOvflDzxqFOrtHsnN8v0BW7ODTK+jm2kDoomuy
	 P/OABQeMHKVJ2HdwsXccdb396ZPeqHUtg3kV/ffp1SN+n+NX9OWV5hzAgksS4Zsdze+x3
	 3uMEsUO3qR9Ul8thHPahmUfzTwtW1YvlCQuS5n99nzWoJ5/Bb68JW/YSWIh6cPA2c1cfZ
	 WB1C2x3Mf+tQnaW3DhwfEMbApMoCwvHThwPUk79Vaai/k8MbOmgfV2iomFf/MSdRAGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793468574;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+zAVEzC/rSkc9QaskgvZhjj4JN6x2m464IA0leuOTpY=;
	b=o0jcP+ZlFxlLWbec2rrXBarVClI8IQCNCs/fyglyr2DdxmbvoNXoTk6wXGYXUkdfNJxP
	 1gjh+8cOUERRB95XGMkswENnMx5TuxScZ02uXqVJKlOv09CDb79en1NJ7s4x1lvuXmNlG
	 dfOzaq9STlsHRKkJKWt9HdCn2G0glt7XhTds/ZIibCgz312kmAP+ohdAmNgyiiCvgcSoA
	 6PB/xacwxpgw9TlDiOCupDBPODhICYAVVhZI9scPzhpHHWKYPWs4/1UNDJb78BIuLmjKi
	 zoEl8HmoHy5jM+FfqmOH1OBLwukxieiro/pc/GHtBl68SRBnfpMjYuv1AkGtV4PA9eA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793468574;
	bh=+zAVEzC/rSkc9QaskgvZhjj4JN6x2m464IA0leuOTpY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=WO0a4n/mZPfTVr+H9W6rEetx2dto8Bkgv92Ir+jW4BEsX59DGbuXLIy+cK2iOQ/fa
	 ILsSqqU/Pp2YiaoUL0bnwS6Yg/FgzztZkZ+QAlg0bPsMfYHxO1t6yPuCLkV25TXCuE
	 wn+/smlp5s7sWne/QXp6qSf/zqQv9vVQof40941Rau5sg7Bfs+EmazFKX5sEN2IVJu
	 jm7OvKvRM7PHIQRt91xyvaGlfhLT05DazGw686thjWeJO1cvRmXrvtmP8kqlwhE6t9
	 j0Xfq7AEdHEIjgEGmkqfC5lifY1xw+8rWJdxiC3KF3FdPe55dPCsHrfhc5bDmaOe40
	 aFRMD9ToWafTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70A3D6061B;
	Sat, 31 Oct 2026 17:42:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9E0F1DE
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB87140672
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9tWvSuwsetX for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:42:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E453640652
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::332"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793468573;
 b=CYSfHW5NjIRs7yjEMu3HxrY9JLulvbULcyZo8nfkA84gjmvZYwMKHZy0abytGz86TsPp
 CMvDcA3dKZ/IaEy+NZU4mWGvq6fpp2RJOXJZ0VLmAXPuvsr1Mw0wUD90t1Xl1dGaZzBmg
 YHUo4JBcunpwjxiDZVIhmISz1tyNcFeV4mi7hsawsI06WXLMU60UmozB1o96VF4G3/MjF
 QuXZDp9h46pr6jByjFsvtmrXmAheVoCr6UD8f/Y7FiBotULRd9Lhe6gfC4LucKbP3APaF
 uct5AffbZ8qwr/i+HB8gP0ZKcDXzUu2ULCScCGzIYO4ftObQXczmVLsTBgWcd/SEmJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793468573;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=S0Llncum8wbi+Y7RvVnCyFODqvQBteRYdtxAot4nAmA=;
 b=l4+jq8RQLUPROY3E5ED0J5Z65wXdqU/qC/4xyhRDWgoAdM6vRmDZsvJ4ll66jOBWR3lD
 FPDtCE5F84FcKpSObZ3NSlsEo8jhMJkI5wR023N/f4S8lZ5nY1loy/IQwiQ7aq6uqYFra
 2aFLljyC/R3z92upXXROoqRyiXO6RKBq0qClhxEpjk06lSXqPoaAtEohmBSAc5LQZfYye
 6MF0/NJVHWCYKZEfKKydltS/xz9o/s9gbScJrcNpPDotQdErIt+DXAA+UE3VGxp4ph/Dt
 kkGIxSx9A04vcde2e4GOiIBdpWj9yXODgzeZF68l/MOLam5vpleONUDi0W8ZQoTpAGw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=XHKGzvSf; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=XHKGzvSf
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E453640652
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:42:52 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-8490a7d6696so1212326a34.3
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793468571; x=1794073371; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=S0Llncum8wbi+Y7RvVnCyFODqvQBteRYdtxAot4nAmA=;
 b=XHKGzvSf2Z/OSNfQh9kl9IWYH57LOr/j1F925cPzCMBo0yJdQxfDiaLHE/yNmrMAGf
 EFI4bLur0muF3UqVJLaQE9fW+xmfn/Mv5Aig7QyDEGTlR531PydhO8xSHCT+4MLIYsZm
 b4AIKJUd1PtlI6CP15qRwMNoj/uNnPB9HToed2OnUhBV/y6m+6cY905pdMM+9fgAUM5S
 qM21BGvfFEReyoHrHIjMaPOkilbRgd++q6hkFyHoLw6fSVX9+ZF9c7ebkR4LARqiMVb4
 b2XJXrOC3Zqgykh4l7zUDu5gPoSiMOhWbMyumQVozGIKPLooy9gILOgfmpTiat9kObWE
 0hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793468571; x=1794073371;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=S0Llncum8wbi+Y7RvVnCyFODqvQBteRYdtxAot4nAmA=;
 b=vduBOWpc/VER8yS6lWN0myJxfYDlfNiAp9k9BGejwa5sv62FZMH54wM61aGpBP1koD
 RHZu8wrjM4tVXC9As9LZXxLJhqDFmn+U4+pyNwjCmjGhcbRFG6g3eY2mtFdxgr6jPDp/
 57M7Tcjt6BST/WbvDfpline+O21PFlFowZ7VY4bLwNCa83Hj07gilgb/ez4dyI51uEP5
 Wu3hdhixX+rF5lmF3d8IJktoK+vUKKOsX040oZk2G/qHNUEBgU/Q6ZZJarxGI/KzZYkf
 kJe1UXZyC0HSwT0SatGP1vLbEoxtnIcZNCI38Qlu4wZlTszchvQH0FjUzmSeSNvcFD7D
 /AaA==
X-Gm-Message-State: AFq9FYJ+be2Pv3a+hhsnovw9piyhtQ0X0UD1ZxhvFZMQ36EWX03fEQSn
 /z+H7mYm8FBmzFHLLs66CsWd1q/ERuQFYOdPag4UZpfwlEx7aMYkn/31+8+Whg==
X-Gm-Gg: AYBFou2DkXU4uFH9c/TLtlB9jH55nSi9MVF8vCjDsYWpnM9CDaLjH6Z9jzjQNLjx7dX
 OYYE6/MlXKU0Fyi+kFl2wminMoUCUmdI6arcvQt4NV5zt3AymUjGcrSgv3/A28PWy73iBGYMAzv
 WAYsjvyRkg+sl/uZXs5AVAdFcNEZAFcfDdZTlaCSoF5UJnS2tXNMurLSouaWSOHzVsJaqx7oFi7
 qDnpys2pDkTx57uNPnA9SpcGvP4yR8eSP6YEmbsPhl+BJuhrf2woCslUdyxeEbDcQg/NJ9ar0tw
 KoC/G9b84yZE9vgim01gxvNdEofYsdXmRVAFa2mBYilEQ9H7NbDgG2PD6VVcxWuWsnpN+aROiZg
 1CAMqc4OQL+yOwfneTTwzVx5QGPm1T51B3rlPujOrBY0r7gOYQ6V5uB1Q9zPz7wmovRT51lrd4z
 Fynk10X73PH2MTm0MJkJ7BGRW42LqArLv3ZyJkHpMLCmWgT6z0Y16oQw2sIxJX8t+s1M1Yqsds+
 Ehk3/+ktOgADpoevqzBDd3Zjwfcuixpa0IUHmC7N0sqNQHwHIrQafWw6+WHsUY7VEwiG1gRYIzX
 q9ThwVRCpz6UoiLff/0rr4b8DCqEcB/3QHr6fSJp3HHJ3WYQt8T+JGNt19Is+nsuqVjtD4NtbFU
 LbHDZ0x8JBZQQM2pxkTiKXFTxIQ48z4rBe7c/o2vhO3vlGJIbGFVi31M/VWlnYXBkwFRQxZZ0Jd
 SbvsdkPxmwYUmy5prR2y/Cd09NsVDisv+CEbmcd0bq8qY2T7T1DUpgFOMYL7QnxrG6RtzHlPMMj
 Q==
X-Received: by 2002:a05:6830:2694:b0:828:f59b:35d with SMTP id
 46e09a7af769-85d365bd0a2mr4282072a34.22.1793468571394; 
 Sat, 31 Oct 2026 10:42:51 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm5008126a34.12.2026.10.31.10.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:42:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:42:44 -0600
Message-ID: <20261031174249.2698980-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-multipart: bump to version 0.0.33
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
 package/python-multipart/python-multipart.hash | 4 ++--
 package/python-multipart/python-multipart.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multipart/python-multipart.hash b/package/python-multipart/python-multipart.hash
index 5163c82fa6..e3f0b30957 100644
--- a/package/python-multipart/python-multipart.hash
+++ b/package/python-multipart/python-multipart.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python_multipart/json
-md5  93ad538d98ed5604845e537d8a0cb369  python_multipart-0.0.32.tar.gz
-sha256  be54b7f3fa167bb83e4fcd936b887b708f4e57fe75911c02aebf53efaf8d938e  python_multipart-0.0.32.tar.gz
+md5  c0154f3239d972a7c6a0db9d89593f0c  python_multipart-0.0.33.tar.gz
+sha256  b8112424a6abd162ec08d390565dd113ad699f2fe6fef3c987b8bbcbfe9e390d  python_multipart-0.0.33.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
index 7572dc4a83..d944bf767d 100644
--- a/package/python-multipart/python-multipart.mk
+++ b/package/python-multipart/python-multipart.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIPART_VERSION = 0.0.32
+PYTHON_MULTIPART_VERSION = 0.0.33
 PYTHON_MULTIPART_SOURCE = python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
-PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/5b/42/55c32bb9b12693c092ad250a0e82edb5b31ddeda6eb772de5f308b3804ad
+PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/9f/b7/15b905f6142a9a8a68f66900788da1a32e4d4254452783b37ad1eccb0506
 PYTHON_MULTIPART_SETUP_TYPE = hatch
 PYTHON_MULTIPART_LICENSE = Apache-2.0
 PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
