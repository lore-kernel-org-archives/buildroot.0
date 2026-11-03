Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56708606A31B
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 20:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XWOSFsIT
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 268C9605ED;
	Tue,  3 Nov 2026 20:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMl2Y7jGVD82; Tue,  3 Nov 2026 20:15:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2FE6A6069F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793736901;
	b=JzKMGvvpyg39ZcdhoGNc/L4VIDDA8Z0fZYqYeZoOFtthYhhdWxfF11qs/Bf2kZtXhdrS
	 diS2RMm2QZFHhTJWw+6elkbLdZ7m1ImgGwN+Dp/Kacl03gLx1lyuOVnQmehwFCW4vQOLq
	 HI5DYZyP/k/mxHsI9fVhp96nXewxWtofW65bCkzzArSu2yy49R7imR+HlruO4FroPgego
	 VvcW5vHWrFnutg+7tAAiwQK8+5v/ce4NpOLCL2pb6HJcYdeU46ki2C4qgCvqPSP1qDNB7
	 7xs28uMi6/QbkazxpTMIvhgY4waIqz6Ob2PVm2wF0hwR+y/DbBs3rnxzPFZqpoUzEFg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793736901;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Date:MIME-Version:Message-Id:X-B4-Tracking:X-Change-ID:To:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NXvt5GEXOfYceF2zLOyGD1V+Spg13NKK2vcjHqIDW1E=;
	b=LKV43/57yjz6O+NdJarYh900EekcT0dCSnGIryGOlG50NMxvIxwDA8DH9DTVSzvs0ZiQ
	 Zn25EwcZaRj0AOEOyGzWmgPp7O6Avo2ok6lCRlGCcVFfIrcYYBPcRSdImA/Gp+L/Q/a4f
	 qE8iFHSjebKNRWSDb05+H1VdeFDvMsZEwyS7FPOysmCZPPBuBftyPWh40aaBXyCa0yLUL
	 oNgJwcppkJkQWxRjSr2mZkhNVuZPzA4bbJp6s2Kux96340TGhwnWO9QdEf+ep8F6lBRXx
	 nD/Q4F2IBNM1rms4BS9cFzysgx6o8v9ULbf00tsJTJ6QbcnWoI3A9aaZTVhqa6S9ohA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793736901;
	bh=NXvt5GEXOfYceF2zLOyGD1V+Spg13NKK2vcjHqIDW1E=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=XWOSFsITH6MYQFr+2mAjoVWEe0JpZh5kW6SEVaaGazU7DueGap0ravdiNDIOy4GZ3
	 PKIUMgTxXnOciUwQPIkaP6gnchb1h0He+53sPEXVQkDZJe+CsD64li4VsL7+02mcin
	 U9UnRT33pu+7wJvce5tdqBJYfH+h8eksNN+UH1koSv83oL4trLRC06b4rCodUo1yED
	 /1ibWZgM3ZbziWph7XnoPHCOFq5ulgmMlAdblriIUN7b2Xqklacv3B/mhsROejb168
	 Mgzp+nRNcEt3Tcj1sgzRya9HMyodvr61r8fxbCjk/6v9P5istlLMycwy0bU2NQgyix
	 81eBfqXoqkjog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FE6A6069F;
	Tue,  3 Nov 2026 20:15:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E1A432AC
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 20:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3ACF4009D
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 20:14:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id whmAo11yXrVu for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 20:14:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 15B2F40062
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793736899;
 b=E62BoP+IUrbeSkjr765QaENh5d4hpAsmhipuQVV2MnNGP/3MxENhwhOD3rQmxsjffOKc
 2/FPlLBXxgMBIOG1KcpOaQHvAuKwxLCiBT/F4YUpxK0LpzltgaLLOIR57kDi0ZNohJr1F
 yyqFJFxMseF1bNHX8Re+SAZVwaLJ0QZUI/C2JbN1tyDu0j4x18rBQdT/fpD7uawzJzxbp
 DgRE2vTnFhNpiU9SOy+DW8yVRx4FUdSqJCrlAVPEsSeCHUL5s1BWJ8KT6UQxAskbaHKCC
 VWNwnTjjtKwFyoHoU+L2QcXlhRST9/qVZI0Q08D7hFCARj0YvLwwrWJQt26ompPBcgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793736899;
 h=Received-SPF:Received:Received:DKIM-Signature:From:Date:Subject:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
 X-Developer-Key;
 bh=Cc2/Z4jAT0PjYKZ99SSOBin3E4wnqMvUqvB21TKKQYI=;
 b=kK0xh3MZ3D7ffJvarX6IXyDjqui46K+Ibf1Z6Mmz68O73av1suM6lkhBCM8RTpjtw305
 T5Nd3nT42HFbHdq/1aXWweaqnx9Is0r8jUHz9B2nrKhQSpmNfVITaZUfeaGdfVqRI4P/d
 YYDqECrUrRXQtkpYu5EC0ir+FPpUhw1QeHgoHuSi1Lf/Ziu1vnmrFI1qGL3voaml8Vp21
 8y4+ntH3h0ICLwew7eNWh0vpNQtf1BIhCB7EH4wzhTtGh2LLVMR9O9XjBghCT2biN3fT2
 /zWzMiA3yOk1miUAM2bcsk7mP0axwG4APsUxLyMA+9UcfBl9Or6K3gyCRbKOzzNMpSA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kernel.org;
 dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20260515 header.b=AYGfUqeG; 
 arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org;
 envelope-from=ehristev@kernel.org; receiver=<UNKNOWN> 
Received: from tor.source.kernel.org (tor.source.kernel.org
 [IPv6:2600:3c04:e001:324:0:1991:8:25])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15B2F40062
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 20:14:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A4D03601EF;
 Tue,  3 Nov 2026 20:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86D41F000C1;
 Tue,  3 Nov 2026 20:14:54 +0000 (UTC)
Date: Tue, 03 Nov 2026 22:14:46 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261103-b4-wpa-supp-driver-v1-1-3a9ba4cfc5ea@kernel.org>
X-B4-Tracking: v=1; b=H4sIALVA6moC/yXMQQ5EQBCF4atIracSjQiuIrNo3YWyoFOFmUTcX
 WP55eX9BygJk0KTHCC0s/IyR5hPAm6080DIPhqyNCuNSXPsCvwFi7qFgF54J8H6HnrrK2dLiMc
 g1PP/ibbf17p1E7n1LsF5XrgkjG92AAAA
X-Change-ID: 20261103-b4-wpa-supp-driver-91103fad8ca6
To: buildroot@buildroot.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1577; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=bsdV9RdBLMwo60Nwdu82hVu6WGqb76HDnj04RUnRU28=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGLJeOey2viy6T+s4D/+z7Qv+XCr5zrBw9obzB3aLcuidN
 b31xrx1TkcpC4MYF4OsmCJLtcm/WuH+He4nXS1VYOawMoEMYeDiFICJZHkzMmya1SJntefB1BWl
 mzazb9m2tkeCzWKeg2/H6ud2vp479e4xMrw1sDwgVqmv5LHeJiq3p/ip1e/8BzPvFCr1LzD1lt5
 kygcA
X-Developer-Key: i=ehristev@kernel.org; a=openpgp;
 fpr=AB184498D27A77B65D7852C81EB31E020EAC2FC8
Subject: [Buildroot] [PATCH] package/wpa_supplicant: add wpa-driver support
 in ifupdown.sh
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Eugen Hristev via buildroot <buildroot@buildroot.org>
Reply-To: Eugen Hristev <ehristev@kernel.org>
Cc: Eugen Hristev <ehristev@kernel.org>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For configuration files like :

auto intf
	wpa-conf /etc/wpa_supplicant.conf
	wpa-driver macsec_linux

the -D option that selects the wpa_supplicant driver is ignored
by the ifupdown script.

Implement the possibility to have the wpa_supplicant driver selected
by the script.

`wpa-driver` is documented in README.Debian, which is the original
source for the ifupdown.sh in Buildroot :
[ eed183e67e02 ("package/wpa_supplicant: adding ifupdown support") ]

Snippet from the README:

Choosing driver backend
=======================

Set the driver type in the interfaces(5) stanza for your device with the
'wpa-driver' option. For example:

iface eth0 inet dhcp
        wpa-driver wext
        . . . . . more options

If no wpa-driver configuration is supplied, the wext backend is used.

Assisted-by: Github Copilot
Signed-off-by: Eugen Hristev <ehristev@kernel.org>
---
 package/wpa_supplicant/ifupdown.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wpa_supplicant/ifupdown.sh b/package/wpa_supplicant/ifupdown.sh
index 569344b683d7..21b29188bc70 100755
--- a/package/wpa_supplicant/ifupdown.sh
+++ b/package/wpa_supplicant/ifupdown.sh
@@ -24,6 +24,10 @@ do_start () {
 		exit 1
 	fi
 	WPA_SUP_CONF="-c $IF_WPA_CONF"
+
+	if [ -n "$IF_WPA_DRIVER" ]; then
+		WPA_SUP_CONF="$WPA_SUP_CONF -D $IF_WPA_DRIVER"
+	fi
 }
 
 case "$MODE" in

---
base-commit: f03de2f6565bee2d53442d1a5358ec0fc400cf38
change-id: 20261103-b4-wpa-supp-driver-91103fad8ca6

Best regards,
--  
Eugen Hristev <ehristev@kernel.org>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
