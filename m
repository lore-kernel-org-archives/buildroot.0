Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF577C4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 17:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A42884262;
	Fri, 14 Oct 2022 17:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A42884262
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DCZ3oQKfibWq; Fri, 14 Oct 2022 17:20:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B90268417B;
	Fri, 14 Oct 2022 17:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B90268417B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A27901BF297
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 17:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DF358417B
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 17:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DF358417B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bI7CvYuiHpGz for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 17:20:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D37368413D
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D37368413D
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 17:20:49 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id q1so4835184pgl.11
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 10:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RuCRX9JCyLKtGCaBaIFBCzS0QMnxVuQByzCMlN4l87w=;
 b=neKmPIBnbxcmE6PU1rcy1aiphW80Nsvf0l7zF1Y3Iy/klEhlVv7gGJ17Y2uk0jcpEm
 BzAqk+i5TZVVTk0TWFMD1pcriLyWBdu9W6GNHWMYgWMkG2XQz0FZEar5CXb3gdpP8VdT
 irRo15bJa/+xE1WWHOKsSUkzVgWM58+9mkVS5rDzjo7OT5PX6JEKEH9lugl0MXSwB0vT
 mgy9hIyDKmLlMkL9JNLcoz9qdl6q3zsuiuZki37BPCd5bIIlSsYXUkbf5PqAmnfqqJcM
 MKHbbpGFQSYaK9tbkjgdzzYyFRlDkdDqPUjdJDVUv3mfZLIsaAuOPHV7LVmFmBu1/f7J
 dLGw==
X-Gm-Message-State: ACrzQf3dLrPpezH4opK1aPdPxglKGLarGVb4Q4ykhVrIpxa2+Q0MGVTd
 zSwrW5zLz3fABavvV9kT2iliUWO8nN6MfCUcODb1xR4u1FLVvA==
X-Google-Smtp-Source: AMsMyM7FrL1wjgSiMGGvkTnqf6/iY4AL2W1aPxLxG9FO/BRnFsRc0H6kR06G6z/+t9UQu+0wJqkSySbAtraEL7nhV2k=
X-Received: by 2002:a05:6a00:174a:b0:562:781f:eca3 with SMTP id
 j10-20020a056a00174a00b00562781feca3mr6344479pfc.41.1665768048741; Fri, 14
 Oct 2022 10:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20221014005055.746362-1-mmayer@broadcom.com>
In-Reply-To: <20221014005055.746362-1-mmayer@broadcom.com>
Date: Fri, 14 Oct 2022 10:20:37 -0700
Message-ID: <CAGt4E5u0HrpzLb8VoTN+couOkgYh_QsOwToiXzGOmQsyzXYHpA@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RuCRX9JCyLKtGCaBaIFBCzS0QMnxVuQByzCMlN4l87w=;
 b=eoyVRDnIiN9UFtH+xI8MG5N1p23azSv3w0gGDmsI2xxMF6aEeSyjy/6qWfBSmWr0lp
 zwY3dqPYMa0/eplevA7a9ZoAtE1XNln8BL2WN1uqUsopGbkZF0DU/kw7glfXERTxAwWW
 38h9BFMRbfGktzkvT9fCkigpxkWtUp0FX39uI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.a=rsa-sha256 header.s=google header.b=eoyVRDnI
Subject: Re: [Buildroot] [PATCH] mmc-utils: allow enabling of "dangerous
 commands"
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 13 Oct 2022 at 17:51, Markus Mayer <mmayer@broadcom.com> wrote:

>  # override AM_CFLAGS as the project Makefile uses it to pass
>  # -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2, and the latter conflicts
>  # with the _FORTIFY_SOURCE that we pass when hardening options are
>  # enabled.
>  define MMC_UTILS_BUILD_CMDS
> -       $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) AM_CFLAGS=
> +       $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS=$(MMC_UTILS_CFLAGS) \
> +               AM_CFLAGS=
>  endef

Sorry, there are some quotes missing. v2 submitted.

Regards,
-Markus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
