Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F36C3DA4B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 18:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85B99409C8;
	Thu, 11 Jul 2024 18:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQun9g0G3UTB; Thu, 11 Jul 2024 18:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AFA1410F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AFA1410F3;
	Thu, 11 Jul 2024 18:35:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3AB71BF616
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 18:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1CD360ED2
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 18:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X37h6hsii2nh for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 18:35:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8AEE860EC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AEE860EC5
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AEE860EC5
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 18:35:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA963FF803;
 Thu, 11 Jul 2024 18:35:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sRydZ-00CHwn-0o;
 Thu, 11 Jul 2024 20:35:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
References: <ZoezviRQPTNSgdCL@waldemar-brodkorb.de>
Date: Thu, 11 Jul 2024 20:35:25 +0200
In-Reply-To: <ZoezviRQPTNSgdCL@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Fri, 5 Jul 2024 10:50:06 +0200")
Message-ID: <87o773hj4i.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v3 1/2] configs/qemu_sh4*: switch to
 initramfs
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

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Qemu 9.0.0/9.0.1 has introduced a Bug in sh4/sh4eb emulation so
 > that the system doesn't boot anymore.
 > The issue is already reported by Guenter Roeck:
 > https://lists.nongnu.org/archive/html/qemu-devel/2024-05/msg00606.html

 > Switch to initramfs for sh4/sh4eb emulation.

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
