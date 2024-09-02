Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F63ECD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 15:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F69A804DB;
	Mon,  2 Sep 2024 15:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQKs9gPEtqiN; Mon,  2 Sep 2024 15:02:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 535A280F1B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 535A280F1B;
	Mon,  2 Sep 2024 15:02:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 915721BF31C
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 15:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E85340177
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 15:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLK71lBumkgV for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 15:02:53 +0000 (UTC)
X-Greylist: delayed 12889 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 02 Sep 2024 15:02:53 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9658740003
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9658740003
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=159.69.201.130;
 helo=mail.3ffe.de; envelope-from=michael@walle.cc; receiver=<UNKNOWN> 
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9658740003
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 15:02:53 +0000 (UTC)
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id A99736D;
 Mon,  2 Sep 2024 17:02:50 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 02 Sep 2024 17:02:50 +0200
To: Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <a9865fde-0c09-42dd-8cd2-d174412dce28@gmx.de>
References: <20240902112735.728574-1-michael@walle.cc>
 <a9865fde-0c09-42dd-8cd2-d174412dce28@gmx.de>
Message-ID: <9640293d17286595101e07a82a66d44f@walle.cc>
X-Sender: michael@walle.cc
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=walle.cc; s=mail2022082101; t=1725289370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RRW9gy80TaaZrAmDj4dJmnjeMyChn0ojOaxN3cpW8/k=;
 b=KRP2m+DBkdoyVDouFAOjpL8uQMnM2j21bkhxq+W/SllTF7PY7t3VN5TsoD4iOwGVUo16b8
 F+iZPTsjyxOt9xi9DXR9qjkdRjmcm6TBhKGgtwjVmFhz93RUE8DzWSPzdXgXMG9/wxWUcd
 xn9oO30owxy+K2B6eiXvB0Vji6TYaM6hZGHRffJGLws9olg72dElLhT+5g98bYZvYXHAPN
 S2PRR9F6urS6zgF3y8Dl1AR/k9jM5gluqFEBh9RUTkbfyjh+dsH3reSsexHV8dnUE4xRZB
 J0j4RHSwx95pZ29HyHIx1Vr+7+Xo270NHhOnAsn7CbAIIiajGcvVqvlzb5qjpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=walle.cc
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2022082101 header.b=KRP2m+DB
Subject: Re: [Buildroot] [PATCH v2] linux: add support for device tree
 overlays
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
From: Michael Walle via buildroot <buildroot@buildroot.org>
Reply-To: Michael Walle <michael@walle.cc>
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Martin Bark <martin@barkynet.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

> This looks like the DTBOs will be installed to $BINARIES_DIR along with
> the DTBs. At least on RPi platforms it'd be preferable to be able to 
> put
> them in an overlays/ directory, to make it easier to create the
> structure expected by the firmware in a genimage config without
> templating. I don't know how common this is across other platforms that
> use DT overlays.
> 
> Would it be practical to add an option to install DTBOs in a
> (configurable) subdirectory?

Isn't that what is the BR2_ROOTFS_*_SCRIPT are for? I.e. to customize
the final image to your/the board likings?

-michael
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
