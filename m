Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B073DE73151
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8511940A61;
	Mon,  2 Feb 2026 10:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BPmMSgwyW9N; Mon,  2 Feb 2026 10:19:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6099F40A3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770027567;
	bh=EgbOlfloUnBQie0NLe+4zz6H8xCl31ONOZIO/m+J8kE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JL5uyFC0Ox00gqpwZPHgk8UWlhyXYH+7E9ZXKHfYHKUz5mEiWyNyEV5Sgip/n+dYm
	 Ka/vKrAeioa1jg7hc2h5PWLOXXpe8/aNjFuP2Mt3WFhYHabWBYauUa1D2QQp1DHIcf
	 JndhV5fXSwfbpmnrZ3EBpn2R3ia16NAmxGo5jY+PJgP6tXmdRYcZiMCJHC+ZkKGv9p
	 1U6rer69LDj6uzcLsN7Ru5NRpt9jsZyyadNQjBTnVp4QlVA+9h2p4AF28q/MB4l/L4
	 wOpPGgUQCmXcBxTNTmKdyU2hVtBnVmGytc1T+Yzce1kYqCmaROv+VTEg4eQrdIPoYG
	 JhJVEFBAGrh4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6099F40A3C;
	Mon,  2 Feb 2026 10:19:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C16A41E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B047B40A3C
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6QeOytG7bz2k for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:19:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9E0BA40947
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E0BA40947
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E0BA40947
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:19:24 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -525349464; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 10:19:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmr1a-00000005s0s-1ibV;
 Mon, 02 Feb 2026 11:19:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org,  Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260104172853.3441726-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Sun, 4 Jan 2026 18:28:53 +0100")
References: <20260104172853.3441726-1-giulio.benetti@benettiengineering.com>
Date: Mon, 02 Feb 2026 11:19:18 +0100
Message-ID: <87h5rz5ty1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=HyRG2n7aQY3G92IzeSm2dGcSPtay6bFm+INu7uTgf+JNc0lhxRa2CKUJC6dLgNSnFYzTB4Ogo0v3IIbnmbgs8l1qxvt3Eq3X0jiAgzcaoq2fk8MF8px7D3+jkNBFHYMGSrJUmqBLoX1pTgy6xbK08uJSb9P37IpFSr0Hhqh5DjxKHFx6QlnLWKiO4SZSXBS9HwfjXCuj9drBZ6K2lOwEaQWTGzUznqS2SDbYdQks3VFGWcKaBrQMJ7Jfsin+sgjyFqejWgKr4apJuDNugsNw7PnsABBXnLru/s826F1GJ+dd4XzUshnlMYUb+rmLtwogaHRcd9dLZGTYWEkePYH+Sw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=IyZpdIrkwsRm2xdEiAzRh+P8z2hYfGJIZLFyu9ZV1z4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=HyRG2n7a
Subject: Re: [Buildroot] [PATCH] package/efl: update Upstream: field in 0001
 patch
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
