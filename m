Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D9DCCD18E
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 06:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DA0183EE6;
	Wed, 15 Oct 2025 06:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZnV1LVcNXM2T; Wed, 15 Oct 2025 06:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4821783EE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4821783EE7;
	Wed, 15 Oct 2025 06:30:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 305F34C4
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 06:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10A704132E
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 06:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ApZu88lDol9z for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 06:30:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E06C5400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E06C5400BA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E06C5400BA
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 06:30:39 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 790988817; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 15 Oct 2025 06:30:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v8v1t-003RzI-0W;
 Wed, 15 Oct 2025 08:30:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20251014185113.3583315-1-bernd@kuhls.net>
 <20251014185113.3583315-6-bernd@kuhls.net>
Date: Wed, 15 Oct 2025 08:30:33 +0200
In-Reply-To: <20251014185113.3583315-6-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 14 Oct 2025 20:51:05 +0200")
Message-ID: <87ikggvfqu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=VyPi7bYJKogN8nJu99xL6P9FcJY6lZqDlfrpWs7UWFOU6rBGM70d3ckZ/RTVI26SAsKSiiZ8H9N2eGXsmEAzdSJBNxPLzgrZ+o8sHVchisY39AiGKeelZR0iaJylw+mOnikS2NxgXt0U9EaM5Ct7d0MmMhkNcXT5SHP+P2t2P44LzfdX8f1xHkJTY46MFM1LTIWzZeHz5KftYZoIL7fEvTM9bvXMfVg0yqsWTts0HtZstUeUPXDAjecsX/7N1oJP3I1XAQDnA0IyJ9mNy9uRUpYfRcauc8QrrK+o9lVOrGMwwuzWABXyffVG49Ph/TF5kVQ+rqC4JvuHZX3Xjniw7A==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=XdZNx7Y91NTF/h5hZ7bWeud2aLXzFFVjAl/ezWr9Nk4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=VyPi7bYJ
Subject: Re: [Buildroot] [PATCH 06/14] package/python-websocket-client: bump
 version to 1.9.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Vinicius Tinti <viniciustinti@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Updated license hash due to copyright year bump:
 > https://github.com/websocket-client/websocket-client/commit/e46a8fe2dbc74f88a2cfa749f2499f7cc6f31409

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
