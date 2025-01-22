Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0CAC02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 09:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CB424064B;
	Wed, 22 Jan 2025 09:27:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id htmYfx_nf3SK; Wed, 22 Jan 2025 09:27:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67AA340865
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67AA340865;
	Wed, 22 Jan 2025 09:27:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5752B1DA8
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 09:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36955607B5
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 09:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WhEZxhTj0kmp for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 09:27:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CAB54607E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAB54607E5
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CAB54607E5
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 09:27:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C795E0008;
 Wed, 22 Jan 2025 09:27:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1taX1D-006C0l-2Y;
 Wed, 22 Jan 2025 10:27:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  =?utf-8?Q?Miqu=C3=A8l?= Raynal
 <miquel.raynal@bootlin.com>
References: <20250112-fix_zxing-v1-1-ffd083221fb6@bootlin.com>
Date: Wed, 22 Jan 2025 10:27:27 +0100
In-Reply-To: <20250112-fix_zxing-v1-1-ffd083221fb6@bootlin.com> (Thomas
 Bonnefille via buildroot's message of "Sun, 12 Jan 2025 21:29:13
 +0100")
Message-ID: <87ed0vnqps.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/zxing-cpp: bump to version 2.3.0
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

>>>>> "Thomas" == Thomas Bonnefille via buildroot <buildroot@buildroot.org> writes:

 > This commit bumps the zxing-cpp version to 2.3.0.
 > The compilation of this package has been broken since the bump to v2.2.1
 > when it is compiled with reader support, due to the added patch.

 > This patch was not added upstream, but another set of more generic
 > patches [1] that do not change the API were added instead. The error
 > that the Buildroot patch was fixing no longer exists in 2.3.0.

 > [1]:
 >     - https://github.com/zxing-cpp/zxing-cpp/commit/d0c8f226e22cd978fd42a25a6cff6d65b47ab6e9
 >     - https://github.com/zxing-cpp/zxing-cpp/commit/d979b765a14423f6d7747827b72193a0da9f3030

 > Fixes:
 >     https://autobuild.buildroot.org/results/ba4573a1bcc0110d4d0b45642e07009ec949d66a/build-end.log

 > Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
 > ---
 > This patch doesn't require to be backported to 2024.02 as zxing-cpp
 > wasn't bumped to v2.2.1 yet.

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
