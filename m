Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762B6CD37AB
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 17:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 216E560717;
	Tue,  3 Sep 2024 17:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gi014VG6sixh; Tue,  3 Sep 2024 17:59:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31B4360741
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31B4360741;
	Tue,  3 Sep 2024 17:59:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B58361BF20B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 17:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A208E402EC
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 17:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQaMk0X30d-M for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 17:59:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D1449402EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1449402EA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1449402EA
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 17:59:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 599B040006;
 Tue,  3 Sep 2024 17:59:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1slXoW-004pEz-1V;
 Tue, 03 Sep 2024 19:59:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240802211506.C5B0783BDD@busybox.osuosl.org>
Date: Tue, 03 Sep 2024 19:59:36 +0200
In-Reply-To: <20240802211506.C5B0783BDD@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Fri, 2 Aug 2024 23:08:58 +0200")
Message-ID: <87plpkobxz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/wpewebkit: disable libdrm
 usage when not available
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=65f8174648a3df922892cfac1ad15279d1bffde3
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Pass USE_LIBDRM=OFF to the wpewebkit CMake configuration step when the
 > libdrm package has not been selected.

 > WPE WebKit can be built without libdrm support, and it will still work
 > with backends that use other platform-specific methods to handle
 > graphics buffers and/or presenting content onto an output. For example
 > this is the case with wpebackend-rdk configured to use rpi-userland,
 > which uses dispmanx to produce the output instead of DRM/KMS.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 >  package/wpewebkit/wpewebkit.mk | 7 +++++++

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
