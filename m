Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3981C28B2F
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 18:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66B8F40B68;
	Tue, 11 Mar 2025 18:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ueeXjqvw-mBd; Tue, 11 Mar 2025 18:15:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E85040C0D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E85040C0D;
	Tue, 11 Mar 2025 18:15:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F13EA1DA
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 18:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0B3460705
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 18:15:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKvsJlVN5VMq for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 18:15:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D62D60817
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D62D60817
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D62D60817
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 18:15:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02EE644396;
 Tue, 11 Mar 2025 18:15:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ts48Q-004GZZ-0g;
 Tue, 11 Mar 2025 19:15:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: buildroot@buildroot.org,  Kieran Bingham
 <kieran.bingham@ideasonboard.com>,  Marcus Folkesson
 <marcus.folkesson@gmail.com>,  Quentin Schulz <quentin.schulz@cherry.de>
References: <20250311-libcamera-qt6-v1-1-4897aadc6fe3@cherry.de>
Date: Tue, 11 Mar 2025 19:15:22 +0100
In-Reply-To: <20250311-libcamera-qt6-v1-1-4897aadc6fe3@cherry.de> (Quentin
 Schulz's message of "Tue, 11 Mar 2025 12:48:53 +0100")
Message-ID: <87ldtbfn7p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddvledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepkeegffdtieevkeejheevteeludetveeffedutedvkeefjeehiedtvdfhkeffueetnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehfohhsshdosghuihhlughrohhothestdhlvghilhdrnhgvthdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepkhhivghrrghnrdgsihhnghhhrghmsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehmrghrtghushdrfhholhhkvghsshhonhesghhmrghilhdrtghom
 hdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvg
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libcamera: force-disable qcam for
 now
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

>>>>> "Quentin" == Quentin Schulz <foss+buildroot@0leil.net> writes:

 > From: Quentin Schulz <quentin.schulz@cherry.de>
 > qcam is based on Qt6 since commit 71aa3ceec30b ("apps: qcam: Port to Qt
 > 6") which is part of the v0.3.1 release.

 > qcam being enabled when BR2_PACKAGE_QT5BASE_WIDGETS symbol is defined
 > breaks the build as it's missing the qt6 dependencies.

 > The migration to Qt 6 for the Buildroot package isn't straightforward
 > though as we're hitting a meson bug[1].

 > For now, let's just always disable qcam until we can get everything
 > fixed and migrated properly.

 > [1] https://github.com/mesonbuild/meson/issues/13018

 > Fixes: 72757d111a5d ("package/libcamera: bump to version 0.3.2")
 > Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Committed after adding an autobuilder reference, thanks.

> ---
 > This is suboptimal solution to unbreaking Buildroot builds of libcamera
 > when Qt5 Widgets are enabled but that should do for Buildroot 2025.02
 > release.

 > We should ideally work on adding proper support for qcam in a later
 > commit, once the issue reported in
 > https://github.com/mesonbuild/meson/issues/13018 is either fixed or
 > worked around in Buildroot.

 > FWIW, I went as far as:

 > ```
 > ifeq ($(BR2_PACKAGE_QT6BASE_WIDGETS)$(BR2_PACKAGE_QT6_OPENGL),yy)
 > LIBCAMERA_CONF_OPTS += -Dqcam=enabled
 > LIBCAMERA_DEPENDENCIES += qt6base
 > else
 > LIBCAMERA_CONF_OPTS += -Dqcam=disabled
 > endif
 > ```

 > as Qt6 OpenGL module seems required now. Additionally, the Qt6 tools
 > dependency is doing nothing so it can be removed. It actually never did
 > anything but turn a check from meson from red to green in the configure
 > step, the binaries with and without Qt tools (qt5 or qt6) were always
 > identical to the bit.

Thanks for investigating!


 > There are also a number of other changes we should be making to the
 > recipe as libcamera is extended without knobs if libdrm, libsdl2,
 > libjpeg, libdw and/or libunwind are provided. So we should add those to
 > LIBCAMERA_DEPENDENCIES if they are part of the build, to make builds
 > reproducible.

Will you send patches for that as well?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
