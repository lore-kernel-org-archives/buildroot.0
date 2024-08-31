Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A3DCD13D8
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 13:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6925040065;
	Sat, 31 Aug 2024 13:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1qD527APvDZ; Sat, 31 Aug 2024 13:21:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40B04400C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40B04400C5;
	Sat, 31 Aug 2024 13:21:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 582551BF593
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 13:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46175606FD
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 13:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jMR2BmMxSr6s for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 13:21:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D598A606FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D598A606FA
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D598A606FA
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 13:21:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D70F1BF203;
 Sat, 31 Aug 2024 13:20:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1skO2D-00EoRG-2l;
 Sat, 31 Aug 2024 15:20:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240715160555.6e88961e@windsurf> <87r0a994or.fsf@dell.be.48ers.dk>
 <20240828154253.206391b0@windsurf> <87ttf47nr6.fsf@dell.be.48ers.dk>
 <20240829234416.4131264b@windsurf> <87le0e32jm.fsf@dell.be.48ers.dk>
 <20240830172920.0ede0f66@windsurf>
Date: Sat, 31 Aug 2024 15:20:57 +0200
In-Reply-To: <20240830172920.0ede0f66@windsurf> (Thomas Petazzoni's message of
 "Fri, 30 Aug 2024 17:29:20 +0200")
Message-ID: <87r0a4zv46.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
Cc: michael@amarulasolutions.com, Xuanhao Shi <X15000177@gmail.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

>> Anyway, I find bmap a bit half-baked, E.G. rather than wasting time (and
 >> space) compressing and decompressing all the holes that are then just
 >> ignored it would make more sense to have a file format encoding the
 >> holes (E.G. tar --sparse or something custom), then optionally compress
 >> that for transmission and have something small and simple (E.G. not in
 >> python) on the host/target to write it to a device.

 > The Android sparse image format looks like to be what you want.
 > See https://2net.co.uk/tutorial/android-sparse-image-format. There are some
 > C/C++ tools at https://android.googlesource.com/platform/system/core/+/master/libsparse/
 > to generate/manipulate Android sparse images.

Ahh yes, that looks more sensible than the bmap stuff - Thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
