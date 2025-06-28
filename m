Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F02C7EE39
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 20:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD45840887;
	Sat, 28 Jun 2025 20:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEcoHKzL_kCZ; Sat, 28 Jun 2025 20:42:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2941040B2F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2941040B2F;
	Sat, 28 Jun 2025 20:42:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3E3D1C9
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 20:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C97F1605A0
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 20:42:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IdNPp6FR_NVz for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 20:42:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A03D56059F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A03D56059F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A03D56059F
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 20:42:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 347605549; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 28 Jun 2025 20:42:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uVcNM-003v7v-2F;
 Sat, 28 Jun 2025 22:42:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Giulio Benetti
 <giulio.benetti@benettiengineering.com>,  Romain Naour
 <romain.naour@gmail.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250628161620.1866792-1-ju.o@free.fr>
Date: Sat, 28 Jun 2025 22:42:16 +0200
In-Reply-To: <20250628161620.1866792-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Sat, 28 Jun 2025 18:16:20 +0200")
Message-ID: <87bjq71tuf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=FAMZgzCB3vvPQ52qy17cnbpne8Qu61AHj2FMUGMHvXAyT/kiN8tuud6bmjmRbN11uo+sLlqsZknOKo0VpqcjQ/UTlLaGCACgEc/3x0XQcP3uoAAqEgqR0jjhncX38nGy98LxVwHQ3P0Fl4MV3Apa6Iwk2lzrSJXpSCSQlPzzri2OIpN+wm9swBsnV9cn1+4FJKuTt9w5zmKML7J/GhyMZbafRcxfaPM2zRr6DvHk5G/DMh2YXqQBqtjY+xtJOKq6yOgttqqkU5eagV0nuaLV0CIHl0JuTLfsodZIp1RkrHAKAuNlgC/ERnQ6gqRMHSIGe2EAPWYm8U3rWJ4Jed6GLA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=6+g28VFMDYPnzbnT2diqosQ5RUWuuybu9OIIhtIPyqE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=FAMZgzCB
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc/Config.in.host: hide gcc
 version for unsupported CPUs
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

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > When a new gcc version is introduced, for example gcc 15 in
 > commit [1], it should have also added a "depends on
 > !BR2_ARCH_NEEDS_GCC_AT_LEAST_15" to the previous gcc version.

 > This logic is described for external toolchains in commit [2],
 > for example. The internal Buildroot toolchains should have the
 > same logic. This logic existed for previous gcc version. See for
 > example the removal of gcc 12 in commit [3].

 > There is ususally no problem, because all the three latest active gcc

s/ususally/usually/

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
