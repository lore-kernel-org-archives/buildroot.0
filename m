Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A09C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 22:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D06CA43655;
	Thu, 30 Nov 2023 22:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D06CA43655
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y1NBA_W4PgUe; Thu, 30 Nov 2023 22:41:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED6144045C;
	Thu, 30 Nov 2023 22:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED6144045C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D3D4A1BF844
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 22:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADA9C6FA50
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 22:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADA9C6FA50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id inX5ahXiDhZe for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 22:41:21 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B16776FA4A
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 22:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B16776FA4A
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED25620003;
 Thu, 30 Nov 2023 22:41:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r8pig-003S0D-1G;
 Thu, 30 Nov 2023 23:41:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231127212712.1059242-1-fontaine.fabrice@gmail.com>
Date: Thu, 30 Nov 2023 23:41:18 +0100
In-Reply-To: <20231127212712.1059242-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 27 Nov 2023 22:27:12 +0100")
Message-ID: <87r0k67tkh.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/motion: fix webp build
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

 > Fix the following build failure raised since bump of webp to version
 > 1.3.2 in commit c88c1d3319dd24fa833455a2e7d96bc4585bab7f:

 > /home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/aarch64_be-buildroot-linux-uclibc/13.2.0/../../../../aarch64_be-buildroot-linux-uclibc/bin/ld:
 > picture.o: undefined reference to symbol 'WebPMemoryWriterClear'
 > /home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/aarch64_be-buildroot-linux-uclibc/13.2.0/../../../../aarch64_be-buildroot-linux-uclibc/bin/ld:
 > /home/autobuild/autobuild/instance-9/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/usr/lib64/libwebp.so.7:
 > error adding symbols: DSO missing from command line

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9b859a701debeaddf1f9909e16adc6811a620576

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
