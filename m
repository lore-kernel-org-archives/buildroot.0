Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506D3C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 21:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E97A83C63;
	Sat, 31 May 2025 21:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id op-A5wHxpQXH; Sat, 31 May 2025 21:36:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A24583C64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A24583C64;
	Sat, 31 May 2025 21:36:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 243D6117
 for <buildroot@buildroot.org>; Sat, 31 May 2025 21:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15B5460BB2
 for <buildroot@buildroot.org>; Sat, 31 May 2025 21:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVpt0V2A9JeF for <buildroot@buildroot.org>;
 Sat, 31 May 2025 21:36:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 65528608F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65528608F4
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65528608F4
 for <buildroot@buildroot.org>; Sat, 31 May 2025 21:36:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.114.90]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDhhN-1uCutq3jR1-00CGtt; Sat, 31
 May 2025 23:36:01 +0200
Message-ID: <7781a665-c51d-4037-ae07-6a268dd3a4a0@gmx.de>
Date: Sat, 31 May 2025 23:36:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Stephan Henningsen <stephan@asklandd.dk>, buildroot@buildroot.org
Cc: Stephan Henningsen <stephan+buildroot@asklandd.dk>
References: <20250531212436.2788813-1-stephan@asklandd.dk>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250531212436.2788813-1-stephan@asklandd.dk>
X-Provags-ID: V03:K1:BYrhIvxHCGpQ/R9AG5Gcrbr3tDO0XxjHvnc6wUK6pgER7cFwHHq
 hCSlpwkeSAeKuKLWGZOmExuUkjI+JkHAC39f+xapk8p5FxeO6s7I6D0rEvAEdxGl1Qd6Mhz
 IZgDfmcjf6eqZRT8+Q8rW+V92e0nx2msf4n3jpdIG8+Bsctx8tIs2KmdylwNE49X+KCcWeH
 xf/eW+xJ2qU3rxFti3Hwg==
UI-OutboundReport: notjunk:1;M01:P0:hTInlf4KNBM=;nSKDTN6T0Mj3AiQq4+EQbKr43ip
 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
 lC/6vxVI3NJOC8tuIutpMgtTsO+74nwqhrx25Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1748727362; x=1749332162; i=fiona.klute@gmx.de;
 bh=DpJ9cvZTA38bDtIw/J/psn7z4oCj41CzJsogWxwuABU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=gimRYruWu64NnDL/2uCqTnv7TotT1aPULYZOTyFPk1zyZoA7tLJFsBGvQJBSdzc0
 XDklHqOn3joYFbIov3ZwRqHd0ZD9dV9oi9IfobuWN4X1uIRd077kgVQ9fqpFOKWOZ
 l0tnVnCnDqt1NXeiNE77mGkDYWltQwd2ibXraftIB9wfqFBCvw72yX9IWDycJj/Sy
 zS3c+khan7IslgKVcbgveP4jRtCMmx7ypdItrAbqY9/pxCsQSbZqd+mYDo6+sEMct
 07kYjl+V7Le8O97qkm5P1MiJZ4tPdyhhAcjOxswyZavT6TfIATy7FRkOkn79TFO8Y
 JwacvkajWniEn8X3qA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=gimRYruW
Subject: Re: [Buildroot] [PATCH 1/2] package/busybox: fix path for crond
 binary in S50crond during stop
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 31.05.25 um 23:24 schrieb Stephan Henningsen:
> From: Stephan Henningsen <stephan+buildroot@asklandd.dk>
> 
> Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk>
> Signed-off-by: Stephan Henningsen <stephan@asklandd.dk>

Reviewed-by: Fiona Klute <fiona.klute@gmx.de>

Good catch, thanks!

> ---
>   package/busybox/S50crond | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/busybox/S50crond b/package/busybox/S50crond
> index 74a0c0849b..7083a36cb0 100644
> --- a/package/busybox/S50crond
> +++ b/package/busybox/S50crond
> @@ -36,7 +36,7 @@ stop() {
>   		echo "FAIL"
>   	fi
>   	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
> -		--exec "/sbin/$DAEMON"; do
> +		--exec "/usr/sbin/$DAEMON"; do
>   		sleep 0.1
>   	done
>   	rm -f "$PIDFILE"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
