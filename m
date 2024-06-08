Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4954DC27C5F
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 18:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AE0340637;
	Sat,  8 Jun 2024 18:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6alk4T6YAiou; Sat,  8 Jun 2024 18:05:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3DF0419B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3DF0419B8;
	Sat,  8 Jun 2024 18:05:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 09D201BF408
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 18:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC10F606B4
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 18:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJz0RYaWZpi0 for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 18:05:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D923605A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D923605A3
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D923605A3
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 18:05:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4726320002;
 Sat,  8 Jun 2024 18:05:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sG0Re-002FsQ-28;
 Sat, 08 Jun 2024 20:05:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240602162123.2513233-1-yann.morin.1998@free.fr>
 <871q5fkxto.fsf@dell.be.48ers.dk>
Date: Sat, 08 Jun 2024 20:05:38 +0200
In-Reply-To: <871q5fkxto.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 02 Jun 2024 20:24:03 +0200")
Message-ID: <87v82jwbrh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/qt5base: fix download
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
 >> Since qt5base was last bumped in 8ab4a0a348b2 (package/qt5: bump packages
 >> to latest kde submodule versions), the hash for the downloaded tarball
 >> has changed:

 >> $ make qt5base-source
 >> [...]
 >> ERROR: expected: 935d01f5c34903ad9e979431cec7a8a59332ed3fc539e639f5ba87e8d6989b9d
 >> ERROR: got     : 3067c4d84ba9927bfe65bf606c17af082199e0a3b22781fbf9bc6c6bc3de26dd

 >> We know the hash was good back when 8ab4a0a348b2 was applied, because
 >> the tarball has been cached on sources.buildroot.org with the expected
 >> hash:

 >> $ curl 'https://sources.buildroot.net/qt5base/qtbase-da6e958319e95fe564d3b30c931492dd666bfaff.tar.bz2' 2>/dev/null |sha256sum -
 >> 935d01f5c34903ad9e979431cec7a8a59332ed3fc539e639f5ba87e8d6989b9d  -

 >> But now, the archive generated by the KDE gorge (Gitlab underneath) has
 >> another hash (as seen above). This means that the KDE forge (Gitlab) has
 >> changed the way it generates archives. So, what's the delta? It turns
 >> out that the only changes are about CRLF that were present in the
 >> original archive, and are no longer in the new one. It is to be noted
 >> that the affected files do not have CRLFS in the repository. It further
 >> turns out that the archive was previously generated with .gitattibutes
 >> of the main branch ('dev' in Qt repositories), while now they are
 >> generated with the .gitattibutes of the commit for which they are
 >> generated.

 > Funky!

 >> Switch to using the git download method for really reproducible
 >> archives...

 >> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 >> Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
 >> Cc: Peter Korsgaard <peter@korsgaard.com>

 > Committed, thanks.

Committed to 2024.02.x after adjusting the filename and hash to match
what we expect on 2024.02.x.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
