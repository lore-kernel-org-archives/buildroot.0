Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1C0C43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 13:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 906A2414E6;
	Sun, 19 Jun 2022 13:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 906A2414E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l-S-U5JSilJy; Sun, 19 Jun 2022 13:41:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 620FC414CB;
	Sun, 19 Jun 2022 13:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 620FC414CB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 446181BF852
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EEA960AAD
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EEA960AAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rCLViyQLwzHx for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 13:41:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E67BC607A4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E67BC607A4
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 13:41:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 28341240005;
 Sun, 19 Jun 2022 13:41:48 +0000 (UTC)
Message-ID: <b9727524-ffe0-00b0-868b-0ecd498a07ce@korsgaard.com>
Date: Sun, 19 Jun 2022 15:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220610210541.3643416-1-fontaine.fabrice@gmail.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20220610210541.3643416-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/dmalloc: fix strndup detection
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/06/2022 23.05, Fabrice Fontaine wrote:
> Fix strndup detection as already done for strdup in commit
> f9287b263f0808c2f0632aa1560d88e39fbf970b to avoid the following build
> failure raised since bump to version 5.6.5 in commit
> 736932c71552adc4dfa95c5236d1064860900e8a:
> 
> In file included from /nvmedata/autobuild/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/string.h:630:0,
>                   from append.c:34:
> dmalloc.h:396:7: error: expected identifier or '(' before '__extension__'
>   char *strndup(const char *string, const DMALLOC_SIZE max_len);
>         ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/2164dac43e2607a3570e8f98957a70f579d06cd3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
