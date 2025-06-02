Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1144C54FB3
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 12:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A8124083A;
	Mon,  2 Jun 2025 12:12:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OKh1I520DcmV; Mon,  2 Jun 2025 12:12:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F97940840
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F97940840;
	Mon,  2 Jun 2025 12:12:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FE63127
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 12:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01326612D8
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 12:12:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rkvSsLPEPqAs for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 12:12:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EBF5C60B8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBF5C60B8B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBF5C60B8B
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 12:12:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 529884391D;
 Mon,  2 Jun 2025 12:12:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uM41w-006c4t-2F;
 Mon, 02 Jun 2025 14:12:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Frager, Neal" <neal.frager@amd.com>
References: <20250530164017.473549-1-neal.frager@amd.com>
 <87h60ypdqi.fsf@dell.be.48ers.dk>
 <SA1PR12MB56150EFB6580E77979B89CD3F062A@SA1PR12MB5615.namprd12.prod.outlook.com>
Date: Mon, 02 Jun 2025 14:12:40 +0200
In-Reply-To: <SA1PR12MB56150EFB6580E77979B89CD3F062A@SA1PR12MB5615.namprd12.prod.outlook.com>
 (Neal Frager's message of "Mon, 2 Jun 2025 11:57:23 +0000")
Message-ID: <87cybmpcjr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefjeeigeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeefueevfeetfeehueffgfeludegfeefffduveeljeejtdduudejvefhgfevledvieenucffohhmrghinhepghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgnecukfhppeekvddrudegfedrleehrddvvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepkedvrddugeefrdelhedrvddvtddphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprghrnhhouhhtsehrnhhouhhtrdgsvgdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihon
 hhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghrrghnughonhdrmhgrihgvrhestgholhhlihhnshdrtghomhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhrpdhrtghpthhtohepnhgvrghlrdhfrhgrghgvrhesrghmugdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: bump to
 xilinx_v2025.1
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Frager," == Frager, Neal <neal.frager@amd.com> writes:

 > [AMD Official Use Only - AMD Internal Distribution Only]
 > Hi Peter,

 >> Bump bootgen to xilinx_v2025.1 release.
 >> With version 2025.1, bootgen executable is now in the build/bin dir, so
 >> the install step is changed accordingly.

 >> It could be interesting to add a shortlog of the (fairly limited) amount
 >> of changes done:

 >> git shortlog --no-merges xilinx_v2024.2..xilinx_v2025.1
 >> Shaik Salauddin (4):
 >> Latest versal specific changes push to main branch for 2025.1
 >> RDI version update to 2025.1
 >> Adding placeholder in build directory for bootgen bin generation
 >> Fix for sdcard bootup failure in zynmp/zynq

 >> bsaihema (2):
 >> merged and restructured code for versal_2ve_2vm and spartanus+
 >> optional data fix for versal_2ve_2vm

 >> Please also document why the LICENSE hash changed, E.G. LICENSE file
 >> changed by a conversion from DOS to UNIX newlines by commit 86b862096bcb
 >> (merged and restructured code for versal_2ve_2vm and spartanus+), no
 >> content change.

 > Thomas was too quick for you this time... ;)
 > https://gitlab.com/buildroot.org/buildroot/-/commit/4850405d8aa2b4f7aeb84a0db7cd3369a727d214

Ahh, sorry - I missed the change on the next branch.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
