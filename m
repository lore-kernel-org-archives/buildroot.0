Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B3CC5AC67
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 18:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2FC580E54;
	Sat,  8 Aug 2026 18:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8zvYFuPG-Jl; Sat,  8 Aug 2026 18:28:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A1C980DF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786213712;
	bh=qb5xgvBNl67NqtKXkeiNvhFWArZMG0eV+gf+L9GjAzo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YcSHkV8bTTpeeUS3aAqLhumg6iVHw9vDo2ERjVRMjbVnsEdPkHbSPOOMMdom2nfOP
	 oWGOM+ZWW9YOfXofphGyZX/nJbUnviGq8NxQd+irzJPvj6syCxZvS3edFlg0zKIZV+
	 EJmIH3oiqpT2Rl+rVOBq8nY21riMXSw2n+IG+Kzd/kJAiEn2TIKHABpM6bmC1N6vf4
	 ru9g/bhXlmG5uphR+Lif4Cw2InP9ZQkW269KwnKbxyqT2+bJfbXmv+dSUoYR5Nsawa
	 KQ/86i8/IFvDdbjkCsuhKF/6c228TTa3QvHKv4YEjTCLjsMZ4XlLqNekwxnTtFbwMx
	 b2+spRkyUxDOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A1C980DF7;
	Sat,  8 Aug 2026 18:28:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D417C144
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 18:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA28180DF7
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 18:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZHjevIQ-Czhz for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 18:28:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F19D880DF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F19D880DF6
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F19D880DF6
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 18:28:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0E72D1A14E9
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 18:28:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C1F176045E;
 Sat,  8 Aug 2026 18:28:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DDBB311C48626; 
 Sat,  8 Aug 2026 20:28:20 +0200 (CEST)
Date: Sat, 8 Aug 2026 20:28:20 +0200
To: Franciszek Stachura <fbstachura@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <and1OD4OXp43npIg@windsurf>
References: <20260704133118.1245367-2-fbstachura@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260704133118.1245367-2-fbstachura@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786213701; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=Axg0BJknT5L22VGJwP/jirrb853Cpcv0xmxRC97xpx0=;
 b=J9tRWWAeUkwcYC96ZJ81UMFlCwsdkwVHDKtcXadxaNSNMzP0TifsJbtGumMEdjC3Jc1+M1
 x7WHORqNIITrRXW169z1hC6NOxPxea/qB3KdnIZFif546VMQJKSlBNYm9jWb0B1hF9OGwz
 0Uty4HZfNfnkcMMnffhjmkjY0X2hSnVCJesHTOXVzQ+UFwqBAHglMhNf2ks6qHR3zhQv5T
 TmAZqdkQ/DsZpAWpAVMbt3vXnPQz24T/fHuAI2H7cqsvgh2K/gjkWIK3YdJvC1szj1i/x1
 YwVtUdhUlhAX42BqZJv9VsSnr6nlodbS++BjMD47x2Tkd0utcih+Pnglx4Krew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=J9tRWWAe
Subject: Re: [Buildroot] [PATCH] package/memcached: security bump version to
 1.6.43
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Jul 04, 2026 at 03:31:19PM +0200, Franciszek Stachura wrote:
> https://github.com/memcached/memcached/wiki/ReleaseNotes1643
> > More likely critical security fixes and less critical bugfixes.
> 
> Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>

Thanks applied to master!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
