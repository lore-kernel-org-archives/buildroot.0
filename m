Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2100606A9A1
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dZ6AEn8K
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0D0460ABE;
	Fri,  6 Nov 2026 16:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rsZ6ddjkUtz3; Fri,  6 Nov 2026 16:11:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B593C60AC3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981511;
	b=iNR+OI90jZXpGLKjVVI+Gmt0n2kOxmS4QoLjUhu/iw+Kn3jKN1ats9zfSAKQK/TCrhDF
	 JXjBLftvOpPUgNgy3E1TKsZL/gBxyS8ptR/6eBqA4zOdpus7vH5XiXjvNS0FbejiH5NwO
	 yWee1l92sXSEs1rLcfqXWNr89c6i15OwUqPTFIJ57TuzM/0SWF28G0xuOb0ANPbQYDTty
	 wKZ9gmhBQXxaPTtBmO9GeILIZzO10xeVFnArVJxHum+rmeucRrorgICY5JP+HXPnrxXHl
	 448XC2oMc3NGA117UXudN3NnqlPG4l1zrxu+H9Hp6cwC591w3oygilAY4r5aRe26M4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981511;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=w9qmDW8g/AStQr9jORlgYA8avQ26a6oKX96ZzT9zZ08=;
	b=KcTAPMp7qlb5yDSJ8UezDAoompTSUcfsbueeP12gKbf+J1SZ3waOdlP/7fSUcOb7HPbg
	 xItFcbHzEILhJjE5yq4iRxJVBI1O9adkHw4EZBO7DWS2ze3zKykJ4fPn/dmlbLP16o4gH
	 fP2CTLWlLvkJD9NLz452I+tbRIpstRdceihn2cywGMZ4Ur/ZESxLjg1cIVlnap75dDnjm
	 CEdDi6wbUZVyDVr7xbG0OBNXYLwOsVmPUaoY0N75MopETeg2NK/gqawet+NXNOeEICyZe
	 EIxMVhItdycUSa9Lxko3fS/45hKuQiEGBmNKkk42NF/1yVxrgWttXu7BeIq5Tx8BYXw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981511;
	bh=w9qmDW8g/AStQr9jORlgYA8avQ26a6oKX96ZzT9zZ08=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dZ6AEn8K3F90Ma+uvokw3NbqnV8lZwKAWU8rvtc/dz+sQ0nl+rUWyBzKEBwQr1+2z
	 AT/RbPoV7yratqh1ebVvAllWkfGim4ubxNDkcYf8Xq2oOMYUI48gg1/TowoUkMR5Ay
	 Gj08ZRsTe3f6JXVnkihXWYkayRdEZDOtCyUM6tKLfYxyTwj7Xfpx0raKv4ag+XQLgK
	 8dc1iNqjIJ0dflzDE8NDrig+3tXiGy5qTDmMqXpAQjURDOQKjdEbK3F6uQvvPs8T57
	 hdW7QsyDjAM/H7oO0fsMvrX+wV8+qfrQ0h5imL0m6GdgHh15LkhLbRNT4CVntQIsdI
	 bae4AEkvoJIzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B593C60AC3;
	Fri,  6 Nov 2026 16:11:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D5942E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23B9C403CB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j6zsffvXcC7t for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:11:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CBBE7400AF
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBBE7400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:47 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a59100fa83so7193225e9.0
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:11:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981505; x=1794586305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=e1771QHlvQm4KpF5q9i43ubQvL2h1ezf/uyf2JDETOs=;
 b=JG8p1/b1HfHCzyPDmT2qUqSlfkvc8DCZOb3zXMeiHr8RB9TSRjG1AhaVDNFzBgcm/G
 GYkyUZLDDZFvAj03uDQImASJlqIh8EMtD0R8+QDsvdOOfQ81DNBfMLY4gw9yA1ArQx/x
 C/fKBeasZlzXHAaq+H/cbE68I7HVl5OCchyKqGvlm1ZoLw/V/n+8CoRW7YXgq+dx9njY
 kYmbup5bWNBlwEwMN/sfiOAT8eL2A/TvSJnPAj29Xl9cXUiUmNAUK67fq7q+7eJpA0Bu
 HVztz9s5HqOLYKuIE9b4tfvlLGobn6egkHkF/CkVl0hmqHFs2g+iTADi1ttO8FY5rMwy
 vbNw==
X-Gm-Message-State: APuU4Z/XHuLXHQ3jt969t8mK/McbAiCaig2IM0uZYEeCxEY/5t18ZEz7
 KAVg0cJE3khDz+ejY5ZjtF7dpOGBCpfXasrNwz8mgqHnpwpbQ7LTetLVKc6UDI42T5lDqb4VFiw
 56+J3lzQ=
X-Gm-Gg: AYBFou3Gr843csJOLUvaxF8RlTD5jz3uK2KOznOp/2HcmOULpeEM1Tg6XWO2zNsSkb6
 FhnU8uYftXqFdDQdG9T1vH26Yk/2exXclafnH10SbQYdbNphHnbTPg+c0T3bJjgsBpzVg8rqRk/
 NVCU6TnyfXvzYixcDr4P7iAUrLYSQV7GwnRK5/+Ar/ORVCK+A9ClQwWbwDMSFk90XN74QKeaqjE
 WxVViEpC7wtImGsDATHANc1aqCQF6M9nLx1C9eZVVzcrgM4TwDXEP8Llcyl44AX9lcjXtBUM9up
 mpYGGWocc8gGuZ2UE0ynF3vis4SZPw0SMoCpKHiiKAeHHUSFxljBqrKr48fWE1aangFUCLphoVy
 ir4Y06z6SQPBcfs64OUTGkXzcKtTIyxBsDrbYSTFB5+PMqolk8jJK7AZyC2aLUJlHZunIufmOSJ
 2gS0h9NCEZhwNgzurRYtwHrkgaweUaEp4YwLy7yhZ799EqKc0SSDUTLLKvJiib/o2pqnT/QeD8t
 168pt3MzJ7exxjjbH7EoOZmxCgAgX2UiFAxZVeUdfgep4ErYln6sDv6cEeLY74kVhdY7TSszwLV
 OdCezOoZMJbsTQJHQgTxLFH6WjFb28o=
X-Received: by 2002:a05:600c:4583:b0:4a4:3a2d:15da with SMTP id
 5b1f17b1804b1-4b6df4f2484mr51757655e9.15.1793981505665; 
 Fri, 06 Nov 2026 08:11:45 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b6e1b5d745sm64115285e9.6.2026.11.06.08.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:11:43 -0800 (PST)
To: buildroot@buildroot.org,
	Titouan Christophe <titouan.christophe@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:11:40 +0100
Message-ID: <20261106161142.608231-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103112020.1072321-1-titouan.christophe@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/python-httplib2: add
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> (alternative to commit 006269e93297e1a4009553526b158c6287aad805)
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...odo-aaa-certificate-services-root-ca.patch | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 package/python-httplib2/0001-cacerts-remove-distrusted-comodo-aaa-certificate-services-root-ca.patch
> 
> diff --git a/package/python-httplib2/0001-cacerts-remove-distrusted-comodo-aaa-certificate-services-root-ca.patch b/package/python-httplib2/0001-cacerts-remove-distrusted-comodo-aaa-certificate-services-root-ca.patch
> new file mode 100644
> index 0000000000..f4728f810e
> --- /dev/null
> +++ b/package/python-httplib2/0001-cacerts-remove-distrusted-comodo-aaa-certificate-services-root-ca.patch
> @@ -0,0 +1,65 @@
> +From: Kirill Logachev <kirl@google.com>
> +Date: Wed, 21 Oct 2026 05:15:52 +0000
> +Subject: cacerts: remove distrusted Comodo AAA Certificate Services root CA
> +
> +Remove the Comodo "AAA Certificate Services" root certificate (SHA-256: d7:a7:a0:fb:5d:7e:27:31:d7:71:e9:48:4e:bc:de:f7:1d:5f:0c:3e:0a:29:48:78:2b:c8:3e:e0:ea:69:9e:f4) from httplib2/cacerts.txt.
> +
> +Six eMudhra (emSign) intermediate TLS CA private keys were compromised and are trivially reconstructable by third parties. Because the legacy Comodo "AAA Certificate Services" root CA cross-signs the affected emSign Root TLS CA - G3 hierarchy, TLS clients that do not enforce browser CRLSet/OneCRL revocations remain vulnerable to MITM attacks if they continue to trust this root certificate. Major root programs and CA bundles (including Mozilla NSS and certifi 2026.10.19) have removed trust in this root certificate.
> +
> +References:
> +- https://bugzilla.mozilla.org/show_bug.cgi?id=2083449
> +- https://emudhra.we-have-a-problem.com/
> +- https://github.com/certifi/python-certifi/pull/440
> +
> +---
> +Upstream: https://github.com/httplib2/httplib2/commit/5fee2b095f49a6ad5e1f0a185d909c89199e4dc9
> +[Titouan: add python3/ prefix to file path]
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + python3/httplib2/cacerts.txt | 33 ---------------------------------
> + 1 file changed, 33 deletions(-)
> +
> +diff --git a/python3/httplib2/cacerts.txt b/python3/httplib2/cacerts.txt
> +index 78a444c..e80059b 100644
> +--- a/python3/httplib2/cacerts.txt
> ++++ b/python3/httplib2/cacerts.txt
> +@@ -875,39 +875,6 @@ Zvqz2cK6Kb6aSDiCmfS/O0oxGfm/jiEzFMpPVF/7zvuPcX/9XhmgD0uRuMRUvAaw
> + RY8mkaKO/qk=
> + -----END CERTIFICATE-----
> +
> +-# Issuer: CN=AAA Certificate Services O=Comodo CA Limited
> +-# Subject: CN=AAA Certificate Services O=Comodo CA Limited
> +-# Label: "Comodo AAA Services root"
> +-# Serial: 1
> +-# MD5 Fingerprint: 49:79:04:b0:eb:87:19:ac:47:b0:bc:11:51:9b:74:d0
> +-# SHA1 Fingerprint: d1:eb:23:a4:6d:17:d6:8f:d9:25:64:c2:f1:f1:60:17:64:d8:e3:49
> +-# SHA256 Fingerprint: d7:a7:a0:fb:5d:7e:27:31:d7:71:e9:48:4e:bc:de:f7:1d:5f:0c:3e:0a:29:48:78:2b:c8:3e:e0:ea:69:9e:f4
> +------BEGIN CERTIFICATE-----
> +-MIIEMjCCAxqgAwIBAgIBATANBgkqhkiG9w0BAQUFADB7MQswCQYDVQQGEwJHQjEb
> +-MBkGA1UECAwSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHDAdTYWxmb3JkMRow
> +-GAYDVQQKDBFDb21vZG8gQ0EgTGltaXRlZDEhMB8GA1UEAwwYQUFBIENlcnRpZmlj
> +-YXRlIFNlcnZpY2VzMB4XDTA0MDEwMTAwMDAwMFoXDTI4MTIzMTIzNTk1OVowezEL
> +-MAkGA1UEBhMCR0IxGzAZBgNVBAgMEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
> +-BwwHU2FsZm9yZDEaMBgGA1UECgwRQ29tb2RvIENBIExpbWl0ZWQxITAfBgNVBAMM
> +-GEFBQSBDZXJ0aWZpY2F0ZSBTZXJ2aWNlczCCASIwDQYJKoZIhvcNAQEBBQADggEP
> +-ADCCAQoCggEBAL5AnfRu4ep2hxxNRUSOvkbIgwadwSr+GB+O5AL686tdUIoWMQua
> +-BtDFcCLNSS1UY8y2bmhGC1Pqy0wkwLxyTurxFa70VJoSCsN6sjNg4tqJVfMiWPPe
> +-3M/vg4aijJRPn2jymJBGhCfHdr/jzDUsi14HZGWCwEiwqJH5YZ92IFCokcdmtet4
> +-YgNW8IoaE+oxox6gmf049vYnMlhvB/VruPsUK6+3qszWY19zjNoFmag4qMsXeDZR
> +-rOme9Hg6jc8P2ULimAyrL58OAd7vn5lJ8S3frHRNG5i1R8XlKdH5kBjHYpy+g8cm
> +-ez6KJcfA3Z3mNWgQIJ2P2N7Sw4ScDV7oL8kCAwEAAaOBwDCBvTAdBgNVHQ4EFgQU
> +-oBEKIz6W8Qfs4q8p74Klf9AwpLQwDgYDVR0PAQH/BAQDAgEGMA8GA1UdEwEB/wQF
> +-MAMBAf8wewYDVR0fBHQwcjA4oDagNIYyaHR0cDovL2NybC5jb21vZG9jYS5jb20v
> +-QUFBQ2VydGlmaWNhdGVTZXJ2aWNlcy5jcmwwNqA0oDKGMGh0dHA6Ly9jcmwuY29t
> +-b2RvLm5ldC9BQUFDZXJ0aWZpY2F0ZVNlcnZpY2VzLmNybDANBgkqhkiG9w0BAQUF
> +-AAOCAQEACFb8AvCb6P+k+tZ7xkSAzk/ExfYAWMymtrwUSWgEdujm7l3sAg9g1o1Q
> +-GE8mTgHj5rCl7r+8dFRBv/38ErjHT1r0iWAFf2C3BUrz9vHCv8S5dIa2LX1rzNLz
> +-Rt0vxuBqw8M0Ayx9lt1awg6nCpnBBYurDC/zXDrPbDdVCYfeU0BsWO/8tqtlbgT2
> +-G9w84FoVxp7Z8VlIMCFlA2zs6SFz7JsDoeA3raAVGI/6ugLOpyypEBMs1OUIJqsi
> +-l2D4kF501KKaU73yqWjgom7C12yxow+ev+to51byrvLjKzg6CYG1a4XXvi3tPxq3
> +-smPi9WIsgtRqAEFQ8TmDn5XpNpaYbg==
> +------END CERTIFICATE-----
> +-
> + # Issuer: CN=Secure Certificate Services O=Comodo CA Limited
> + # Subject: CN=Secure Certificate Services O=Comodo CA Limited
> + # Label: "Comodo Secure Services root"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
