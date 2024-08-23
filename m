Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A46EC52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 15:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABE4984107;
	Fri, 23 Aug 2024 15:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kuWh8F16xiRG; Fri, 23 Aug 2024 15:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9363984101
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9363984101;
	Fri, 23 Aug 2024 15:48:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 780521BF313
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 15:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 724264041C
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 15:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 329ZlbVbKn_P for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 15:48:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1AF0440399
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AF0440399
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AF0440399
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 15:48:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71B1E2000B;
 Fri, 23 Aug 2024 15:48:41 +0000 (UTC)
Date: Fri, 23 Aug 2024 17:48:40 +0200
To: Un1q32 <joey.t.reinhart@gmail.com>
Message-ID: <20240823174840.40aacd0d@windsurf>
In-Reply-To: <20240823090939.79455-1-joey.t.reinhart@gmail.com>
References: <20240823090939.79455-1-joey.t.reinhart@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724428121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r2nPFwcfBuCCVGCQ/Jz3VsjYqtgRYJypln1PIu2qEws=;
 b=eleL47an88kQBQUQJfDINp0F/qvpQSb4CslCSF1oHANzpp/osntPcsyxPUQwF7WmxRv01E
 5qdod02OFfdD3F87bwIemzItj7kb1Qsy9skfSXeu+mbGJVx1sV14o6hK+9yYzRsrGeRIkL
 soh8oI9MHT76vQTwzJApatRwTz35PRgKDt9Ax4EuLX83cOOU8LLQvMHnUAV1nDbLBhpMGA
 IZyj5BUwwTZF20ITQQ74ho7wqzwQfuffTy0T9aviyDV8j0MJPEl7gvrNOxS8KerbTJqCld
 gdkzx3tax1tU2C41blLeel4cVYtcssnObtEtOe2uL2ZTF79nR+2oKqWQ66pEJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eleL47an
Subject: Re: [Buildroot] [PATCH 1/1] package/busybox: patch to fix tc build
 on 6.8+ kernels
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 23 Aug 2024 05:09:39 -0400
Un1q32 <joey.t.reinhart@gmail.com> wrote:

> Signed-off-by: Un1q32 <joey.t.reinhart@gmail.com>

Thanks a lot for the patch!

We need patches to be sent with a real-name... especially when in fact
your real name is clearly visible in your e-mail address.

> diff --git a/package/busybox/0010-tc-build-fails-on-kernel-6.8.patch b/package/busybox/0010-tc-build-fails-on-kernel-6.8.patch
> new file mode 100644
> index 0000000000..95f2585c21
> --- /dev/null
> +++ b/package/busybox/0010-tc-build-fails-on-kernel-6.8.patch
> @@ -0,0 +1,55 @@
> +http://lists.busybox.net/pipermail/busybox/2024-March/090678.html
> +https://bugs.gentoo.org/926872
> +
> +Linux v6.8-rc1 removed the definitions related to CBQ making tc fail to
> +build. Add some #ifdefs to handle this missing support.
> +
> +Signed-off-by: Un1q32 <joey.t.reinhart@gmail.com>

Could you please send a patch generated by Git format-patch, and that
keep the original authorship? It should have an Upstream: tag pointing
to where it has been submitted upstream, and indeed your Signed-off-by
line.

See
package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
for an example where it has been done the way we expect.

Could you come up with a v2 of your patch that addresses those small
details?

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
