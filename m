Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBDE606A330
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=miTY2EHi
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6BCD40ADA;
	Fri, 20 Nov 2026 10:00:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wID_GoEzB4qN; Fri, 20 Nov 2026 10:00:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C631540ADC
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168856;
	b=TpBFhUogR2WvWcE43Xed3p4gFWbSpb+i8svcErvzswsBM2Li8em5s2aTT5z4Vdg3GS7o
	 Wzj52NwjPrzqgZYAYLs+05dCex7wLS21TSsvQdiINJ2/H7UY2UOXbHOJKa7lszQl3DjCa
	 yFJNi1CyQ+6ULcRu+lvGu0hw2EBCzSiL/igQ9aCDfHeTxZa0wLFOV7hfER2PKHjP0RWIU
	 bCFivzoTX2PhLzoqzFp3OC9bs12Ys0ECaoqcptuQlszdAprtf5ABW2a5A1T8QQbIvU9pa
	 hnHCXzRrC0FZyjIIxOb80aeS4NP4vBODxRJTwIuJ91l+yisMvAvjVcVKQZnPJWJB5QA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168856;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=szIU8ik5xE84qwtW0Cpk1u+4D7KbQTET3LIocB3x/QE=;
	b=poUd6zqzjWw/ex/+h7fKR6NH3k7DMIV9Kxc81tcOlMaE4/2D1xbb5hapy0AXfh1yr0u5
	 rVMp396kBsgMKpFPTCM8H+fSwYPtTiDS7KDQLwOhrBIp3jn55QpgEvywhkNISRDcEQxs1
	 mmggvBZlo0CoNOecJsPqvXdxpRkKPmTSjZERi3ir5VBG8MrJemq4MuFNbCUuiIcVivBB6
	 eS2efah7kZozgxQEu05i8RbydroTl8D2kf/+21/o+9yiJMHd0OaqhQnk6/Qz1cR70u4JO
	 PXrKld1yOgKagQqYG6mJ5UMH2HTkW6C7PaqdqYNOBJspSSkZ6Pu3mybuifI7oS0GtCw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168856;
	bh=szIU8ik5xE84qwtW0Cpk1u+4D7KbQTET3LIocB3x/QE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=miTY2EHidtnhPotVXP6ipStYZoIlF7hPdG/xQOC3D8QzdXrqvx4FF2nth/JOqvoA7
	 t4zMnt1YSY4b/AKWXpwVv4+hzzc1ihA0IgXwYwveA66QK5Y4cvhwtxh6Afk/2jEeZ9
	 cvej30+T6zNOU0axNwgRV50oYJihEofKJkKZ7Kc3jWN3+b7R8aodBbPhA0IZoB8XlQ
	 a617X2hjqS9YTthc+zSbeqwg2tWEreB0z9ej4V8ueNwbFPwt5BQJY43qe6ha4DzA63
	 ii2r6eKaU6fdGj7FnIWrjw5XR0fz7XZIZU9Qlfka9LQRMTLZdFya33HTS03ynZKW3c
	 NuSwjjCpBRaLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C631540ADC;
	Fri, 20 Nov 2026 10:00:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4EBA169
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AE26813F2
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kOtrol8BuSbR for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:00:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DC65E812F1
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC65E812F1
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:53 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4bb702a7548so5147635e9.1
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:00:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168852; x=1795773652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RhX2AYc6D0fHOB1sb+nV4Oz1RCvqKbvM+RrZe5w7pkA=;
 b=zn4+wr+TPphXjxYcHNEvYK7AxDcomPpzT7khcjWRUyuJA/Z4IIN203yaxEQWVuBMiR
 Bu2ylKy23V6nQp4+Lp8FsWKnSj9AxjGZF4Q2Y6f/y/itVo1qDdhQz8jUWpbdafY+XHqu
 7FvK5F+akjniNTcov4zTEPLFaX/pFxCJF83J6TkUTdy8BuymjvPLla7x42Uig+hY3TWS
 W2ziMczO/HnyOi7fNHOpVLZMUs1GJCdt98yfQxTtIzQC/mYgEJUXjgh+FdaqkiP0NxA5
 IPJ7xO7O0BsK/uKgSBi9lAgz4tdxjtoV9vr1Cgeg2VsX0eeczanBrreJuzJ04vfYJOPZ
 HGUw==
X-Gm-Message-State: APuU4Z/hqMYDLd8koZBPwrLwQC1gn6vCamr0VOMs01mOW+AERtjx434l
 vovTY0Hss64rtTgR1CegXsdo/KydSI4LSFLC/yfrEC5sIUbEHbDRWvI147+jHpCufdMEtH9Wj2L
 W+BQ8Sb5Lyw==
X-Gm-Gg: AYBFou1L9LX2mlqw6xjmGSycMG/V0+bmfoe0rGAKQBvm68owUTwpH4c5FpFIhnIZdle
 OJUb6xZ1m/ISE+NGHjkbr/ayZ6GsnUnV+Y0nlCnsCTSvxDr7KkhaKciJ4Yda7KPbwgy38UBilLb
 pRDlB8VrntMkx8IgvsaSza4/CWAH0cM9w7f/W92uCUU/JxopH6xqECIoD9DWXz6lHQfNBktSuSz
 a4IKNcaKppZdu0g2imzZYSSJyojKc/WJHUcqFwETd68GCbZitXDLK1c8TQXKfzA0CT7cG/enNMI
 +8cUfRuKODDwRWnfDErhwsvQQaeK3xgrkx+jBz7iieQvOR/VZoEmMDYE/1J1Xpad0UOoW+McCJG
 60dn0tARJHq3Aj63FVxwvH/aD/RXoE+dg5Zi9iPUPa9guaPWIncxtrsaL1+tk4lv/xCCM44/B9F
 WMgtPNqJvy1HfSyYtAK8INk8ujfab+Ba5jBMX3am0ChcD1P0KluGUGYDjjL1oAGaU4t9KVY6wsR
 usbd3gHYOynZ9zp5o8stNLKAyhQZoiSeCqnF08X5nqIBXSxRq313mImtFAS6SvdfSu7AdIJlTuq
 2MT92ox7HmAua4tV7suDtcuCi22r8rbEzuHKPspYa6hP
X-Received: by 2002:a05:600c:5246:b0:4bb:6de4:2f7c with SMTP id
 5b1f17b1804b1-4bb8881c5bdmr56901575e9.20.1795168852054; 
 Fri, 20 Nov 2026 02:00:52 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884a3a3dsm63910705e9.10.2026.11.20.02.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 02:00:51 -0800 (PST)
To: buildroot@buildroot.org,
	Julien Olivain <ju.o@free.fr>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 11:00:46 +0100
Message-ID: <20261120100050.542350-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261114222155.1450949-2-ju.o@free.fr>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] Revert "support/testing:
 test_python.py: disable interpreter colors"
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> We are now disabling colors for all runtime tests. Setting NO_COLOR in
> test_python is no longer needed.
> 
> This reverts commit 3a6e2b4a0395f6e049cd847cf16406a4d0d998ad.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  support/testing/tests/package/test_python.py | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
> index e815376d21..c9ecf9acda 100644
> --- a/support/testing/tests/package/test_python.py
> +++ b/support/testing/tests/package/test_python.py
> @@ -17,9 +17,6 @@ class TestPythonBase(infra.basetest.BRTest):
>                             kernel="builtin",
>                             options=["-initrd", cpio_file])
>          self.emulator.login()
> -        # Disable Python colors for all Python tests, to make pexpect
> -        # pattern matching easier.
> -        self.assertRunOk("export NO_COLOR=1")
>  
>      def version_test(self, version, timeout=-1):
>          cmd = self.interpreter + " --version 2>&1 | grep '^{}'".format(version)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
