Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D13FC25B7C
	for <buildroot@archiver.kernel.org>; Sat, 25 May 2024 16:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 133956061E;
	Sat, 25 May 2024 16:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1iL19QLHyw2; Sat, 25 May 2024 16:36:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1893F6062A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1893F6062A;
	Sat, 25 May 2024 16:36:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 482D31D0718
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 16:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40D4E4051E
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 16:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0l5DeMDfI7I for <buildroot@lists.busybox.net>;
 Sat, 25 May 2024 16:36:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D48FB40508
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D48FB40508
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D48FB40508
 for <buildroot@buildroot.org>; Sat, 25 May 2024 16:35:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EACA160004;
 Sat, 25 May 2024 16:35:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sAuN9-001oXr-11;
 Sat, 25 May 2024 18:35:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240525062142.15552-1-fontaine.fabrice@gmail.com>
Date: Sat, 25 May 2024 18:35:55 +0200
In-Reply-To: <20240525062142.15552-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 25 May 2024 08:21:42 +0200")
Message-ID: <87v831hms4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcpcd: bump to version 10.0.8
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
Cc: John Stile <johns@msli.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.8
 > https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.7
 > https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.6

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/dhcpcd/dhcpcd.hash | 4 ++--
 >  package/dhcpcd/dhcpcd.mk   | 3 ++-
 >  2 files changed, 4 insertions(+), 3 deletions(-)

 > diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
 > index fb4f6064bc..d29f49fd28 100644
 > --- a/package/dhcpcd/dhcpcd.hash
 > +++ b/package/dhcpcd/dhcpcd.hash
 > @@ -1,4 +1,4 @@
 > -# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.4
 > -sha256  eb1f3cfef3069781ff8c896d7cea922639964afe22db28c069dc3f37f57eb428  dhcpcd-10.0.5.tar.xz
 > +# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.8
 > +sha256  d8dddf9f971a8d9ff828f33d8fa9f6d9a892a4a1429d230e9efb2be97dd0e313  dhcpcd-10.0.8.tar.xz
 >  # Locally calculated
 >  sha256  a7d6da3a202cdd38eaab0bcea4d25f60d002980f3785b3e896d9bf387f093ac8  LICENSE
 > diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
 > index 991c5cca57..b89edd268a 100644
 > --- a/package/dhcpcd/dhcpcd.mk
 > +++ b/package/dhcpcd/dhcpcd.mk
 > @@ -1,10 +1,11 @@
 > +

Dropped this stray line and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
