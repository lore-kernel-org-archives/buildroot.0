Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72C3C47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 11:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59432408D9;
	Sun,  7 Jan 2024 11:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59432408D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wgtoGIhalOkj; Sun,  7 Jan 2024 11:19:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B459C4085C;
	Sun,  7 Jan 2024 11:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B459C4085C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 517351BF4D5
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 11:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AC604085C
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 11:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AC604085C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nMa3fPQxGO4j for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 11:19:05 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11ABC406E0
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 11:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11ABC406E0
Received: by mail.gandi.net (Postfix) with ESMTPSA id C75EE40002;
 Sun,  7 Jan 2024 11:19:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rMRBF-006diJ-02;
 Sun, 07 Jan 2024 12:19:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@aperture.us>
References: <20231220092741.37794-1-christian@aperture.us>
 <87msu5886b.fsf@48ers.dk>
Date: Sun, 07 Jan 2024 12:19:00 +0100
In-Reply-To: <87msu5886b.fsf@48ers.dk> (Peter Korsgaard's message of "Wed, 20
 Dec 2023 11:44:44 +0100")
Message-ID: <87a5ph1jdn.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/1] package/openssh: security bump to
 version 9.6p1
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Christian" == Christian Stewart <christian@aperture.us> writes:
 >> OpenSSH 9.6 was released on 2023-12-18.
 >> This release contains fixes for a newly-discovered weakness in the
 >> SSH transport protocol (the "Terrapin" attack), a logic error relating
 >> to constrained PKCS#11 keys in ssh-agent(1) and countermeasures for
 >> programs that invoke ssh(1) with user or hostnames containing invalid
 >> characters.

 >> https://www.openssh.com/txt/release-9.6

 >> Signed-off-by: Christian Stewart <christian@aperture.us>

 > Committed, thanks.

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
