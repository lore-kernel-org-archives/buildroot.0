Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03064C4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 21:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95D25615BB;
	Wed, 29 Nov 2023 21:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95D25615BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AFiaGA_LOqiv; Wed, 29 Nov 2023 21:26:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0581F615B7;
	Wed, 29 Nov 2023 21:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0581F615B7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FC881BF377
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 21:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68AEF615B7
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 21:26:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68AEF615B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E60FyNsfUkjL for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 21:26:48 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C9CC615B3
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 21:26:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C9CC615B3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51C0820005;
 Wed, 29 Nov 2023 21:26:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r8S4y-001kn8-2D;
 Wed, 29 Nov 2023 22:26:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231129200832.580226-1-fontaine.fabrice@gmail.com>
Date: Wed, 29 Nov 2023 22:26:44 +0100
In-Reply-To: <20231129200832.580226-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 29 Nov 2023 21:08:32 +0100")
Message-ID: <87fs0o9ror.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libgdiplus: needs C++
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Unfortunately, libgdiplus unconditionally calls AC_PROG_CXX since
 > version 6.1 for google-based tests resulting in the following build
 > failure without C++ since commit
 > 5b6dd17b864cfb9133d3e2d78b9a15fed877b15b and
 > https://github.com/mono/libgdiplus/commit/4f9802230653ffe810ed2e535a572e42821fdf2d:

 > checking whether the C++ compiler works... no
 > configure: error: in `/home/thomas/autobuild/instance-3/output-1/build/libgdiplus-6.1':
 > configure: error: C++ compiler cannot create executables

 > Fixes:
 >  - http://autobuild.buildroot.org/results/3757921a2160ca209089a0b47414a445cc42e35e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
