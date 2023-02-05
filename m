Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62DEC636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 12:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AC324010D;
	Sun,  5 Feb 2023 12:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AC324010D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7XDZb2MBDGSm; Sun,  5 Feb 2023 12:24:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88B294010C;
	Sun,  5 Feb 2023 12:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88B294010C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A02621BF364
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79E154010C
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79E154010C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AxKMoyLZNcDt for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 12:24:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A54A40106
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A54A40106
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 12:24:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3F70E60003;
 Sun,  5 Feb 2023 12:24:22 +0000 (UTC)
Date: Sun, 5 Feb 2023 13:24:20 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20230205132420.6a559edd@windsurf>
In-Reply-To: <20230202133817.56293-1-neal.frager@amd.com>
References: <20230202133817.56293-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675599862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qWwmPpgpYuv60NNNsQbJLvXsFu+IpoIqFYe7k4XvEPY=;
 b=CjX6l/FntjWPOiA4k4gilvwRmRUg+ssGD7LzGjLCDEX8xw3347p0PD2ujvbGGQFLRTliIn
 VPqbaNobYzP2rhUjrnuCWxbOMK453wGHdbGJwLI3usgQvAiNtIFajQ8z7MtVzirmciGvot
 4k8aROvKkw49Vt6Yq1u3x+8yCyJOg+m13wIGgmhivvW0XFQLHK9dbwviI14qtHs73P15ie
 K9FImyvR/yz4JfWSWfNG8WU2MNS7Olf9B9udI/vVgpjsNDFXUJFpxXO9ZnhO2fd1GLC1Pc
 B/aXYFbKNY3154MiQJirYvRd+hoUtpxFYxFyswZ33xvqRM9xiaoMsn/8uiQ3HQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CjX6l/Fn
Subject: Re: [Buildroot] [PATCH v1 1/1] board/versal/post-image.sh: do not
 require xilinx/ prefix for .dts files
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
Cc: michal.simek@amd.com, gsmecher@threespeedlogic.com,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 2 Feb 2023 13:38:17 +0000
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> If using BR2_LINUX_KERNEL_CUSTOM_DTS_PATH to copy .dts files from
> buildroot into the linux tree, these .dts files are copied to
> arch/arm64/boot. Unfortunately, the post-image.sh script expects to find
> them in arch/arm64/boot/xilinx.
> 
> This patch does not require the xilinx/ prefix to be present when
> symlinking the device-tree to system.dtb where u-boot expects to find
> it.
> 
> It is effectively applying the below patch for zynqmp to versal as well:
> https://patchwork.ozlabs.org/project/buildroot/patch/20230201195956.1758827-1-gsmecher@threespeedlogic.com/
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  board/versal/post-image.sh | 2 +-
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
