Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C87CC10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 20:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 137B280E97;
	Tue,  7 May 2024 20:13:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X1guUfdIapqi; Tue,  7 May 2024 20:13:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1388281089
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1388281089;
	Tue,  7 May 2024 20:13:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8BF2A1BF281
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 20:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86408605F2
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 20:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2W58F_7ReqdZ for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 20:13:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A9D0F60017
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9D0F60017
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9D0F60017
 for <buildroot@buildroot.org>; Tue,  7 May 2024 20:13:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F07D160003;
 Tue,  7 May 2024 20:13:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s4RC1-005Dly-10;
 Tue, 07 May 2024 22:13:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20240417161915.727361-1-peter@korsgaard.com>
 <87msph9x3g.fsf@dell.be.48ers.dk>
Date: Tue, 07 May 2024 22:13:41 +0200
In-Reply-To: <87msph9x3g.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Thu, 25 Apr 2024 19:21:55 +0200")
Message-ID: <87seytv0qy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/tinycbor: override prefix at build
 time as well
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
 >> To ensure the correct prefix is used in the generated tinycbor.pc instead of
 >> /usr/local:

 >>>>> tinycbor 0.6.0 Building
 >> ..
 >> sed > tinycbor.pc < tinycbor.pc.in \
 >> -e 's,@prefix@,/usr/local,' \
 >> -e 's,@exec_prefix@,/usr/local,' \
 >> -e 's,@libdir@,/usr/local/lib,' \
 >> -e 's,@includedir@,/usr/local/include,' \
 >> -e 's,@version@,0.6.0,'
 >>>>> tinycbor 0.6.0 Installing to staging directory
 >> ..
 >> install -m 644 tinycbor.pc
 >> /path/to/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig/tinycbor.pc

 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Committed, thanks.

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
