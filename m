Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBF2CA5FF0
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 11:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 011F14064A;
	Mon,  5 Oct 2026 11:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0NgJVdou85i5; Mon,  5 Oct 2026 11:21:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C903140640
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791199277;
	b=aphXp+y68ofbL5JLqEouwmKhzyEYT7+VHBySorw8XbEcyWKzql2/qaC4EEfrWc2OGmIO
	 ZeLdf8DEjRas271ZAUVwqZn2ZQuVKiV+6dopN4Vud+6XJD7C35uvWlM8qt9ViPjuTfhvW
	 9MiwyOVvX7/4ZPOHq9BpuQBfSRhS6qvlV0Sag1kYuinPI+q/rs4MZua2Ez/mrmMOvr2i4
	 mhKOBjR6mhGJ1OpqjqpS/aKfu3Td0zaCMkj2LW1hTzjeMV6Ju/n9OZ+b+MO3JbSHZEKw6
	 thVU2FSRJ9WvoCmLIQkO/7GAX3RPNlJOs84E9PyIml91u4zV0tR3JfTgN4yIclUymuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791199277;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vjtS84kv3nWG1Nds7z+UJC4p7Sz0rO+VdsSavbG7cPw=;
	b=k6utZp8fW6147VS3yqeW1OfnyXYEEZTmysJCPU4ed5xCtd3tn9UtnPZ24VIemFQiReAF
	 snGjedJyie2UNRTzmPrNCxwSe1g42XVHvkavTksKHW0oFFv03La51YI+WvXUzEMwgDqXb
	 bWfTcFS5mp/R77Vh+R/v/lhFUpDxpXuLD4aBxdY6elQznEBEzkLoqPyydM8V9Ly1p1igz
	 T2G1UHnGxI3+H/f1Z0nMTY2zgALXUMeqpqJTI+kYV+IA8ZcywR3xvMijb8e3AzBeoKjRg
	 ZheU6gSFdafz5khqHaj1kmyDN98M3767cfxziLx4f1aUCo6BAXJfdUX9yrM3CwiSvXg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791199277;
	bh=vjtS84kv3nWG1Nds7z+UJC4p7Sz0rO+VdsSavbG7cPw=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N+gfGhOCryo+zuus+qs+Ayzvvz/4q7O35EEA5SDgiroTrf6Iu1fIgdiT+B9zZTcN/
	 9hxammt2BC6mWuwe9MK6OutbYwdAEa7/Z6sWrOCCFxdXSTIfTq0NMzcZloQSf4TR9x
	 cM5BcPxg3n5Sk/BJjH7XxG8p4HaldQ1CVmywRxZqBdtJ88Fp8E/GeN9KMTWjYEM7QS
	 e6XP8mbT0Q8NgoYcFpR6hKCUKUkVTrABKzHHEGYETSMa5ts18DkU9BXgfvM+YIFeMo
	 lvgmo6NMAgmluJPOe65Rgh7kZvc5rmoQoVP8lhKsWgIy9leSBGV9kZYjxB8Z7xVA+S
	 4ZsuquHoOR/Zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C903140640;
	Mon,  5 Oct 2026 11:21:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C20E82E0
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 11:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7BA460611
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 11:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNbgpmI-Tx_F for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 11:14:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 00AA260606
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791198858;
 b=BixP/IbBtKwjh6Qhy/zvHjZfmTjrE+ZB5fMHcruKU0PmZF+WHTezursHLhBcorD4uMTk
 WAzlMceGd/3jyy+AuGuAI7QxzixTh7vWlh53B1m5pEmj2UJRpYLYappO1NSfIjReaAt8n
 phEyHsTE0tCOhuhsNQTazE2F4eCDB+2XKiWcbeHAOYUmHbgxqhnBlmBKUBErEOy9jPgmb
 LDUyxUB0P6Fwy0bzuj3H9QEisPNFbeGND1ybkfzN7F/APahHvVbN+MyLvVeQbFqZ104vn
 /+lYXPwWxjuHR4LnQ9CUWEy67ksIoFDU3dcmkNJb4cip1hXj7vhJk0DIS7+PbpNXCdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791198858;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=/Da0oAH28WtRbZJGpP8xuuqy5stGuvuDa9yeDXgzMnY=;
 b=a9albPUDW8s1zofeES/M6kxFplxKBH0dcSUv0C5Hik3V8Q35KcaVLcrdtFZdiYRvLERi
 BLdGiVHS2LW3YH6NYNLeNcMZ8PvRDqc6rYhLvskUNAYxsb8Dp76dTAFoRsS4PVkoh9lzj
 IPQlEzHL6TRqZ+5zlQ47j5nk7rCuXY4DPHq81Qch5j4VnhtCX185REKR7ba+ETZGoAuOa
 k1dqH9MVBQvVpLSb8upfGLHWDiBi2mEkNDJv2+dYIb0m8ouRSUijapUQ2Sm7HNNhgGAue
 E/ECYU9Ku5uBvv84MCV62+JvriWEDRux98rHJ4735pHo/mPpiDcDJF0C4QNYAp1Bwhg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=TyuD2fjR; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=TyuD2fjR
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00AA260606
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 11:14:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=TyuD2fjR3X27Ac2NwPwaOqnqzhuyDVDk67kQYqR6qBIRfpeCt1xesYTD5+0GEaOg2WFe0PKRb/HmbMJzQ0JyrCqHPdmJAlTMn6v+AeJ4aVhZEOW3s1hvxG2XwLcFkM4YI2cfChA63qsXWohFWOVg+FuPC4Y6W+otaGvZVDpxvJjfpXQ/tKBYrRvG/XSup6I4F1ZGoJ5q29ensLkzavYWkxCFSAyrurA/IFRaHQzJovxLqHbbmFLeCdFotLjHBXthFubPwiwwvc9qfFzkEymrrQnpHTkvg3n4q7PQwlcbsomnyY7fS9rnXbhF9lv8hcyu/Vj9d/fODamNNHOdgSLsfg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=lXw1botL/xnrJXMIqa3dIOwoeziVCJabYuWKCcWKl8I=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1043180434; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 05 Oct 2026 11:14:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xDgdu-0000000Dgq7-3zbM;
 Mon, 05 Oct 2026 13:14:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Simon Dawson <spdawson@gmail.com>
In-Reply-To: <20261004182839.2615667-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 4 Oct 2026 20:28:39 +0200")
References: <20261004182839.2615667-1-bernd@kuhls.net>
Date: Mon, 05 Oct 2026 13:14:02 +0200
Message-ID: <87v77ge6x1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/vlc: security bump to version
 3.0.24
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://code.videolan.org/videolan/vlc/-/blob/3.0.24/NEWS
 > https://code.videolan.org/videolan/vlc/-/tags/3.0.24

 > https://www.videolan.org/vlc/releases/3.0.24.html
 > "Over 130 security fixes across VLC and its bundled libraries"

 > https://www.videolan.org/security/sb-vlc3024.html
 > "VLC 3.0.24 fixes over 50 security issues in VLC itself."

 > Upstream removed unmaintainted libschroediner library:
 > https://code.videolan.org/videolan/vlc/-/commit/614914f7bb7d4098bd5805724c0d8415d7fa32fa

 > Upstream removed support for mfx, which was disabled in buildroot, and
 > replaced it with optional support for libvpl:
 > https://code.videolan.org/videolan/vlc/-/commit/dcd1e9f447323a97ae230b9d86c7b8fd223426fb

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipelines passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/14754d73ba95dac50861e6fb609bbc0e8a81cb7e

 > with the exception of
 > bootlin-aarch64-glibc-old/build/vlc-3.0.24/.stamp_built which was broken
 > before:
 > https://gitlab.com/bkuhls/buildroot/-/commits/c66a31b0f7840c690de486941aa19b8d4d7b108e

 > No new build errors are introduced by this bump.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
