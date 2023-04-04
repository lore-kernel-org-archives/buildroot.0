Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6F7C6FD1D
	for <buildroot@archiver.kernel.org>; Tue,  4 Apr 2023 18:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82C0F40883;
	Tue,  4 Apr 2023 18:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82C0F40883
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tP43HZ4e83ve; Tue,  4 Apr 2023 18:31:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76F86416D4;
	Tue,  4 Apr 2023 18:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76F86416D4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 185401BF25B
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 18:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3C42416D4
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 18:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3C42416D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZNoT-8NvAqvT for <buildroot@lists.busybox.net>;
 Tue,  4 Apr 2023 18:31:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3F6E40883
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3F6E40883
 for <buildroot@buildroot.org>; Tue,  4 Apr 2023 18:31:25 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id m2so33800354wrh.6
 for <buildroot@buildroot.org>; Tue, 04 Apr 2023 11:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680633084; x=1683225084;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ioY4PDV/Ygo761+zCrZCT/2OYSQkZ6D3CLX7x0MJDpM=;
 b=WBXpv1X11asY8LC6Ax3ZjSLHt26Fuqa+9CECDUMI6cbEXJZkTigainnbQ/+oASogqn
 Dvd8aHLIUk0vShsfBcUA+vwjIg0rNTN0ekgjYJ7ELuK8EFm/FwF8djLoYTnvEaBgfDpn
 Uc0lybeWGu38y+85tI3m/8vkTKfVSm3ReMMtM+c1vbBUE6TkxB8ATUFd50jJXBEItnYH
 veKlNebXuA+ZptovlJpawajeUMjzQS9fV3Fy6XxsMqtXQHlI0vgdp7EXqKm2nKqGVUyX
 Ac3WDiQIUAIj+p9o7x50GPbqzlutylgXylwPCbofZiwK6KPX+qcFvcj7q7HdJryGypLf
 ck5A==
X-Gm-Message-State: AAQBX9dTAvd9mMi6LELQpxu+0YmqNUZYmRfhA3oe4c9LDiXCc+nPT90M
 SWoID4q8BPE0BNcq5oIAkSs=
X-Google-Smtp-Source: AKy350ZByNjxgYwqnEJN21y6p5f38rP/iHDZwi8zsl5TWvuy0kIhzU0pst+h5dxrYly8WhJdTvi/Ag==
X-Received: by 2002:a5d:62ce:0:b0:2bf:bf05:85ac with SMTP id
 o14-20020a5d62ce000000b002bfbf0585acmr102043wrv.23.1680633083685; 
 Tue, 04 Apr 2023 11:31:23 -0700 (PDT)
Received: from ?IPV6:2a02:8070:4182:37a0:64cb:8203:42ee:ef04?
 ([2a02:8070:4182:37a0:64cb:8203:42ee:ef04])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a5d4e0b000000b002e71156b0fcsm10079688wrt.6.2023.04.04.11.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 11:31:23 -0700 (PDT)
Message-ID: <826757ff-529e-c01f-cf4e-63c109ff8e5c@gmail.com>
Date: Tue, 4 Apr 2023 20:31:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230325175815.24876-1-raphael.pavlidis@gmail.com>
 <20230326141805.310d6e67@windsurf>
Content-Language: en-US
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <20230326141805.310d6e67@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680633084; x=1683225084;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ioY4PDV/Ygo761+zCrZCT/2OYSQkZ6D3CLX7x0MJDpM=;
 b=oQEERXLZBJl1dMXdB+/yC39wGB1cgzCqgVJwdty0tYuzNvxIKrXuVwdYXS6Qd182oq
 ZvK2c7PwdqMxiNH857wvHmJafJy8YSPKj49Pm8s3/ilVrahXipv4LWbPmTqJEYX7fN1a
 xyXHxrp8drXpUTxsayMtawjtbM/zuNQAGEENxsMIk9vrD4rRuSCjmy+QVMS7LGD4ILkH
 rChCSbTks3wBt3y6ak7hVKnH0IiP6DiY++ubZAI/f1DOQ68N3sr2/966aWNRg0/6Abr9
 S7e4wPKZNH/nAXfPRqVyJMIGKDQE2wj84uQgGPg3f6M5xQqWELYNjpg8oG2SvUOjFSYu
 HSQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oQEERXLZ
Subject: Re: [Buildroot] [PATCH v1 1/1] package/shadow: only yescrypt build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 26.03.23 14:18, Thomas Petazzoni wrote:
> On Sat, 25 Mar 2023 18:58:15 +0100
> Raphael Pavlidis <raphael.pavlidis@gmail.com> wrote:
> 

[SNIP]

> 
> Thanks for fixing this! Has this patch been submitted to the upstream
> shadow project?
> 

Not yet.

> Thanks!
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
