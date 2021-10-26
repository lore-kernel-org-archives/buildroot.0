Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A99C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:39:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F08F860238
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F08F860238
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7A4E4011F;
	Tue, 26 Oct 2021 18:39:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5dfn4OF2urpH; Tue, 26 Oct 2021 18:39:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00B814022A;
	Tue, 26 Oct 2021 18:39:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 351471BF20F
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24E3980D8B
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:39:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qvx1XiXBnnGv for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 18:39:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF6EE80D86
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 18:39:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id D63D8100005;
 Tue, 26 Oct 2021 18:39:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mfRMK-0000TK-7S; Tue, 26 Oct 2021 20:39:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211026170929.4051746-1-fontaine.fabrice@gmail.com>
Date: Tue, 26 Oct 2021 20:39:40 +0200
In-Reply-To: <20211026170929.4051746-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 26 Oct 2021 19:09:29 +0200")
Message-ID: <874k93sk9f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/lrzip: security bump to version
 0.641
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
Cc: Sam Lancia <sam@gpsm.co.uk>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2021-27347: Use after free in lzma_decompress_buf function in
 >   stream.c in Irzip 0.631 allows attackers to cause Denial of Service
 >   (DoS) via a crafted compressed file.
 > - Fix CVE-2021-27345: A null pointer dereference was discovered in
 >   ucompthread in stream.c in Irzip 0.631 which allows attackers to cause
 >   a denial of service (DOS) via a crafted compressed file.
 > - Fix CVE-2020-25467: A null pointer dereference was discovered
 >   lzo_decompress_buf in stream.c in Irzip 0.621 which allows an attacker
 >   to cause a denial of service (DOS) via a crafted compressed file.
 > - lz4 is a mandatory dependency since version 0.640 and
 >   https://github.com/ckolivas/lrzip/commit/3345a239b7f5353a1c1296d6a5d6b90729d4b669

 > https://github.com/ckolivas/lrzip/compare/7f3bf46203bf45ea115d8bd9f310ea219be88af4...v0.641

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
