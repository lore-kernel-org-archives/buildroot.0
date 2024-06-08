Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32BEC27C5F
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 07:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A974242457;
	Sat,  8 Jun 2024 07:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SyEIvpaX-Mu; Sat,  8 Jun 2024 07:27:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 828674245B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 828674245B;
	Sat,  8 Jun 2024 07:27:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 222281BF422
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C9A760671
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vbHg3BF4SjFO for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 07:27:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 33A7B6066C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33A7B6066C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33A7B6066C
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 07:27:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A55360002;
 Sat,  8 Jun 2024 07:27:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFqTx-00GGhB-34;
 Sat, 08 Jun 2024 09:27:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240307102535.20447-1-fontaine.fabrice@gmail.com>
Date: Sat, 08 Jun 2024 09:27:21 +0200
In-Reply-To: <20240307102535.20447-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 7 Mar 2024 11:25:35 +0100")
Message-ID: <87a5jvao86.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/zxing-cpp: drop opencv and qt
 dependencies
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > opencv and qt handling can be dropped since switch to an active fork in
 > commit 456a7398316655ad0b669635f580e4887c24a700 as they are only used
 > when examples are enabled resulting in the following warning:

 > CMake Warning:
 >   Manually-specified variables were not used by the project:

 >     BUILD_DOC
 >     BUILD_DOCS
 >     BUILD_EXAMPLE
 >     BUILD_TEST
 >     BUILD_TESTING
 >     BUILD_TESTS
 >     CMAKE_DISABLE_FIND_PACKAGE_OpenCV
 >     CMAKE_DISABLE_FIND_PACKAGE_Qt5

 > While at it, also drop BUILD_EXAMPLES which is already passed by
 > pkg-cmake.mk

 > Fixes: 456a7398316655ad0b669635f580e4887c24a700

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
