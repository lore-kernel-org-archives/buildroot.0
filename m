Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87192C282DE
	for <buildroot@archiver.kernel.org>; Sun, 16 Mar 2025 20:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A52A600B3;
	Sun, 16 Mar 2025 20:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UK0ceuNJRS7f; Sun, 16 Mar 2025 20:11:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 590DA606BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 590DA606BF;
	Sun, 16 Mar 2025 20:11:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EBB316E
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EB2980F38
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iAVHMhez57IT for <buildroot@buildroot.org>;
 Sun, 16 Mar 2025 20:11:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A533F81E38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A533F81E38
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A533F81E38
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:11:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A03E044344;
 Sun, 16 Mar 2025 20:11:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ttuK8-003xWN-0A;
 Sun, 16 Mar 2025 21:11:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org
References: <20250309220640.213083-1-olteanv@gmail.com>
Date: Sun, 16 Mar 2025 21:11:03 +0100
In-Reply-To: <20250309220640.213083-1-olteanv@gmail.com> (Vladimir Oltean's
 message of "Mon, 10 Mar 2025 00:06:40 +0200")
Message-ID: <87zfhk3fe0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeejheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnheptefgleevffevhedtveegfeejieduudeltdffheeggfelkeetkeetuddthfelieeunecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepohhlthgvrghnvhesghhmrghilhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/util-linux: add uuidd user and group
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

>>>>> "Vladimir" == Vladimir Oltean <olteanv@gmail.com> writes:

 > At rootfs creation time, fakeroot fails as follows:
 > printf 'host/bin/systemctl --root=build/buildroot-fs/ext2/target
 > preset-all\n' >> build/buildroot-fs/ext2/fakeroot
 > (blabla)
 > FAKEROOTDONTTRYCHOWN=1 host/bin/fakeroot -- build/buildroot-fs/ext2/fakeroot
 > rootdir=build/buildroot-fs/ext2/target
 > table='build/buildroot-fs/full_devices_table.txt'
 > ignored spec: h /var/log/journal/%m - - - - +C
 > ignored spec: x /var/tmp/systemd-private-%b-*
 > ignored spec: X /var/tmp/systemd-private-%b-*/tmp
 > ignored spec: x  /var/lib/systemd/coredump/.#core*.%b*
 > ignored spec: z /var/log/journal/%m 2755 root systemd-journal - -
 > ignored spec: z /var/log/journal/%m/system.journal 0640 root systemd-journal - -
 > <stdin>:37: Failed to resolve user 'uuidd': No such process
 > make[1]: *** [fs/ext2/ext2.mk:66: images/rootfs.ext2] Error 65
 > make: *** [Makefile:83: _all] Error 2

 > The error comes from systemctl, which cannot find the uuidd user in
 > the target rootfs, needed for this:

 > /lib/systemd/system/uuidd.service:
 > [Service]
 > ExecStart=/usr/sbin/uuidd --socket-activation --cont-clock
 > Restart=no
 > User=uuidd
 > Group=uuidd

 > Add the uuid user and group in support/scripts/mkusers syntax.

 > Signed-off-by: Vladimir Oltean <olteanv@gmail.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
