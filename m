Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B243AD32D9A
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 12:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D136606EC;
	Tue, 12 Nov 2024 12:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGT3BDFysb5J; Tue, 12 Nov 2024 12:34:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 944776074D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 944776074D;
	Tue, 12 Nov 2024 12:34:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A7026C
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 12:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0833B809F6
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 12:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEPMbBOBr2QT for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 12:34:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C83F809D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C83F809D3
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C83F809D3
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 12:34:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4EA8A240005;
 Tue, 12 Nov 2024 12:34:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tAq6L-00CNsZ-2Q;
 Tue, 12 Nov 2024 13:34:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
References: <20240815135649.462812-1-ju.o@free.fr>
 <20241026184007.0d0bd27d@windsurf>
Date: Tue, 12 Nov 2024 13:34:33 +0100
In-Reply-To: <20241026184007.0d0bd27d@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sat, 26 Oct 2024 18:40:07 +0200")
Message-ID: <87cyj0aaw6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add unbound runtime
 test
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Thu, 15 Aug 2024 15:56:49 +0200
 > Julien Olivain <ju.o@free.fr> wrote:

 >> Signed-off-by: Julien Olivain <ju.o@free.fr>
 >> ---
 >> Patch tested in:
 >> https://gitlab.com/jolivain/buildroot/-/jobs/7592103034
 >> ---
 >> DEVELOPERS                                    |  2 +
 >> support/testing/tests/package/test_unbound.py | 79 +++++++++++++++++++
 >> .../rootfs-overlay/etc/unbound/unbound.conf   | 17 ++++
 >> 3 files changed, 98 insertions(+)
 >> create mode 100644 support/testing/tests/package/test_unbound.py
 >> create mode 100644 support/testing/tests/package/test_unbound/rootfs-overlay/etc/unbound/unbound.conf

 > Applied to master, thanks.

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
