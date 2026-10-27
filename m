Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422A7606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 13:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=snNCtUrA
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 178FB40728;
	Tue, 27 Oct 2026 13:39:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bF11ZszBu_CY; Tue, 27 Oct 2026 13:39:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 155944061D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793108365;
	b=HtA0OsDrOsdrmsFd7JTMuIUDIoaRvOdywvJCuZXooFKgNrcKWpXeX4fltnJVhiywS9zL
	 OrpE0V/WPWzPJGoQkFRVgVGSF5mUYHSxOXUnXXjO16Bs3NduwCKSArYAX7ifSwZsvPNDp
	 w0QoH8lfqpmKV/4J6gZDqZxtMcAglHH4MwZ0H0hAXNojBtvUwp41JbsXmvCCc4iDJn5E+
	 YBQzdXClnLfzkiwSmq+0srZ5rA+sbYv79Ko9Yn9hkzjgCuza4Nmc04kuaSQ3PzKwu5+Z/
	 G2maIkDP+L8cTAf7QqNPbkGZIxBf9tG0JSVZj/dkMh8ar6l3JkY9I+9EbTMhbpqh9XA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793108365;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=73gIHAFvh72A6yB1UiDPE/8pYwAx6IzORYuhZ/vSJMQ=;
	b=LlspjkCvLX7vfTMBBGhivKuupYUc9J1c5uhWowBxOMF7uv+4dBmhC1rJRGT/ruIsSXlj
	 a6+ScAP1wP186tRqi7o1Q1w0RgGvsDC43DcUTdyFTCJ40wk8s+tIJsZMjV0M1WU29wuqm
	 w8EuwV3YTz15Kwmvte83J9la3av6gD1Hun+6RTm/TyzQBvxG2bqzNpnya6HPIi8SLTL6O
	 iKkSku58rOENwTCmbPYOJQcWo/eKDT1r7+/fGJSK6YrsJj3BK7tlCd0dKVv+4VSEUlOGi
	 ydhJhwEyksLrtuqswoLr2CnlB5D4TasppOQsc9EXUUHPWPo1SCoKcjOkA7uGFrW4+/A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793108365;
	bh=73gIHAFvh72A6yB1UiDPE/8pYwAx6IzORYuhZ/vSJMQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=snNCtUrAFyg4RecdB7kWxYW5+DHFnlsDoUHTQ5a03cXcEF9gtABfFNJKCD81AIcA1
	 B7vcVC9ihMYCOsmCTtTzV+lgrwHfpQSwIbDzDS0XZ9NYmpjlqQ9FO0pcPT9ifB8MsZ
	 eCgHP66m1YUsNHcR7mpl7wt0b5QJcDGhcMHzhhm4oruimaOoRWxjt6QcinYJhRMCDX
	 EnTTnSA8aKMKi40aKiHWLBAPFrfgmBjkpbMRv/4kSN7Pavl6KN+sBL9cpew6KNuRPs
	 nBI0wfBQtv++NowAlsXcg/w44EKmluVYEOvgdCEC55KMEE9qxlqqNyGxROeLg8sqkL
	 pgM9VRstbIEgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 155944061D;
	Tue, 27 Oct 2026 13:39:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 709864BC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 13:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56A38402A4
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 13:39:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5LmLb8WSUM5V for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 13:39:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E213340261
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793108362;
 b=N9vHERa5W+AK8gZY7pzDpyVDEinTSEHGuXqlCwdw2WBJHfPWk542w1Ke1Qnk9fkTX9Ju
 W5B00ybDkdiV6w9/mroW/fhvYVgcydVz26VRas8kHF90JQV7RBiiERODBouKDPFeN15NI
 3GQOXVGF0Wrwqb/OX3vdDpilHFYhrMUCzBDfZuRdZ3ZxfwOMkODf6hmGAA+MvmIEKt3w1
 0Aa98Xboebd3Q1kTnCUKt32vSuqi0h6kJ1LwahHsdW6OV5wNjtKnheSaSC2OcDLzcMVhV
 UKaACFdwQHqebfovkUMox7tzSULBfwzv3wJpZcQG3jygRjNCgrZ+AnG/uCnNu4TJL+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793108362;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=LnRRdYz8MxjT4+5zMxbziLyLshiPieISEvBnGaFqgq0=;
 b=BLwS+H27MoOehplSN7OzZoLG1Gz4MwvmPO3yEJsEsoqY4oQzxcVvS7tmVr2es80XhX8f
 FICbIF2Mi1+frwXsUgn86G52x1+2D7uHfIA+cTwsQ5ekw0NeJnwVaeL58TCw5fkIyt8ZA
 iTqAXa5VEMBPItkzDcfvnTFwXQlormpHt6WFZDIlCIXpsgz9cDVbZVNZl6vFUmlxWnY6K
 aEIpr+ecKzJuDpnmT1VPYHaUCmjPr6w3rvAisN2DHW1tgbEYkZGBNkRwgHJBymc3Ghsvo
 1U4I0ZwDqE+u/ZgQaG81KlRSpDYR1wlJhftaz8+10JIMEXcleA/kfgJASeY3uLcG2rQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="f/qxF5Ie"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E213340261
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 13:39:20 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a2084d62cdso32568115e9.1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 06:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793108359; x=1793713159;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LnRRdYz8MxjT4+5zMxbziLyLshiPieISEvBnGaFqgq0=;
 b=ZdvpraNBEIsvnjXnFoZKUkQQMWoJOzOmcsDBm9cR3MBLF/JAXkj6PkCBUjwsl/4CGl
 NWxXdIMcWaHfr9dQARCU9BnrTGPmCirApbGAPXQqO6TQ61XQ1O3mjQ9uKGQ90yV6nwjM
 kW2ci7b3OSGmMERvGj3hQROK9gPXhfU9W0+nX9bh5P5LryZR4jxcFSW4Bxv3UW17IlA3
 HDUsc8/56gE2MHd+hIhmYKZvGx9hST12G1SMO57c30sKtXtvtGx4iR9yIY+PMchwbmJe
 9OqnK31YfXnbQRdMplu7VStTJxQvm6oTnIgKbDJnUm6WpeVHdOwTHHZGNMqTeDVYE3jt
 shrQ==
X-Gm-Message-State: AFq9FYIBo7XJ+w4hITDIKu1OJEYyEQFIyzRXTMAaGltQrypJKPYvZHfi
 2/43k37+PXNPNbTRCLzgb3YyKvZN71lCCYbQvBC+zOdI9joNH9GPvYDhTcs+DJ0kpeyXJ/3nT4v
 eO7Nb
X-Gm-Gg: AYBFou3sSgbRacgmPE0o6VdURBHDkhFIMRwetmgPbAKy6KDXAvaiKvaIQC7gQayWXYd
 HUdcM3MzGP9H13wkRUNwhoLUH8DjF3gIr5H9xfJ2+7wo419OpvaFWgMC5WunTf529uF7R/FEkdx
 3VxDymsuJNsAZYQJ59KAklewkQ1aN3/3R33z+R5IT68Sgl5zQ+LT6wcMk+0cmYQLQyxinCvjv86
 AXjomE6/J5DyIae0mu/N9vaiTCeqmh8u1yU19NQVeJg/WzC0uwi9FHK/5D/JaYSA8HRI/d9Goaz
 qHeoCIK/BGliMUSIbPh34kLm7X8lLITgfQd9gVcbdO7zLxRxDwYXvKYnx/N5szHr7+yjGFwCrbV
 IuqEsrHP/3N202w2XbDFbLB9ul+onpT/PkYoBtYxtqBlFy5WlCj4MUYHr5+vHShX5AaCoLwWkLL
 LSYkkcLceTgy8Jra3McHvxarjCqbgBMJeVT2/5JVgegg1MVU6DOhOBPgc6deh2z6xuhazV7iyar
 TI5jcEPHBL/D1nXp11PYRlIDh6i1rY7uXwt++GoYhKPNGu0CD3UiVPhlee1ga0x2s25fZQRfbFy
 zta+4HKXywIMFtjyeZOnMWY+Mst/hQr/
X-Received: by 2002:a05:600c:310b:b0:4a2:150f:1607 with SMTP id
 5b1f17b1804b1-4a35ac9495emr186503875e9.13.1793108358977; 
 Tue, 27 Oct 2026 06:39:18 -0700 (PDT)
Received: from dragon.home (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a0bb112sm286133365e9.8.2026.10.27.06.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 06:39:18 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 14:38:54 +0100
Message-ID: <20261027133854.3175088-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x] package/python-botocore: add
 patch for eMudhra leaked CAs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>, thomas.perale@mind.be,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

botocore commit 0a6c7b6b3e794e865193dee23c68adfadb6b9c04, available from
version 1.43.117 onward (see [1]), blacklists the roots that signed
the compromised eMudhra intermediate CAs ([2]).

Since LTS & Stable versions are several versions behind, take this patch
instead of bumping across (potentially breaking) versions.

(alternative to commit fd9c348c227e9560a45caaeaa2cb026a8cf8043d)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
Note: this patch applies to both 2025.02.x (LTS) and 2026.08.x (Stable)
---
 ...-root-from-vendored-cert-bundle-3838.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/python-botocore/0001-remove-comodo-aaa-root-from-vendored-cert-bundle-3838.patch

diff --git a/package/python-botocore/0001-remove-comodo-aaa-root-from-vendored-cert-bundle-3838.patch b/package/python-botocore/0001-remove-comodo-aaa-root-from-vendored-cert-bundle-3838.patch
new file mode 100644
index 0000000000..515257271f
--- /dev/null
+++ b/package/python-botocore/0001-remove-comodo-aaa-root-from-vendored-cert-bundle-3838.patch
@@ -0,0 +1,57 @@
+From: Shaan Majid <70789625+shaanmajid@users.noreply.github.com>
+Date: Tue, 20 Oct 2026 14:51:25 -0700
+Subject: Remove Comodo AAA root from vendored cert bundle (#3838)
+
+Eight eMudhra intermediate CAs whose private keys were compromised chain to AAA Certificate Services through Sectigo cross-signs (https://emudhra.we-have-a-problem.com/). Mozilla removed the root's TLS trust in 2025, and certifi dropped it in 2025.4.26. The bundle contains no emSign roots.
+
+---
+Upstream: https://github.com/boto/botocore/commit/0a6c7b6b3e794e865193dee23c68adfadb6b9c04
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ botocore/cacert.pem | 33 ---------------------------------
+ 1 file changed, 33 deletions(-)
+
+diff --git a/botocore/cacert.pem b/botocore/cacert.pem
+index 68d899399d..52ef539353 100644
+--- a/botocore/cacert.pem
++++ b/botocore/cacert.pem
+@@ -356,39 +356,6 @@ LBfQdCVp9/5rPJS+TUtBjE7ic9DjkCJzQ83z7+pzzkWKsKZJ/0x9nXGIxHYdkFsd
+ 398znM/jra6O1I7mT1GvFpLgXPYHDw==
+ -----END CERTIFICATE-----
+
+-# Issuer: CN=AAA Certificate Services O=Comodo CA Limited
+-# Subject: CN=AAA Certificate Services O=Comodo CA Limited
+-# Label: "Comodo AAA Services root"
+-# Serial: 1
+-# MD5 Fingerprint: 49:79:04:b0:eb:87:19:ac:47:b0:bc:11:51:9b:74:d0
+-# SHA1 Fingerprint: d1:eb:23:a4:6d:17:d6:8f:d9:25:64:c2:f1:f1:60:17:64:d8:e3:49
+-# SHA256 Fingerprint: d7:a7:a0:fb:5d:7e:27:31:d7:71:e9:48:4e:bc:de:f7:1d:5f:0c:3e:0a:29:48:78:2b:c8:3e:e0:ea:69:9e:f4
+------BEGIN CERTIFICATE-----
+-MIIEMjCCAxqgAwIBAgIBATANBgkqhkiG9w0BAQUFADB7MQswCQYDVQQGEwJHQjEb
+-MBkGA1UECAwSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHDAdTYWxmb3JkMRow
+-GAYDVQQKDBFDb21vZG8gQ0EgTGltaXRlZDEhMB8GA1UEAwwYQUFBIENlcnRpZmlj
+-YXRlIFNlcnZpY2VzMB4XDTA0MDEwMTAwMDAwMFoXDTI4MTIzMTIzNTk1OVowezEL
+-MAkGA1UEBhMCR0IxGzAZBgNVBAgMEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
+-BwwHU2FsZm9yZDEaMBgGA1UECgwRQ29tb2RvIENBIExpbWl0ZWQxITAfBgNVBAMM
+-GEFBQSBDZXJ0aWZpY2F0ZSBTZXJ2aWNlczCCASIwDQYJKoZIhvcNAQEBBQADggEP
+-ADCCAQoCggEBAL5AnfRu4ep2hxxNRUSOvkbIgwadwSr+GB+O5AL686tdUIoWMQua
+-BtDFcCLNSS1UY8y2bmhGC1Pqy0wkwLxyTurxFa70VJoSCsN6sjNg4tqJVfMiWPPe
+-3M/vg4aijJRPn2jymJBGhCfHdr/jzDUsi14HZGWCwEiwqJH5YZ92IFCokcdmtet4
+-YgNW8IoaE+oxox6gmf049vYnMlhvB/VruPsUK6+3qszWY19zjNoFmag4qMsXeDZR
+-rOme9Hg6jc8P2ULimAyrL58OAd7vn5lJ8S3frHRNG5i1R8XlKdH5kBjHYpy+g8cm
+-ez6KJcfA3Z3mNWgQIJ2P2N7Sw4ScDV7oL8kCAwEAAaOBwDCBvTAdBgNVHQ4EFgQU
+-oBEKIz6W8Qfs4q8p74Klf9AwpLQwDgYDVR0PAQH/BAQDAgEGMA8GA1UdEwEB/wQF
+-MAMBAf8wewYDVR0fBHQwcjA4oDagNIYyaHR0cDovL2NybC5jb21vZG9jYS5jb20v
+-QUFBQ2VydGlmaWNhdGVTZXJ2aWNlcy5jcmwwNqA0oDKGMGh0dHA6Ly9jcmwuY29t
+-b2RvLm5ldC9BQUFDZXJ0aWZpY2F0ZVNlcnZpY2VzLmNybDANBgkqhkiG9w0BAQUF
+-AAOCAQEACFb8AvCb6P+k+tZ7xkSAzk/ExfYAWMymtrwUSWgEdujm7l3sAg9g1o1Q
+-GE8mTgHj5rCl7r+8dFRBv/38ErjHT1r0iWAFf2C3BUrz9vHCv8S5dIa2LX1rzNLz
+-Rt0vxuBqw8M0Ayx9lt1awg6nCpnBBYurDC/zXDrPbDdVCYfeU0BsWO/8tqtlbgT2
+-G9w84FoVxp7Z8VlIMCFlA2zs6SFz7JsDoeA3raAVGI/6ugLOpyypEBMs1OUIJqsi
+-l2D4kF501KKaU73yqWjgom7C12yxow+ev+to51byrvLjKzg6CYG1a4XXvi3tPxq3
+-smPi9WIsgtRqAEFQ8TmDn5XpNpaYbg==
+------END CERTIFICATE-----
+-
+ # Issuer: CN=QuoVadis Root Certification Authority O=QuoVadis Limited OU=Root Certification Authority
+ # Subject: CN=QuoVadis Root Certification Authority O=QuoVadis Limited OU=Root Certification Authority
+ # Label: "QuoVadis Root CA"
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
