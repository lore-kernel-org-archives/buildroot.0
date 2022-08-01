Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B66C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 18:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E8C4409ED;
	Mon,  1 Aug 2022 18:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E8C4409ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olGARtRPyg48; Mon,  1 Aug 2022 18:06:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAF9D40865;
	Mon,  1 Aug 2022 18:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAF9D40865
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1521B1BF337
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 18:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB4F940865
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 18:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB4F940865
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id omb6_OSjgg3i for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 18:06:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAF2D404B9
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAF2D404B9
 for <buildroot@uclibc.org>; Mon,  1 Aug 2022 18:06:13 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1oIZnv-0002LF-It
 for buildroot@uclibc.org; Mon, 01 Aug 2022 20:06:11 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 01 Aug 2022 20:05:11 +0200
Message-ID: <pan$5b6cb$bb19d38$901acf5f$10cb6fe3@ID-313208.user.individual.net>
References: <20220731111240.12145-1-bernd.kuhls@t-online.de>
 <31fb8cf8-02e4-8bc6-a7b9-c6f9cd0845bc__49535.9333044448$1659376652$gmane$org@mind.be>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: ignore various CVEs
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

Hi Arnout,

Am Mon, 1 Aug 2022 19:56:53 +0200 schrieb Arnout Vandecappelle:

>> +# fixed in version 2.2.5
>> +APACHE_IGNORE_CVES += CVE-2007-4465 CVE-2008-2168

>   Then why do we need to exclude it? Is there something wrong with the 
CVE's CPE 
> information? Or with our own CPE information? Or with our cpedb script?

my understanding of the CVE/CPE stuff is rather limited but I guess these 
CPEs show up for us because the database entry does not contain any 
version number:

cpe:2.3:a:apache:http_server:-:*:*:*:*:*:*:*

What about ignoring such version-less entries in buildroot?

Thomas suggested to get the NIST database fixed:
https://lists.buildroot.org/pipermail/buildroot/2022-August/648210.html

but these entries can show up again and again... And providing proof that 
a disputed entry from 2007 should be removed from their database is 
beyond my capabilities...

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
