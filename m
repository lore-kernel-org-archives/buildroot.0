Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F091C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 10:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F5F3607C2;
	Fri,  1 Mar 2024 10:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26r4k4SLy7bS; Fri,  1 Mar 2024 10:10:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E6DF607E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E6DF607E1;
	Fri,  1 Mar 2024 10:10:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F26781BF32C
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF82141749
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:10:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CALKJTU-ab0H for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 10:10:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E179D417A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E179D417A1
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E179D417A1
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 10:10:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3C76C0009;
 Fri,  1 Mar 2024 10:10:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfzqh-006h1E-0W;
 Fri, 01 Mar 2024 11:10:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20240207084503.11109-1-romain.naour@smile.fr>
 <20240207084503.11109-2-romain.naour@smile.fr>
Date: Fri, 01 Mar 2024 11:10:39 +0100
In-Reply-To: <20240207084503.11109-2-romain.naour@smile.fr> (Romain Naour's
 message of "Wed, 7 Feb 2024 09:45:03 +0100")
Message-ID: <875xy69s9s.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 2/2] package/python-bitstring: add
 missing runtime dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > python-bitstring require python-bitarray and python-zlib at runtime
 > since 4.1.0 release [1][2].

 > python-zlib is now needed for the "Experimental support for two 8-bit
 > float types" [2].

 > Fixes:
 > https://gitlab.com/kubu93/buildroot/-/jobs/6114047821

 > [1] https://github.com/scott-griffiths/bitstring/releases/tag/bitstring-4.1.0
 > [2] https://github.com/scott-griffiths/bitstring/commit/70c8af4d8bef557bc7d96f809d37e2c241587dd0

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Cc: James Hilliard <james.hilliard1@gmail.com>
 > ---
 > v2: fix commit log about python-bitstring release (Marcus Hoffmann)
 >     reproduce the issue on gitlab-ci and update the Fixes tag url.

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
