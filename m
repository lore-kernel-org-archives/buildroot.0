Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34683C433FE
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 11:11:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F9A660F6B
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 11:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F9A660F6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2373360659;
	Mon, 20 Sep 2021 11:11:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jQCibCru1Q0m; Mon, 20 Sep 2021 11:11:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72A206061A;
	Mon, 20 Sep 2021 11:11:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 06E1C1BF2C8
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 11:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02C48403FD
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 11:11:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G-jqlnrx6RcD for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 11:11:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FB0E402FB
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 11:11:34 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.167.42])
 by Aruba Outgoing Smtp  with ESMTPSA
 id SHCum7SRsJzjeSHCumKN9c; Mon, 20 Sep 2021 13:11:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632136292; bh=y8bZf+W3gnT/Wd+NWYODfrXn4AK9mIIag8TCWu92eyY=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=B7+4BV7DJjsJ7nt8nPR5Lo0cqQDQL2UKM+/mSGeufF8nM9tLtxYq4elSyR5G+491e
 NwMfr7awyxN/MQHZN+xHBAfo+RJgtKCW+xsuv9mxhuwJlM2lK48wdS9wO2z6TvefTV
 yyBlXhNcakB/IC9yiTqRvqBVcx1/BMbgx7KPnlrHeBQZP0LeC1j0rqtoPRy7KRe34b
 9nAiO6zYlhzVgs7wa5gBKLgL3NjIWbeZ4loG1FTTCkwG0Y8MRzOm0stwTKCavYR6HL
 urh5t542y3aLNJawX0lBw/nm+jhx8XtDV0aPszhskJ8af2GDgk0MIaPtdK+LgLpV+b
 85HDt376tR8AQ==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <f98c560b-9a4f-26df-3bcb-3bdb4509786d@benettiengineering.com>
 <20210920084105.4b8fea91@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <92946c00-1939-725d-7ff6-cffdb58bed65@benettiengineering.com>
Date: Mon, 20 Sep 2021 13:11:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920084105.4b8fea91@windsurf>
Content-Language: en-US
X-CMAE-Envelope: MS4wfBBRyTq9SGLFM8yo2c+h8gyu350OqWiq6IXP22vedifP029uReCbEYziHAwM8YJ5W+AdUdDBaPNo9tS4YOKqUFY+OTKFAEoYEE7e68q3s3ynM2vhp4k9
 jNlofc0iYicrPoiG9AcClMbl1wQ2ITl1ReLVXO1oZJuvkrNnXIe6bN0zuQ4jjK2FmQsacnZ0daPHu5zOo1sQifoYeqKCsP+tVIKxNi6be5O3AIijMFcUbnxr
 xkhGjL6A7Gpwa0H0GMDKM/SKQSQ3imxXcj3BdAvRPIPFkKBN3yA+lJweqGFHcbT8
Subject: Re: [Buildroot] Harfbuzz bump major version question
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

On 9/20/21 8:41 AM, Thomas Petazzoni wrote:
> Hello Giulio,
> 
> On Sun, 19 Sep 2021 23:10:23 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> I'm going to bump harfbuzz to version 3.0.0 but being a major version it
>> looses 15 apis[1] and introduce some new ones. So I'm not that sure if
>> this can be a normal bump or I need to introduce the new package
>> harfbuzz3. Package pango that requires harfbuzz builds fine, but how
>> should I proceed? Should I build every package that depends on it and
>> check if it builds fine? Or should I add package harfbuzz3 and then
>> every package that depends on harfbuzz should move to harfbuzz3 package
>> per package? I'm new to this case so help is appreciated.
> 
> The best is to not have to introduce a separate harfbuzz3 package, as
> it really complicates things.
> 
> There are not that many packages that have a dependency on harfbuzz:
> 
> package/efl/efl.mk:ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
> package/libass/Config.in:       select BR2_PACKAGE_HARFBUZZ
> package/mupdf/Config.in:        select BR2_PACKAGE_HARFBUZZ
> package/pango/Config.in:        select BR2_PACKAGE_HARFBUZZ
> package/qt5/qt5base/Config.in:config BR2_PACKAGE_QT5BASE_HARFBUZZ
> package/qt5/qt5base/Config.in:  select BR2_PACKAGE_HARFBUZZ if \
> package/qt5/qt5base/qt5base.mk:ifeq ($(BR2_PACKAGE_QT5BASE_HARFBUZZ),y)
> package/supertuxkart/Config.in: select BR2_PACKAGE_HARFBUZZ
> package/vlc/vlc.mk:ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
> package/webkitgtk/Config.in:    select BR2_PACKAGE_HARFBUZZ
> package/wpewebkit/Config.in:    select BR2_PACKAGE_HARFBUZZ
> 
> So I would suggest to create a configuration that builds all those
> packages successfully prior to the harfbuzz bump, and then retry this
> configuration with the harfbuzz bump applied. This will give you a
> sense of how much breakage the API changes are causing.

Ok, I proceed this way then.

Thank you
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
