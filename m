Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889BAC47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 13:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22DA584480;
	Wed, 31 Jan 2024 13:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22DA584480
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id smrdQW6TT-m0; Wed, 31 Jan 2024 13:51:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 466D08446C;
	Wed, 31 Jan 2024 13:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 466D08446C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E25861BF868
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 13:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8CBE6146D
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 13:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8CBE6146D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KgJnHaU7xFjK for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 13:51:33 +0000 (UTC)
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37D2260F2D
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 13:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37D2260F2D
Received: from [172.20.10.3] ([151.34.228.121])
 by Aruba Outgoing Smtp  with ESMTPSA
 id VAzwr5l5iZ3lVVAzwrRaDO; Wed, 31 Jan 2024 14:51:29 +0100
Message-ID: <a83b04af-90ee-41ed-bc01-a6cb3873d3a9@benettiengineering.com>
Date: Wed, 31 Jan 2024 14:51:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Vyacheslav Bocharov <adeep@lexina.in>, buildroot@buildroot.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240131130329.142721-1-adeep@lexina.in>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240131130329.142721-1-adeep@lexina.in>
X-CMAE-Envelope: MS4xfLfPFUvSRZrNu2+rqoONSHBP+/H/n4MlLRvckPs73R7Bnu3/dFG3jTK3pi2ZS/qSiX4EC8HUt78A9BeT17GaIG5yzBGXnOXzV+wupBi3iYBUKQtELkWK
 YuIMzzX//lV9c8BhZOENJENvruarF1lBae8IHOqiP21yl4KpoKXfZqvb2UomhYBuhQ9J0ycad9TL5MJ1wXL3P5IhhC0HnM7bbeiZFtwNPkPWNRWyEoW6OJsp
 FA5Xkdo0Ci+hZkjChnYyhF8zzxSKPkiPCXUEJ1Yx27F3yt2WHL/HyrLvd/hm6hew
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1706709089; bh=moiPv8nTXVS2dXUFmDjnYutM7IxxPQC25c0i1znOTiw=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=PnyYHrV6T3ZzXPjoUxhrGEObqlTCXPJ9XXJDKKnGUGVy27T3H5s9rlkk4lRVcs/9V
 hmcwK/t+cIIqaLHPdRXSLmJ56g0V3ZWHQiEX7qkzGgxeuLjzAWJCSARmoSoLN59Zqc
 1SrPzTLs819MtvpaAHfdD27CKcewNxuAJmrbmohS+QziqxOE2oy3cQY8d8cKKKTh3Z
 SQY+xy9aRH2m/em2VjWePM3STN/uSvQK7Bmv/Cr95OAy7CqG1tcVBjyC+bz/0ABHAe
 /hwCb4t4vZOTkaG99Frkb5uFgZ5FdXwmaiW8Peg78I6wkuqId9B5FsquShKNcTo7m6
 AIU/MFVamAQcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=PnyYHrV6
Subject: Re: [Buildroot] [PATCH] Bump driver version. Update driver for
 kernel 6.7+. Fix build failures: x86_64
 http://autobuild.buildroot.net/results/b4f34e622410a59943fa763148da1115cea0932d
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

Hi Viacheslav,

thank you for the contribution!

Can you please reword commit log like my pending patch[0]?

This is because Subject can't be that log. You need to split
into Subject and body.

Also Subject should be like:
"package/rtl8822cs: Bump driver to version 2024-..."

Also, when pointing you're fixing a failure you have to use:
Fixes:
http://autobuild.buildroot.net/results/b4f34e622410a59943fa763148da1115cea0932d

You can find explanation in Buildroot manual[1].

So can you please send a V2 patch with requested changes in commit log?

Thank you
Best regards

[0]: 
https://patchwork.ozlabs.org/project/buildroot/patch/20240130110504.559989-1-giulio.benetti@benettiengineering.com/

[1]: 
https://buildroot.org/downloads/manual/manual.html#_analyzing_and_fixing_autobuild_failures
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

On 31/01/24 14:03, Vyacheslav Bocharov via buildroot wrote:
> From: Viacheslav Bocharov <adeep@lexina.in>
> 
> Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
> ---
>   package/rtl8822cs/rtl8822cs.hash | 2 +-
>   package/rtl8822cs/rtl8822cs.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
> index 4b44512913..34bcc412ce 100644
> --- a/package/rtl8822cs/rtl8822cs.hash
> +++ b/package/rtl8822cs/rtl8822cs.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256  b3b8543ff6d6d602ffaf60342969830edc8205917b96d004f84ed79524894dc7  rtl8822cs-2e4e99ae1502b173a938357dc1087e49475b26ed.tar.gz
> +sha256  d61fff0ee8b4219a6441791ff26be1b8c49ef8b2ca78345bf12b7a0541f498e9  rtl8822cs-fda6cd263e89567272060e6182a39aee20b894c4.tar.gz
> diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
> index 6036acb864..dbdc7d84bf 100644
> --- a/package/rtl8822cs/rtl8822cs.mk
> +++ b/package/rtl8822cs/rtl8822cs.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RTL8822CS_VERSION = 2e4e99ae1502b173a938357dc1087e49475b26ed
> +RTL8822CS_VERSION = fda6cd263e89567272060e6182a39aee20b894c4
>   RTL8822CS_SITE = $(call github,jethome-ru,rtl88x2cs,$(RTL8822CS_VERSION))
>   RTL8822CS_LICENSE = GPL-2.0
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
