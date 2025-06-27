Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00579C7EE31
	for <buildroot@archiver.kernel.org>; Fri, 27 Jun 2025 14:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B063061289;
	Fri, 27 Jun 2025 14:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LhRFsd8W_G40; Fri, 27 Jun 2025 14:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE2FD60890
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE2FD60890;
	Fri, 27 Jun 2025 14:02:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 808CC1D0
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 14:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6702360B9F
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 14:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y0loTV75apsU for <buildroot@buildroot.org>;
 Fri, 27 Jun 2025 14:02:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 45FE760672
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45FE760672
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45FE760672
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 14:02:23 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -167404189; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Jun 2025 14:02:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uV9ei-003Pv0-1W;
 Fri, 27 Jun 2025 16:02:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Giulio Benetti
 <giulio.benetti@benettiengineering.com>,  Romain Naour
 <romain.naour@gmail.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250612171117.3475778-1-bernd@kuhls.net>
Date: Fri, 27 Jun 2025 16:02:16 +0200
In-Reply-To: <20250612171117.3475778-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 12 Jun 2025 19:11:14 +0200")
Message-ID: <87frfl1dw7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=NCIMRQIbS5oa4BYJPYXinHXzrS4WVb0wIIw+ynSH2Ro7agTh9/l8UeHnbee0VsWlefRG2CPyZg6sJAYtZlSq8kS6f4SnyfMy9Er/42Hv2PMrCux1QU24aQXbpr7zroODtnlLIHruhAkYCsNk7nZXgKidiF5TNBa7fkCPb8jml9MBApHU7jRC2YT6VgwMoj2L+e4hlYNZlwJ39aM1CrJPUyZbM07GLhqTK+EqiDHj9qq9rlVlh5BhA6J2S/qdg37gaAJYLJ1l0Ynbk21/ZNEm6t91i9YelTUGnrf9OTIDaQEqPmWJciqLoDRtc9EyiT5NOl+2ZL6xcCzazSeH4/9ppA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=aKaSwpCiL0EEIXe4dXhZhLMBJfp6UyC4MJwFpPYhRq0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=NCIMRQIb
Subject: Re: [Buildroot] [PATCH 1/4] {linux, linux-headers}: bump 6.{12,
 14}.x series
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to 2025.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
