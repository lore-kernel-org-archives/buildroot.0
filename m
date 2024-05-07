Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AB8C10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 16:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 744EA6066E;
	Tue,  7 May 2024 16:11:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHTjcsrNGhYo; Tue,  7 May 2024 16:11:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9927960A91
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9927960A91;
	Tue,  7 May 2024 16:11:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE1BC1BF591
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 16:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B777981E81
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 16:11:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oC4xlBeDENOX for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 16:11:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96F4281E79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96F4281E79
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96F4281E79
 for <buildroot@buildroot.org>; Tue,  7 May 2024 16:11:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D38E40007;
 Tue,  7 May 2024 16:11:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s4NPW-004j8F-11;
 Tue, 07 May 2024 18:11:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240501212627.17988-1-fontaine.fabrice@gmail.com>
Date: Tue, 07 May 2024 18:11:22 +0200
In-Reply-To: <20240501212627.17988-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 1 May 2024 23:26:27 +0200")
Message-ID: <87a5l1wqj9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pillow: fix legal info
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit dfaa34ddd3398f22718f7361d617d98d53b51630 forgot to update hash of
 > LICENSE file:

 > ERROR: LICENSE has wrong sha256 hash:
 > ERROR: expected: e706384c6f299d1b6fa782ae657740b372b4bd7938a1a318bf94ac249114758a
 > ERROR: got     : cf234c27a3f275f5a050f4df3946f8855704226fe4e7ca8b33928cbcecbced37

 > LICENSE file has been updated to clean up authors and contributors:
 > https://github.com/python-pillow/Pillow/commit/4197263dff19a79f13cd86f6cdc9a0ec6c06da92

 > Fixes: dfaa34ddd3398f22718f7361d617d98d53b51630
 >  - http://autobuild.buildroot.org/results/5a35d83c73367e1b20534b1bc7f2f564cf653a38

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
