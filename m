Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429E6CAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 13:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F385F41286;
	Sun,  5 Oct 2025 13:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syE2HghxPPuB; Sun,  5 Oct 2025 13:30:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1222B411D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1222B411D1;
	Sun,  5 Oct 2025 13:30:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B7DB272
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D69460DD2
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b4C-5tZk25yO for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 13:30:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5188460DB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5188460DB9
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5188460DB9
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:30:44 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1001312674; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 05 Oct 2025 13:30:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v5Oow-00Gl2H-0J;
 Sun, 05 Oct 2025 15:30:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
References: <20251004122804.2164771-1-bernd@kuhls.net>
Date: Sun, 05 Oct 2025 15:30:38 +0200
In-Reply-To: <20251004122804.2164771-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 4 Oct 2025 14:28:03 +0200")
Message-ID: <87v7kt3281.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=TKYqoTlGmvJ0ePOL7Lc+TBLunYb2DOw1xxbEHYpshHhQdCZlRHMsdrewZZHkkrnNe8+ub3fqmSNtWww+hQysXDMxNgCfGKuB8x42iV1Lphy3mhPMHs4MMYAvp3w5eak2lpFcfNVrGjHHZnUnp7csG5Gpm8Ib+6ZgOHB8xtU6fw96I2hZ9czov7wUG2udKpqOMtby4cU9Fm//vNutGsO4H1CBEiT8gsw/cj22EdnyQFsYNC9rzIEIYwliRk3FoZ7+0U4rbVI787ucEuOqaof1d0LP3GR/DIjLBAfKOSw6HrJyIIgSFRrAlm0pYNk+ZN3a+O7PpADpgjPoXznhXkBmsw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=aU2e6Ue6qJ+MHo0cHsQzPavpuTH3zodPaOw4hMQQwq8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=TKYqoTlG
Subject: Re: [Buildroot] [PATCH 1/1] package/libgsm: bump version to 1.0.23
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

 > Removed patch which is included in this release.
 > Added sha256 hash provided by upstream.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
