Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E03DC4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 17:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0180160BAC;
	Mon, 30 Oct 2023 17:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0180160BAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zoyt__IQnAZ1; Mon, 30 Oct 2023 17:24:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A0A160BAB;
	Mon, 30 Oct 2023 17:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A0A160BAB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 589FA1BF3A0
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 17:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EABD6080B
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 17:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EABD6080B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mtdtHgWdk7d7 for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 17:24:02 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1497360A8C
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 17:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1497360A8C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 291E71C0004;
 Mon, 30 Oct 2023 17:23:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1qxVzZ-002o2Y-2j;
 Mon, 30 Oct 2023 18:23:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231028161244.221857-1-fontaine.fabrice@gmail.com>
Date: Mon, 30 Oct 2023 18:23:57 +0100
In-Reply-To: <20231028161244.221857-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 28 Oct 2023 18:12:44 +0200")
Message-ID: <87ttq82fde.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/tiff: security bump to version
 4.6.0
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Drop --without-x (now unrecognized)
 > - Fix CVE-2023-40745: LibTIFF is vulnerable to an integer overflow. This
 >   flaw allows remote attackers to cause a denial of service (application
 >   crash) or possibly execute an arbitrary code via a crafted tiff image,
 >   which triggers a heap-based buffer overflow.
 > - Fix CVE-2023-41175: A vulnerability was found in libtiff due to
 >   multiple potential integer overflows in raw2tiff.c. This flaw allows
 >   remote attackers to cause a denial of service or possibly execute an
 >   arbitrary code via a crafted tiff image, which triggers a heap-based
 >   buffer overflow.

 > https://libtiff.gitlab.io/libtiff/releases/v4.6.0.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
