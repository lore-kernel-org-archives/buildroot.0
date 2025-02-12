Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7772C02198
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 19:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8473D608D1;
	Wed, 12 Feb 2025 19:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wm_-jhzQ3IIY; Wed, 12 Feb 2025 19:51:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7E8A60A37
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7E8A60A37;
	Wed, 12 Feb 2025 19:51:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 183B31C9
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 19:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF96460A37
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 19:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XlZ-kpB_tCl for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 19:51:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 719BD608D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 719BD608D1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 719BD608D1
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 19:51:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74C2B433F7;
 Wed, 12 Feb 2025 19:51:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tiIlN-00CFnY-1L;
 Wed, 12 Feb 2025 20:51:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org,  linux-amarula@amarulasolutions.com,  Niklas
 Cassel <niklas.cassel@wdc.com>,  Julien Olivain <ju.o@free.fr>
References: <20250212191015.3413693-1-dario.binacchi@amarulasolutions.com>
Date: Wed, 12 Feb 2025 20:51:13 +0100
In-Reply-To: <20250212191015.3413693-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Wed, 12 Feb 2025 20:10:15 +0100")
Message-ID: <87frkjyma6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggeejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpefhvdeijeevveffhfdvteekveevheeggedvudegteduhedvkeegveehueefvdefudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegurghrihhordgsihhnrggttghhihesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghmrghruhhlrgesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepnhhikhhlrghsrdgtrghsshgvl
 hesfigutgdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [RFC PATCH 1/1] package/pkg-download: don't export
 the download command variables
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

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

Hello Dario,

 > Exporting the download variables can cause unfortunate name clashes, as
 > occurred with the SCP variable used by Binman for compiling U-Boot [1].
 > The patch removes the global export of the variables containing the
 > commands used for downloading the packages and passes them as
 > parameters, using the new -C option, to the dl-wrapper, which in turn
 > passes the appropriate download command to the specific script under the
 > support/download directory.

Thanks for the patch, but is this -C option logic even needed? Couldn't
we just pass all of these in the environment to dl-wrapper?

 > [1] https://lore.kernel.org/buildroot/a023971c7c8bfa4826a9a8721500c7ff@free.fr/T/
 > Cc: Julien Olivain <ju.o@free.fr>
 > Suggested-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
