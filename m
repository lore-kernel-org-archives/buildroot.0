Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5252CC433FE
	for <buildroot@archiver.kernel.org>; Thu, 10 Nov 2022 08:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2A674019E;
	Thu, 10 Nov 2022 08:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2A674019E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ffk6v5O30RrD; Thu, 10 Nov 2022 08:40:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A9FA401FB;
	Thu, 10 Nov 2022 08:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A9FA401FB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61C0B1BF3C5
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 08:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CFF760A8B
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 08:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CFF760A8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w0PnKrIz_oFa for <buildroot@lists.busybox.net>;
 Thu, 10 Nov 2022 08:40:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B0AD60AB9
Received: from mailproxy05.manitu.net (mailproxy05.manitu.net [217.11.48.69])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B0AD60AB9
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 08:40:31 +0000 (UTC)
Received: from [IPV6:2003:c4:d718:4800:13e4:5f80:9e24:9265]
 (p200300c4d718480013e45f809e249265.dip0.t-ipconnect.de
 [IPv6:2003:c4:d718:4800:13e4:5f80:9e24:9265])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: wg@grandegger.com)
 by mailproxy05.manitu.net (Postfix) with ESMTPSA id 22AD31B6013F;
 Thu, 10 Nov 2022 09:40:26 +0100 (CET)
Message-ID: <a69fa13d-e723-4119-001d-21e468e976d7@grandegger.com>
Date: Thu, 10 Nov 2022 09:40:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <651aba63-797e-a11c-8380-a331361a5678@grandegger.com>
 <20221110085813.14133f2a@windsurf>
From: Wolfgang Grandegger <wg@grandegger.com>
In-Reply-To: <20221110085813.14133f2a@windsurf>
Subject: Re: [Buildroot] [PATCH v2] package/udisks: add config option to
 support mounting in, /media
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Marek Belisko <marek.belisko@open-nandra.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10.11.22 08:58, Thomas Petazzoni wrote:
> On Thu, 10 Nov 2022 08:49:58 +0100
> Wolfgang Grandegger <wg@grandegger.com> wrote:
> 
>> Support mounting in /media instead of /run/media for compatibility
>> with the Filesystem Hierarchy Standard (FHS). This is also required
>> for backward compatibility with udisks1.
> 
> Thanks, looks good, but it's still missing your Signed-off-by line
> here! :-)

Ouach, sorry!

> Could you send a v3 with this added?

Done.

Wolfgang
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
