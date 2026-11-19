Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2205606A320
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 14:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YPDJsH1x;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=K61YIdwx
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80AD68137C;
	Thu, 19 Nov 2026 14:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94RmsFhsGK1u; Thu, 19 Nov 2026 14:47:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7D9438136A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795099650;
	b=FLj4jc3DQp0AUqUhUDrunjwMbfcN0jcO1ITAcayaV9AaX9GmTEj/fIZxPglK5w8nitR9
	 60trSlFIsU0uzELN6BqLcDk5bzZrMqhDJPcPAT3haL08ElPf2s5q7RNYkS26YxEFCWkbH
	 pchuNBLsvmLEUlBx60T212fBe0KljBKl6NfjB6ehKEuQG1yWl7tr+lWNhe48TPlSqW/jB
	 gUAztvi7l+2WhIPJol/LTKMurPgSlOHiq9hmRtG9GYcDCEzu++i+SO7dpwAfDHzZSeAhT
	 S2w7QleF6xK84xfoj+X8bYk1rTOYZdXNdODA817UVZav4WwOrGy2TnyhkJi+9lKZaog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795099650;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=OXML+OqDhHeBIWFARbSmtz8l0XLCZDwVRO9gxWPA6sg=;
	b=KMDTXmnPUUFZXxC/t5TfEaywTg+2QZOj3CqXN2ivCoccNFmZcl/oBr+YeT1BUJ/pWBcB
	 UNgzAH/j28pMfGy44emruk0XpQCf8eVKLgRzxdhs6MQn3kUCmKJogDkSdaV83L1nQ+eJz
	 h/1+SurC5VgKslBuGnGWnU8xMs81WTy7wLeh7HVpr6Et28nYxpsyLKKo3uLRKNAGkYU7K
	 nradpbzbJ2MT2NN7tyxDNX1URaPF8WjhDuWu7oSh3slaKW+V2UuRio5TBEtee+hOE/6UH
	 RKNBC5Isrx15Jah1rh39cJKYxPJvE5LL8soHEOIgax153MVhxN4SeFtnsNpQTR4Kb8Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=K61YIdwx;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795099650;
	bh=OXML+OqDhHeBIWFARbSmtz8l0XLCZDwVRO9gxWPA6sg=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YPDJsH1xBdcqZSjJ5FxLV/FN06IwBPEYZqmKMQZIyvxB7sQcChFVms2yaH9Qp+rL+
	 JfSqQX5NtoNaGinFCUMZKmFR07eA9NxL4mx2DpsakLh9w2MS1vH2gaOi7iLEHlu88W
	 1fqMvDxVsix0e8ZXfQ4eY7ZyHjdJsWSpzABs4XQkqQ7I5r2ki3gGC+5sW5yWtV4uBk
	 sjZaRU6NYo5iLIqlmOQLRN92j/MZ+Hy6ErDrPrS7YYYUHuYhrg6DWb46TsX9QN0sbK
	 fDg8YQ1b1RR1O3ysIXqsfRTIHa/Y4sZecQvRF5mdJ4wYgvnE0cSQVKZZE7qUuZpiSO
	 mIaFNIcH6npiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D9438136A;
	Thu, 19 Nov 2026 14:47:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CC92722B
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 14:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE38C8136A
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 14:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EoK19eKP0Slc for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 14:47:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 13557812DA
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=K61YIdwx
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13557812DA
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 14:47:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=K61YIdwx1pf+hZj9GFc7l9igWhHolOkwoC7nVeDT+b4VXyoJhfDQzx+cGNEj4a/NH1/Gg5cS2eM6pyYHzemYGXvKmWRjqHDCor0KIHWUSmc8GajHGXFR9E2qAZYjK6qI1n+qeEuQUSJiDd63Ptp65rHW29lxxxqu+DScE7uNc9sgN1SCUxLvz4/4H30WW/hYr0kMfTqa0DFJPwfKitczxyl5ep+ylWEuA6PQfvMFUiXG6kHAm/eS95YLxYarWcruDLMIuhDr3fBRwAjW13HCvqC+1sQdl2dm/j0GKpuCftutYbSUou6kZfrsOIz3IZhP547UtKZwDhtRtkBaiuy47A==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=uhTZbyNfhMnkG4sb+sIxQa7VNhAlmTB/YYD1RxsLyvA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1036164987; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 19 Nov 2026 14:47:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xU3Q0-000000014wH-2wrN;
 Thu, 19 Nov 2026 15:47:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yegor Yefremov via buildroot <buildroot@buildroot.org>
In-Reply-To: <20261119103103.2602430-1-yegorslists@googlemail.com> (Yegor
 Yefremov via buildroot's message of "Thu, 19 Nov 2026 11:31:03 +0100")
References: <20261119103103.2602430-1-yegorslists@googlemail.com>
Date: Thu, 19 Nov 2026 15:47:20 +0100
Message-ID: <87h5hcvpxj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/shellinabox: fix build with musl
 and GCC >= 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Olivier Singla <olivier.singla@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Yegor" == Yegor Yefremov via buildroot <buildroot@buildroot.org> writes:

 > With musl, shellinabox is configured with --disable-utmp, as required
 > upstream. Its configure then no longer checks for utmp.h, so the
 > header is not included by launcher.c, although login_tty() is still
 > found and used. musl, like glibc, declares login_tty() in utmp.h, and
 > since GCC 14 made implicit function declarations an error, the build
 > fails:

 >   shellinabox/launcher.c:899:5: error: implicit declaration of function 'login_tty' [-Wimplicit-function-declaration]

 > Add a patch to check for utmp.h even when utmp support is disabled.
 > HAVE_UTMP_H only controls the inclusion of the header, while the login
 > records depend on HAVE_UTMPX_H, which stays undefined.

Committed, thanks.


 > Upstream has been dead since 2019, so the patch is not sent there.

Perhaps we should remove it then? Oliver?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
