Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98626606A31C
	for <buildroot@archiver.kernel.org>; Sat, 28 Nov 2026 14:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IJBXprd9
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5392A40612;
	Sat, 28 Nov 2026 14:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q46eb1aVpvHX; Sat, 28 Nov 2026 14:18:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 878B740613
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795875484;
	b=AYxaTn52wS0rzoNYfpTaDHTd/636emyKwonJnXdLwyHpaiROF/1BDoZ4h0X1e/knrd6J
	 ahAPVdP6YSqbKGqFn6ggyObIkotLXD99fS+HCSP6QY6TjwfaLnr6Cg8dukiRWo/q2r0mg
	 NNrxtVoCHRUwsN0vd+XmWIS+d6dzMaMEEE/KMj5uz3UsrKTvAFjsMp8p+S37r1mpkbCiH
	 oCWjEvFf3R4nmgN4Qtr9C9bGqlD1RzGthw0Xa0eBwHxqb7dDad5ijPg8qv4L2GOr9hSXP
	 sio2KMeo0knhintvauKm1hT1+Dm8AERJa4EN00NabBccJtmN6aTCsYMoXKw8a3CKqpA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795875484;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=lI+6zjggERkZCM3edzr+uNQAvAkTCcaWsi0QtPBhEtc=;
	b=lD4iOKqyYCrN3lXLNkTwZRHgMjJ8HA9ZmdYS4iEw6pRKGLmZMeTbgT0XAEP9pJ34mLXz
	 zP1FW78v8k6EwVepO9BT2jzaJPZRb5mUITR5mK5Ln3L/o/W/55viAw2YhoDvI5hzaUNot
	 q2FKjCZOoe+Ib2GATyxh5F5N3I67BzWSRLj9K03sKH+yubVFnKsDu2FTRICSEn7j9MmBm
	 ZUrDzupaGXetdIStqC/eieT4FNhh83eYDc7QcK82N2MBJCM1WAxinCBqcwvc/9lZS//h/
	 yQEsWrDt+q0YNmuc6CK9kJfnTTuO8YbOTeLFd4Z1KYLYDJxEwt9AMbwmqqYF1HZ6mTg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795875484;
	bh=lI+6zjggERkZCM3edzr+uNQAvAkTCcaWsi0QtPBhEtc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IJBXprd9DJP3OT/EZrgcKLizZsRRJ40h845UkUlVkWDX8Qt5WcqtAUo57gbQpEdDK
	 ZNlmhq29ozHgJlIY/YYYfQ6ZunTNQK+ca0ZIub6FKBTDEeOU3v60nj9IdU060DfWQr
	 nV7gZWZgQWlhjNhhiyO0Jla2xZuAxo3cvM1R6zkbWj61z5tGBtgskO3jLzS5H4Ppqy
	 4AE9JWK/LMk2LqGsKFHp7U1uIWNWrD+k8DkVeqT8Hc4xn03d4TkJBCapPh2jJblolG
	 eX05MGLqpLfPIJy8COv0c3gSXr+aPfNP7qc0tw1Wsn+ffw0ADESC06aFIzS5LVcYQs
	 Hds9MmQ+0qwag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 878B740613;
	Sat, 28 Nov 2026 14:18:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F1D0266
 for <buildroot@buildroot.org>; Sat, 28 Nov 2026 14:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6536440613
 for <buildroot@buildroot.org>; Sat, 28 Nov 2026 14:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5w_fUTSJVrS for <buildroot@buildroot.org>;
 Sat, 28 Nov 2026 14:18:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 600D340612
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 600D340612
 for <buildroot@buildroot.org>; Sat, 28 Nov 2026 14:17:59 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id AF4352C84DDA;
 Sat, 28 Nov 2026 15:17:56 +0100 (CET)
Message-ID: <f063a68f-6c2f-470a-b9ce-bc06cef8c937@bubu1.eu>
Date: Sat, 28 Nov 2026 15:17:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
References: <20261123212022.3748880-1-angelo.compagnucci@gmail.com>
 <20261123220017.3955658-1-angelo.compagnucci@gmail.com>
Content-Language: en-US
In-Reply-To: <20261123220017.3955658-1-angelo.compagnucci@gmail.com>
Subject: Re: [Buildroot] [PATCH v3 1/4] package/qt6: drop hashes of removed
 license files
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/23/26 23:00, Angelo Compagnucci wrote:
> qt6mqtt, qt6opcua and qt6websockets have a hash for
> LICENSES/Qt-GPL-exception-1.0.txt. Upstream removed this file from
> these modules:
> 
> - qtwebsockets: in 6.8.1;
> - qtmqtt and qtopcua: in 6.8.2.
> 
> None of these packages lists the file in its _LICENSE_FILES, so the
> hash is never checked. Drop it.
> 
> On 2025.02.x, the qtmqtt and qtopcua hashes went stale with the bump
> to 6.8.4, which is only on that branch.
> 
> Backport to: 2025.02.x, 2026.08.x
> 
> Fixes: ecea4d94ac676ae9e66ce3e8799c0ba7dc14cc96 ("package/qt6: bump version to 6.8.1")
> Fixes: 5ae304d96cb7c4df040ba1bdfedfb09b3d5a3417 ("package/qt6: bump version to 6.9.1")
> Fixes: 1ef39b9196e0a5979581187f15fd665ca390c2a0 ("package/qt6: bump version to 6.8.4")
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
Series applied to master, thanks!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
