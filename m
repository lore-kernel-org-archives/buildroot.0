Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFA3E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 19:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C4D4605D1;
	Sun, 29 Dec 2024 19:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pT6p9WpdBSHT; Sun, 29 Dec 2024 19:59:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A58E3605E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A58E3605E5;
	Sun, 29 Dec 2024 19:59:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4053ECA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 19:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 206D8605E5
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 19:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YclQ68-1RBv0 for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 19:59:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 14430605D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14430605D1
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14430605D1
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 19:59:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49287C0002
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 19:59:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tRzRI-00EbbW-1t
 for buildroot@buildroot.org; Sun, 29 Dec 2024 20:59:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20241216134631.491836-1-peter@korsgaard.com>
Date: Sun, 29 Dec 2024 20:59:04 +0100
In-Reply-To: <20241216134631.491836-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 16 Dec 2024 14:46:30 +0100")
Message-ID: <87cyhai7lj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/netatalk: security bump to version
 3.1.19
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2024-38439: Netatalk 3.2.0 has an off-by-one error and resultant
 > heap-based buffer overflow because of setting ibuf[PASSWDLEN] to '\0' in
 > FPLoginExt in login in etc/uams/uams_pam.c.

 > https://github.com/advisories/GHSA-pcmr-ff73-xcj5

 > CVE-2024-38440: Netatalk 3.2.0 has an off-by-one error and resultant
 > heap-based buffer overflow because of incorrectly using FPLoginExt in
 > BN_bin2bn in etc/uams/uams_dhx_pam.c.

 > https://github.com/advisories/GHSA-52mm-rqxx-gfq6

 > CVE-2024-38441: Netatalk 3.2.0 has an off-by-one error and resultant
 > heap-based buffer overflow because of setting ibuf[len] to '\0' in FPMapName
 > in afp_mapname in etc/afp/directory.c.

 > https://github.com/advisories/GHSA-j764-4v6h-pqp7

 > Release notes:
 > https://github.com/Netatalk/netatalk/releases/tag/netatalk-3-1-19

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
