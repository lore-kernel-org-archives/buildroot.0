Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB01E668BC
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 16:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AB6184A88;
	Sun, 24 Nov 2024 16:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jzeOKRXGjPyj; Sun, 24 Nov 2024 16:29:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DE8A84A97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DE8A84A97;
	Sun, 24 Nov 2024 16:29:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A522231
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 16:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85C896084C
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 16:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdGhC8J4PhVz for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 16:29:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 57E7760842
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57E7760842
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57E7760842
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 16:29:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D55AA240002;
 Sun, 24 Nov 2024 16:29:09 +0000 (UTC)
Date: Sun, 24 Nov 2024 17:29:08 +0100
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20241124172908.2b4db731@windsurf>
In-Reply-To: <CAFkzVZbczGknp7uz78yCHo+8aW3RbjQG0ns4fGPv=Gakb02fWw@mail.gmail.com>
References: <20241030002020.73963-1-fancp2007@gmail.com>
 <20241031191844.60ba9a59@windsurf>
 <CAFkzVZbczGknp7uz78yCHo+8aW3RbjQG0ns4fGPv=Gakb02fWw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1732465750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RL3MEOevkPF+CXUN9R+52XNndJ9EBjbCXzVrgyHYX10=;
 b=a9BiZS8DFZ1INhNWVME8rcwQHN/X8WMzVgQDODN/Td4aNoZazlDKvbJYqmG3y+0VeZF7bp
 aHfwGMB0OyZ39Bsio/BLzRujEBswsSYrSx77qu1pYQhAFNVVoSWZsvcmMoCg+S8x1XQgnh
 1piqahFqx4+rn3vCOF+aVhEln99LyIhTO5c1Iul5P+1Gilzjn7fVa7kFcm24YR651j/VV/
 lUIHOsrbWHxTPJfg1qAiO0sQikbDBS4VQ/2C12Q/WLjuF/N9NrQGCk8qSq2VZ0u9a6yT8s
 zFC5WK6UHRy/kldV9wzQa5ff+o6Kr184MxqNV9dGGuSf1MnOCmu4Ni6UzfYYVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a9BiZS8D
Subject: Re: [Buildroot] [PATCH] package/procps-ng: fix pidfd_open checking
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

Hello Scott,

Sorry for the slow feedback. Not sure what the status of this is and
whether my answer is still useful/relevant.

On Fri, 1 Nov 2024 09:31:08 +0800
Scott Fan <fancp2007@gmail.com> wrote:

> > So I'm not sure my previous review was clear enough: what is wrong is
> > the procps-ng patch itself, it shouldn't AC_MSG_ERROR(), but instead it
> > should automatically disable pidwait, as if the user had passed
> > --disable-pidwait.
> 
> I understand what you mean, but I may not have expressed my thoughts clearly.
> 
> Before this patch was applied, I got a compile error (not configure
> error) when the package was built with linux-headers-4.19.322,
> Then I tried to figure out what was going wrong and I eventually found
> this patch from upstream.
> 
> After this patch was applied, it threw a configure error (not compile
> error), which is what I expected.
> 
> As the patch said:
> The previous build setup would check for pidfd_open using
> AC_CHECK_FUNC and would be incorrectly reported as true.
> 
> Therefore, I think the key to this patch is that it successfully fixes
> the pidfd_open checking issue.
> 
> If pidfd_open() and __NR_pidfd_open were not present, it will report
> an AC_MSG_ERROR message,
> and gives us the --disable-pidwait configure option, so you are
> explicit in not wanting and knowing you wont get pidwait.
> 
> Whereas you mean, instead of AC_MSG_ERROR(), it should automatically
> disable pidwait, as if the user had passed --disable-pidwait.
> I'm not sure if this is acceptable to the upstream maintainers, who
> want you to be clear about the purpose of the option you passed.
> Even if it is approved , it would require a new patch to improve this behavior.
> 
> 
> To solve my compilation problem (with linux-headers-4.19.322), in the
> current case, I had to pass the --disable-pidwait option.
> If at some point in the future, when the patch you expect is
> successfully applied, I will remove it.

What you can do then is:

ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19),)
PROCPS_NG_CONF_OPTS += disable-pidwait
endif

This will ensure to disable pidwait support when headers are < 4.19.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
