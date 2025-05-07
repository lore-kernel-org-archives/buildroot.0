Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F554C3ABC0
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 21:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10E626134B;
	Wed,  7 May 2025 21:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xqmrd1C9MOWV; Wed,  7 May 2025 21:19:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A3CF612E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A3CF612E8;
	Wed,  7 May 2025 21:19:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 55C5815A
 for <buildroot@buildroot.org>; Wed,  7 May 2025 21:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4731B83DBE
 for <buildroot@buildroot.org>; Wed,  7 May 2025 21:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8W2I1OMgaCFj for <buildroot@buildroot.org>;
 Wed,  7 May 2025 21:19:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F272383DC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F272383DC5
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F272383DC5
 for <buildroot@buildroot.org>; Wed,  7 May 2025 21:19:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02DF143A0C;
 Wed,  7 May 2025 21:19:02 +0000 (UTC)
Date: Wed, 7 May 2025 23:19:02 +0200
To: buildroot@buildroot.org
Message-ID: <20250507231902.14cbc9aa@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffduudeflefhuddtleekgeeiudetheethfekvdfhvdefudelieektdegleegvdejnecuffhomhgrihhnpeguvggsihgrnhdrohhrghdpghhnuhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduleemledvtdgsmeegjedttdemrgdvfheimegukegukeemhegtvggtmegshegvgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeelvddtsgemgeejtddtmegrvdhfieemugekugekmeehtggvtgemsgehvgegpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegrrhhnohhuthesrhhnohhuthdrs
 ggvpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhrpdhrtghpthhtohepthhhohhmrghsrdhpvghrrghlvgesmhhinhgurdgsvg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1746652743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=a3jAsh3+Lft9s1ZRDtW8Qx6G4JKChFLBmchjgAbmntc=;
 b=NwJ+SuC2ftMfDQP8ovYtvdrdSCTYteZelYFb7n7ZHV9jERrdYZVClCC+ziTuk+4dX51ZvU
 GrkWacwGuspzpdbUvYrfdu4EA78lmxShFwbNVjH9PIXAckfvgyQf0got0zaPqApfJUQIzG
 +u3+BBgl0pgM1NbJEjLSjUK6qQ+WE6ecoEqH7HxlXxmHKGDydk7i/WN/yV8avA6Vx7ceD3
 kNmHbqddYsx8opspyNPkmeLHhwy5Q9ekCgr8lOZUuA0AEDx/DSJYLjmqEH1QRS6D1Pk1sU
 8AxAAylt//GSHYXdKIOU+5PpW38YSDWDRJTq2Z1XO/7c3c0mScJBm64ughlHRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NwJ+SuC2
Subject: [Buildroot] Grub security situation
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>, Julien Olivain <ju.o@free.fr>,
 Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

The latest pkg-stats scan reported to me a number of grub2 security
issues:

                         grub2 | CVE-2024-45778   | https://security-tracker.debian.org/tracker/CVE-2024-45778  
                         grub2 | CVE-2024-45782   | https://security-tracker.debian.org/tracker/CVE-2024-45782  
                         grub2 | CVE-2024-45779   | https://security-tracker.debian.org/tracker/CVE-2024-45779  
                         grub2 | CVE-2024-45780   | https://security-tracker.debian.org/tracker/CVE-2024-45780  
                         grub2 | CVE-2025-0678    | https://security-tracker.debian.org/tracker/CVE-2025-0678   

Looking at that in some details, there are in fact a LOT more CVEs:

  https://lists.gnu.org/archive/html/grub-devel/2025-02/msg00024.html

Many of them are not reported by pkg-stats because NVD has not
annotated those CVEs (meh).

Now when it becomes a bit tricky is that those CVEs are fixed by 73
patches. All of them have been applied upstream, but they are
apparently not trivial to backport on grub 2.12.

See Arch people complaining here:

  https://lists.gnu.org/archive/html/grub-devel/2025-02/msg00124.html
  https://lists.gnu.org/archive/html/grub-devel/2025-02/msg00098.html

There are currently 284 commits in grub's master on top of the 2.12
version we're using. Backporting the 73 patches fixing the security
issues seems complicated, and having all 284 commits as patches in
Buildroot also seems not very practical.

So the only solution that I can see right now is to used grub's master
branch (of course with a fixed commit). Of course, for 2025.02, this
means we would bump grub to a newer version that not only has security
fixes, but also a whole bunch of other random changes. But that's how
grub is maintained, and I'm not sure what we can do about it.

Opinions? Thoughts? Suggestions?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
