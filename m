Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92627C02197
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 13:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52AEC40130;
	Sat, 14 Sep 2024 13:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id liX3z5gJcK9o; Sat, 14 Sep 2024 13:22:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E9DB401C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E9DB401C2;
	Sat, 14 Sep 2024 13:22:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 824C11BF3F9
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CD554031F
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 13:22:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qd0d0-bqBTQO for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 13:22:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 68E4140305
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68E4140305
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68E4140305
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:22:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB97D1C0003;
 Sat, 14 Sep 2024 13:22:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1spSjZ-0054IE-2d;
 Sat, 14 Sep 2024 15:22:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240822102040.2083799-1-thomas.petazzoni@bootlin.com>
Date: Sat, 14 Sep 2024 15:22:41 +0200
In-Reply-To: <20240822102040.2083799-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 22 Aug 2024 12:20:25 +0200")
Message-ID: <871q1mxtcu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2024.02.x 0/9] Fix Qt6 CVEs in 2024.02.x
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
Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > The Qt6 version currently packaged in Buildroot 2024.02.x is affected
 > by a number of CVEs. This series of patches fixes all reported CVEs
 > affecting Qt6, by backporting the relevant patches from upstream.

 > Some of the fixes do require bringing along some related changes, as
 > they would not otherwise apply without significant rework.

 > All of the CVEs expect CVE-2024-39936 only affect 2024.02.x, as
 > Buildroot 2024.05 has a newer Qt6 version that isn't affected by those
 > CVEs. CVE-2024-39936 is already fixed in master (commit
 > b866afa68405564497dd60c1f8f33cdf71d22728), but this patch series
 > provides a fix that applies cleanly on the the Qt6 version packaged in
 > 2024.02.x, so it should be considered as a replacement for backporting
 > b866afa68405564497dd60c1f8f33cdf71d22728 to 2024.02.x.

 > Thomas

 > Thomas Petazzoni (9):
 >   package/qt6/qt6svg: backport fix for CVE-2023-32573
 >   package/qt6/qt6base: backport fix for CVE-2023-33285
 >   package/qt6/qt6base: backport fix for CVE-2023-32762
 >   package/qt6/qt6base: backport fix for CVE-2023-32763
 >   package/qt6/qt6base: backport fix for CVE-2023-38197
 >   package/qt6/qt6base: backport fix for CVE-2023-51714
 >   package/qt6/qt6base: backport fix for CVE-2023-37369
 >   package/qt6/qt6base: backport fix for CVE-2023-34410
 >   package/qt6/qt6base: backport fix for CVE-2024-39936

Committed series to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
