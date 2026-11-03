Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BF46082BD7
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 11:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=szxLTa1C
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D071380E24;
	Tue,  3 Nov 2026 11:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UW_kIKpfYBaW; Tue,  3 Nov 2026 11:17:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 59C9D80DA1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793704673;
	b=F2iT4PEw/Q8SwmXQD1FSC1VHn9MVRUzHW9JTKlyH65pHog1Y0n4ookG2+7nN09Qg5DO4
	 7+NMmC2+eY5yAdG/PgeqO8IV1ifeNWYZ97Q2vhtvyV1BVRvbVRrpP0FhG0F3+cM1ZtQdI
	 jPCx2LOGHayTnpl/xoHd+bc9TEDQtdWUuMsaNJX/0Vs5K//EVAaW+6JohgOfjvVqNhTDY
	 1jafoEX+zG1uGuP0oQ0PwqiTq55otFxfkM4S7FqI8HaNJF/QiOZqarP0v7LMfCjqm9HtN
	 78N9AbwAM3SU1IxvHEFIEkVVDH3vpeftsl8Tr3LZcsK3ICLui3LDSudqmBCQoi+9h2w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793704673;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Hx3jBNLeqXC3huDlXJ0oVd1NeMUPixKmKf1E4ydEdbA=;
	b=ZA0p/zPzqk7uj5Q4NY6TtOX4mzkcEkNF0iWS6qiv5Ie9hhedKWkS4P8x5RLiZsQEvCeh
	 avCP4fQoG/GelvwjfQ2ByEMS9ARh6z3biBP9J3dGAv3Z1yBtEPtpYoK1o5fafYStbn39p
	 UA1z8mJyMqES0pdMv5p/Eo7wrSyWvT/SHXkT+zCPDwmNwG3wLuU783x3eUg0Bu4s0s1Oa
	 TVsGYBfT0NmJUuinyNXhM+xPQErHIGXvgLmEpMagIMBvBrYPTNWcEJEnapMwltJ3WKka3
	 1LswMUuyY+/TCGWbCwPrUMGve79pgsW5fwivkO39MWitokYHmxAFdsf2J/JVsBqzbqw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793704673;
	bh=Hx3jBNLeqXC3huDlXJ0oVd1NeMUPixKmKf1E4ydEdbA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=szxLTa1C4HG9bcdEpUNilyeW+tLIXeaLoxdVXl05/jue+vqpqqUQdstuZynHRW8cJ
	 qpCoqgMr9WzhSfTKEoesBKcYClW56/OvpptNXOhR2wmmnP8DIjFEItjyLNagN8INHA
	 Eh4xXLh453IJu1oA5755XxD/H+T1Odea95rVfelM+ZbsCO9U2w03dLeM26Vo1r4E3h
	 yQ3nK3C8ydNi0ffNtm+/Oz9PcVPpgE/9wP3vlmtK544ckiiKziVdlVW5TWGf6DGum4
	 +JnEWyRb3gDJzIRs5p5YhVFRlL0Ey3SayE6mJEImILsggPoFow4FlNkaXRXgdPZtxQ
	 2vm+DNYvOa36Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59C9D80DA1;
	Tue,  3 Nov 2026 11:17:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02B1D356
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 11:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC3FF80DA1
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 11:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v7KC8eueS3Om for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 11:17:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0D7D180D87
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793704669;
 b=sstI2+yXu0ctCP2IvL+8UOz3CDe+cCdt4Hd2gJbSKS7bAOaBcafrlmX2lNO+NnYOmDb0
 YJ6C9mDHMwgdqvLY+JvcQh/Gv6p96GAKKtrSsyMMPyTfWD7AXCoiou7wp+CP69r7vqJT+
 YYkltq/2t9r3Lsds4UskNfL1Zh6jrIARa6WaKG0A6y2dTw8HhJG00z6GOCtJ1awGvSZ70
 LMsKlecbprwaB7yW4MVmULjRe1AGnU/ER8B6VdbCNAr7bs1haGradl6TqPiYUiuW1/XD+
 0R/mAN2zQYNiIXUaQDxJ/Pv4+6TDttnQsrv2CW51d+GmhJ290BeNwcG29CrREuTvX9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793704669;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=haGTEp+zRHTiGC0y0WnaWrk2R8LdXN9pTslxqaoUAsc=;
 b=i38+Q6frs+OTHzPRB23oYc7bmQkB7mdY6vW/29i7HQ3DcEKuI72qwBWWZoSM5L8KtAHU
 ziUELtytkUSPjlpjllk+GR9qIITvSWH1gjziLh7NebH+ClrM1Yp8mtzqaNoOVwGrHTC3O
 cWn6AOpFuPiWHU+fQnqJGmX7CGVXMkWpGSLGzgMkT7sRJhFBHvyZq4yzh9H5DnuaaGVp5
 hahNQzZH3dcS2k6MioQL65lWS7YEMsEmJft5V49lJOHs0JVwHEvudBZZXO7a3aWT7CbrV
 o26mKVVloXO3l5W+T+xr0sPs2ziBWdodQoakXivx1X365uVpYtvixgbt04TRDPC/CbA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=hhLxjnj4; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D7D180D87
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 11:17:47 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so26085775e9.2
 for <buildroot@buildroot.org>; Tue, 03 Nov 2026 03:17:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793704665; x=1794309465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=haGTEp+zRHTiGC0y0WnaWrk2R8LdXN9pTslxqaoUAsc=;
 b=wWLSREcpEPybPZQbFsPno5JIG2wq6XysHP15+NFWAYCYlvEhX56glvfyBKRj9Pp+/+
 JUOk2oQLV+a9HF7Gl5NRQY5Fl5iTNTb77nEA7U9esqeU/mv9aMB013wzESMKz4wX+KYa
 cSr+Lraq5aT6BRXM8ilCGTCj96DuebNFeN+ppKaBV4cvhTINccKj9MlQTloUZy439Hwq
 DycNMMNYTeVNZpctNMrGty9VLH7MP+ertE99N76OuezW2jkMmtrIFHCPRuTnSEJaErsE
 efv4rOynZNj0mHNkowy6ssHafYC5ActrIOLedck5DsFvU20XiQC9a6hAIpGShNVaxMPR
 Kn9w==
X-Gm-Message-State: APuU4Z/3uDL/vww5o9RUTtonPclac5ZU9ZhfzjnrrBqpbRUMTE5QQ78J
 RFOnVhi9vPH+BO+XJIT5JbyQYkkVKKTSIefx2KRBW1ue2XtCWUh/yVKVk7U7ECYCOqAOPPpgMcm
 YOaaZ
X-Gm-Gg: AYBFou0yIQQtGEmvDW9FAauE8X9cvfWO8c06CR0k4d1IUtNWFl33AEKpN4nfupTbCKR
 RwiEZUSR2kmVVCLvAIH1+vHz6Mjus8jFFNGIRdZS1RKEkXR5gxcCem1tgxSNZ0Yr1IFy+SCXLoG
 gfXFCsKia49ftHtLDylDT44WpOYrji5XDAbqICKMX4/9bszxqDAY5desUW0wE3l1n9rcw7mtnSQ
 qhBi+OgGRnqN7WDLlXnUFY1I+uygDDS0HHV2ByjP9KjU9uSFnq2YfsK5VYmI57GCjmBBVFWuxUo
 c0CUcE3Lf9g6w/Uxwi8pqPZBA7peXbNb+Qfe7QygFKL128/Fsk4Jyw+lnP/QpNRDDIMUz4Qk19V
 DbEWuoWjOUXfKL+I8noQfNasb5CLRuKgpYVd1/m8VDNzPW/ZdhiBV1rzI/YZEWDcpDXhtY6WYI8
 893u8ZO8iF0Plv1HQJ0n7foraeprf+CrIYYpit3JLiq8MyUgsRg0wlhVqXXY/Z/tH8RtM6O5TcM
 YYRvaA3EBy/g2nMVNfN+5Mj8Bxp1KrSiS0JthmhpYBA2MQkeCkj7Ye3R2jp8CE3mgbzQLo8B5aP
 204yiMVSIq2QRSoyQdnAfCB8RoeAj2rsDkvNd+HsnoJFNvvboXQpsxPXOISi+JI=
X-Received: by 2002:a05:600c:c16a:b0:4a1:fbd2:f689 with SMTP id
 5b1f17b1804b1-4ac16fa352emr298835175e9.7.1793704665271; 
 Tue, 03 Nov 2026 03:17:45 -0800 (PST)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abebe33e79sm243433405e9.2.2026.11.03.03.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 03:17:44 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  3 Nov 2026 12:17:21 +0100
Message-ID: <20261103111721.1068467-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2026.08.x] package/python-httplib2: add
 patch to revoke compromised eMudhra CA
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
Cc: raphael.melotte@mind.be, James Hilliard <james.hilliard1@gmail.com>,
 thomas.perale@mind.be
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

(alternative to commit 006269e93297e1a4009553526b158c6287aad805)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...odo-aaa-certificate-services-root-ca.patch | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 package/python-httplib2/0001-cacerts-remove-distrusted-comodo-aaa-certificate-services-root-ca.patch

diff --git a/package/python-httplib2/0001-cacerts-remove-distrusted-comodo-aaa-certificate-services-root-ca.patch b/package/python-httplib2/0001-cacerts-remove-distrusted-comodo-aaa-certificate-services-root-ca.patch
new file mode 100644
index 0000000000..c7d93df543
--- /dev/null
+++ b/package/python-httplib2/0001-cacerts-remove-distrusted-comodo-aaa-certificate-services-root-ca.patch
@@ -0,0 +1,64 @@
+From: Kirill Logachev <kirl@google.com>
+Date: Wed, 21 Oct 2026 05:15:52 +0000
+Subject: cacerts: remove distrusted Comodo AAA Certificate Services root CA
+
+Remove the Comodo "AAA Certificate Services" root certificate (SHA-256: d7:a7:a0:fb:5d:7e:27:31:d7:71:e9:48:4e:bc:de:f7:1d:5f:0c:3e:0a:29:48:78:2b:c8:3e:e0:ea:69:9e:f4) from httplib2/cacerts.txt.
+
+Six eMudhra (emSign) intermediate TLS CA private keys were compromised and are trivially reconstructable by third parties. Because the legacy Comodo "AAA Certificate Services" root CA cross-signs the affected emSign Root TLS CA - G3 hierarchy, TLS clients that do not enforce browser CRLSet/OneCRL revocations remain vulnerable to MITM attacks if they continue to trust this root certificate. Major root programs and CA bundles (including Mozilla NSS and certifi 2026.10.19) have removed trust in this root certificate.
+
+References:
+- https://bugzilla.mozilla.org/show_bug.cgi?id=2083449
+- https://emudhra.we-have-a-problem.com/
+- https://github.com/certifi/python-certifi/pull/440
+
+---
+Upstream: https://github.com/httplib2/httplib2/commit/5fee2b095f49a6ad5e1f0a185d909c89199e4dc9
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ httplib2/cacerts.txt | 33 ---------------------------------
+ 1 file changed, 33 deletions(-)
+
+diff --git a/httplib2/cacerts.txt b/httplib2/cacerts.txt
+index 78a444c..e80059b 100644
+--- a/httplib2/cacerts.txt
++++ b/httplib2/cacerts.txt
+@@ -875,39 +875,6 @@ Zvqz2cK6Kb6aSDiCmfS/O0oxGfm/jiEzFMpPVF/7zvuPcX/9XhmgD0uRuMRUvAaw
+ RY8mkaKO/qk=
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
+ # Issuer: CN=Secure Certificate Services O=Comodo CA Limited
+ # Subject: CN=Secure Certificate Services O=Comodo CA Limited
+ # Label: "Comodo Secure Services root"
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
