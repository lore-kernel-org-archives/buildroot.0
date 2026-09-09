Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86898C79FB6
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 13:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E142605D7;
	Wed,  9 Sep 2026 13:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8fo0-TBWUjEv; Wed,  9 Sep 2026 13:54:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E80E960756
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788962090;
	b=MnUKjqNNXxa7RsePAfcr+5kTmJ7WGWRw8IK5EOEouN2tZKbL3jCjh4iIC0gyWKPz2eYU
	 5Wq/m5EN47EnAsdRKI8lJq2Ce9kri5GqzkA8VZ5bPq+X88kJJubga3G+oGAHKgWN1/LBT
	 jOkiI6SanjPTqWVxQv6rSxUltNx6klNi0fgHQkcdCgeK0SHVbZow7qUQyHJRjCeBUzxrL
	 OjitEMMF9GNdxoJUXSbw4TvanYnj0gsid0x9I7tBiQq4ay3/CvHyFFHalc0iv/YI00EHH
	 0NJE0k4XIUFW1dPgx7fR25QKJQSVRdZrtKbGr0yAzSCgqaLmii/o3TBaWp4EV3cCzag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788962090;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=fG2dHuQjqBD0kWP0FxiFCBXMVdD9hldCwa1AsHF9Nlc=;
	b=SMWsdnIPcFYxyL2QMffxG6MNfBAdmurhwy05q4DHop7CyeikAIdX5s0JoQsGYhmaXfeA
	 eLl9Wz+NBBq6kE4ZlNwStquO497otPr3VdarH+jRPrCW1KwwkVz5eMUZ18pYLWPpsfQKY
	 /juChWa2B8HHW8+EOWJAU42EN3WMLp99+o69ylUvxUTGC5ymEo17cqR1N/piUSWFjLR6h
	 54BQHltDE7QaC/XTCqvGmcmS7GGsLAUsVkVcRmEz7MJYaKdd9hTYfoVlt/QpyMny8UIMn
	 O4LzrzvPnEpHVZ435q4odbS1JHeOJtaVROOe6ulOy9WQ1FmoEXNjJs47O6/Es1308CA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788962090;
	bh=fG2dHuQjqBD0kWP0FxiFCBXMVdD9hldCwa1AsHF9Nlc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NQC7IKpWMlA41G9ZgenQzXpYn43ZodInIfuQ3box3Rxk2iUoJpFcO9RFmipvQOeDG
	 69Si/kF2CTN946L96yw8cYvqj1JweC/rfoNqCZP5dH+HP5mNTjXTg/KYF1HEV/l5b8
	 k/h8r8ddZwyJ41DnPi3uL4sHXQwoyYHMo1lAQ5BJAbhEyx4E9CaUA7IJxBBy8r1KuV
	 w8IO1XJ7M9zxhU2mSSDQ7tfWFNS+WeTNtIL+qJTMMway4IBSpoGkQ7zSOKUl+y8mof
	 jftgEhg5RcdFG40pzEJIuGtOOBlEiTOaYdFDeUqbD8/9LxqjA52pfaqMUqObOWaSZH
	 22XyAzSFTg0kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E80E960756;
	Wed,  9 Sep 2026 13:54:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 998E93AF
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 13:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B5E4400FF
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 13:54:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8oRQG6n_cR-H for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 13:54:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 08AAC40085
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788962087;
 b=m3DMAQLQiRy6B+Elf6wrOMlw4qhq87ku8lnKttIx3bFGZwR6MYuqztoyHnCF9sLyQXX8
 Ul9N0CTnGnTZANiJ0iz+RsE5hyBtcWvKqxgmPX+Pcfi1tIkWmWWQr/VqQuEr4/tKlyHbm
 SZmUuk5BlaafGj0GU6wOrUYUMyVbIqE+j/6AAfWQPyaGBLbz39zHOsH/xegS68zBWbR6V
 rPfc1XK56iZ06fuYxq8otU9QrCn0h06DSpqXzx7jDRp3O6EkhTb4Q+R4vydi78XOQSWvs
 BhfcZAUrjm/BtT81uw5+23nhrUpNBeVwglkfiyIp9hG8huWtSZH9Z0O70zVJ73AewOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788962087;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=BJVPEVuc1CrBjfH7Su3OjF/3ImktVVu88aRVgra5MEk=;
 b=Aweona1fdP6tFuiHanwxc0ZT5gnpOTVPf9+GxB6xWs6m473jWY4I5h8c0ztcLvEEPSVh
 zgrd8fLzA5DQwXG3CGAgzwof79PbnrzWvLh7zLQaN37XLb4LFhXkXFRZUaWcbvm76wmmu
 ybjZv8aXz9HuxD7fvVNch0jjmjC12HaQuRjD6V2XNbsuNCjtb3JseO1PqJpXnds8bDrsr
 ylzzPOAcM2i6C6Dna9bBe2Dn6BGvugd0Jq53QkLiRtyo1B3MGG77lRwY1v7+vKqdtCIpg
 XBeiCVCKI8TFt0XMOcHd4hkNth+ZbYZgjMKDYrGiarVxaIJ115uZe1REv3cM3+m5fyQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=LrLVwvht; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08AAC40085
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 13:54:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8B2EC4E41592;
 Wed,  9 Sep 2026 13:54:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 584D660448;
 Wed,  9 Sep 2026 13:54:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B08E911C7AF80; 
 Wed,  9 Sep 2026 15:54:38 +0200 (CEST)
Date: Wed, 9 Sep 2026 15:54:37 +0200
To: matt@thewebers.ws
Cc: buildroot@buildroot.org, Matthew Weber <matthew.l.weber3@boeing.com>, 
 Clayton Shotwell <clayton.shotwell@boeing.com>
Message-ID: <aqFk8AOtIGzgikHZ@windsurf>
References: <20260827185951.3180679-1-matt@thewebers.ws>
 <20260827185951.3180679-3-matt@thewebers.ws>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260827185951.3180679-3-matt@thewebers.ws>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 3/5] package/libc-test: add POSIX functional
 test extensions
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, Aug 27, 2026 at 06:59:50PM +0000, matt@thewebers.ws wrote:
> From: "Matthew Weber" <matthew.l.weber3@boeing.com>
> 
> Add patch 0002 which provides additional functional test coverage
> for POSIX APIs including:
> - pthread attributes and operations
> - POSIX timers (create, delete, gettime, settime, getoverrun)
> - POSIX message queues
> - Scheduler (priority min/max, rr_get_interval, yield)
> - Time functions (clock_getres, clock_nanosleep, gmtime_r, etc.)
> - Process (execve, posix_spawnattr_setflags)
> 
> These tests exercise musl's implementation of scheduling and IPC
> APIs that are not covered by the upstream test suite.
> 
> Signed-off-by: Matthew Weber <matthew.l.weber3@boeing.com>
> Signed-off-by: Clayton Shotwell <clayton.shotwell@boeing.com>
> ---
>  .../0002-add-posix-functional-tests.patch     | 6798 +++++++++++++++++
>  1 file changed, 6798 insertions(+)
>  create mode 100644 package/libc-test/0002-add-posix-functional-tests.patch

This is clearly a massive feature patch, that we can't take in
Buildroot before it's accepted upstream.

> 
> diff --git a/package/libc-test/0002-add-posix-functional-tests.patch b/package/libc-test/0002-add-posix-functional-tests.patch
> new file mode 100644
> index 0000000000..402a7811cf
> --- /dev/null
> +++ b/package/libc-test/0002-add-posix-functional-tests.patch
> @@ -0,0 +1,6798 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Matthew Weber <matthew.l.weber3@boeing.com>
> +Date: Tue, 22 Jul 2026 00:00:00 +0000
> +Subject: [PATCH] add POSIX functional tests for pthread, timer, mq, sched APIs
> +
> +Add comprehensive functional test coverage for POSIX APIs including:
> +- pthread attributes (init, destroy, get/set for scope, stacksize,
> +  schedparam, schedpolicy, guardsize, detachstate, inheritsched, stack)
> +- pthread operations (self, sigmask, testcancel, mutex_trylock,
> +  mutexattr, getcpuclockid)
> +- POSIX timers (create, delete, gettime, settime, getoverrun)
> +- POSIX message queues (open, close, unlink, send, receive, notify,
> +  getattr, setattr, timedsend, timedreceive)
> +- Scheduler (get_priority_min, get_priority_max, rr_get_interval, yield)
> +- Time functions (clock_getres, clock_nanosleep, asctime_r, ctime_r,
> +  gmtime_r, localtime_r, difftime, times, tzset)
> +- Process (execve, posix_spawnattr_setflags)
> +- Shared utility header (utils.h) with thread safety and buffer
> +  overflow test helpers
> +
> +Upstream: https://marc.info/?l=musl&m=178593914174006&w=2

This particular link doesn't point to an upstream submission of the
patch.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
