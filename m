Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC8FC83F2C
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 19:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 634C4414CD;
	Sun,  3 Sep 2023 19:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 634C4414CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id coFz_ONMI5Gv; Sun,  3 Sep 2023 19:32:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82A12414C5;
	Sun,  3 Sep 2023 19:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82A12414C5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D2F231BF3C8
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 19:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACFE860EDE
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 19:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACFE860EDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iae_VlYV36A6 for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 19:32:24 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B102160E91
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 19:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B102160E91
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47A1B1BF203;
 Sun,  3 Sep 2023 19:32:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qcspX-00328i-7G; Sun, 03 Sep 2023 21:32:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230902221217.3577073-1-thomas.petazzoni@bootlin.com>
Date: Sun, 03 Sep 2023 21:32:19 +0200
In-Reply-To: <20230902221217.3577073-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Sun, 3 Sep 2023 00:12:17 +0200")
Message-ID: <87sf7vjbng.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 4.1.10
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > 4.1.9 is affected by CVE-2023-36053, and 4.1.10 was released to fix
 > it. The changes between 4.1.9 and 4.1.10 are just:

 > f9a14b8f0668029fb7e0aebcae57b60dcec4a529 (tag: 4.1.10) [4.1.x] Bumped version for 4.1.10 release.
 > beb3f3d55940d9aa7198bf9d424ab74e873aec3d [4.1.x] Fixed CVE-2023-36053
 > -- Prevented potential ReDoS in EmailValidator and URLValidator.
 > 3b48fe413f91612fb8c43fe9d489860d10c84bf7 [4.1.x] Added stub release notes for 4.1.10 and 3.2.20.
 > 0e5948b8df5d25deb48a505cbf16f010d9dc603c [4.1.x] Fixed
 > MultipleFileFieldTest.test_file_multiple_validation() test if Pillow
 > isn't installed.
 > 66e1e9b006618ba00e804d18bd90d3a9e94801b3 [4.1.x] Added CVE-2023-31047 to security archive.
 > d1385cc51b142b05b21b721d9d68fc461bc7241f [4.1.x] Post-release version bump.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
