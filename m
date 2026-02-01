Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B685E65298
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 20:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CF0E60823;
	Sun,  1 Feb 2026 20:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4RzAfcS7bKW; Sun,  1 Feb 2026 20:56:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1B1E606A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769979362;
	bh=OXWu8qQffkApiYmg65EzBZmdHDUSdZfQnMfw/6aobs0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cQHCP0oC1zX5UakAm3ABk+fZpQOg9YsLYl0i2wjDChO7ktAvsEZVZJd4dKKKbPihg
	 WD57ehnweYchWudp/E+RK06xili1wqcrgl5RepFtte5nbbIBQGYF48PedVRtdO109I
	 z9RLiD0bFIoyW3W9SImn9qzpOEgQXpwriUYacjSVYsm8i2Qp4RuJkUD95EE0ok3u7b
	 3dR4PlWlsL8I+Mci7HbvwZ9ymq87qoHn6Z9pYrUExIfYBaEDDLJozUO+LRzrkcwiOr
	 YMVPs2aNB/bBSHwFWurcrbE8zExSD12JuHX4CDlSo9r9vexg/k9LXLAYPHSGg8Sq46
	 csidEaofB5N/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1B1E606A0;
	Sun,  1 Feb 2026 20:56:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 86A9D1E0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C220606A0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8jOTEuhw-D4o for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 20:56:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6B4046064A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B4046064A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B4046064A
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:56:00 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -148270254; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Feb 2026 20:55:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmeU7-00000005kj2-0oyL;
 Sun, 01 Feb 2026 21:55:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Patrik Olsson <johan.patrik.olsson@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260131205047.9112-1-johan.patrik.olsson@gmail.com> (Patrik
 Olsson's message of "Sat, 31 Jan 2026 21:50:47 +0100")
References: <20260131205047.9112-1-johan.patrik.olsson@gmail.com>
Date: Sun, 01 Feb 2026 21:55:55 +0100
Message-ID: <87wm0w89pg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=le1s1zoV5+xPdr/kY9du/GHwVSF5kmC4sFe2zHabFNwK/HlnDti+GjTSjcz3iHoAJFmzhaxVJQ8Fw45Ui9sflFzI3GSmn1W7C68lPGS4kjnk8PFh3GpZeQ8z+pUo2Ikfmcwcj4m6FsO13BFHUHeAuru9lFuj7lA6zuOShIIC9ijV/vmwqJZlNMFP4dyF5Yljm830HMFV63yTGeKBIgVD1Jugw66hJMiU+WnkVdw1eKnhJhY9I7M2YSyhIDUScc5dnBlrmzIeJTMZqJfRVcb+x4JZqXo6TSkBnPWtRAqThPelGwR7vLuZRoqlskGLyTV/WrUCOC8/nCLYhA4TlXVs4g==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=xgB7aIf5U5xSMA/cD+ZHtJYCvtWNsw5CkxOt8sCYz6U=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=le1s1zoV
Subject: Re: [Buildroot] [PATCH 1/1] configs/rock4se: bump Linux to 6.18.8
 and U-Boot to 2026.01
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

>>>>> "Patrik" == Patrik Olsson <johan.patrik.olsson@gmail.com> writes:

 > This patch bumps the Linux kernel to version 6.18.8 and U-Boot to version 2026.01.
 > Tested on Radxa ROCK 4SE.

 > Signed-off-by: Patrik Olsson <johan.patrik.olsson@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
