Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123F9606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fuqePqkP
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6B8A81DEB;
	Fri, 30 Oct 2026 15:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vMIPtXXtXKjV; Fri, 30 Oct 2026 15:31:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BA3DC81DE3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374285;
	b=tQhTo8BxgZrIcOjAPTVeidRMG81eAYQLfdwBQWxv7eRZ2npM+LLj1arJtM4Vu9MATwwI
	 5HIqaZfQdkBo7XsREwNITt19dZn6LKOfQuSC73G2xieZVE89rJIwYnckpjEkS27TJ3KAS
	 xdl5uYZPY/So0Efj/n5RM77qpakrnCWEufekSBVOnnR98IbgNOLFF16f2OEHDLra+V/S5
	 KAaAJsHRrPtW3Qo/2EErmC8sKQZCxOeM+K9KeRlNdn09FuLAFQG62umyq61GvNtYRETGO
	 kf7fW3cwZcJ9QbQXkjlyJJAZibppds8cODAVkAQTJLnvTpqsSximAJH5ej1DEUCcbKw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374285;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uqGqw4G/2VnGtl2zo/SAwNyBFaoXZ6d37DCKscbYseE=;
	b=JtPinNilPf1L7DTnWWvIpYWj4pcBS+7ugx2tweu5y3qZPjzP3xCQ01nBxQLdz+4SRCpI
	 8ytEWcmlcvAAVs01BfziX271WoJ3NXrMfYAR3ZUuhbHTECAu6B1Nv0M9hn6ekzAc1ppp1
	 dMbvbbOSG0HXwYOtidHVe3/BqDeOdTIFxWZslqdVBJc/+Nv8nYLi1KOPWixq47SKKZliA
	 6lzisJOfimlRPp1vf++vy+7QANxpRNuwqH5fenHJ++2wxRkiAJMpBshcboZIeSLDs2Zi+
	 yUVNPSLHuJW8akDfEHTvUILw0DezHGWTqKRTcup7cstBqWLCin2/M4dSdHtdh2/7Pyw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374285;
	bh=uqGqw4G/2VnGtl2zo/SAwNyBFaoXZ6d37DCKscbYseE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fuqePqkPmNAcxnIPh57/loguNCC+Ljir9cAECBq0/Y1vQsiqwgCrhGSzA2Y6VwILK
	 jwwZZAkWttGZRLgkJVnZMCCpiqD3WnFmP1GkQ1Cl/P+SgRbJNOMZu0vns87WUfO4wi
	 GvdxJ88ryKwDILsskK+kYUGldvftXPkHJZluH3hQkxqeNUtgNL2hM8CeJQQAi6veZv
	 vgqVcsgQWZfnrlpUdTNT5BBgvUoSiv9xjV9HiyskPmCZJB0Y0exUdq3iRB11h4AKpJ
	 DcwYbbTPu/E0neApLBS8M+AS7Loq67cZcZwREMTPJWu1QyTSOTCwnt+JrIpjUoltf4
	 bi8vj0vxqtf+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA3DC81DE3;
	Fri, 30 Oct 2026 15:31:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D363F235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C508140530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTNzQUBb4CF3 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:30:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8A00140211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374220;
 b=WNClb1hUetuRGicFPA2WC9Rlh1/onICHsus1ccfYirlmrhnXgsFYgdIVkPWdq7rjupQ2
 tNKlTGbMkKlgp91DqDx8CD7vtpSeoy0Nxs+c94i4Ws9SBOqwGxMefRCJdFR51IAogrMfF
 Wnw8Cg9Du7fYYvBUA2S39L1DmZfL5nZ9422/LszdOYAyKjFfbYZe9nDp1wESAhEdum+7M
 MSEXTy6d7AfQqRwZyqaveuFP5aTRuJgcPisiNjazezx07oMSYaFxoU0BF7xTSqLL1/1rZ
 VUSZlyec/U8XutZr3jmuTqrj2ccX8t82kMrMKalCV+jPndFVhukHVvgLTTNwEe5012g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374220;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=bFPGZ4YmZwzMluXooVHFo6OObgiSpQkbVJigpcF2ZX0=;
 b=mu2e/+81huq7JZ9hd97IGw2gCdUfey4dB7VOuojfAJ4kjfy9WrkH+ITsee0/75yr33qB
 YFLWGwwUSTBu7NQthg4pEJTJy2lzlTbjZLceY3IHe7wCWCh4nZWhf2MIdGlW19Fo0kfEZ
 41prId2cGFNY69ujaf6EC5yFnMxtSissg5sH1tYAC5NZScrGs2/2iLE8M8V4e+ZQa2p/v
 KzGjZd72k0gqTKda35AQJ5nmlslZYTOE+EmnrJr+HW3xnyajWf8Jfy1rps67xUWQ5DyL7
 NCXSH0yT9MnOBQL/MHHtYbQScgb0uCqdKsdzWquylBcmLpvPf0sVsFngxAC+D4gAIhQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ceMrR8Qf; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A00140211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:19 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a1b07c3c5fso7551245e9.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374217; x=1793979017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bFPGZ4YmZwzMluXooVHFo6OObgiSpQkbVJigpcF2ZX0=;
 b=UoRWlWxZvu/gtZN4rM9iCnSmdNBKLyDKy55zg0PIO0fot7ihFZeZnydX7emDNQwiZl
 ad1+eaHAaKwT6in1SE2GjYw4+T1LWhUXIJrf5Z/USSob546gEqZG9As2vcEjOyVGuvu6
 ciBpFf54LjGBpqwUXEmBIsrs8eCHPTFnK6YgO0nfkP9SCtELQDLmK8y6vwA+jrlAygR6
 M5JcuB1ZAVZ6hmycpAgK9lNXTRk21N82UwdVzehoNaqQiM+Hn8KEWkhnVV05aYitnwZH
 grSQ47MV+jshACXBDx/1O1dlDYYler7L3eTQ/9SMrVD+xyhUqxRMo380FnGOf6Ulbxj4
 oCcA==
X-Gm-Message-State: AFq9FYKX8Ve2xNRmp5rvyrL9CoUaYwUfLzFIAIx06YINWI6B6Kjr9ubz
 ZFKnqO2hl3H00TmJA4wzGH4FiIZbceGtS/Qc/24HTKR5COg5FTxz+CD0i4y4TmyAsjv3MMBhsVg
 SHTamr/0=
X-Gm-Gg: AYBFou3OpGHh5VXOy0tAQJNO35Ck2rlJxkm2Ib1tdt5FgAuqrkletMqeu+UocicjZTt
 CKjiGLdQLZ5Kjtzqs7rkyoo64IF3UNaEazg1i7vvdkQawMbrH+MbSa2PqiH0PpR731e4XqZE7Jj
 kaWKYmRF+GrWovnsJDxV7P6AkKIFB8trINze6soOG5puaEyYHNDIDD7UhR/Bx6me83oh9tDFvGF
 Qd9MAg1KwALBnq/aQ44N0OOKhwwCrTv1KvYcdVkdMxqxe9VEDjK9KpKpuDcu3GAGTYgkEgnNGVa
 TGeE2UfTXXQIGdmZj+8b/zm3/K/Pfa8evYclwo2NyTZZfnQxKoagKw9FjXjDfsgPzSYzlKCUeXy
 Kwo+tMZSsxDyUk+s2pvDRczLUIkaQamky+wt+iYJ7+VJ7YqHzU07/qY1Z0gPAuhiXdm4Xt2r0hZ
 pArm4MdoLMMJo46Q7F4YLPegGgt6vxKI961d1RJ0hA8jNZ+vBeGfAUlRp5RiPkckZo+zsRu26Ku
 CIVaHxxYtcCuBFeBJAWtWPDCAuQRfG3sETGX60yZVxbZlvzCJ6wzmVBqGIBXNziqk8WwU3+MjDo
 lmA0PCTmHLmFD7dAESjzLl45c6R+cFJIlM07yH58GMMdA/TjyVMSiBCzCPcfVVQst6xIhhYrp1N
 vE4ISUlMxlHx1ZnD2wA==
X-Received: by 2002:a05:600c:470d:b0:4a7:9006:b176 with SMTP id
 5b1f17b1804b1-4ac17471285mr58449535e9.7.1793374217068; 
 Fri, 30 Oct 2026 08:30:17 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71bae25dsm3310224f8f.59.2026.10.30.08.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:30:16 -0700 (PDT)
To: buildroot@buildroot.org,
	Titouan Christophe <titouan.christophe@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:30:14 +0100
Message-ID: <20261030153016.1908392-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027133854.3175088-1-titouan.christophe@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/python-botocore: add
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
> botocore commit 0a6c7b6b3e794e865193dee23c68adfadb6b9c04, available from
> version 1.43.117 onward (see [1]), blacklists the roots that signed
> the compromised eMudhra intermediate CAs ([2]).
> 
> Since LTS & Stable versions are several versions behind, take this patch
> instead of bumping across (potentially breaking) versions.
> 
> (alternative to commit fd9c348c227e9560a45caaeaa2cb026a8cf8043d)
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Note: this patch applies to both 2025.02.x (LTS) and 2026.08.x (Stable)
> ---
>  ...-root-from-vendored-cert-bundle-3838.patch | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 package/python-botocore/0001-remove-comodo-aaa-root-from-vendored-cert-bundle-3838.patch
> 
> diff --git a/package/python-botocore/0001-remove-comodo-aaa-root-from-vendored-cert-bundle-3838.patch b/package/python-botocore/0001-remove-comodo-aaa-root-from-vendored-cert-bundle-3838.patch
> new file mode 100644
> index 0000000000..515257271f
> --- /dev/null
> +++ b/package/python-botocore/0001-remove-comodo-aaa-root-from-vendored-cert-bundle-3838.patch
> @@ -0,0 +1,57 @@
> +From: Shaan Majid <70789625+shaanmajid@users.noreply.github.com>
> +Date: Tue, 20 Oct 2026 14:51:25 -0700
> +Subject: Remove Comodo AAA root from vendored cert bundle (#3838)
> +
> +Eight eMudhra intermediate CAs whose private keys were compromised chain to AAA Certificate Services through Sectigo cross-signs (https://emudhra.we-have-a-problem.com/). Mozilla removed the root's TLS trust in 2025, and certifi dropped it in 2025.4.26. The bundle contains no emSign roots.
> +
> +---
> +Upstream: https://github.com/boto/botocore/commit/0a6c7b6b3e794e865193dee23c68adfadb6b9c04
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + botocore/cacert.pem | 33 ---------------------------------
> + 1 file changed, 33 deletions(-)
> +
> +diff --git a/botocore/cacert.pem b/botocore/cacert.pem
> +index 68d899399d..52ef539353 100644
> +--- a/botocore/cacert.pem
> ++++ b/botocore/cacert.pem
> +@@ -356,39 +356,6 @@ LBfQdCVp9/5rPJS+TUtBjE7ic9DjkCJzQ83z7+pzzkWKsKZJ/0x9nXGIxHYdkFsd
> + 398znM/jra6O1I7mT1GvFpLgXPYHDw==
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
> + # Issuer: CN=QuoVadis Root Certification Authority O=QuoVadis Limited OU=Root Certification Authority
> + # Subject: CN=QuoVadis Root Certification Authority O=QuoVadis Limited OU=Root Certification Authority
> + # Label: "QuoVadis Root CA"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
