Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65547CFB442
	for <buildroot@archiver.kernel.org>; Mon,  7 Oct 2024 06:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 323D980BCB;
	Mon,  7 Oct 2024 06:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vq9WX9E_DXof; Mon,  7 Oct 2024 06:33:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4867980C42
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4867980C42;
	Mon,  7 Oct 2024 06:33:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31EAC1BF471
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 06:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 211EC606DC
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 06:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JA35cb626uyB for <buildroot@lists.busybox.net>;
 Mon,  7 Oct 2024 06:33:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 35ABE606B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35ABE606B0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35ABE606B0
 for <buildroot@buildroot.org>; Mon,  7 Oct 2024 06:33:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 131F260002;
 Mon,  7 Oct 2024 06:33:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sxhJT-003oZu-1Z;
 Mon, 07 Oct 2024 08:33:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Ismael Luceno <ismael@iodev.co.uk>
References: <20241006213134.2423-2-ismael@iodev.co.uk>
Date: Mon, 07 Oct 2024 08:33:47 +0200
In-Reply-To: <20241006213134.2423-2-ismael@iodev.co.uk> (Ismael Luceno's
 message of "Sun, 6 Oct 2024 23:31:33 +0200")
Message-ID: <87v7y4ifqs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/mawk: bump version to 1.3.4-20240905
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

>>>>> "Ismael" == Ismael Luceno <ismael@iodev.co.uk> writes:

 > Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
 > ---
 >  package/mawk/mawk.hash | 3 ++-
 >  package/mawk/mawk.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 2 deletions(-)

 > diff --git a/package/mawk/mawk.hash b/package/mawk/mawk.hash
 > index 31a74cab606e..227c2b1b17d2 100644
 > --- a/package/mawk/mawk.hash
 > +++ b/package/mawk/mawk.hash
 > @@ -1,2 +1,3 @@
 > -sha256  a8e319a83744b1f1fb6988dfa189d61887f866e9140cc9a49eb003b2b0655e88  mawk-1.3.4-20240123.tgz
 > +sha256  a39967927dfa1b0116efc45b944a0f5b5b4c34f8e842a4b223dcdd7b367399e0  mawk-1.3.4-20240905.tgz
 >  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 > +

Dropped this empty line and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
