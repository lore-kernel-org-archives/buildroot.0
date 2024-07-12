Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5F6C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 10:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4617E416AC;
	Fri, 12 Jul 2024 10:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gKvWjrhSAUWa; Fri, 12 Jul 2024 10:54:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1037F417E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1037F417E7;
	Fri, 12 Jul 2024 10:54:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2AA8B1BF47F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1600A417E7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:54:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DjOp32is7OGK for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 10:54:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D658C416AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D658C416AC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D658C416AC
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 10:54:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD29A40004;
 Fri, 12 Jul 2024 10:54:49 +0000 (UTC)
Date: Fri, 12 Jul 2024 12:54:49 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240712125449.59b0cb87@windsurf>
In-Reply-To: <20240625211847.1419944-14-roykollensvendsen@gmail.com>
References: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-14-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720781690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mlc5nYHvB7xCwHL8aniUNzUkkB51mPU0eeGoZbi5+Ho=;
 b=c2mOhTJxZx54lOaluah560mOYidPkUK2g2g0m/K+qTLFjyM312kPVahT2bpYucONMc+6fZ
 90zdN2zMnB16tw3DqbquXNaqreVTtniSdk8KJP2gD/d+ul9gBCSZAxbkiNVKdIC5s6rL5G
 9EjyX6HNvVoST2W6VBAh3iRNDjuyoTzzcPGvGeemZ/FsSw9lbTKh4+7pJHPvxEZ7wFpIWf
 9tN3sgfEzjDASxHxh2JmYjV/wEfGj/NLnmc1tc7wf7fI94o4FWfLAR+fNMVMSCznsnkwfN
 +Y0WipeeJOyAEFBL13LqfNXNMC+hNQDangjMQs8NsPlM1FsUbl+y1TjhNQ2rbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c2mOhTJx
Subject: Re: [Buildroot] [PATCH v9 14/14] package/qt6/qt6mqtt: new package
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 25 Jun 2024 23:18:38 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
> Changes v8 -> v9:
>   - bump version from 6.7.1 to 6.7.2
>   - update hash

Applied to master after changing the licensing details to:

+QT6MQTT_LICENSE = \
+       BSD-3-Clause (examples), \
+       GFDL-1.3-invariants-only (docs), \
+       GPL-3.0
+
+QT6MQTT_LICENSE_FILES = \
+       LICENSES/BSD-3-Clause.txt \
+       LICENSES/GFDL-1.3-no-invariants-only.txt \
+       LICENSES/GPL-3.0-only.txt

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
