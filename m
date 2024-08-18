Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA0DC52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 12:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3828F80967;
	Sun, 18 Aug 2024 12:44:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2-j-toT89rg; Sun, 18 Aug 2024 12:44:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31D188055D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31D188055D;
	Sun, 18 Aug 2024 12:44:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 558421BF47F
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 12:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EFE080509
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 12:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYCZheFDE0oD for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 12:44:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 15C96804EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15C96804EF
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15C96804EF
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 12:44:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBDE6240006
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 12:44:29 +0000 (UTC)
Date: Sun, 18 Aug 2024 14:44:28 +0200
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20240818144428.7e5078d6@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723985070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JNtthyXxBnRsi2E6bMGvEr4ZEk5iwk0mus10evlEf9w=;
 b=p2iTcaegt8t1D+LH/2RRxUWl29IaRgtoSaZ6lY7lTygxU7DbkN67hpy3J4Je2oI8392oUn
 ahCmYsjtDO35CU2qV38phTduZfLxTcPvxyASD24LYoYgI2/TWk5ZJqF9vRPl6or8EKFzhr
 MtUElugn5lg3dgAvYcSQ146Xp0OBBvt/MWnL/uML1foQErupq3fXuwWAScHcX++teAOWK3
 RS06fV+meZmuDgIGistjGGoYmi/p0TWJCctxjtTfy/u+SmOsPJQXc/ujO/8TpZI5atjlHD
 rLp1WtAdvz6I8KjcynK9iV5vGMfVD8XmRvX8CBGDVHQgbhYQC89QuGj6woTLqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p2iTcaeg
Subject: [Buildroot] Autobuild server migrated
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

We have migrated autobuild.buildroot.org to a new server. The DNS
entries have just been updated by Peter, so it might take a little
while for you to have the new DNS entry. The new server IP address is
138.201.205.61, the old server IP address is 94.23.254.152.

The old server was a super old dual core Intel(R) Atom(TM) CPU D425
machine, with only a spinning hard drive. It was really, really slow.
Also, it was owned/rented by me personally.

The new server is a 4 cores (x2 threads) Intel(R) Xeon(R) CPU E3-1275
v5 @ 3.60GHz machine, with NVMe storage, that the Buildroot Association
is renting (please become a member of the association to support it, or
ask your company to sponsor).

The new server is therefore much more responsive, especially when
searching through build results. A few hints for those of you who may
not be familiar:

- You can create some search queries by manipulating the URL. For
  example:

  http://autobuild.buildroot.org/?reason=host-gcc-final%

  will list all build failures related to *any* version of
  host-gcc-final (% acts as a wildcard)

  http://autobuild.buildroot.net/?reason=host-gcc-final%&arch=powerpc64le

  will list all build failures related to any version of
  host-gcc-final, which occurred on powerpc64le

  You can also combine that with
  &libc=musl&subarch=power8&branch=master for example

- http://autobuild.buildroot.net/search.php provides much more advanced
  search capabilities. Most notably, you can search build results based
  on config options. You can for example search all build results that
  have BR2_PACKAGE_SYSTEMD=y, or any other option.

  This is particularly useful if you are looking at a package build
  failure, and wondering if this package was ever built as part of a
  fully successful build.

  This search used to be painfully slow on the old server. It is now
  still a bit slow, but much more usable.

Back to the server: we intend to migrate the official web site
(https://www.buildroot.org) to this new server, and also our
backup mirror (https://sources.buildroot.net), in an effort
to consolidate our infrastructure.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
