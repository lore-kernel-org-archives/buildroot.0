Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADA5C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 08:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D105481E6F;
	Wed,  7 Feb 2024 08:16:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gn4xqm1Q02qg; Wed,  7 Feb 2024 08:16:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7E8E81EFE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7E8E81EFE;
	Wed,  7 Feb 2024 08:16:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 234D31BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 08:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D5C660BBF
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 08:16:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3bczP1wEuDHJ for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 08:16:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 49A1F60AFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49A1F60AFF
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49A1F60AFF
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 08:16:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A338C1BF205;
 Wed,  7 Feb 2024 08:16:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rXd6c-00Erhc-04;
 Wed, 07 Feb 2024 09:16:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: patrick.oppenlander@gmail.com
References: <20240108222957.3567-1-patrick.oppenlander@gmail.com>
Date: Wed, 07 Feb 2024 09:16:29 +0100
In-Reply-To: <20240108222957.3567-1-patrick.oppenlander@gmail.com> (patrick
 oppenlander's message of "Tue, 9 Jan 2024 09:25:51 +1100")
Message-ID: <87bk8s3d0i.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/minisign: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "patrick" == patrick oppenlander <patrick.oppenlander@gmail.com> writes:

 > From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
 > Signed-off-by: Patrick Oppenlander <patrick.oppenlander@gmail.com>
 > ---

 > Changes from v1 (reviewed by Baruch Siach):
 > * host-libsodium dependency was incorrectly on to the target dependencies list.

./utils/check-package points out a few minor issues:

package/Config.in:1572: Packages in: menu "Crypto",
                        are not alphabetically ordered;
                        correct order: '-', '_', digits, capitals, lowercase;
                        first incorrect package: minisign
package/minisign/Config.in:6: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
package/minisign/Config.in.host:4: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

You put it in Libraries/Crypto, but I isn't a library, so I think it
makes more sense to put it under "shell and utilities" like we do for gnupg2.

Committed with those issues fixed and an entry in DEVELOPERS added, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
