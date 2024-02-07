Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4588BC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 17:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAAD94049E;
	Wed,  7 Feb 2024 17:10:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nmDcU-pY_n8N; Wed,  7 Feb 2024 17:10:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9949D416CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9949D416CA;
	Wed,  7 Feb 2024 17:10:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFD641BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B894A416CA
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:10:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QZ4rk7j5uODM for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 17:10:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1D54D4049E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D54D4049E
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D54D4049E
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 17:10:55 +0000 (UTC)
Received: from bubutux.localdomain (ip-185-104-138-44.ptr.icomera.net
 [185.104.138.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id CA5362C83776;
 Wed,  7 Feb 2024 18:10:52 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 18:09:53 +0100
Message-ID: <20240207170959.2672846-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707325853; bh=3lORNM1uAQeJM6381umRx/IwcOKMg3bavigPSkWr61s=;
 h=From:To:Cc:Subject:Date;
 b=j5IKid1G2MQzVWo/4oDU7XR5snLjmsF7C3CLik92oBa/vt1zFqJAozsoz68+2n9gB
 U86IFXMzB11Fh7FNerxCwVy8Yz4ocNszowLGSnlOFZmLVJu81ffPga8CWlL6pFci/b
 uhDYqMTqCZOz6Pq20lCYd+MXpa/cuiGFYCKZPA8wPZHU7ZPh+8QcJt1Zsf0fd89kkw
 tg3v9TpkNFV4qL1c2SBhBQwTmRrQLjYsLPq9LORu7VdX+sZ6qpYBip1CqAqZG43nuO
 LQN4fXVLNKs/AbZm4kn3TG72SQuwFjuSo2u3bMsORBhvYcZHPoRssxcYGnzftR7+ez
 dVXS7edkuob3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=j5IKid1G
Subject: [Buildroot] [PATCH 1/4] package/python-ruamel-yaml: fix comment in
 hash file
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-ruamel-yaml/python-ruamel-yaml.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.hash b/package/python-ruamel-yaml/python-ruamel-yaml.hash
index 29852a51ed..ee5016835b 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.hash
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.hash
@@ -1,4 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/rfc3987/json
+# md5, sha256 from https://pypi.org/pypi/ruamel.yaml/json
 md5  206bda0f33ab2c2f63777636200748b7  ruamel.yaml-0.17.21.tar.gz
 sha256  8b7ce697a2f212752a35c1ac414471dc16c424c9573be4926b56ff3f5d23b7af  ruamel.yaml-0.17.21.tar.gz
 # Locally computed sha256 checksums
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
