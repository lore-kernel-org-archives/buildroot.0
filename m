Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DCCCD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 18:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4801404C8;
	Tue,  3 Sep 2024 18:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMpI9etXDfPw; Tue,  3 Sep 2024 18:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB2A040A02
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB2A040A02;
	Tue,  3 Sep 2024 18:58:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC2521BF319
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7C7E80E87
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fl4b-buAb6Kg for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 18:58:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B67FE80E85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B67FE80E85
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B67FE80E85
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 18:58:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFB86FF802;
 Tue,  3 Sep 2024 18:58:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1slYjm-0059tT-0l;
 Tue, 03 Sep 2024 20:58:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
References: <ZrDeobsGFJYy4gL/@waldemar-brodkorb.de>
Date: Tue, 03 Sep 2024 20:58:46 +0200
In-Reply-To: <ZrDeobsGFJYy4gL/@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Mon, 5 Aug 2024 16:16:01 +0200")
Message-ID: <8734mgmumx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/nginx: security update to 1.26.1
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

 > See here for a Changelog and CVE's:
 > http://nginx.org/en/CHANGES-1.26

 > Patch 0006 is no longer required as the openssl library is found without
 > this patch, which does not apply anymore.

 > Patch 0009 is no longer required as it was fixed in another way upstream:
 > https://hg.nginx.org/nginx/rev/fb989e24c60a

 > Patch 0011 is upstream:
 > https://hg.nginx.org/nginx/rev/f58b6f636238

 > Reorder the remaining patches and update .checkpackageignore accordingly.

 > The LICENSE file is changed, the year changed from 2022 to 2024.

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 > v1-> v2:
 >   - forgot to update LICENSE file hash and information about the
 >     changes (requested by Thomas P.)

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
