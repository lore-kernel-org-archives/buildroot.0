Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B17C606A31C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 09:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=C3N5Tlzh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=fXo0UaV4
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23AAE605EC;
	Mon, 16 Nov 2026 09:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k3wOCtpj1ghe; Mon, 16 Nov 2026 09:39:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 26FEE605ED
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794821955;
	b=UpAAkOB6hGzg1TTH83i0KWy1QQgzUpQ1m7tAXzZiF77nbqdpVGZdCxLGqxoDDuLLBR8j
	 vIBVE7t3j6MmWTGEyzu6uBkiqUZEajUSb8sRacOtMeKcNqsU73qpXTCX7gEB5h2O0am+1
	 iqsxX5n4+P81xUZa4w39138K3Bmbz+y6SKgFYcf6lxPCu4Zz/aMy5zv8do2ZLpuGdTvPm
	 H7dtiRzTif49Oef3YjkdkddnSMIOU+bi6fQN3GHMMFMiaSMwYHmSPPCQm/6Sfudxx5ij3
	 IpxGB+bLDFJy7yYwUfwGnT6m/MJ8dPZEr06t2oxcB+PpSeXOycltGpLxj8G8MzItPlQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794821955;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=78vbI3sTYHa/1O+7BxY1hQ30a9V2zC62T18y8mcjhp4=;
	b=VdoqeTNlOmh16Gyw6mrJSxeLhT59OIqlqf72AlE80c00yABJLFGg7GBd0AogYyTtI5DH
	 m5/dTBzojx/85zrqWdiVzKUQ5w2JXmYAcWhOMp0125cZ0PSxb3HAuyaM1/hbIJ/0V32c/
	 0c2m7Bohi4TuAkSB5s1a+BHvCIUeamp8Q8iQfW+EMNeRFJChg3JsPcPlAR7LpFGxLJAbY
	 czOxifN5yIiiTJiEaPKoMjTY7Wkt8wOzVXm6USiFowEMuoKIYpLW7gsBHvOCEZnOB6G9f
	 hUN9ETUa+2EJ93Dq7WgTOgGZQtgrJPj6+B46ywjqm3zXHJ4BcU3ZwCVwvgGE1lYn/og==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=fXo0UaV4;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794821955;
	bh=78vbI3sTYHa/1O+7BxY1hQ30a9V2zC62T18y8mcjhp4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C3N5TlzhQ8vWxKIsCtVbI0VSg5mjdUQF5bg2ewsSlnePYuDZSAOUHtLfM6IxAw5EU
	 YIV1+1VITvDwGINSWoTxVol1OQzmkWPChqhAoYCKQl7qa05dPPSSpVvwKMjysj1uWY
	 h1hj5iZerUPFjLT1cv628sglKDhlL6SxAvf79DugtWcABB8asgXm1SgmCb7ztf8/8y
	 zT4RolwDsDARA3m3aCPsexPVB20B7BUzhvuQSrR2GXEN05EW2YrRqc4bStO1ztYngy
	 +mrzWXP0exSm+XdimqXAdy6ZWzFXtLgf94yyCVpGIgR4nMwU6eICIPfAND/JYYxgTS
	 LYMPQiEj+On3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26FEE605ED;
	Mon, 16 Nov 2026 09:39:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A1152176
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 09:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87742605ED
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 09:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72MgwkNFju9h for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 09:39:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3FB4B605EC
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=fXo0UaV4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FB4B605EC
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 09:39:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=fXo0UaV4KPZksvrpM0OdTCxaJXPZV5dT0GSlAY2nLcE5OBj9MaML3gqz+HL98E9mVljBMfJyfGtHnQ1Rr1RK8W/zGNJTVQKqtr/i0ZqGyf485ls34pbSZptniEiST566iJwAMcQJnbz9q2KmEQiK7vlXd2G2pjG26JwWU8+ZlXzL1iq7H37pe5UJ5CBY7+hvoEOzazw1njX3np57NO1mWqgOsTJ9uGgs42iEVxex0SZ7/rPAI98uESi8WKD8tVPbhZPYaUq1GihVanKOR9esQ7nUqW7q0/98pqlE09KyD1wMKG/j6wBiTcIa2GPnL57pByNB7Ke52bzPIo6AoZ0L3g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=H+2pIuAV6HC/QIh6P+Efu0+70hj/2JWBU24PoWTYrJs=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1501451082; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 16 Nov 2026 09:38:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xStAw-00000000FV0-2eVP;
 Mon, 16 Nov 2026 10:38:58 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Sebastian Michel <sebastian.michel@oss.othermo.de>
Cc: buildroot@buildroot.org
In-Reply-To: <f5679391-fea4-4ad3-a0dc-01e7031dbd7b@oss.othermo.de> (Sebastian
 Michel's message of "Mon, 16 Nov 2026 09:15:27 +0100")
References: <20261113092630.1245957-1-sebastian.michel@oss.othermo.de>
 <87bj7r8qcv.fsf@dell.be.48ers.dk>
 <f5679391-fea4-4ad3-a0dc-01e7031dbd7b@oss.othermo.de>
Date: Mon, 16 Nov 2026 10:38:58 +0100
Message-ID: <87zev915fx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/wireguard-tools: switch to
 git-based source download
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Sebastian" == Sebastian Michel <sebastian.michel@oss.othermo.de> writes:

Hello,

 > Ah sorry, I should have given more context here.
 > I am having the issue for package `wireguard-tools-1.0.20250521`,
 > which was the previous release of that package in buildroot.
 > I suspect that wireguard-tools was re-packaged for some reason and
 > then uploaded using the same file name.
 > To prevent this from happening again in the future, I created this patch.
 > Take a look at the following log.
 > The first downloads hash verification fails, source:
 > https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20250521.tar.xz
 > The second download succeeds, source:
 > https://sources.buildroot.net/wireguard-tools/wireguard-tools-1.0.20250521.tar.xz

Ahh, indeed, so the immeditate issue is only for 2025.02.x, where we
could change to git download OR simply to always fetch from
sources.buildroot.net.

Longer term we could indeed change master to fetch from git in case
similar issues occur in the future.


 >> Ahh, as the author of cgit, Jason would probably like to know about 
 >> that. Did you contact him?

 > Not yet, thanks for the suggestion. I'll contact Jason to report the
 > issue with the cgit snapshot download.

I had a look at the wireguard-tools-1.0.20250521.tar.xz differences, and
the .tar files are identical, but the .xz output differs, so it is most
likely caused by a (security) update of xz on the git.zx2c4.com machine.

I don't know how the cgit archive logic works. If there is come caching
then he could perhaps replace the 20250521 file with the copy we have on
sources.buildroot.net?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
