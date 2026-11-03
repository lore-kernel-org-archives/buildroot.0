Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECA0606A327
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 11:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=drKDQTUe
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58AD9605D8;
	Tue,  3 Nov 2026 11:20:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LPOsbxMUxjKl; Tue,  3 Nov 2026 11:20:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5466B605E0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793704834;
	b=Ppy8+EsmGJvnWPBtB6Lx6j6rs8UfFS2rhhrBINECK24o+2z3f288wvByw8S2JFYPF5Fe
	 U+h43wv2INhAwHAlAa6nSNFc4E8QPEm10DXcnGe7BfVsaGFo5HUvn5HqY3DIAlHNPYJFN
	 2ddiJNI5AjhFxmfZlONGufH7U/I/zxPKBPD88BZckf6mpq//8MCcQ+cKKOerXDojvkdpe
	 T/CguOoEAOqFi/GchpxHyxg6zit5Kd30olXGzbdnx2rrgpjvvRWafSscAXSiPoR2m8XZt
	 6XoeRWr/GYtVn7+sw6ZGOLOWbbYDCd6QbxUAlXwZl1T8Ft3zVWwliFgVcdLP13bPBgA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793704834;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EgSg6iu+ABJ7ziU8Lsv1H1cdlsxtCVBJ7T5NkGvNDeA=;
	b=MQ+4IQKsrCYQLxLP7g3wWIH7i9tGhDzdLj0akU+TlNZg8fVjKD/CoGT4C01mlA7+/swq
	 w7YrZVdiDQ4iOIMwF6wmYVdFOhjlqBBpbKxcHcgiNxL/TPT6hUxtSVNk0Rwy6f/AwQgPw
	 pUKXloQfYENSy8vz8i1O37ywqy64DvloTZNDo8HiyXpUV2+gUpXNVPq7hw5cdNLem/D3t
	 H8USJedy1JOzKuqbJv/RXMVnsLVTXxW+E+LWD9HHU/vf0auepHzzsY3v/f3Wzkrrvpwc0
	 MZ/blj743/cP7KkUuE1YH9BkZtvEd1wgjyuVm4gTg0rYXmxG5H0mFy7AH4FmtP69Cpg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793704834;
	bh=EgSg6iu+ABJ7ziU8Lsv1H1cdlsxtCVBJ7T5NkGvNDeA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=drKDQTUeC/3zQKE/D5d8YDectICjojkoOowznz/LdaU/sgEhPkxY/MRtQaEUbZ02I
	 dniOI0JVb/Bo2x3t1lcsQ5zEZY0KygQLKRGlSneH8oej1c+FoiRWimiV2p27nFDZY9
	 ppSeovKROtc0wiEUP5DgAn6k56m0xrVbDT3ntUbBEDABJEstVOjBgcWksjAXDttMCK
	 escrLzNe1x4QTP6U0oLKo1g/je886+G3ySr3RTFaJsPY79n3iBoyzZ4IxHGR1nPSpC
	 GCLdhU4JLIylcQIz0OWQlEEgMo8GOGOf7nb7huQOWEWgTb8+FeJ2epAc0YGZRF9sd1
	 gsBflAe+NfwoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5466B605E0;
	Tue,  3 Nov 2026 11:20:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BC387356
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 11:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADB0A80E03
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 11:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDfe-5qFekAi for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 11:20:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 519FF809BD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793704831;
 b=gDj6SOsTAfBSzP2T+K67O2Vs404ROvhnHFAnMKlI8OsiXrhB//vhjIAwvtUCSssUmWIv
 80UZkueymEOQpOSOPObktsFnv3MKOvWoh0+NFLQI/4kQMahNPsIRaQKbK4ekHjq0ru6B5
 iqwwF26CQCNkFJ8BSeIJAVg/7Pbvnn6J3mDcqf8rSE2XPE5WegsM0Bwr4WabVl6c0BHx/
 EnZwXIlSf27EYuVSuyXbDTuUGYlBstzyTvR1OHXvqSMupIDfSlzuEJbSKNNmQR7SKqBBg
 3No47MBSCiK5+QNBewqskGFD3jspQvo/OXU0cXAsPfeQMYoir/GRGXiY1z+Rq3J8X6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793704831;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=cXyJAZvYyJ8hQrdz9Kqr8LV3XxTJg8BUU4zdY4zLa6E=;
 b=Mf7WjCewFu9Un08b5duJW9eyHJrk8Ip6SXE6x3IXAudC6BYdZiYunwOVB4U71nIJoAQF
 OYYnzFfFyVDzVeqqTXm5nBwsZupLK6YHY7ZW8sICPnWmx1yZ9qprLR1uV8O45fuJQYJOW
 udIIUPUftpyBRKp3aho6WwBzIQuYH64NhaBLUbXlx0K/251w25zaOih1EGyovDd1VzWYF
 GK4NfLpU82Qi3umFYmn74/u5MjjIZ5nVoBeJJGznI6sjFtlB+3xHyuL/WpSfg+R/Ae0A9
 YegXBvm9IKQie/xeQTMTVG92QH1xnz6XkqODf9UuRRH6l+CP5WnALYGSYLK0hOXn/Eg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZOjfOPlE; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 519FF809BD
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 11:20:30 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a2084d62cdso35848045e9.1
 for <buildroot@buildroot.org>; Tue, 03 Nov 2026 03:20:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793704828; x=1794309628;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cXyJAZvYyJ8hQrdz9Kqr8LV3XxTJg8BUU4zdY4zLa6E=;
 b=Wj+8qkN0UtWXIolPWsfAwcAae2HhMcz0IiaWZa+jf5dkcAdlSfpxLbMLXh/Waegfqz
 fl81RWoTelideelBgqMifncn06BhOCpGNoo2nNPlSGUmdC7OxSyn1eOuNSzljRZAJHgq
 sGmxrml50JqhajVIS53ucb/Cv+PuEE6/XreHLNjlTRk0iSZRe4IL43YEnQh5DSqXqsab
 Ey8ggpjjiuxNfA2i9RUGVSMWvQCFlDmIBvnE5I6bvWS6L/J7mRkjhuBdGM1aa2bvYug9
 6ZAaoIBC+5lO0068Y4i+0uMn0t+ofZs9/KUl2HfhTrexzQlVUAcvlbNWDmJE3aICJR6i
 zROg==
X-Gm-Message-State: APuU4Z96+86lVVfvkDr3DPXFDIL6Oujac3wEeH3soPGAOgRRXAeFp/sI
 rkFXvto6LPyrqDnSVpOQ5tJ8lhuIkYbKaHcrqq8KrgLb2tZ7gpBsccIwmZ9sicUkTO9Qih/dQkd
 XGJE7
X-Gm-Gg: AYBFou3GhYmePucJ4ZCKWuGe1/7s2OgXswkgpsZ69pUhMI1BEVzuk8ygWt8P7mTiQ2/
 lknyHEF1nMSOcA5wcVRYkiY52R57xmlD4MGBGol74/VRaudP/OOwQQ8P0Zhuf13hUCIj5iNDCaB
 MLjkjP/3r/XRCtso0XQvkBqtkLdJhVaSMBp46uMwnefvWwDk6ZVFUH7/jN/ZJMaaQfn8fcvPplr
 Yo3ojjxVGzMW7lJ/KSD+sOADxQP2WofBtzpQxEedH4qWDxPWdEoAfrAHGQ85c6IZ9KDdRR3aci9
 eVAvfgk396C8wjKe+qGfmCUyKMC/t+7dVakRWHYiFLMZ1J9cxtx8+aMUmp0IIk0YWPUDkJZ0ejY
 klLtJ0vjkE9NRFDcyYyaK6e1Em8yjPNaRLMvHVB7rbWGpANElHp2NQEU8R6b5Y2miuFanBzqUqX
 nRYM03RLi4NO6nI1/qeHl5wznQD9Tm1TAq/Kq0qRAP+Zdymo64CMRKNL14Uzczac6+xtsUUmg8v
 hajny8GMa5RG2esbfkPY7HqcGa5Xq6HE3vnq6NlDXdBbIVU6njQdaY4Xcgn4uqRpTZxL260n7qN
 L9H7yKrZEUjX/gLA6/9XPgP5S7EbF3Q+zocbTrZvNg==
X-Received: by 2002:a05:600c:4715:b0:4a6:eca1:7d5c with SMTP id
 5b1f17b1804b1-4ac182dca82mr297864455e9.32.1793704828559; 
 Tue, 03 Nov 2026 03:20:28 -0800 (PST)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac0a66caefsm267965975e9.5.2026.11.03.03.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 03:20:28 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  3 Nov 2026 12:20:20 +0100
Message-ID: <20261103112020.1072321-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x] package/python-httplib2: add
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

(alternative to commit 006269e93297e1a4009553526b158c6287aad805)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...odo-aaa-certificate-services-root-ca.patch | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 package/python-httplib2/0001-cacerts-remove-distrusted-comodo-aaa-certificate-services-root-ca.patch

diff --git a/package/python-httplib2/0001-cacerts-remove-distrusted-comodo-aaa-certificate-services-root-ca.patch b/package/python-httplib2/0001-cacerts-remove-distrusted-comodo-aaa-certificate-services-root-ca.patch
new file mode 100644
index 0000000000..f4728f810e
--- /dev/null
+++ b/package/python-httplib2/0001-cacerts-remove-distrusted-comodo-aaa-certificate-services-root-ca.patch
@@ -0,0 +1,65 @@
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
+[Titouan: add python3/ prefix to file path]
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ python3/httplib2/cacerts.txt | 33 ---------------------------------
+ 1 file changed, 33 deletions(-)
+
+diff --git a/python3/httplib2/cacerts.txt b/python3/httplib2/cacerts.txt
+index 78a444c..e80059b 100644
+--- a/python3/httplib2/cacerts.txt
++++ b/python3/httplib2/cacerts.txt
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
