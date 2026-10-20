Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36A2606A324
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 16:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=N63m9Ypq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=hsVsapq9
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFD0D405F6;
	Tue, 20 Oct 2026 16:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJOsoVhNjaLJ; Tue, 20 Oct 2026 16:39:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DE5044073C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792514364;
	b=UzTqFDNl03+VARqfTEM8RFe/ffs+0eb07iRkQN0xULgUIbFs4H22or7Kkyq1Usm1V5bJ
	 PSR6S0zmpn7ne2MfayazN3v+iCQV7/qkqOSFrrgo4aDDnHLq/iYYbAdI/G2aLnky5/22/
	 5mVkDhq06TB8ndNpJy0lq4xp5Kv+jkQKtOSnddP75er+iCzDYcdjNSYYDzPbZBrvel/WD
	 Euw4rOOKy6GkrO+5pWqdyFek+k61iv4WGw7UnzxmCz2vFgiY/efeoxTVzL+Jtl0vTjaJW
	 VcDNRH/tUQCsZiSf3ni6YNXF3m3JGnus20EnNICsHFRcHbS0S6e+ol7/RNhb2rSrJZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792514364;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pXQvN+K8VuUSO3Drut6fRmGvpB7y+zZahe/Yon3mwpo=;
	b=UoOHUh9TSJJA9VcLSZMjEJlQhFTIR/HssjrdgNc/WxN+XMTBy0sKJEuv5zw+pi7nJZAG
	 FO0ksuOstBqzAWYzOfKQT8/q+iqUDMA3EUfQwNWcigE7r9/8G1tKp7etRhLFwPPhpIB+g
	 1CzdYkV4wTc8sxp2MF3XBy1vMPpxx8kbhZ2QyK6hgf7TXwO8iGUmU6fwDfywEjOp2RKcl
	 RSWLj0eWfGRCyWkR8NuSa5qKn3Qq9bEGvuIPYqE3zExkBojOpQDRLf4UcbwRVcqe7ufZr
	 X5HqQ81kWeStAP4zJBteH4TeIMMw2ibfO0Z5NApF9DECG2IIYoAvv0ofPVaS/REUyyg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792514363;
	bh=pXQvN+K8VuUSO3Drut6fRmGvpB7y+zZahe/Yon3mwpo=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N63m9Ypq34nrYeO1JaGKvDSlgthAAxOWrkyadTVl8pIfgLtBiMguhEAohg1KoC5C8
	 CNsnN6xsJiGAuOmvHLeGSWEQyvq8nIXaXbEjnEsVw8k94I5PLYOs3l7sqzDES23jMR
	 InOr2luTWRDLTNN8dviE3i7bl8OsdJX2axoxbkj0J6D+GaFtEsFZRAACj03Rap+M1C
	 1BsNYWW02vSeyP8p6scOtFIp1wO38jrwPIcpHCzSqIMdJbJNq9iYilEOQamCNUhnVI
	 eHfS4Cri/2kwpL+XU7kl03RM4hmnr43287rssOGtjOuoPRAzDkS0jnftUvFLllDbrA
	 xGsg75xMo1fOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE5044073C;
	Tue, 20 Oct 2026 16:39:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 53B173A4
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45E6D400CD
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FSCx6u9sYbIi for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 16:39:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D72B840060
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792514361;
 b=HvRGAM5vcWyz0DVUR9+ngQ8fVPy13Xb5vR+hn8sjK/4NkGir8cQCq+iX3jEQgeoUhepX
 Mjsm9Ox9zaeHbHbwyUNRcT9UtALY/bN584fQb8pZ10F7tgePbzCJQPsu+uLkCujLX16E2
 nn0dqAYDjw8m/PNTmsU6eohkUDzl4IOxDwtqVeoARdepUFsO5GSiZiNOfGlEZ9I+TQwFm
 IHlyXMZJmqedB8g3/ySwvi7tIIqZkwIyVGI2OC2kyTPOTz91DOwPoqMLEwg0Anuy42irC
 V/eIAOk7k4kgS7cCduzV9KLZMP8URY5jbluPHGGLZEHsFZxkxGm3LrTLq4gOVfy5wWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792514361;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=tV47BD1mjUlqUnACKf4FwpU8Sr8RB/W5z7YV3HdgTl4=;
 b=NpxUs1pjEpK+nd0ZYwfIgP0ASdI04ODqcbdFY9izamsGf3o0AbEgfOJn4YAC7tG3+AF5
 vOQutiRRoSfPoqGAdZzNWI5mTP7GNaV/fIhUEUXR7zUhLT9BPNp8yJkQL6aEybPHz5wqW
 3xp3Pv7XSqDOY0NCakw7EWSZqwIWSOmlxiHCxJx6heJZ1dlDQZrk/jwYjXWsUGdfLWzSf
 +SPvObqD+8I33TUA6KLqqb6gAGMTzYv33VZ5rpSgjg/0qQB6Rz0MOurnca9Mbw0cA5HHO
 fjuZv2QSLqJKOPdRXjivEUL2Dtz9HepFfCrfpHbZQoimnp6yDnvL01JDsJVHMQe94hw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=hsVsapq9; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=hsVsapq9
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D72B840060
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 16:39:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=hsVsapq9LRPqwMWP6OfcMNZHLGVB1YxRGuS/vGACjeaJEKzuz2v5d4z7wXFvm028qpmKbXfZTdKFuvf9gNMm6BmJ8VqOT9TeoYQzPV1Hn2vVkM68l44pAZwUPVBt6brAoU6bGO14hliQgU7kOH7hJaAiyE0lLeX4vMgKFTnVQM7qsK1nTbL/jrgml65uEGVzxTUVCmRKaetsWqssxSTDxkXJX5hmYVGVOt+QDgLeYc8CE0UJ/Q1tQMIyFLkBGztDDXsH0sQhvp9W+vs6OM1w+dho7aWT/IEURxCsQhGdz4ir43QtMxq6wDvTHivvuoW0Qz/V2RPDTHp3wB2Y0XAHug==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=mvNnvIIi5yf0Mk9+0A0gurrbpjaIBWoQJCRGASSZQco=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -462809586; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 16:39:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xJCrp-00000008Byk-3bQW;
 Tue, 20 Oct 2026 18:39:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <877bjc9vjw.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 20 Oct 2026 18:38:27 +0200")
References: <20261020135455.1595899-1-thomas.petazzoni@bootlin.com>
 <877bjc9vjw.fsf@dell.be.48ers.dk>
Date: Tue, 20 Oct 2026 18:39:13 +0200
Message-ID: <87y0bs8gy6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/network-manager: fix build when
 jansson is enabled
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:
 >> Since upstream commit
 >> e5d2c7cc6dd5f8146954d52855fff36febd03d5b ("meson: fix
 >> cross-compilation issues"), which first came in release 1.58.0, the
 >> jansson detection logic is broken causing the sysroot path to be
 >> prepended twice, causing build failures:

 >> ../output-1/build/network-manager-1.58.1/meson.build:307:2: ERROR: Assert failed: Unable to determine Jansson SONAME

 >> We fix this by doing a partial revert of the upstream commit. We have
 >> submitted this partial revert upstream.

 >> Fixes: https://autobuild.buildroot.net/results/104c0e15617d52ae73930fa1c439b7f426837e8d/
 >> Fixes: 67cb61bea5876227226603e58d3f74e5032b734d ("package/network-manager: bump version to 1.58.1")
 >> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

 > Committed, thanks.

Ehh, the v2 series naturally.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
