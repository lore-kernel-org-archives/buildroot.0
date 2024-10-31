Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C256DD767FB
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 20:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78BA680592;
	Thu, 31 Oct 2024 20:26:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_tIW9caknk2; Thu, 31 Oct 2024 20:26:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ADF1805A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ADF1805A5;
	Thu, 31 Oct 2024 20:26:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AF0335E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 20:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C94640126
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 20:26:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ettx8CKRlfPB for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 20:26:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3E414400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E414400D7
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E414400D7
 for <buildroot@uclibc.org>; Thu, 31 Oct 2024 20:26:12 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1t6bk9-0004pq-OM
 for buildroot@uclibc.org; Thu, 31 Oct 2024 21:26:09 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Thu, 31 Oct 2024 21:25:44 +0100
Message-ID: <pan$dda0f$dc3fe6f6$13263fa7$213d4df6@ID-313208.user.individual.net>
References: <20241031193809.711402-1-bernd@kuhls.net>
 <20241031205835.13b00d20__29671.8216895655$1730404740$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 1/1] package/netstat-nat: bump version to 2a
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Am Thu, 31 Oct 2024 20:58:35 +0100 schrieb Thomas Petazzoni via buildroot:

>> +NETSTAT_NAT_SOURCE = $(NETSTAT_NAT_VERSION).tar.gz
>> +NETSTAT_NAT_SITE = https://git.sr.ht/~nabijaczleweli/netstat-nat-ng/
archive
> 
> Could you switch to Git download instead? Indeed we're not sure those
> tarballs are stable, and a tarball named 2a.tar.gz isn't exactly nice.

Hi Thomas,

quoting the project homepage https://sr.ht/~nabijaczleweli/netstat-nat-ng/

"Release tarballs [...] are thus available on the refs listing/tag page"

From that refs page https://git.sr.ht/~nabijaczleweli/netstat-nat-ng/refs, 
which looks to me as providing release versions, I took the tarball which
has this, indeed, weird filename. Clicking the link in Firefox provides 
"netstat-nat-ng-2a.tar.gz" however and with wget you would need
"--content-disposition" to receive the full filename.

Having the option to download an upstream-provided tarball I would like to 
stick to it. Would it be possible, even optionally, to add "--content-
disposition" when wget is used for downlaods?

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
