Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6E9D743D2
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 20:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1988B606DA;
	Wed, 20 Nov 2024 20:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gs2gY_hCqwwv; Wed, 20 Nov 2024 20:39:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23327606EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23327606EC;
	Wed, 20 Nov 2024 20:39:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 62186970
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 20:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F4FB40AEF
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 20:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TGOFRxbYKEYd for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 20:39:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3CF01405CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CF01405CA
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CF01405CA
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 20:39:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E58741C0003;
 Wed, 20 Nov 2024 20:39:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tDrU4-001AjL-0V;
 Wed, 20 Nov 2024 21:39:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Hannah Kiekens
 <hannah.kiekens@mind.be>,  Jesse Van Gavere <jesseevg@gmail.com>,  Roy
 Kollen Svendsen <roykollensvendsen@gmail.com>
References: <20240921080845.18098-1-hannah.kiekens@mind.be>
 <20241029222938.67c80af7@windsurf>
Date: Wed, 20 Nov 2024 21:39:32 +0100
In-Reply-To: <20241029222938.67c80af7@windsurf> (Thomas Petazzoni via
 buildroot's message of "Tue, 29 Oct 2024 22:29:38 +0100")
Message-ID: <87bjy9vdvf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6base: remove
 -DFEATURE_concurrent=OFF from hard coded list
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Sat, 21 Sep 2024 10:08:45 +0200
 > Hannah Kiekens via buildroot <buildroot@buildroot.org> wrote:

 >> It is set by BR2_PACKAGE_QT6BASE_CONCURRENT
 >> 
 >> Signed-off-by: Hannah Kiekens <hannah.kiekens@mind.be>
 >> ---
 >> package/qt6/qt6base/qt6base.mk | 1 -
 >> 1 file changed, 1 deletion(-)

 > Well spotted, thanks!

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
