Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD04606A327
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 14:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CMNWEryu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=Az9bHlPq
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7B176069A;
	Tue,  3 Nov 2026 14:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rOQLQBpxhsKx; Tue,  3 Nov 2026 14:17:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 75FE6606DE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793715445;
	b=PohBWloAX9zxT+dAQlUvCpjBfpyOAq9k/ZYrZwFR6/v2iSLq03rjUzII35RA16bRLfeJ
	 L2mGKELkMFhkXKAPCx4e3hSCA25DxQ41/RVDj464xIfV0FsnV94UDqXDtldmB3HdQ4HkG
	 I2Bfwnwc8SGFDjdmYPAKX5LyPFgMyCTYdm/1oNFn3NHe2nISr4A7+mNppaVOBppewmEOB
	 rdh6GZb2qYDbKENj6O5AUuAE0P0bFQk4GNKMXxkp/OD0hsKHUMJ+s0fvCF9PMgcQ2gkh4
	 dPGKi/EYxy/3RPEAGXNJtO4w2EnFVrRjnmgnOnk9ZentDaUKC3dXo10v0DSyQBF3MXg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793715445;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UZh2CF0TCal4G2OkY2BQJKGeEfuE6uJXmdA6347KLIs=;
	b=YQGovJnYkzKJEMfC3B5W+k9rQVfba4z+Ki5x2Dy+dvMlvw6byoDl8Dx3j3+151SuNjF7
	 8SVEwIn6WWWxPiVmRHATiaksiCJR1hTzQkNi//VG4VDF+zbOIy7uNyEDlU/p8lzkaTRyE
	 NwO0r2WE03ueiXYaCPNnpszk4o6s5bAo63CjFolH5Z0U8LPYmOquZr6Vy3XMHmFLCmpZH
	 XRo9MTMuBE6Fj7GSawe17k5NrrHuNPD+pazT/Sr6JcR+agvR8c7ApU43KtQ75MKg70o4x
	 h+rdBuGqRG5xjlHaNTIFgiqWuLajqU/SLLl1rQW+t0UOjrWU/2LrjFAD790JmDBfcwA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793715445;
	bh=UZh2CF0TCal4G2OkY2BQJKGeEfuE6uJXmdA6347KLIs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CMNWEryuoJnuUpELqw1IWWf01IwLW8fnmaFzjuGdr8piQfy17yTQ3nA5B/V20GZYp
	 yt7WjFGpJDW8/ONrlTSdigHhv2kJ2dNr8s6KRe41wpxTEPSShoDi8i0N8wE+gFkFua
	 W67k4/iGkl8vKnaANO4+vPm5j/Mlb+tucvPCUUBSlh9/KJI7c7hEAgGr/mhApwcZLW
	 W4SqZAUFoYqzewbq+/1lC5fEVFeDRJtPLWtGVttf7CDNKUzJL8BnimJc0PPeFZHyuB
	 QqAP92vo4NMyFoPPpffW5QeKUMeGwxRbPrlE/mgMPB5C9Z0svJbS80bcDjMU99CrT3
	 TFgGjN3xCmyjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75FE6606DE;
	Tue,  3 Nov 2026 14:17:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B6700356
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 14:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C0DD400E0
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 14:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lsKZvydkl9BK for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 14:17:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8411440068
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.131
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793715443;
 b=nUYJZZ8hC6vk/oC6WLVdeqw7ceAnL/z2uGoLA4Sy0919eZIndzdCWyrnuFGrRK0C3veU
 PKhE+G6fMSS2BnPBqncC/Jat0wMkgd3EpZgEBsIRD67PIIIIYB1JHYBgOh17Cbj7+dcn8
 OeWuPQAA1B9+IQyo2CZco5CxAmRZMzR9cqtYFWaMFsiMObk0L1jim/NRl2whccFqYtLVI
 LJuY4R8i6X7cRL9DjcoMhbaIu+AN8+l2OuFj8sUGDTOuGAL2w7WJ7tBn3VGhhuxGR6oI3
 XsMveihqCFq1l6aK8eJMWncWd42yAUjPBOfjTvvagNaK94qj5z8cfxfq9HZRl3eJPXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793715443;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-CMAE-Envelope;
 bh=w707PWtWa75uVWWsbLAcxZyRl3STwcomCZV/f5jAF6k=;
 b=sWMytFHPXsNxZAH4dIOY+SUwa2pBE6a4mOd0ekOq5t6M15qkzByhP3d+bu00qC/6yG/R
 sV85cpZs0pQT8qlg2+TQyGJgmyZDop+EJCtGLa0vByjEjdvNIKdkdCGpC9SEsCsnNEFH2
 SyBcJ8mMfBYeffOMIC8ky9P56qLUf36ukHXJKmxiRD6umR3Hse6W2Gu3Vn65XYl6+soAH
 U3X+jdNa3WlnMM+zBaUUHEVNEFnPnsizthBH07WJBEzCnBVmn3jjBHEzbBlufZR1y/dl5
 skYQbEPbLAZ2fVhFdk6A0q/9dW52Tg1fOQWGJOUFBKpnOJ//IcR4dGSLg6mx765aUqg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=Az9bHlPq; 
 arc=none smtp.remote-ip=62.149.156.131
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Az9bHlPq
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8411440068
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 14:17:21 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id OFKAx34oJV5J9OFKAxTrdG; Tue, 03 Nov 2026 15:17:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793715438; bh=fgSt/x+24tHgbfcAAIEJ8CXlREynU0nwYt4pfjd292U=;
 h=From:To:Subject:Date:MIME-Version;
 b=Az9bHlPqLsFzFD4ubZU+MZpyiRwUcXOxVJX7noQUl3RgUVp+gzYkMQvWl0w/0lx3o
 yT8ii6bur/4EshdmsQxWPW57yppLnHQMyJNMd4Gm1yXO2n0z47rGWlsDYr2Xfbm4jL
 T0gCFYFwL2Vy5nLIwbXMH5/X5FaOA5XvQYclTsPPsRxLQMN8pCQ90O2ovKJNQnkfbY
 5eUQFVGsdRugigeddI23vZP3d3AtlWNxY6EH8jD+hfmDpANfXigQX3O9UFr6iLKe9B
 1n6T79zkYIZuZKY8CXsE0RaLhJ1XWiTlrY0zuFO4bOCGcO6QO0PhgOPVVJl97i7cKe
 E8kY4deHTWf6w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue,  3 Nov 2026 15:17:17 +0100
Message-ID: <20261103141717.385038-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103141717.385038-1-giulio.benetti@benettiengineering.com>
References: <20261103141717.385038-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfC9Busdso/ZaWN9G8g/pX5Qh1qYKTi7K41AptMHwXg+PACZQ/+Iqp5UAQPcMF8kA0EHAFcaAK7yjqxcUBzzear71tA+dBSL67WCnxr5B1DPe1JvjlFF7
 Wtr7P9ZsIwOPY6YbxFfKTQdrDb2aVE3aZrLo1A7AXOg3Ke+rvYnhmcaKwVNdU1M19XNECwfMk35QbZfq2xxSVmZ5fihVqxk54iSa0O3la7VyS/bHxWqtNFrr
 xfHAsGrWKSQ/Jmk6sJ6MdOJE4IdvdGtUlKkKlOkvVXs=
Subject: [Buildroot] [PATCH v3 2/2] support/testing: swugenerator: new
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* no changes
V2->V3:
* no changes
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
