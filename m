Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C038E71068
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 12:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9D4683C4B;
	Thu, 21 Sep 2023 12:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9D4683C4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NrSY9ov08vRY; Thu, 21 Sep 2023 12:50:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C7A883C46;
	Thu, 21 Sep 2023 12:50:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C7A883C46
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE2371BF3AD
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 12:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 949AB40A54
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 12:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 949AB40A54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vPLeiyZQ6GF6 for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 12:50:20 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05FED409BD
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 12:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05FED409BD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13B91E000C;
 Thu, 21 Sep 2023 12:50:16 +0000 (UTC)
Date: Thu, 21 Sep 2023 14:50:16 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230921145016.19fd28ce@windsurf>
In-Reply-To: <20230920211844.47690-1-fontaine.fabrice@gmail.com>
References: <20230920211844.47690-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695300618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uWAbbfZUUsIcYXDsiXIupx3rvGNLWRhBf+rw96k8cLk=;
 b=H9rifaKSvo5yVTHx9mSo7b9RRXCgvWomwDgQjfHENFDpjpLP1V0dB3+CH+OjxhublfCpiC
 PJo500GYmQLcBu6G1NG8sRL8tCBqZiFG2A+kUl4qpWrgy7GJFkNPOT/eveLhDMOqmr+4Ak
 RjHGcK7YSkd0aPA3r53/eU4N8W/kPMDOmxmHvNKQc2cv1DbDzZ/6qeeBNVWRfb2XqGOk0H
 X53+3gEjrjCmraHQ7zdYzZTY93ZLeXGvxW4sphLd9dtmsDdJUFgFQh71dqVpinG5jt8DTS
 y+jr46L1xw/KgV4DcBDzyRN/Ig7jYB+Yzsyg0o5qsaRV4k6ZVYLGFZM9etl+oQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H9rifaKS
Subject: Re: [Buildroot] [PATCH 1/1] package/multipath-tools: update hash of
 README.md
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 20 Sep 2023 23:18:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 9ca60c004d69e1f38000e3a74151b0a90aca7f21 forgot to update hash of
> README.md (multipathc added with
> https://github.com/opensvc/multipath-tools/commit/f220ab6678184b156b800c2885c0147acc9b2aa8)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/633ceb38996af7c95331ebe878ae8ba8a4b9b7de
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/multipath-tools/multipath-tools.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
