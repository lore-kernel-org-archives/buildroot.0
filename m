Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FAD606A32C
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qs5vJRUZ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BE0581F02;
	Fri,  6 Nov 2026 16:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FrCp5e1TwlSt; Fri,  6 Nov 2026 16:11:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6352181EEC
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981506;
	b=PlwFFStARJo1mcFCO1LquHVH52AOXZhgXWE6M8lhQc5LD3Dir5J1Jps2D0MeT5Ukx2bg
	 Fg0zGdiEfMvxyXaivogm8a40xjxOh4b5Nxh9GKFjMgJrtqqaDowTVP+HMHt9U163Kn4WR
	 fRUgmqq1cQG3Tjjhj4QeBqUXRf/529YTwzQYA8xI3eFrx8bCmxX7k8rvRprljpGRBjDp/
	 eplwM3rS2L4we1eH4NGUVF65YCvrH724c4ROnIra0MkqOwBrM3fmT8GYWuPAyqYVEh2uY
	 G8vc951sspRStKYZXJWmXYmNbqPJhqHICKQYh9xYG/7q/f5VI4EQ5TLy8nArKoPuijA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981506;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dRgpAOVXvpc6EkNLXs6+BEfTXjwcW6YsAM30qBuBH9s=;
	b=BETbXSNgdb6MhazWBgUu+GX06vZfHkbyxFz77dH5lltiOV7M0/XJ1BDrnlqwt4afVVVo
	 abs3D2Iv2+JjW7N/qE0p5tF0Euti71sjYY+s0uJXOqiZ0Von21horyKegSE/tzBgoBIkS
	 P1VQd9WiTKPUiZTR4zvESQ3m9PCu6agspVZ7dxDgsxDLG6qGhbcxgic0Z64oOOcgkwFqP
	 wpR39c43Au6OiC6wfUv88UEXHj1UqwbYgqeKCRe+gvib3UGM4emEyaN5dIHrhdNAjw7qE
	 cHpk2QJceUmccT2afuX/rXeCVjFsRH8IbwOS/rPsJRNwumyuTpIceOBKunyKxrXfL3w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981506;
	bh=dRgpAOVXvpc6EkNLXs6+BEfTXjwcW6YsAM30qBuBH9s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qs5vJRUZiYc9qeOSaEvN3fVjJBxT9ShJAf6bFlUuOtqR+1vEwJkBtJEZueK4nXY7M
	 508FF3sUQ0MuV6o/Kxn6+/0EaknnVMwMQvRquW7+aa+4tlmbqxRaRE6SsJ+6rEzErw
	 /mD5pt0oN+eR3YkooVpZz+pDvP0S/NTcmLBgx+RhxHOmzNMx7hnXO4p7tYUjwWmGXD
	 pGndzrluAnIl/Cnz/S0V0iQMLXW5XDvRsxZA+6ltqyfaaWV21Onw6QxmFrO1GxMMzi
	 2cOi2W96ripxH1+kBZAzGmuPPWuHpU/W8cuHD/dWlCZFvxZApWunQ2C0OyD/frdBtJ
	 DGFnVerbv8u5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6352181EEC;
	Fri,  6 Nov 2026 16:11:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6EB14B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C301D403CB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgwrGkUSTfDs for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:11:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7A5E0400AF
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A5E0400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:42 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48e10a70540so565191f8f.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:11:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981500; x=1794586300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8yLI+MdkkI8CHnAOm/BkPGrp4AiIyrrfqwCg/UO4pCw=;
 b=CHCA9WiNglVjDS13v2nSDxLdy4yZ1tL+8BO69CDclsuCUBQKkjEestMVZFCot4I4SY
 fH1DchkMdseK86F0N7KLm5f5z3wJlAmBnzBNYLHaWnQ3KU3F3PksQ/A6BwxUdrxFoBHE
 vIUnNN5iEiZAQhg48MOkOnOrCRhjRFjC7eBEQLuXNhEudc2T6YTELEqQPTBR06ozh3xS
 Zt7wItxznRvaN60VQaiw/fQGQle1oj3mCW6pnCo0/VGpKFRew+2pEZoydO4uhgaPnqeO
 Xe8sqJYiu/LbkBu1tWGIbb55Ppk9S7io2mEPA9ccrzphoewUrmOYlvkCVilbq2iYHvEb
 IPvw==
X-Gm-Message-State: APuU4Z9/KyFatqVDY+dhWCGkRFywmz/d6bJOdhsQiw+TcXvKvhHj2hWq
 bX1lInxll2F8paHmqtaZl6Nn0rw/Z/sA9LL2dQadnA7z4F4lkNCvD3uBM2cJxkJk3s3mmRVzFq9
 IEBKbRqI=
X-Gm-Gg: AYBFou3f+LQlvdsfwaTHTmRHnkM9OP36EcEk8RQ3sOirxQbs6Xou8afgVV1hInbTjGF
 sRHuIqpMp0Sy6cW9qMExGUSP1fKuQVP95OYRbjf/v1kIW/FPFsTDg2NgVMaTEMp7NlYT1Z2l78b
 lrdI4z3nA0046t0g4vUcy8N0lWfuYih9ZmTliQH7EOG4GqPzNrepZvWejZJ5IMmSr7DhXw8dWEG
 NDkTegjOmsmL1ziB5/zO+ecnoC2SjWIn0KyRDz0dM4GG9kljgjd4ivujh8sjSAXHghtKl0NBgtb
 IG64+ycWZCYYFucXlzprxitpysbgOc1n8o7YsQsnMpZj4p8dwSQTq45tod88BW7mbDR+iCNJpXF
 vwNgLtX95QqaQXifcLARgWXc923A0i+mB6DWWNh2dHPpM0D1VP1MpnfPFqhWyh7Lsg+SwS9b0vi
 aOBe6f9oGYF45NrG242pAR7QEHyo15okDR3tp4D8nsRCY07vUJwTq6LZQPpiB+YyJ0jblP/808Q
 s/NnxGUQhAszynSCMbfYZT3wfLciQpWi3jtp06GJ2fTGFcMOWKXTkVRS+vy1vq+AfCFONvY+1ud
 zUgagMQYRv6pbGWTFgMuofaK90oHEKM=
X-Received: by 2002:a05:6000:29da:b0:48e:66d0:664c with SMTP id
 ffacd0b85a97d-492762c5490mr4750676f8f.15.1793981500385; 
 Fri, 06 Nov 2026 08:11:40 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d6d63b79sm4449225f8f.20.2026.11.06.08.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:11:39 -0800 (PST)
To: buildroot@buildroot.org,
	Titouan Christophe <titouan.christophe@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:11:37 +0100
Message-ID: <20261106161138.608200-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103111721.1068467-1-titouan.christophe@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for 2026.08.x] package/python-httplib2: add
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> (alternative to commit 006269e93297e1a4009553526b158c6287aad805)
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2026.08.x. Thanks

> ---
>  ...odo-aaa-certificate-services-root-ca.patch | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 package/python-httplib2/0001-cacerts-remove-distrusted-comodo-aaa-certificate-services-root-ca.patch
> 
> diff --git a/package/python-httplib2/0001-cacerts-remove-distrusted-comodo-aaa-certificate-services-root-ca.patch b/package/python-httplib2/0001-cacerts-remove-distrusted-comodo-aaa-certificate-services-root-ca.patch
> new file mode 100644
> index 0000000000..c7d93df543
> --- /dev/null
> +++ b/package/python-httplib2/0001-cacerts-remove-distrusted-comodo-aaa-certificate-services-root-ca.patch
> @@ -0,0 +1,64 @@
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
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + httplib2/cacerts.txt | 33 ---------------------------------
> + 1 file changed, 33 deletions(-)
> +
> +diff --git a/httplib2/cacerts.txt b/httplib2/cacerts.txt
> +index 78a444c..e80059b 100644
> +--- a/httplib2/cacerts.txt
> ++++ b/httplib2/cacerts.txt
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
