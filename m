Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D89BC83030
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 21:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6991641927;
	Mon,  7 Jul 2025 21:17:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIT05Wbh1VLX; Mon,  7 Jul 2025 21:17:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0FDE4192B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0FDE4192B;
	Mon,  7 Jul 2025 21:17:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 22DBF15F
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 21:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14E5580E36
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 21:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-JbeoAZekhN for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 21:17:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.56;
 helo=smtpcmd0756.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC0A780DE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC0A780DE3
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC0A780DE3
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 21:17:44 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id YtDZuZvBut6p9YtDaukSMz; Mon, 07 Jul 2025 23:17:42 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  7 Jul 2025 23:16:24 +0200
Message-Id: <20250707211625.3673431-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPy8cUMoyN7q+cy/3kVL7gIOJatwcNKIsHTKcak1G1PfsBkKsSISetU97aOvkVXvmkL1A8vxnuiu4OjvpA8msakumcjNFf9NNfxF+2B3+4wcXkg7B0Kj
 OcyYQqbcB1RaTVqw9a8/EXFMggJzjIlxX/8z3DP4han9lXX16BtdEQDchcdRTK/FrlXASB7RjFhmhXBHspy4F1C0TAxNzjEkUQ7vruezegxEtsTlsN3u9UCF
 cNot9Y8BGKogp6+i1birLUyj/qdxiJDEvvG4u9grGWk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1751923062; bh=AEHxw01yx0QOKllkhgHiiPRPyAhNu9UjD5TmagQguZc=;
 h=From:To:Subject:Date:MIME-Version;
 b=ZLoRS8UgWUJMotseq8+0IRNTXtUq8ArbIIXRV6JV56Yymj9t5PDiaGCjPbTyVW5C1
 9ioz0Vx+M9+NLObkWEN6ORGz2hvUt8yP9hwjDriMN4z7WpPbQG02Hy/uLqanYluOcb
 kDP6RKAk6F6OLiAgV4gvZUhTfp91eVuKXntgD8XOTnmEWaaM7Jt2AaOfkGVeXo86zH
 Twk2AYFxpL1xFUCoWYcnLDfCrHxu6tKwae8SRiVcZ7W5Cz0iVsArKv7j/wA5WYwbBX
 VR+N19/lgEsZHbE/UJZ64OgxtLAfKwmdTGPtnSsjIJQ/nflnNNI8IvivO1ItLBf/YX
 ImhOC7I4vUhHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ZLoRS8Ug
Subject: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to liblo
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5b76c898ff..3d5eb265e4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1305,6 +1305,7 @@ F:	package/gcc/
 F:	package/harfbuzz/
 F:	package/libblockdev/
 F:	package/libfuse3/
+F:	package/liblo/
 F:	package/libnspr/
 F:	package/libnss/
 F:	package/libnvme/
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
