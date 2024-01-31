Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D6AC47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 18:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FBF8400A4;
	Wed, 31 Jan 2024 18:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FBF8400A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Om7E-qcoqP15; Wed, 31 Jan 2024 18:23:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5992442DC9;
	Wed, 31 Jan 2024 18:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5992442DC9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93FA31BF59E
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 18:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A2B160F31
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 18:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A2B160F31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZlcxY_oV5giP for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 18:23:28 +0000 (UTC)
Received: from smtpdh17-2.aruba.it (smtpdh17-2.aruba.it [62.149.155.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6F1760F28
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 18:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6F1760F28
Received: from [192.168.50.163] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id VFF7rIb8MOlcgVFF7rHr4n; Wed, 31 Jan 2024 19:23:25 +0100
Message-ID: <ec936dad-e6b8-4cda-8366-f8c7e19b4ecb@benettiengineering.com>
Date: Wed, 31 Jan 2024 19:23:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Viacheslav Bocharov <adeep@lexina.in>, buildroot@buildroot.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240131150927.194406-1-adeep@lexina.in>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240131150927.194406-1-adeep@lexina.in>
X-CMAE-Envelope: MS4xfBECufY+zCaJhfg6EWdjguZH0ZMxt2MhZKdDXnbqm6oQXfCDtNnpMS0a5TFXHJj3TazJBEuT4JVdW2Ja/NS+Q0ABtJHk6HL07i8U/WnfBmDiellCE7/q
 wHg3WAsBUdCZfwju8iFAGdQ8BAbAH8Vm1kySTumbC7WGXvcyphNR6LuegpiUhKIDDX4iKXXWyL3jOrjvnFviF+7mgW8pkIH5g14bVKQ7ObplPvigkA3OLpvI
 Qu2VjtLGEMMCKeqaj3KfgzL3+cmyQJjBmfAbwvwBtUwfQ94CyozfuGiw1fuMI3tg
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1706725405; bh=nML+oIzKwIsTyc+Wtc+E3NnMGQIUWQASBNSbECnOFj4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=NkrW3gbnIQ0nBocGg4mJZ/i8YsXa22VdjszNemqNdSrqBGM5YGct1yoZJFifnkyfe
 8f427jQ1uqJzIBArhF60BsoqJbYBmQywTz93AGvCAvyFwmE6tsX2gi0t/msEVrcUuG
 Zd2ajqDPA9XEd/OoOb9ewy5tDHH1guv+vJLTv5cs3rtr2bI1Og54qKRBFF9DBaVBeY
 NyWFE1XiIcAo1AJ8N335tUED+ngYg2kD4P8lWE5h7E5H2sgZnJC9R4rxXjza5RdUh2
 k1wvGfgF/Vwgi4VeWIrmEx3ettNNoAV2mAX/rEt7I51s6F6cVLmvm8784f8AhAaLJ9
 NEKZQcwRLXPFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=NkrW3gbn
Subject: Re: [Buildroot] [PATCH v3] package/rtl8822cs bump driver version to
 latest
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

On 31/01/24 16:07, Viacheslav Bocharov via buildroot wrote:
> - Update driver for kernel 6.7+
> - Fix warning/errors on build
> 
> Fixes: http://autobuild.buildroot.org/results/51000a9d4656afe9e0ea6f07b9f8ed374c2e4069
> 
> Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>

There was no need for V3, anyway if you someone gives you a Reviewed-by
or Tested-by or other tags you need to keep it in next patch iteration,
so you had to add my:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

that I've already given you.

> ---
> Changes from v1:
>   * improve commit log  as suggested by Giulio

Here it must be every change like:
V1->V2:
* ...
V2->V3:
* ...
* ...

and so on

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> 
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
