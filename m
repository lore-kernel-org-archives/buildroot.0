Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201A2D2E9D5
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 10:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D00F960606;
	Mon, 11 Nov 2024 10:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9g4iGXavT6o; Mon, 11 Nov 2024 10:51:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E56DF60664
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E56DF60664;
	Mon, 11 Nov 2024 10:51:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E6AE56C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 10:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE08E403A2
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 10:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1gxk37DuvKeW for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 10:51:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9959F40370
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9959F40370
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9959F40370
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 10:51:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCD0640004
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 10:50:57 +0000 (UTC)
Message-ID: <3e5a31b6-4efe-4811-a724-776474b77e4a@korsgaard.com>
Date: Mon, 11 Nov 2024 11:50:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240401084841.439073-1-hypnotoad@lindra.de>
 <20240405175454.14431-1-hypnotoad@lindra.de>
 <092f3459dc801de7a7f962c3acb25ea3@free.fr>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <092f3459dc801de7a7f962c3acb25ea3@free.fr>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v3 1/2] package/python-pyqt5-sip: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/26/24 15:21, Julien Olivain wrote:
> On 05/04/2024 19:54, Ralf Dragon wrote:
>> This packages adds the PyQt5.sip module.
>>
>> The official documentation [1] mentions that this module is needed
>> during PyQt5 runtime. It is currently compiled without any
>> dependencies to Qt or PyQt5, but it seems quite useless without it.
>> The module was introduced together with PyQt 5.11 [2].
>>
>> [1] 
>> https://www.riverbankcomputing.com/static/Docs/PyQt5/installation.html#building-and-installing-from-source
>> [2] 
>> https://www.riverbankcomputing.com/static/Docs/PyQt5/incompatibilities.html#pyqt-v5-11
>>
>> Signed-off-by: Ralf Dragon <hypnotoad@lindra.de>
> 
> Series applied to master, thanks!

And to 2024.02.x and 2024.08.x. I did fix the commit message summary of 
the 2nd to instead be "package/python-pyqt5: add missing SIP module" to 
match our conventions.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
