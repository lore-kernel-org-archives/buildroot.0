Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B279CDD543
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 16:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E362C4059D;
	Wed, 18 Sep 2024 16:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bzWHIDVXF4hK; Wed, 18 Sep 2024 16:11:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEBF9408C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEBF9408C0;
	Wed, 18 Sep 2024 16:11:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1854B1BF2C9
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 16:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07147610FE
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 16:11:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-bk7Eye7pyx for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 16:11:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DBB5C60E1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBB5C60E1A
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBB5C60E1A
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 16:11:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6E7AC0009;
 Wed, 18 Sep 2024 16:11:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sqxGp-00DDE3-09;
 Wed, 18 Sep 2024 18:11:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
References: <20240822121710.709074-1-buildroot@bubu1.eu>
Date: Wed, 18 Sep 2024 18:11:10 +0200
In-Reply-To: <20240822121710.709074-1-buildroot@bubu1.eu> (Marcus Hoffmann via
 buildroot's message of "Thu, 22 Aug 2024 14:17:09 +0200")
Message-ID: <87wmj9q6w1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/python-sqlparse: security bump to
 version 0.5.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > Changelog:
 > * https://sqlparse.readthedocs.io/en/latest/changes.html#release-0-5-1-jul-15-2024
 > * https://sqlparse.readthedocs.io/en/latest/changes.html#release-0-5-0-apr-13-2024

 > Version 0.5.0 fixes the following security issue [1]:
 > Parsing heavily nested list leads to Denial of Service

 > Build backend switched from flit to hatchling in [2].

 > [1] https://github.com/andialbrecht/sqlparse/security/advisories/GHSA-2m57-hf25-phgg
 > [2] https://github.com/andialbrecht/sqlparse/commit/326a316446c3e091a93950251e3e376ebf0d4127

 > Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
