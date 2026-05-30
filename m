Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2417DCD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 22:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7B27615F4;
	Sat, 30 May 2026 22:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e8Y9aAJQPNab; Sat, 30 May 2026 22:14:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0112861658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780179274;
	bh=cpp3NH0gEMfrOUtm+hWaECMraU8oeaptfV65xPgNSBA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KiwcRTXByqQAlJ86lefB+qbbEVVF2x3kg7IM8PZ3VR1ikx1ZnNUuWuSTfaTbDDksA
	 LDT4cW8lXsFsXIPuJnEcbW4m5oFl9Hxn5uqSksAiE/MfGeVnYfgFtOsFr/QmTzwvia
	 wlDsjSxBInDlADibKhVA8KpK3apllJzMqJtti33VQeaPoQZNDKNArgRzV++OolJVKP
	 JV9KVR6g3H8QWxWYHjMWAX1phcTOCOhd6/l6HYwNXnCtvZHgJl6qsJyj8FnXBQK/nq
	 VkflBvopj69uWOEU+6ub+Z91A3wdRtmcvloEePr/WPqiHF6Tw2+hWXBTQM88j3DzQk
	 fExKPNXHfIgqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0112861658;
	Sat, 30 May 2026 22:14:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 563AAF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4473C4014D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SOvZQY_T4t9V for <buildroot@buildroot.org>;
 Sat, 30 May 2026 22:14:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3274F4010F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3274F4010F
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3274F4010F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:14:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 088DB4E42DA5
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:14:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9F1496073B;
 Sat, 30 May 2026 22:14:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C699110888CC7; 
 Sun, 31 May 2026 00:14:28 +0200 (CEST)
Date: Sun, 31 May 2026 00:14:28 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <ahtgsypO31LpWfYa@windsurf>
References: <20260402152156.653017-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260402152156.653017-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780179269; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=mfuXR+QOGZetFgnq5FqyuvgvvMksB3wy9tJbC5NnlHA=;
 b=mhZpQsuAUSl2Ba+zrh+GQMQ5vr5oK8fpGfdmETZNcAwEvOjYbmLiFnMvK5qwgZqCWsk4YO
 p0Lof608gQpCPC1WT5sXMJC35LYUh1h99Op9tV6I7Z7fkP15xqFlXn/KbfhAmrq/famvdO
 vOqiav8EZJxtechfYhbnwI7YvdGdtg6uZjOm2PNUvJozVCr7jo/JTiYh6FWNU+7+j2AsQ6
 uaIugxUpAbFWmM1hqS/MiwVNvn6kHUuAv0NpiCwRoVN25MGhsVWYWaPjmslAjGGDg/fKMq
 uAo5xqP6HmPo5JXBP9n7+1/nteDes25KRz48mRlp85++1nbVFx9zMhAi503X0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=mhZpQsuA
Subject: Re: [Buildroot] [PATCH] package/ncurses: improve EGREP detection in
 configure script
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

On Thu, Apr 02, 2026 at 08:51:55PM +0530, Shubham Chakraborty wrote:
> Building host-ncurses fails on systems where a non-standard 'ggrep'
> script is present in the PATH (e.g., from Android build tools).
> The ncurses configure script picks up 'ggrep' because it searches
> for it before 'grep'.
> 
> The existing check for EGREP only verifies the exit code of:
>   echo a | $GREP -E '(a|b)' >/dev/null 2>&1
> 
> The problematic 'ggrep' script returns 0 but does not process stdin
> correctly, causing it to be selected as a working EGREP. This leads
> to failures later when the script is used to extract version numbers
> from dist.mk, resulting in:
>   configure: error: Release major-version value is empty
> 
> Improve the check by verifying that the output of the test command
> matches the expected value 'a'. This ensures the selected tool
> is a functional grep.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>  ...-EGREP-detection-in-configure-script.patch | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/ncurses/0001-Improve-EGREP-detection-in-configure-script.patch
> 
> diff --git a/package/ncurses/0001-Improve-EGREP-detection-in-configure-script.patch b/package/ncurses/0001-Improve-EGREP-detection-in-configure-script.patch
> new file mode 100644
> index 0000000000..e43fd737cc
> --- /dev/null
> +++ b/package/ncurses/0001-Improve-EGREP-detection-in-configure-script.patch
> @@ -0,0 +1,43 @@
> +From 8fb8ef42710bec224ea4cd8940007d6c85268f0a Mon Sep 17 00:00:00 2001
> +From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> +Date: Thu, 2 Apr 2026 20:33:10 +0530
> +Subject: [PATCH] Improve EGREP detection in configure script
> +
> +The ncurses configure script searches for ggrep before grep. To verify
> +if a found grep works as an extended grep (EGREP), it currently only
> +checks the exit code of the following command:
> +  echo a | $GREP -E '\''(a|b)'\'' >/dev/null 2>&1
> +
> +On systems where a tool or script named 'ggrep' is present in the PATH
> +but does not behave like a standard GNU grep (for example, a specialized
> +wrapper script that ignores stdin but returns an exit code of 0), the
> +configure script incorrectly identifies it as a working EGREP. This
> +leads to a failure later in the configuration process (e.g., "Release
> +major-version value is empty") because the tool fails to extract
> +information from source files like dist.mk.
> +
> +This patch improves the robustness of the check by verifying that the
> +output of the test command matches the expected value, ensuring that
> +the selected GREP actually processes input correctly.
> +
> +Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> +---
> + configure | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)

This patch is wrong for two reasons:

- You are patching configure, you should be patching configure.in

- You did not submit this patch upstream

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
