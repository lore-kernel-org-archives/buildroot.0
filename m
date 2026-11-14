Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6AC606A323
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 09:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SDUIBWo1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=PnbVfeKg
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BFA760679;
	Sat, 14 Nov 2026 09:43:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n60gTGwXKuxl; Sat, 14 Nov 2026 09:43:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E45116069C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794649421;
	b=CSecz36pqHpUE19HEkyVRQNw/Ssv02uUTyXcyhfIYogHkfmsYfDAgVWqi/nyFcP95Pcp
	 YjPJlby0mD/EsQPExxTYTDAEEhAHhzgUSUnHYCTaxOxc/8RsBptF+PKAXSZCd2aVcgoUP
	 xlYAuoKx7LzRE11r404SE62b9nLJHRKUISUKYFdhBwEZvqLnHoApZwQaFxgy0goCcB3Xh
	 3Nwv428fHIa4MabZMztjLtal+H/Id6yiZh4qkDxHiv6avcncbrOMmKIXfx9SiGLoW5i9X
	 2Lpv/WlnIMheITJCOMJmpKsPv6UU/VGRImijmrnLHTuXxBy3CwKOaV15aHz31ouUBmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794649421;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FkktxuZYLPediBNKOEM+M+vyo6RzqJbWKnZDmvj69zs=;
	b=g2w3M1HkwVxHT46+5cQICJUUvW6tuVfHsGyfVaNiQRhOXG8qRYtQYn1M4mCkHFJ0Yamc
	 JysgVS8GB9O3MRP9k76f9iifbviD/dFF7OVCrurgCtiS+rnwSnosGvsOjSCLNx7p/Pst7
	 OkmWn1SDTne20yu6AaOLK6wFkD6ggVk+VMySgqRIqEI7faSntvaLdQEfnSHDh9fO29zZ6
	 w00gsh4ZIsIX/dGnoZq1aUFxAhMXTsuSEuTvJgxM9FqSTjkFTqbUQS+PnN0LN8Mj9Jhie
	 WravRDLMsdk9dhVdcFeRpChlZqDlf7wIKSE0yV/cLZw48HrbuIccNlV+S73aBYnz3Bg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794649421;
	bh=FkktxuZYLPediBNKOEM+M+vyo6RzqJbWKnZDmvj69zs=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SDUIBWo1HdtJXZ9LS30Wrfdw+uGp7q3nyUKGsTjXmXzBXvZJQykLwK6M7+ObSGs4W
	 N+7YFecrXuw+1InhckRe1GywLYz9SzwRS5URw4GfzI7lL+z3e0i/A8W0+SwTU4mxsa
	 HOuB9brwA0wf4Q1L/UgoT0uHVaezbyKqX0FmJ9wjvvf1/dw3RWIM4+7lloY6xAzgvy
	 gGpkaMh+pOZP9UPf4gCMDVk3AgHzRqiLnx8O96/BSILd2yNAXQ6t8fmRQ/6iV2W6cX
	 luiqWvcecA2iI6GyPUtN9R1RJZ/i6RARe/+gzezrdZsxIO1TbITrACPQipQmNFNnAe
	 Y22S9js3E/hPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E45116069C;
	Sat, 14 Nov 2026 09:43:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0174A70B
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 09:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBCED400AA
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 09:43:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k9A0rugEVkKR for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 09:43:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7709B40050
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=PnbVfeKg
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7709B40050
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 09:43:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=PnbVfeKgJWelMOn4qfkMgzQjafLLtOvNkBfHRLI0/KgQcnw5gUagQNZpsACezsnt1W+Dd1ftW19a6SxcB1Z6cfgWRPwUiIyfQ6lVQyZiCD1l7HaF/Xul3P8VrnZ7WlaYBTGwzx7fh1a3eMbICUvBiYmECb4vwoBW/6pS9Ohb/rW/FutzVJV+W/wADPlDAmAB1dTfFXU8Q0teP5tvH3AHbQNxwpxNy+7vx8it06QpRBYXRJHQHMkw3nly5i//X1cCd0iF0DnHpsJPzI645ZkDR+WL0ca/utSrA2GwpR9n0PrW5UdOjp9VsC7YIeyAwM4VXahNC06yJddVaQzlitzeNQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=5lx6aeqO9q3Z37mJw/zQYbXOOWGUIxbLkmbkAB3GF18=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1866409774; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 14 Nov 2026 09:43:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xSAIG-00000005oJj-0gGc;
 Sat, 14 Nov 2026 10:43:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20261113230643.3815452-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 14 Nov 2026 00:06:43 +0100")
References: <20261113230643.3815452-1-bernd@kuhls.net>
Date: Sat, 14 Nov 2026 10:43:32 +0100
Message-ID: <87y0aveojf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.17
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.17/ReleaseNotes?ref_type=tags
 > Fixes TROVE-2026-075.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipelines passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/7ca1b0385264ebae4bc06a15d07a11142260081c

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
