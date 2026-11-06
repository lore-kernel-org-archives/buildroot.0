Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F02E606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JFfRiHoW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6610260B50;
	Fri,  6 Nov 2026 21:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNRcqPkZIAxa; Fri,  6 Nov 2026 21:17:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CFD7C60A6A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999855;
	b=XkorkRupgurH/99KjAvyA7N6Yyx7x4N1+cyeJwvjH9D1R07OBrgVej+6PyFOw8OhddL6
	 zEaUAGgYy4w52guzYbwJtluwaSe8+NHJRMIzwXor0AUjI+c6i013joXuZJWI1HXzQtV+T
	 sbHFYLUS16e+WwhnbsbzJA83wTqAW9roVu0QwL19vqVajvMi9jAmZH90tNc/g2Mgr6kK3
	 jslsyArGJLvbZG2HCoLu3BAzTrcYgj0fwwzqD/Kx9miyymNK8YCDOsmbxg21nbBFLBYoH
	 1pT0lXnGkhiC04zP+qPDmkTWvkLX2MnZFctilJtAsVq8wqgBrDYZeNTu1TF5aTGKGoQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999855;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=LMLc2otTdQ6AE67kmlUFwIo/CbVw1pRNN6xD7Eg19n8=;
	b=TdsMe7RREYZkajMG3eglGpdUbojC/KiA1Qk3KAyyTS3mvoflNdaaDWlKRiJIqF81B060
	 pTWseomu4FuZrobxJXxxUnVBZuxFj+/ikMssYCR4vQQL6PMFStgYML+HIxUiecqyJjAtQ
	 5SAX59YOVHmZMUvHGJylkV8N65ObG5IeeXfD94m8BeYDlYUljKpnxR52/awCP5UUoyPMK
	 ZqIsA2qwGyOZ2M4dbZu2QDnGzJfvvvQFuA07gVM8BJczNhFkHAIbKXkpfocpK8ozf3fPC
	 S+B46Oz0p+Nrr2Dc511XNpWadX1TK5F5C44BqXXB28kotHS3OqTbKWVFZTT5qhdZ0vw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999854;
	bh=LMLc2otTdQ6AE67kmlUFwIo/CbVw1pRNN6xD7Eg19n8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JFfRiHoW8evu9RakkJqFpAb9rP26GyGL0+kCT4SMPRbIH/9YC+tnIMw7Toaw+Wm+u
	 JIDpZITlEK1+9hlWSyWoUcnKr9/Eg+RhAGZtfUxAKW+EXpUbe+jGx2hACACsN4gWw/
	 Wb4IT1l15I+D6WMQWJ3WEQEGukEvOzjdShcTMr1813zODlz+MbOI6QyhrZu/BiAOFZ
	 /rQJ0UIEC6f7agLByAj8Li/2PrMXbQIdQV/zxOGQ1M9cGZgfJvL1nxChf5hcPRRjUd
	 CMo/7EIRU51IWoycaTbxOvlIyrcuWBFoxz5i3VSvUddcz5YE/HACKw7mAkcnCmO/kV
	 yo2+j0c20j5yA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFD7C60A6A;
	Fri,  6 Nov 2026 21:17:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BFB031F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5235C407E9
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xjlftw0cPnPj for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:17:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 38A83407E2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38A83407E2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:17:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B8FA313F86E;
 Fri,  6 Nov 2026 22:17:28 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:17:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:17:28 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Louis Aussedat <aussedat.louis@gmail.com>
In-Reply-To: <20261106191536.2120153-9-james.hilliard1@gmail.com>
References: <20261106191536.2120153-9-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <22b733d802d020423ca90af1f529a351@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-dnspython: security bump to
 version 2.9.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06/11/2026 20:14, James Hilliard wrote:
> Fix GHSA-vvf4-9x63-8xvv: parsing a WKS record with an out-of-range
> service number could consume excessive memory and CPU.
> 
> https://github.com/rthalley/dnspython/security/advisories/GHSA-vvf4-9x63-8xvv
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
