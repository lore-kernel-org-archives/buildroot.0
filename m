Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F11EEB57B
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 22:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DA0140631;
	Thu,  1 Jan 2026 22:09:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 79tw90phq0GE; Thu,  1 Jan 2026 22:09:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18E33405F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767305355;
	bh=2lrGtNX5i7GimFlVh6TIctSFo6IP14ImtM0chXlRrfU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XmlnsqHABayEirqDvBlk1aIM84/afaWJIKnshKLkcBYnxu015c+M5BkloYh3XLSFQ
	 FaE5JrqhCXuUDMvPt6gmmOMdtzpZqjjBRSq+WPdHiNCwHD0xReh8XKR+icRJFfrMXY
	 LQ5o31Mxmn7xnA/8y4A/U4ofTWmNYek2iWRUX2fhXo15a/zTiQ36yZrvm4lP96V++8
	 zmg6A/Y1lPpCOL2dENrAW019sh3XGt076SgSRAhj1X2bgB1O5m2Mxjo12860UWe6Mo
	 b2hNIz67e2U66I4tv0ucZktwZsoQ554ygSLx8DWTj3pE8sGR1ohCHUDx/u1UzH+vLt
	 ZcsEeAzNHnX0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18E33405F9;
	Thu,  1 Jan 2026 22:09:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 83A70206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A77B405F9
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SkVUS5xFjT0e for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 22:09:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 894C4405ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 894C4405ED
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 894C4405ED
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:09:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id F0FF9C1C3A0;
 Thu,  1 Jan 2026 22:08:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 80D5560749;
 Thu,  1 Jan 2026 22:09:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3E548113B0713; Thu,  1 Jan 2026 23:09:05 +0100 (CET)
Date: Thu, 1 Jan 2026 23:09:04 +0100
To: Norbert Lange <nolange79@gmail.com>
Cc: buildroot@buildroot.org, Sen Hastings <sen@hastings.org>, James Hilliard
 <james.hilliard1@gmail.com>, Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <20260101230904.6d78e9f5@windsurf>
In-Reply-To: <20251119154819.3416176-1-nolange79@gmail.com>
References: <20251119154819.3416176-1-nolange79@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767305347; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=CL3o499/xzC+/pn9f2osFzvDAP0tVDKPTl8pkiWt8zk=;
 b=gQcQ2KBVfZ4L7uupiGBSXDXDVzshKTk3gHlANlFREG3w231jimieYCim2JrdX/c7oIc56s
 jv2x2YX41EbBkDa9qU3WuOqRvS8O+eXUz8nvBLXHy6ZxAggNIiWW1bvVuIDr2lwOS4GtJV
 VWcSw4AmjsYvFl634aPuqV9bDKO+xdycRO7zfv4Ne8C8T7pO/xqPVgerbK8OUsXuTGZwdJ
 B9fZjlPxEAUvbOGpl1bCvI+4eutyWgtuHQWNefPtoVZ0ZgtzzwfcUJvJt+YhIzR2dxom4L
 dj7WT30D05wgI2M1xCFwb4XGYE6yZDvKbkQl1BSm2yQ7PVK7cWJLemD9ynii6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=gQcQ2KBV
Subject: Re: [Buildroot] [PATCH] package/systemd: remove several Kernel
 config options
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

Hello Norbert, James, Marcus,

On Wed, 19 Nov 2025 16:48:18 +0100
Norbert Lange <nolange79@gmail.com> wrote:

> All those features are optional and prevent customization of the kernel.
> Forcing IPv6 is particularly nasty.
> 
> This reverts parts of "package/systemd: bump to version 256.4"
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

Thanks for the patch, and thanks everyone for participating to the
discussion.

Buildroot's "philosophy" has always been to be reasonably minimal. So I
would tend to agree with both Norbert and Marcus that we should not
enable all possible options that may be needed for all possible
use-cases. We want to enable what's needed to get our systemd package
to "work" as-is, but not necessarily every possible feature that the
user may use through systemd unit files or specific features.

However, it would be good to draw a clear line, and rather than
applying Norbert's patch as-is, I'd prefer to see a commit that cleans
up those options, with a comment on top of SYSTEMD_LINUX_CONFIG_FIXUPS
that documents our "policy" on this, like "Following what's documented
at https://github.com/systemd/systemd/blob/v257.10/README, by enabling
all mandatory options, leaving disabled only 'recommended' options,
with the exception of A, B, C because blabla".

Norbert, or Marcus, do you think you could propose something like this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
