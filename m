Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBC5607F104
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 15:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=X7e5U6aR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=UDqxtJHk
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3990B60661;
	Mon,  2 Nov 2026 15:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWnEtb41zSXi; Mon,  2 Nov 2026 15:20:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E179A60669
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793632841;
	b=KtYGUNu4APYxdFs3S+stxyCFlsmBtCbHNXalklbWLiiZ2vchoSUT4+fdyVzGgLQf0nBz
	 Y5pBMfF6O5ocpgnn24OKAwCNxu7UeTz8a3v18gLXs411L7BghH13Sh8GQIAwOEv3SD8Ky
	 aMQ1B/p/eqizKxTqFqPikVEqj7hNx/tX/OfqIt7Z5sWRkLH0lev6ea9bgbh8xHhX/Ir88
	 D967IJqPO06UnpDIyNgmyM6BfiBAq7ruoyC5T7H/BLr58cWZJUkROnbI9klRBv46bd2AC
	 +wVN1VQ1Svr/dzOKQSKz1Yte0jqdT5YL48mHHmxYfDaKICRu5tFtcZu9dBa3MmhjmoA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793632841;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yRBEsuU9cn2DemYc5wnidN0XAEVv6WZjGxQi1usLfzM=;
	b=PtA5UyYivZqP6dtADlFJpK1AxnlKqQEcVATWrAii0pk7nFiuinIuwrPhtL4du6ALj16s
	 QpBzT6PIx+abOnpH0ADJT7qbO7khhCn9+KZkzwx9VM0bzpzg/B17rYxt0QpbbBEyBGgeW
	 Li88VWCDrhVP/Agh6rWeSPTX8VqZkynLE691ntoake+EV+DWS+dbSwo/kE8maZ8/ZhzHP
	 JalP0QPXz5a80Y8+ijsRu2lBlsyyySWjGirCgQijx1VzSy13zsX+gqoJVqGmKJh2Mbt5W
	 AU0KTD9VyZGc0hn1KWpnccZm/zHe8+MrRjVvm1B/AM/51JNhFDXnHsVaZNMTalCv+tg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793632841;
	bh=yRBEsuU9cn2DemYc5wnidN0XAEVv6WZjGxQi1usLfzM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X7e5U6aRCEO1f+n78fPmnVpiXmNQ4Q3VC6CXnNhTIrQVfwhWCSixUy+p6uTwT4afy
	 zT8+bcFo61j8K+mOKFjvDmSLMsIzYcDUKXjYhA7hFUE+Up2ecpI+beu0+fnEiY9Gxl
	 NO/ylqSNpp598bbjW/fiEtZvZY849znnS3PpKmnj8u6xZfmFMo9SFv0VOjsyogL7Lv
	 dAFRtMbkIyUKYZc/YO0OaECohDIhvn29RWr3nSEclDQYhW7vZaVWoJmkrL4DtNeURP
	 Yo1/NZxHPl2auTxCwAJCGe4pizc7aOebyXpgGdJEYei0uE3y/+ZGMmXFMdDWfGxIV6
	 hIatiPvYqSC4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E179A60669;
	Mon,  2 Nov 2026 15:20:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5933D4BC
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AC1781090
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uHwX3GVD7O8a for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 15:20:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5B59F81080
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=62.149.156.87
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793632838;
 b=eB8iYZ7ZFWes4CA+pBvGKp+1OxtIY7Jxhf5g7sYK4kxo87po27LqlijBCMAKr+28kbJd
 hgAzU9odt2ueRMnXP+9au2YfFRro2SsAyK1BXp6Bgq/SWdLiTxk3Ycml1IGrUZtWZGzLq
 7LNknLT6E5njAUXqKFhxIxgyjzQPYvV/DtyFO41o10FnqNM10mVepwuk5MoxDXffYEVMB
 KkA1mKQ3ru5QK0i6BNK9VZZpnRVJOlZNM1mtP4LRSraMsq5nf1m1YQYbdlFdqJkfNBfvQ
 2wJI/BKqE5OtcskWs3RHcV3jFNa/V44S9U856NMFz7oOJbnRgWWUxyMOdDKE1b00Erw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793632838;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-CMAE-Envelope;
 bh=rrFVjkaTGA27Tw7bqphUK7D+XKYyit5B8EZKFGh8Uqo=;
 b=VYX5ckCiBLr/lHuUZM8PbdAIj5FOAAOiOzwxQcbskjaw2uCx+XZxT82kYNnGKV955fSo
 73ARquc8/rIUdbKygr67Hr2EKWsuUXDlcJe1Gp091v040qXrWVGWYcqJnRK26xYKgkxkk
 7jilPPP04XdWdX+zzcX/F6yYtYl0rcsShQ/9rPEskOeE2sncFDRjzjbyklscip4T9Xspl
 oRm6V48o0rXHVfQQDiyj3Hig+JOFxOTqcpy31fsYhY8LMvLqmrK3q5t7eZWizNT4IGw7O
 Ob2hEDaPDna0TAwLObqUjNKhiPkiLend4Y0pDuxx7j94IXZofc8aGN2dyu5Ux82l+XQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=UDqxtJHk; 
 arc=none smtp.remote-ip=62.149.156.87
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.87;
 helo=smtpcmd0987.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=UDqxtJHk
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B59F81080
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 15:20:36 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id NtppxcP346q8sNtppxmdNz; Mon, 02 Nov 2026 16:20:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793632834; bh=BvGuLySSxWAXQAxPw6WkBUCNxHYCh6veGp5C/5nVjyc=;
 h=From:To:Subject:Date:MIME-Version;
 b=UDqxtJHkyoWmRDTTO2n641FRiauBt4pgS+yZyp/geleeg3PB6xn8Uq9lfsATAcYQo
 GtiOZOWT1v/awQbVPmm1RTmR3wim9BHkW14mW4I1WdR08jmqq9oUFWsVQggeNiEF+M
 OOVPY8oA4ITqrgunJiiaCKJ7CyB1BZrqWtn3t8YTyRbJ7nuap8RRo6RVGmY9y4eAZI
 Sr+anfOzFfDZRqUZTFl5TNQ0CUbnDD/9F3qr6QFA28iKEqE1zg8QkpZOjs4wPoePTF
 5avOpzV3pgHRBPHIuK4gUgRbxAawZR4k7Z3K5+RvdIxFoO5FthUgkitWCvzJAGpWK8
 e4LpeHk3JBTJA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Julien Olivain <ju.o@free.fr>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  2 Nov 2026 16:20:32 +0100
Message-ID: <20261102152032.354085-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102152032.354085-1-giulio.benetti@benettiengineering.com>
References: <20261102152032.354085-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfL60fkc2tiVyd0JEOKye0Qo+RbpOw9Sgoct5cHhYPj2DmNdASQ1YiL5B2mKmw/2J37MVAYeNrSGiElHfldcMSbqzPoU+aM/91IA6NceHwUHHg2RwAIPW
 ijuynWRi1dyAMiedEt1YUhdU5Gsn4Y69oJWHhYTSHuN9SvOKbyrdf+lIpJbCYNuz1cW+7bwacmTxC5eSxoPsRDg+gtq/rfmI4dQ5Id19hpI6/acC/Y9781Iq
 YSq1Iwc7B7qgHDEMz0HM+RZhqO/gdFCIHZFlvnpTYn7Dp34ZmuMMGUn1gjy7Nr1K
Subject: [Buildroot] [PATCH v2 2/2] support/testing: swugenerator: new
 runtime test
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 support/testing/tests/package/test_swugenerator.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 support/testing/tests/package/test_swugenerator.py

diff --git a/support/testing/tests/package/test_swugenerator.py b/support/testing/tests/package/test_swugenerator.py
new file mode 100644
index 0000000000..2bfa1e7efb
--- /dev/null
+++ b/support/testing/tests/package/test_swugenerator.py
@@ -0,0 +1,13 @@
+import infra.basetest
+
+
+class TestHostSwugenerator(infra.basetest.BRHostPkgTest):
+    hostpkgs = ["host-swugenerator"]
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_HOST_SWUGENERATOR=y
+        """
+
+    def test_run(self):
+        cmd = ["host/bin/swugenerator", "--help"]
+        infra.run_cmd_on_host(self.builddir, cmd)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
