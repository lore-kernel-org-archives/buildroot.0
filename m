Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71290C3DA49
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 12:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F2D760B1E;
	Fri, 26 Jul 2024 12:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hsy0W3AzQcsO; Fri, 26 Jul 2024 12:12:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8470B60B14
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8470B60B14;
	Fri, 26 Jul 2024 12:12:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 204301BF29A
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 12:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DEC181F11
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 12:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VHbLkCYT4H6n for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 12:12:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC04F81EBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC04F81EBD
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC04F81EBD
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 12:12:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C226AE0007;
 Fri, 26 Jul 2024 12:12:49 +0000 (UTC)
Date: Fri, 26 Jul 2024 14:12:48 +0200
To: Danomi Manchego <danomimanchego123@gmail.com>
Message-ID: <20240726141248.41369067@windsurf>
In-Reply-To: <20240726094603.10333-1-danomimanchego123@gmail.com>
References: <20240726094603.10333-1-danomimanchego123@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721995970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uK4BjIySKKnkIjIvKFtDp7NzKmLl/yttECsxoQ0h5Hw=;
 b=QUwAKjfoELq7WaR4k7EdkJVrTZvp0x9y5Y0zpR+CT4TG7GXLMq4lNrJNSs4G86tiEuQgw5
 2BmEvn59sBOB1uqN0t0fSb92X2BCK2OSbU9rzDKBdEsqTXS6hpnSHiuy9QVXG+agjTToO+
 NAKemFbUhibgT4Tz4vx+FMRn4gdDByonlcafxor7z3KsU3noobXwoZtFSRdlQY4HJRBSb0
 tHKqMD6UlxKDuUbO81WwcT8Fk8mqlTAPZ/o40/qs3bl8TO4I67da8GTkmKkRJvpwDpkDdX
 zYZQFFudSQEVxY4yyHUGeyCOM7F+7dwXMFQ9IMlMUWchAmGLiwzhT9RXjBWjEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QUwAKjfo
Subject: Re: [Buildroot] [PATCH v2 1/1] libpwquality: fix PAM module path
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Stefan =?UTF-8?B?U8O4cmVuc2Vu?= <stefan.sorensen@spectralink.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 26 Jul 2024 05:46:03 -0400
Danomi Manchego <danomimanchego123@gmail.com> wrote:

> The libpwquality package provides the pam_pwquality PAM module - the
> replacement for pam_cracklib that was dropped from linux-pam back in
> version 1.5.0.  However, it currently installs it to the wrong place,
> so passwd and friends fail to find it.  This commit sets the security
> directory path to /lib/security to match the corresponding setting in
> linux-pam.mk.
> 
> Note that libpwquality has *always* installed pam_pwquality in the wrong
> place, since version 1.3.0 was added to buildroot in 2017 in commit
> 462040443ca943694fc59ec8380c82f8bf9aaddc.  However, back then, linux-pam
> version 1.3.0 still provided pam_cracklib for advanced password checking.
> Linux-pam deprecated pam_cracklib in 1.4.0 but still built it for us when
> linux-pam.mk set --enable-cracklib.  Linux-PAM deleted pam_cracklib
> altogether in 1.5.0, so it was not until our update to linux-pam-1.5.1
> in commit 276f1e0a896698abec85500a86686bf72c79eb91 that pam_cracklib
> became unavailable.  After that point, pam_pwquality was the only
> alternative for PAM-based password checking.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> 
> ---

Wow, *that* is an amazing commit log with all the details about the
problem. I think we could link to your commit message as a golden
example of the level of explanation we would like to have. Thanks a lot
for coming up with this v2, which I have of course applied!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
