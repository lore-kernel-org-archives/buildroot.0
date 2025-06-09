Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D082C5B552
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 14:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCE98414E4;
	Mon,  9 Jun 2025 14:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cp7kMnYaPLrG; Mon,  9 Jun 2025 14:22:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 135C540E05
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 135C540E05;
	Mon,  9 Jun 2025 14:22:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 634A3C8
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44947400B9
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GqBEAEa0ItML for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 14:22:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 73144417AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73144417AA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73144417AA
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:22:49 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -531898295; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 09 Jun 2025 14:22:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uOdOc-00EHQi-0k;
 Mon, 09 Jun 2025 16:22:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Thomas Bonnefille <thomas.bonnefille@bootlin.com>
References: <20250608110935.18887-1-ju.o@free.fr>
Date: Mon, 09 Jun 2025 16:22:42 +0200
In-Reply-To: <20250608110935.18887-1-ju.o@free.fr> (Julien Olivain's message
 of "Sun, 8 Jun 2025 13:09:35 +0200")
Message-ID: <87ecvt9eq5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=qg+Vi3foKusutx4Nf+tvl1fFgorFmeD26Rk0oeHSp1cCSYJKbPCq5QicAHG/Y9533XwbcCo1uT9i0qa/squY30Jk0pxxokcO1KC/pCvh9dg1DeMdKnu9Z55Vs8rO7GtyRS6grhTLCzJEGX+YM81A8YlFi8ogeeYupA/xJBi0amGi+VRNxGPZkZTqF5tlUkc0EuKwa16qlUZ9Lupdc8K1hRzhyYAZshnEmHZSqo/bqpwhkUSVv+SQFc73jfjXVuDgZadS/VQFNzHXvqpoMcP3hUhTh/lNQIDEG/alJg9ODMWxOqQL71FcDtuh3OmAdf74iub5WowvKU1cajZsDm3iog==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=mLeryjnmGd6Ud46TvRvOA/IiaQ6PQOkYqT1n6ZEkv/Q=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=qg+Vi3fo
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad:
 webrtc needs sync_4
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Commit [1] "package/gstreamer1/gst1-plugins-bad: bump version
 > to 1.24.11" added new requirements for webrtc which selects the
 > sctp plugin, but forgot to propagate its dependencies. The sctp
 > plugin depends on BR2_TOOLCHAIN_HAS_SYNC_4.

 > This commit fixes this issue.

 > Fixes:

 >     WARNING: unmet direct dependencies detected for BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SCTP
 >       Depends on [n]: BR2_PACKAGE_GSTREAMER1 [=y] && BR2_PACKAGE_GST1_PLUGINS_BAD [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 [=n]
 >       Selected by [y]:
 >       - BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC [=y] && BR2_PACKAGE_GSTREAMER1 [=y] && BR2_PACKAGE_GST1_PLUGINS_BAD [=y] && !BR2_STATIC_LIBS [=n]

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/90b3cfedf44cc92289746aa30e439be409ca3747

 > Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
