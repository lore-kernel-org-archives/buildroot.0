Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA56C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 20:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 774B040156;
	Sat,  4 Dec 2021 20:23:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PAAgpFrmWlwK; Sat,  4 Dec 2021 20:23:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7ED7F401DD;
	Sat,  4 Dec 2021 20:23:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32CD41BF861
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 221F26062A
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:23:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tGiHLQfCE9k3 for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 20:23:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FA8860009
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 20:23:26 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id v15so13146044ljc.0
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 12:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yViWXx2BXUy4DWoCDCRBqIa2ZJWQO16FKC8xHq09bbI=;
 b=nOgEMFSQBOjqnHWJEhDlBPoXgEDCcMRh+MjuTbSXkbZNgTb/HPyG2rcUtZeOXWn+MR
 wGICnZpFdoYc40gqaEabmstfqFWPl7ul2coZ0bZwTLldKlR3vqwXjj19tTZdGiMcpKpn
 06KiBPCgaN/WzP02tTQzuMuiP0V3uer0wqGjmgvJfsZRtz3gbbYEkZDMEYZ316fH0Pna
 A07nfcPAMAw49v+qAK/o5TFfJXFDu7qzDo3Js2h/d02EoSyfrS58Rec363gMUpFCkPAZ
 RJDPY4m4DDPvTJvLEk8uArbbaX9WcAnabJ74AAauGuG+VYR+Ew2O1736qe+osQxgK28K
 UGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yViWXx2BXUy4DWoCDCRBqIa2ZJWQO16FKC8xHq09bbI=;
 b=fhVtV1ZkVMoWokqUNBFc2g9RN6D90vsH5YFNagSWiY731PSKFkPHRxLp+cig826NHp
 gS6BdKVIjcue+9BbaZgJxtPmbBZhts6w8Ix6tyLMtgAdHKfiPEObHulgB1PSpjcaOEtq
 4bRUTIOgM4kGUffSPLswsnskKGdB/vp6JD1EE95zWLk3FbEHFz3svbuA9N5Sxg0OkK5N
 Hj6S3xDEikYGyC5K14R4BGa1UDd2Klv0LYd+14TAKwcz+mRqnz7Lt+W8CR1E9WAtjuAH
 OSyOZYh2/gUuJUheM23CqUiVgvXoF8W0dowtHV7LoLdj9r48Gz5YsTYrJ/tWTeP8tYIT
 Aqrg==
X-Gm-Message-State: AOAM531THFm51itWDj0kA0HLkJVJrrMJLkUkIgmrnVGFI41WMDPN+kAW
 DuTWYvAtU9Td1+2I1kHZbhE=
X-Google-Smtp-Source: ABdhPJyir7UOTeDaHKDbjExk66Eesc1ZVTUB2ZZWzGgPgKcBlFV4zh0Y8n9qI75J388iGDD5RpFRzg==
X-Received: by 2002:a2e:b0e3:: with SMTP id h3mr25558020ljl.276.1638649403928; 
 Sat, 04 Dec 2021 12:23:23 -0800 (PST)
Received: from [10.0.196.136] ([176.10.248.198])
 by smtp.googlemail.com with ESMTPSA id o22sm860228lfu.274.2021.12.04.12.23.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Dec 2021 12:23:23 -0800 (PST)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211202013902.1593562-1-troglobit@gmail.com>
 <20211202013902.1593562-2-troglobit@gmail.com>
 <20211204210459.461e4f39@windsurf>
From: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <0f7d1dfe-07c3-198f-3449-9179db0e385c@gmail.com>
Date: Sat, 4 Dec 2021 21:23:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211204210459.461e4f39@windsurf>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH next 1/2] package/watchdogd: bump to version
 3.5
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
Cc: =?UTF-8?Q?Alejandro_Gonz=c3=a1lez?= <alejandro.gonzalez.correo@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/4/21 9:04 PM, Thomas Petazzoni wrote:
> On Thu,  2 Dec 2021 02:39:01 +0100
> Joachim Wiberg <troglobit@gmail.com> wrote:
>> This addresses the autobuilder failure for master as per 2021-11-27.
>> The root cause was a name clash in a dependency, the libite library,
>> clashing with the DirectFB LiTE library header files.  
> Thanks, I've applied both to next, as indicated in the patch title.
> However, in the commit log, you seem to indicate that it's fixing a
> build issue in master. Could you confirm?

Very unfortunate name clash between include files in two packages.

http://autobuild.buildroot.net/results/185c753af2aa159b494b13f78b0826dddbe4aed6


However, I think it's highly unlikely they'll be enabled at the same
time. My recommendation is to go for next and let 2021.11 out the door.

Best regards
 /Joachim

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
