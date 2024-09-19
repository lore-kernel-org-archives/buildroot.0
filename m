Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602D1CE8D79
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 11:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24A3C4011A;
	Thu, 19 Sep 2024 11:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UM9b3xyP4VaZ; Thu, 19 Sep 2024 11:16:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D469C404CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D469C404CF;
	Thu, 19 Sep 2024 11:16:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 415E51BF33B
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 11:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F1074281D
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 11:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ekTEAbwTZ1kW for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 11:16:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 743AC4280F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 743AC4280F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 743AC4280F
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 11:16:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 697EF20005;
 Thu, 19 Sep 2024 11:16:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1srF9L-00EBlV-1y;
 Thu, 19 Sep 2024 13:16:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <Zr6t0edkFUlZULGn@waldemar-brodkorb.de>
 <ef80790b-14cc-40fb-866d-aa7f8ce05ec2@mind.be>
Date: Thu, 19 Sep 2024 13:16:39 +0200
In-Reply-To: <ef80790b-14cc-40fb-866d-aa7f8ce05ec2@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Wed, 11 Sep 2024 21:40:46
 +0200")
Message-ID: <874j6blwq0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH next v3] package/bind: update to 9.18.28
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 16/08/2024 03:39, Waldemar Brodkorb wrote:
 >> Bind 9.16.x is EOL since April 2024.
 >> See here for what version should be used in production:
 >> https://kb.isc.org/docs/aa-01540
 >> Remove patch 0001 as CC_FOR_BUILD is used in upstream code
 >> to compile host utility gen.
 >> Use BIND_AUTORECONF = YES to avoid a Debian 12 libtool bug.
 >> Otherwise rndc linking fails. See here for a bug report to
 >> bind9 project:
 >> https://gitlab.isc.org/isc-projects/bind9/-/issues/4840
 >> See here for a changelog:
 >> https://downloads.isc.org/isc/bind9/9.18.28/doc/arm/html/notes.html
 >> COPYRIGHT file has been updated, following Copyright holders were
 >> added:
 >> Copyright Joyent, Inc. and other Node contributors. All rights reserved.
 >> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed to 2024.02.x and 2024.08.x given the security fixes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
