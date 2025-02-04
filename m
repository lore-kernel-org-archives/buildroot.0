Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6726C02196
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 13:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4D126006A;
	Tue,  4 Feb 2025 13:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJRc8d1aHbuz; Tue,  4 Feb 2025 13:14:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1E056089A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1E056089A;
	Tue,  4 Feb 2025 13:14:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3305185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C524B60AE8
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I43iPo5jcTLF for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 13:14:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A3536089A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A3536089A
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A3536089A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:14:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4FA24426B;
 Tue,  4 Feb 2025 13:14:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tfIl8-00FoW6-0C;
 Tue, 04 Feb 2025 14:14:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20250128202823.1905913-1-ju.o@free.fr>
Date: Tue, 04 Feb 2025 14:14:33 +0100
In-Reply-To: <20250128202823.1905913-1-ju.o@free.fr> (Julien Olivain's message
 of "Tue, 28 Jan 2025 21:28:23 +0100")
Message-ID: <87ed0donra.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepgefhfedtvdfhheehtedvhfdufefhheekkefftedtudejudehfffhffevgeejieegnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgpdhgihhtlhgrsgdrtghomhdpghhithhhuhgsrdgtohhmnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package/util-linux: fix libuuid
 build without pthread
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Since Buildroot commit [1], util-linux libuuid is failing to build
 > with uclibc toolchains, when there is no thread support
 > (that is, when BR2_PTHREADS_NONE=y).

 > Builds are failing with error:

 >     libuuid/src/gen_uuid.c:83:10: fatal error: pthread.h: No such file or directory
 >        83 | #include <pthread.h>
 >           |          ^~~~~~~~~~~

 > This failure is due to the upstream commit [2], which introduced the
 > pthread dependency.

 > This commit fixes the issue by adding package patches, disabling
 > the uuidd cache in case the libptread (or the pthread_atfork function)
 > is not available.

 > Fixes:
 > https://autobuild.buildroot.org/results/e5856cf6f3b8512ededa17d20db2b330a478dd8e/

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/f14929c657a7b1794dcd39ac469d2ad826465d98
 > [2] https://github.com/util-linux/util-linux/commit/25bd5396ab700623134b491f42a3280556cb674c

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Changes v1 -> v2:
 > changed package patches:
 > v1 was using https://github.com/util-linux/util-linux/pull/3375
 > v2 is using https://github.com/util-linux/util-linux/pull/3383
 > ---
 > Patch tested in:
 > https://gitlab.com/jolivain/buildroot/-/pipelines/1645583168

 > Note: there is two build failures, unrelated to this patch.
 > ---
 >  .../0002-c.h-consolidate-THREAD_LOCAL.patch   | 65 +++++++++++++++
 >  ...ine-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch | 47 +++++++++++
 >  .../0004-meson-add-HAVE_LIBPTHREAD.patch      | 27 ++++++

I guess the meson patch is not strictly needed, but OK - Maybe makes
more sense to use the entire patch series and it will go away anyway
once we move to the next release.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
