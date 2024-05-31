Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D75C27C44
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 17:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85012423E6;
	Fri, 31 May 2024 17:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sD_Z4ooC5F3Y; Fri, 31 May 2024 17:32:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 511DB4242F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 511DB4242F;
	Fri, 31 May 2024 17:32:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 311CB1D556F
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 17:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A1C241739
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 17:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 070FO1Pc2HHN for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 17:32:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 16FFA4172C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16FFA4172C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16FFA4172C
 for <buildroot@buildroot.org>; Fri, 31 May 2024 17:32:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C89F1BF204;
 Fri, 31 May 2024 17:32:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sD679-00FJ63-16;
 Fri, 31 May 2024 19:32:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20240527190607.61429-1-giulio.benetti@benettiengineering.com>
Date: Fri, 31 May 2024 19:32:27 +0200
In-Reply-To: <20240527190607.61429-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Mon, 27 May 2024 21:06:07 +0200")
Message-ID: <87y17plwes.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/mongoose: bump to version 7.14
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > https://github.com/cesanta/mongoose/releases/tag/7.14
 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > ---
 >  package/mongoose/mongoose.hash | 4 ++--
 >  package/mongoose/mongoose.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
 > index 716833eeed..82eb593297 100644
 > --- a/package/mongoose/mongoose.hash
 > +++ b/package/mongoose/mongoose.hash
 > @@ -1,3 +1,3 @@
 >  # Locally computed:
 > -sha256  5c9dc8d1d1762ef483b6d2fbf5234e421ca944b722225bb533d2d0507b118a0f  mongoose-7.13.tar.gz
 > -sha256  4ba646f5a7012d8b52f3a74398e446f56960dde0572f7241a2215430da5dd5a2  LICENSE
 > +sha256  7c4aecf92f7f27f1cbb2cbda3c185c385f2b7af84f6bd7c0ce31b84742b15691  mongoose-7.14.tar.gz
 > +sha256  7e2bc5dabbc27b431a530540161ba860906f12109d4b84b1e4bc8879f1afc3bc  LICENSE
 > \ No newline at end of file

Don't drop the final newline, as also pointed out by check-package:

package/mongoose/mongoose.hash:3: missing newline at end of file

Committed to next with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
