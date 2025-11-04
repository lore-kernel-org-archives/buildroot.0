Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07DCCCF9E3
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 07:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B71A580E28;
	Tue,  4 Nov 2025 07:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AaGzYNutr3yB; Tue,  4 Nov 2025 07:35:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F98580D5F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F98580D5F;
	Tue,  4 Nov 2025 07:35:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 892D8222
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 07:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B68660EE8
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 07:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MhDMHPpGzWts for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 07:35:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 732CC60EED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 732CC60EED
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 732CC60EED
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 07:35:07 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1881145316; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 04 Nov 2025 07:35:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vGBZE-0037XX-0S;
 Tue, 04 Nov 2025 08:35:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251103203153.213444-1-bernd@kuhls.net>
Date: Tue, 04 Nov 2025 08:35:00 +0100
In-Reply-To: <20251103203153.213444-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 3 Nov 2025 21:31:53 +0100")
Message-ID: <871pme9rob.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=njO6MNKHSpdQt1oA8ikyG1hqAmo11EfxO9whuFObrWliL6UC+/uDK5pAoi51xfHvgCHWF/f5Z/rCL/PcVOYX+MReGndxke28QImaIptDrhShQS9tBJlVk5uE84oxDarp2LJOcKAgpvg1MFTKGcvKKn0WP9We3xqvYAY4zz2XYtkNjIC7zkd02B7yypgGlmwDcTBYJxtpUdfs5wwTAUQlQHFKDnOrXTqvbhHZI+1BjSLrFAsFUALJz0A/Kan8YDL9z1HL1W6jXQzjbmL5N7s8eTwNwP52tBWlxyTQKB8ioW34y+eFL3Yg/nmQgW651g/du/+6LHgXzX4luIzt/BIYsg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=y33gVSFzfXMBISFyXj4MATxwZ1wefQpzbimKfa46ZNU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=njO6MNKH
Subject: Re: [Buildroot] [PATCH 1/1] package/libcap: bump version to 2.77
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Release notes:
 > https://sites.google.com/site/fullycapable/release-notes-for-libcap#h.mr55t4z9vzea

 > Removed all patches because they are included in this release.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
