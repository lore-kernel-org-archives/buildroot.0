Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9C9CF2592
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 07:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72D8641DB0;
	Wed, 19 Nov 2025 07:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nzzSPPs1E05h; Wed, 19 Nov 2025 07:43:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CBF441DB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CBF441DB4;
	Wed, 19 Nov 2025 07:43:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 876DC158
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 07:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E2C9816FD
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 07:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gTeZubLRLNzF for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 07:43:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF653816FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF653816FC
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF653816FC
 for <buildroot@uclibc.org>; Wed, 19 Nov 2025 07:43:09 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1vLcqI-0005l6-Oz
 for buildroot@uclibc.org; Wed, 19 Nov 2025 08:43:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Wed, 19 Nov 2025 08:42:29 +0100
Message-ID: <pan$ad6d3$5135641b$d770d362$88a45f61@ID-313208.user.individual.net>
References: <20251118211149.2013582-1-bernd@kuhls.net>
 <87ikf6wriq.fsf__24259.6589656145$1763528538$gmane$org@tarshish>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 1/1] package/xinetd: bump version to 2.3.15.4
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

Am Wed, 19 Nov 2025 06:55:09 +0200 schrieb Baruch Siach via buildroot:

>> -# 0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch +#
>> https://github.com/openSUSE/xinetd/commit/
91e2401a219121eae15244a6b25d2e79c1af5864
>>  XINETD_IGNORE_CVES += CVE-2013-4342
> 
> If this CVE is fixed in 2.3.15.4, why do we need to keep IGNORE it?

Hi Baruch,

being by no means an expert on NVD entries afaics the CVE record does not 
contain a version number:
https://nvd.nist.gov/vuln/detail/CVE-2013-4342
so we still need to ignore the CVE.

OpenEmbedded does something similar:
https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/
xinetd/xinetd_2.3.15.4.bb?h=master#n20

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
