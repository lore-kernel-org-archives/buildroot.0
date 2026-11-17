Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E77606A31C
	for <buildroot@archiver.kernel.org>; Tue, 17 Nov 2026 16:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=U9+1fLzD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=gnROB1UZ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 878E660774;
	Tue, 17 Nov 2026 16:34:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T3-hbRkmEn6L; Tue, 17 Nov 2026 16:34:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C7E236075F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794933266;
	b=reM/ic0enV3bQ4xvOdohcbLCfo8WjLjAWftQBugYxHzClywjdF2kSy6vHpO6f9VCM89K
	 Vc2Ws1T7ySwF4LN9hN5upmevbIISfJMjwDIlbLpL1F+vchlslfpgeHS/ifx8HvuPHSjpW
	 XDFx9CCLAxqzQ2EV24Min6TIJ3cYblym2V2Y/Meptiw4pihrxzjYK/mymLi+Q61u/+1Wx
	 R6c7wJK586FmZg/SZ3sphvrvK3Ht445/2R5Md/GNzu5/SI8TPlms47jC1CuWr/n8wQaOT
	 JAEbhzaVt8OyWnqkN8QKfirqVxHl99p4gvMD4mF5SNSgCLusa7PS0RV3hVdQ2vSwOTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794933266;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3mZNzbvjKeWNFBZmIQl6Bqy1DPWuk6wXH8CzPbULiGU=;
	b=WaeTqpL0FsfIb44Sk8OgqMlEnhMUy2+TDwnLwPCeRsJeeWmMktM/345iGg+wS3AFPjbm
	 S0YhYv8WbWtv0dNiNrN555d1/qTL7Vw1/ucCr/SO4UAck0X8xQf502lVT7e8CEu4k/ty0
	 YzGHk3DVwIFsqIlbg8XpstFhUnWHPt1GADOd7yGXzKxd6pf/Lo3d9AxqT61st9gLbkNBs
	 Y3cjgjD3QXgJkjzF+MuUdfGdBejCt7++tmHPbbahaghylJ7OEApxirLJhETU6+kJXvtUG
	 u3y83tRaN1Qn1MTvpHS9r/dVLyXDS1QDNpvBHH4VQL4xhYif1d1SW3fyvTP+ynBqhhw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=gnROB1UZ;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794933266;
	bh=3mZNzbvjKeWNFBZmIQl6Bqy1DPWuk6wXH8CzPbULiGU=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U9+1fLzDFR8G0GWf8dIylWNQPyHMZE18mtD7gw3nZETEmQc5lOzlJMVcZQCyxcxSb
	 E6GXnw4MqnH0FIao3g6e7QYoD0NDs/EVSUTiZhs6POZXRlU86opwqT3KiU8zPmr68O
	 vCwpOSy3ZKuMp18CD9PcZ8UGhIbpOs2WQrTg+P59Rdycor9RSUqp9FoH2sUKtjniNG
	 U2N9X6Gm8mgQxYqXIXPVrY48r46C1/zmOUbs516TnhjCg1SdR1ioJyYEXjj7rJ73Jl
	 PYWBsnloyOxnC1zZvYNmouHh2L+nEw72nTtOllX/SV/mIPa55/2d3NYW1E5Yzg2z5P
	 5d/BW1xfE2Bpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7E236075F;
	Tue, 17 Nov 2026 16:34:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FE03105
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 16:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 360BD6075F
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 16:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DZaG7NxgheRU for <buildroot@buildroot.org>;
 Tue, 17 Nov 2026 16:34:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 358C8605EC
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=gnROB1UZ
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 358C8605EC
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 16:34:22 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=gnROB1UZQyu8p2fDNaCkPOhNMRfR/zLfXXku7j7DYC2/poVdKVp+D7ewTDz0xZpnPDP0HcD4AW5C+7zwjLr5gUmATCKQJqZPfCpxxCAM0OyyjEz4s9wJcmgnbUNWTP0nQ0iyt8WFxM+LlebU0qoRXlTCSGD2mvPWm5TkWEFV/t/uP/kef3z+cAXZKyYKDXmwmdbHKX9aANukhodEvTOKi1C5IaKb5gj0gcJwpN7InZmoLh7qXTf7uDuSBItpMV+hUlPjwB5Iv5vi+hhmIFtzFXkaQ4fD7PwLCC1IySDubHlV0NlUdXTPD+yVlUMSnII5DCn8CqEF057pj4pRpOJ32Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=dpnhDlaoiqyZtuwXdt9VuuMvBRljArc+qOQ/xM/K2Ic=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1017199381; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 17 Nov 2026 16:34:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xTM8P-00000001AhR-2oOw;
 Tue, 17 Nov 2026 17:34:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
Cc: <buildroot@buildroot.org>,  <arnout@rnout.be>,
 <luca.ceresoli@bootlin.com>,  <thomas.petazzoni@bootlin.com>,
 <michal.simek@amd.com>,  <ju.o@free.fr>,  <brandon.maier@collins.com>,
 <romain.naour@smile.fr>,  <romain.naour@gmail.com>,
 <ibai.erkiaga-elorza@amd.com>
In-Reply-To: <20261116142632.1699007-1-neal.frager@amd.com> (Neal Frager's
 message of "Mon, 16 Nov 2026 14:26:24 +0000")
References: <20261116142632.1699007-1-neal.frager@amd.com>
Date: Tue, 17 Nov 2026 17:34:17 +0100
Message-ID: <87h5hf4dti.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/9] board/xilinx: add xilinx_v2026.2
 hashes
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > Add hashes for the Xilinx vendor repo xilinx_v2026.2 release tag.
 > Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed series to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
