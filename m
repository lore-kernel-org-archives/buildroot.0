Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EA8C54E67
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 19:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3642D6061F;
	Sun, 17 Mar 2024 19:39:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fE6i6gllM1bl; Sun, 17 Mar 2024 19:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6320260635
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6320260635;
	Sun, 17 Mar 2024 19:39:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3D131BF3DC
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 19:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC004817C3
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 19:39:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VGSwInhAJjEb for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 19:39:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 299E981763
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 299E981763
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 299E981763
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 19:39:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6874E60003;
 Sun, 17 Mar 2024 19:39:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rlwMF-002QJy-0W;
 Sun, 17 Mar 2024 20:39:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240221181439.1113724-1-fontaine.fabrice@gmail.com>
Date: Sun, 17 Mar 2024 20:39:47 +0100
In-Reply-To: <20240221181439.1113724-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 21 Feb 2024 19:14:39 +0100")
Message-ID: <87frwoir5o.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/s390-tools: disable cargo
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
Cc: Alexander Egorenkov <egorenar@linux.ibm.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Set HAVE_CARGO=0 to avoid the following build failures raised since bump
 > to version 2.29.0 in commit 68df20336664d4d0b1a9d8d0285d23eba631845a and
 > https://github.com/ibm-s390-linux/s390-tools/commit/e6add997ebbcd967734391da8a8987c7926e168f:

 > error: could not compile `pvsecret` (bin "pvsecret") due to previous error

 > [...]

 > ERROR: architecture for "/usr/bin/pvsecret" is "AArch64", should be "IBM S/390"

 > Fixes: 68df20336664d4d0b1a9d8d0285d23eba631845a
 >  - http://autobuild.buildroot.org/results/22035cb4d8e251f9930a7d529b91b128919252bb
 >  - http://autobuild.buildroot.org/results/99be6d3b2bab7c952ce02853f54924c5219aecc1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
