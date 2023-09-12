Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D11CA0EC3
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 06:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B91A60FB4;
	Tue, 12 Sep 2023 06:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B91A60FB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HvOkEUjfM3Z8; Tue, 12 Sep 2023 06:08:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB87661060;
	Tue, 12 Sep 2023 06:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB87661060
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E64451BF3A3
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 06:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C346D418EF
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 06:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C346D418EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fDDaZni91BER for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 06:08:03 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B384418E1
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 06:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B384418E1
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE166C001E;
 Tue, 12 Sep 2023 06:06:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qfwXi-00G0EM-VY; Tue, 12 Sep 2023 08:06:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Nicolas Boichat via buildroot <buildroot@buildroot.org>
References: <20230812010118.2654653-1-drinkcat@google.com>
Date: Tue, 12 Sep 2023 08:06:34 +0200
In-Reply-To: <20230812010118.2654653-1-drinkcat@google.com> (Nicolas Boichat
 via buildroot's message of "Sat, 12 Aug 2023 01:01:17 +0000")
Message-ID: <87cyyo7wnp.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v3 1/1] package/screenfetch: Add upstream
 awk detection patch.
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
Cc: Nicolas Boichat <drinkcat@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Nicolas" == Nicolas Boichat via buildroot <buildroot@buildroot.org> writes:

 > screenfetch requires an "awk" implementation, but upstream would
 > only use an executable called "awk": pick up upstream patch that
 > can autodetect awk implementation, so that "mawk" can be used.

 > Signed-off-by: Nicolas Boichat <drinkcat@google.com>
 > ---

 > Changes v2 -> v3:
 >  - Simply assume that an awk implementation is provided [Arnout Vandecappelle]

 > Changes v1 -> v2:
 >  - Busybox's awk also works, so add that as a possible dependency [Thomas Petazzoni]
 >    - Tried to use "select" instead of "depends" as suggested, but that
 >      creates a circular dependency.
 >  - Fixed boolean logic in "comment" part (&& not ||)

 >  .../0001-Detect-which-awk-to-use.patch        | 783 ++++++++++++++++++
 >  1 file changed, 783 insertions(+)
 >  create mode 100644 package/screenfetch/0001-Detect-which-awk-to-use.patch

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
