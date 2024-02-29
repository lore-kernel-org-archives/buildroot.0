Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952ABC54E41
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DC35417F5;
	Thu, 29 Feb 2024 15:24:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PJDx0yOoMo7D; Thu, 29 Feb 2024 15:24:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D12DB417FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D12DB417FC;
	Thu, 29 Feb 2024 15:24:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 437E01BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E53A60EC8
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:21:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SaedgDnhTVK2 for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:21:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B4F6460ED8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4F6460ED8
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4F6460ED8
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:21:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 797AC1C0003;
 Thu, 29 Feb 2024 15:21:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfiDs-004md2-28;
 Thu, 29 Feb 2024 16:21:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240205142727.38F9D86C99@busybox.osuosl.org>
Date: Thu, 29 Feb 2024 16:21:24 +0100
In-Reply-To: <20240205142727.38F9D86C99@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Mon, 5 Feb 2024 15:27:05 +0100")
Message-ID: <87o7bzgutn.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/sysstat: update upstream
 location
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=35a2cb02277acae94f018a0d22138dc9de005fdf
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The http://pagesperso-orange.fr service being down,
 > http://pagesperso-orange.fr/sebastien.godard/ is no longer
 > accessible (or more precisely serves some HTML junk), meaning that we
 > currently cannot download the tarball of sysstat from the official
 > upstream location, and we always fallback to sources.buildroot.net.

 > This commit therefore updates to use the new upstream location on
 > github.io. The 12.6.1 release is available there, with the same hash,
 > so we can just point to the new upstream location.

 > Fixes:

 > ERROR: while checking hashes from package/sysstat//sysstat.hash
 > ERROR: sysstat-12.6.1.tar.xz has wrong sha1 hash:
 > ERROR: expected: a730982e0c2d4964a0022c1509f3ea0a345402bc
 > ERROR: got     : d64a079729f2ff5b304294d68fbc041a46c4966d
 > ERROR: Incomplete download, or man-in-the-middle (MITM) attack

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
