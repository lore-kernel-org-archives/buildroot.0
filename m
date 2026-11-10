Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23525606A320
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 17:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VO/BMe7a;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=WMvG9nU0
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED09A4099A;
	Tue, 10 Nov 2026 17:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZUKwxBohIsCe; Tue, 10 Nov 2026 17:20:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 26B254088D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794331247;
	b=Wx8Ry2MwUcPxjJg5Hk0eaIAwz9vLp6UUZn8ydvXkTsrxafDRNPY3LZTWVWSIvOqdYDs5
	 w2AUBFbd/K9Ue/0bikCwUAoMY9UanFmUUKr3rE27KnPsmA0fR83Ctlcp6YSu/3Xs0I76X
	 flz249ArhizJtumrPsfWniDlugBPGYk+3VfPVit/YraCYgUbbZ96sd1PLDDof/kbMA9ns
	 /nu2/+PB9I6pf9JYctTxkTs9SRFGy9D99+pPXg0sRykowTed84L5myr1XiQjrKxnWtwBT
	 OGrYlKtcVL4WawsBIKGGiI2U15urbRlcf9avZ7Rsqw9mBOkZFVLCSHsgtWau3S/Y/og==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794331247;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Zya9naovqgg2tOQPgn1Q+6L2SDr0oFfXUUh5KEkoXqo=;
	b=gajJBQY0b+V8DozcK6/6cC4idOtF5TDPWdefCu/GcHGbun6bYxTCV0WCS6FfEg55tDb0
	 PTKXnQt4Il4XrjiUD7xDb6deuxDZkDYjzP7QvqzChzYLvngClLnaJgwFgFz7DXD/GZDMy
	 XwN5ltAh/pWSmCjIU4D0W10jf6pgefliSnl/mCfIR3Y16MTC8fBBx1AZvPG4Ie6+9zYTI
	 EAT9vhlC5l5jSu1uyQwerkyzWAUFI4Jl3Uhhnnoz3f5b3p5z9uXEPIZ4zeyBJP8dJWqIX
	 IWYkpTfRoO3tOSGC0V0NaxeDgGm10TRXtBeFWmlSsNBp3pCqLtKDZSGRDhWUI3aNKOA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=WMvG9nU0;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794331247;
	bh=Zya9naovqgg2tOQPgn1Q+6L2SDr0oFfXUUh5KEkoXqo=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VO/BMe7aExRZ7/FQE0iTXyGfZ7fJpgk1xyP/xYV7LBYOkdFXpEXodd2MhENox56sZ
	 8Q5EBUOUzg/MTnWc2c2QaRI2mfmo3MuG7GJs2NwrnE+2DkQT0aa3CFeq4ZYs2iXdXG
	 wEsgMe1TDCw6xiOIE9DCLkWSgxeq03ls0NG1IzFTGreRnevkwUdaaR7ZTcUknAULLT
	 /YgQnfaHaWrcA7K45s3La1gOaN+Y1Tsvgq/c87S3LGhohEIAz2iEwE3ZR3aIW1GBph
	 wwmttEbrbUh3KRVsiSOGIJLfcU571KKeA7gvzzH2xG4hWtA4PuDWU3Upu5ziYo2XS8
	 davhoOMQf8VYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26B254088D;
	Tue, 10 Nov 2026 17:20:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B0D9B9D1
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A27554088D
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-1AuI4WIIfz for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 17:20:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9097540878
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=WMvG9nU0
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9097540878
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:20:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=WMvG9nU0AcSCJvJg3qzTTzxKSKVrXu/+cCPinbbBqudcuCVEoN7gu7uVSr0vKlPQgmz1kXzVxngz7Ihs39yYDz2zJE3y94IioOpoeMHsYDtZPK0wmwVhEC9krl8/5IZClN18fuhffOTYBHNfj1xasVwhxfITTsjkmOlFn/m897kgHuDRggNoZt1Tgb1ap0kl6pZ1IxWTHyGY9BswmKHPxzd9GZpenBhsrpLcChZY82Mll1TwkhNRWU5jIWu5SJWA9rc4y2OjpCHbWbzp990SMDWVJpZJRhOXbRl1vNWOAf6PaXhcUsZ1PabGXpWWcV0klOV9RGrWdE80Yc4EbJ1oLg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=P3V4GkZhWQsIRM+Az7ztkOW6l9X4sBAolif1uixae9M=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1295083039; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 10 Nov 2026 17:20:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xQpWO-00000001HtB-2JAT;
 Tue, 10 Nov 2026 18:20:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yegor Yefremov via buildroot <buildroot@buildroot.org>
In-Reply-To: <20261110112924.1662842-1-yegorslists@googlemail.com> (Yegor
 Yefremov via buildroot's message of "Tue, 10 Nov 2026 12:29:24 +0100")
References: <20261110112924.1662842-1-yegorslists@googlemail.com>
Date: Tue, 10 Nov 2026 18:20:36 +0100
Message-ID: <87zevgtxgb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/shairport-sync: bump to version
 5.6.3
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

>>>>> "Yegor" == Yegor Yefremov via buildroot <buildroot@buildroot.org> writes:

 > Bug fix release. The mDNS sources moved to a separate mdns/
 > subdirectory, which only affects the upstream Makefile.am.

 > Release notes:
 > https://github.com/mikebrady/shairport-sync/releases/tag/5.6.3

 > Assisted-by: Claude:claude-opus-5-5
 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
