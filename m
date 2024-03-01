Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDFEC5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 10:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15D466066B;
	Fri,  1 Mar 2024 10:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6f7NzmOwCnMO; Fri,  1 Mar 2024 10:10:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43D35607BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43D35607BD;
	Fri,  1 Mar 2024 10:10:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D56D1BF32C
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 482B341749
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 10:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CCB3okP3BOn8 for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 10:10:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3233C4149F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3233C4149F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3233C4149F
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 10:10:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA9E12000D;
 Fri,  1 Mar 2024 10:10:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfzqZ-006h0q-0D;
 Fri, 01 Mar 2024 11:10:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20240207084503.11109-1-romain.naour@smile.fr>
Date: Fri, 01 Mar 2024 11:10:31 +0100
In-Reply-To: <20240207084503.11109-1-romain.naour@smile.fr> (Romain Naour's
 message of "Wed, 7 Feb 2024 09:45:02 +0100")
Message-ID: <87a5ni9sa0.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/2] package/python-bitarray: new package
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
Cc: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > This package is needed at runtime by python-bitstring since
 > 4.1.0 already [1].

 > Note: the License is under Python-2.0 but "Python Software
 > Foundation License (PSF)" has been remplaced by the author
 > of bitarray Ilan Schnell.

 > [1] https://github.com/scott-griffiths/bitstring/releases/tag/bitstring-4.1.0

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>
 > ---
 > Triple checked the license type with other distribution:
 > https://salsa.debian.org/python-team/packages/python-bitarray/-/blob/master/debian/copyright?ref_type=heads
 > https://src.fedoraproject.org/rpms/python-bitarray/blob/rawhide/f/python-bitarray.spec
 > https://aur.archlinux.org/packages/python-bitarray

 > v2: update python-bitstring version (Marcus Hoffmann)

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
