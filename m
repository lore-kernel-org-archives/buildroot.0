Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9806D606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WpF53kIj
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7199E816DE;
	Fri, 30 Oct 2026 14:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_88TMdb-LI6; Fri, 30 Oct 2026 14:20:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6B7C681691
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370000;
	b=TydU/rY14Wvi9ThuZQT0j9g60mOQDOAgdaDhJSdxwT1XTwQCJX4OR+5KaazrYGthbxuP
	 SVJy5sfzc3owzNaU/ofcEc7KTSvucgTvlLPgMbhajQwuuHo0MsInDU0SR6V7kBoeafDmc
	 hTidyxER94/AqDIknu64D8tTgkpViIMJ3n9fRHKqgd2X0OACYtYK3OePyYTy7L0zOA4H5
	 lGp+UzsekksVHlLHK7nSgbBO+Wr8aZXRmmF+JOvOygnDPyo/xP3cs7agns6F32ROM9aY/
	 VuYJFzhKUg6wwIoP90L6wuAsAAC3fONS4+YG09hHL8pbWIu9abEbDn0iZcfh8sSzllw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370000;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=IWYqdwtoyDcv2jDzugBw6ruVA7jGeNkoTCfUMDs3Mqo=;
	b=JUB1IMlmxRUU3KycZ3sglgkLQa1mbsH7z/Bg0xYxVtClZfeIQd9r1Y7UFEPBxF2K36a3
	 wBsaGZwQrOH0VVg8RIuvl7y339f0eFrJo9U0Bc+eNS1oxLOBraGVK4JEw3e1uz8jUDg7I
	 ediLYPPDKlWBchXk6OTOqg+GIkWN/O57onZJ/UBSLtpY5zNATIw7X/sAD3PIz2AqZl5Wm
	 Nvvg+cTQbQ5Y4oxwSlII+te/u6hNGhtT5VxzTlE05J95G1A/e/43IlzufvI8zgCn+MeUq
	 WCsmQhuum1+52lew5l9tJKhjtyRwn0ReX1LqR8GRIEmaP74Ml8KYW1NFkoOSj+lVTZg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370000;
	bh=IWYqdwtoyDcv2jDzugBw6ruVA7jGeNkoTCfUMDs3Mqo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WpF53kIjx6GS4uGH1G+YBt91qff93HIqqvmKyZE1JRCGMTeV5HlcwvfYmO+DpdSOz
	 QpqCSy35a9LwZAQCkXzT7l6mtTdEGjVAEL/6vxOV8HEad2wPiTlPtGNJGfWXK19ljs
	 viB7vzkKXkUtbc526lIr3dseyU0tpbNSUNOicQDi8OHMgTlH9KhXwGMXDrzIZAw3mE
	 DwToSvWYfDlUPSwdE0yxNKjv6rPw0PZSFhbxZidqa5m2/j3XsCSqof9heGTQFnZsFr
	 nAf2/29T8pdgsUtksFTOlNe93eqteDKJWfda7jLiQUGFpSE+7Lvw+63P+GVd3f7Jey
	 rV6h/rXLk360w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B7C681691;
	Fri, 30 Oct 2026 14:20:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 713F8362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55CE540C21
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYPUpyy7iuTr for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8CDAD40BD0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369894;
 b=QO9BtTlhXau84pguTaRb5AJZb6BiivA5MdVuz7fj2g2Qd+RL9q6+HqFuvfrqaNRBrz8m
 kyw6GtbuMtOjsk84iTewHyzirmZWbmmCT1vjUEIIOYxhX8/5oICWj9ZvOT3WqOdbzJZkd
 IWd/eL/NsSxCMvh/dZTglPTH6+t66NzE35tyqZKF7iIYf8vY3WDauuotLXnRZNIhMdvvW
 n5RvIp0f0kZHcw+xRoNzgoPytjY0lgDqPleQpVpqBa9cdk7bJoEKZWMUex7fylcX0Yl3Z
 1Yq6dLjgzn+ZCOVRIfrraP8+iptiMc/xYNECbIn41RXPqwzEBBNAABHsGqQPcyIjjoQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369894;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rNo3PCTGljaH2SGeRQwr1jVyR7hoFpbKL9jgrn7xz5o=;
 b=jxr2xuoCi3vWZpuvs37W00OR9MgN3Egyusport4pE2F9767/HU5spwFziBwzv25DRAh3
 buNoaaFQdJ7YGWr/dPp68G3Nqxm0mBJpV8J5/n5pAKyJnEn8esXiIN6AZOLIJdT9gqVGv
 OBN9FvSWg1BA0fb6Wst1Q6hH73sL67aCTYttQcnXW1rEE0Iik2R5OTlM4i4It2tGZjPCK
 YrUwSwhNypeuG4SeGI5edFi+Sb1gbgxQJHan8uWQVArWgAXcWCdvdL7lqzsep7renW+jS
 +0iZpDTrRCR+6PpA+4YOKGgB4MGB1TmFccaiS6hJ5owELSpb8ybOtudzBxUJ+W0iA3A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CDAD40BD0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AABB29D389; Fri, 30 Oct 2026 14:16:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:10 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 8122355cf161804f2395f26ab91f35da6393e1f4
X-Git-Newrev: b21dd5c5eda4574b6219174c937da941a2ade12f
X-Patchwork-Hint: ignore
Message-Id: <20261030141646.AABB29D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/python-botocore:
 add patch for eMudhra leaked CAs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1610851248436681566=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1610851248436681566==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b21dd5c5eda4574b6219174c937da941a2ade12f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

botocore commit 0a6c7b6b3e794e865193dee23c68adfadb6b9c04, available from
version 1.43.117 onward (see [1]), blacklists the roots that signed
the compromised eMudhra intermediate CAs ([2]).

Since LTS & Stable versions are several versions behind, take this patch
instead of bumping across (potentially breaking) versions.

(alternative to commit fd9c348c227e9560a45caaeaa2cb026a8cf8043d)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...o-aaa-root-from-vendored-cert-bundle-3838.patch | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

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

--===============1610851248436681566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1610851248436681566==--
