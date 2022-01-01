Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4D3C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 12:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59F6360DC2;
	Sat,  1 Jan 2022 12:28:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 47HyryHrj6_y; Sat,  1 Jan 2022 12:28:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD70C60D9D;
	Sat,  1 Jan 2022 12:28:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 424701BF39A
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 12:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F735401F6
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 12:28:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A1h82xEM-z85 for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 12:28:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60000401ED
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 12:28:18 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id s4so30483119ljd.5
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 04:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=bz5kbjPl/YnD65hDlruIEmGcMT7N7GUY7/sVQcYDK7s=;
 b=NlscBWgMgxTHx9S5vy+gfcCrbYVA+FNkCcRDdOxKPdEmxkDsZQ4rpwSLbT9Klw49+i
 IA/jjkgszzNaTLFhoNhMVcCOyL9hgyqSVBMFhiT4bUIPwV8XmGLEiIr9RqVwC7x3N5Dk
 6LrtczssYoOmhk+BtJts1YxQ/TB5e1ayme9oNtbatsuFGGS2gb8YkbVuICl5DuvGtab+
 yTHmCRcUuj62mAumvXfTqkvZf/9eh/I+9EA7Tq6HYzA39g9uZWzbbQY8TMS/YiSd1RkY
 SEovBv8dBYPIstLkRDcXoyh5DUbRn+/v0issX71NH0SIJHQBPF4OoPPslfdYJKyUBL7Q
 DFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=bz5kbjPl/YnD65hDlruIEmGcMT7N7GUY7/sVQcYDK7s=;
 b=jDocW9YzJzlT35dcnXy5n5WseqsASsUG0gPbnm0bwguizoQSWU/lRmn1M3VPmxvK22
 I29mMALT6uCk7SX55Dbc+wyJ4nVuh9eN6iZGklrnO5B7MrE5R0Rv+rudWy9pom7ZegUL
 2GFzKt18cdZBq68lxOLJaSv7mZtYPzYpM9Natbnba30bwIY8/St8NxV1m9y1wz9uK34g
 MxlIaEsopBySm1+78sT5gtu7a88fVGBRrZXnY+fDqk8KfGv+ChqlbDmx1ayhRfc40qR1
 ogJRjE8qBLxmNTwpIXOJupyBbrZx5LYgYALAJyV+1ityx+LnOLPsDn+mnOCqD5aptI2q
 C13A==
X-Gm-Message-State: AOAM532Fbq4W+C1EpNtxSFdU1L0Pb0ZSt5d/WuzS83zLUrzbCZbhCXyn
 wSzc7H8J6ppUM+ic04KpbKRoVUW/Nh0=
X-Google-Smtp-Source: ABdhPJzfKgAWRiuLUdCW38fzaOgsC0zwyijW9TSNKa8dOfsshTKlhHqBdxS3Qplfwk0G9bs1Bqhs8Q==
X-Received: by 2002:a2e:a26d:: with SMTP id k13mr32457063ljm.229.1641040096216; 
 Sat, 01 Jan 2022 04:28:16 -0800 (PST)
Received: from luthien ([176.10.248.201])
 by smtp.gmail.com with ESMTPSA id 8sm2911097ljf.123.2022.01.01.04.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 04:28:15 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
In-Reply-To: <20210321135842.1165539-1-fontaine.fabrice@gmail.com>
References: <20210321135842.1165539-1-fontaine.fabrice@gmail.com>
Date: Sat, 01 Jan 2022 13:28:15 +0100
Message-ID: <87k0fj1vz4.fsf@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3,
 1/1] package/rsyslog: enable options when libcurl is enabled
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
Cc: Matt Weber <matthew.weber@rockwellcollins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Mar 21, 2021 at 14:58, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> Following the bump to 8.1910.0, items requiring libcurl were
> disabled by default. This patch selectively enables options
> which depend on libcurl when that package is enabled in the
> build.
>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> [Fabrice: Disable mmkubernetes which also depends on lognorm and while
> at it also disable mmnormalize which is available since version 6.1.2
> (from 2010) and
> https://github.com/rsyslog/rsyslog/commit/b9d3cdceabf91bc28f8f6d31cfe9332724e37bbf]
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Joachim Wiberg <troglobit@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
