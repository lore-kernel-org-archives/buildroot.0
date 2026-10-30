Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800E9606A325
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mDkpVOIJ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 502D2814AB;
	Fri, 30 Oct 2026 15:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B1lJPUR5XGHM; Fri, 30 Oct 2026 15:26:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 50EF3814C5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374006;
	b=cIzTMBQf8mtBQHW2I2sxXn30PTfKkNXx4wP9S0VVD6vtFKvfVsVNiHLXaDKRRn/jDwST
	 nmIG48OvkTcXV14sdsCOAt1Bmlj9nIhHAMhUwBNIiSoHye5mRfcBYeMkyCbwdQVQuQ6Ab
	 zj7a38zeq+fsfo1tpjqeDoQHt9fumtVxMEggv+eVLV/oIKjejGRMsCDz6B2XEeYWE3kca
	 Znf2Xi7yvIMjds13Amoe7RHVD8etaf3r0JTzbRWJFNEc1g9V6FzsyJr72v2MtcmNTbCQK
	 fCWJ4/WhBdEJ+6UYazfR0yO/NFBXeef0gUVsqIB9PAkMmqshP0VVjNYetH4u2OKlZQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374006;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=grRo/mqM2K13/nwKuhHIQBj5U9OJWGs7OGCGDXMibgE=;
	b=tGXaw1csxYwYM54yySMdQiohX2T+dXEEeKkMrjRvhoF0N7rivH8U6xzUjPeDJNBbSNPG
	 27fA/X8FGOIAtGeJLKxaACYacUe2Kj3kuFyYCi0Ynm6wppmOOhCv0dq4WDXzAw8ftHBct
	 AebwdmBeahMNYzqBI6wuWq0Hqy6fWFeEYLmwvKAKfWeVSaKAtP01L9vBXwn5GGwx6UhD7
	 jPZP7NqJKNHRpKTcYvRanag8uF3eO+UW8UkZ7X5EFNyteKr6xAPH90POqepOKO8bGypDQ
	 n+tJKaH+cFop64YrLkV0W5mSw48dT3spUa+Dah0GXmiMmtGwdpS+GSrRqhpwVvS8WPA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374006;
	bh=grRo/mqM2K13/nwKuhHIQBj5U9OJWGs7OGCGDXMibgE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mDkpVOIJYQT3tiScSEK0u4dEd8xfzng0VCPK8AtOH11jsXAqvlbtUtju8UxvK8Inj
	 GDDLKTgjfIH8dWnVQ6ncUF0MExdeofa2dnzySTe6xoR6qPsqY98jiECzlraQJtbCbB
	 emgMOI05kqrCpvu0Yeeqlk3ZkT0Lo9nCgUnKjA4rPeLHoCMdH52I5/5yZ9uxMNvEnQ
	 7wg8Rn3SQjTAO3dfnamjVf16M27yX12pJv9zvInWl+aPQn4Kykg6AQlBDLh6qkozLY
	 vXdT1DdjqnkSyCCxoH9foSzPIqWc2LxI7x2PZn4DGpG1hjHOD2gwRMXBijJl3hNrh0
	 m43UDrRKElYRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50EF3814C5;
	Fri, 30 Oct 2026 15:26:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 737073AF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6552140530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0hdzdihrZ-B for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:26:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 26B1C40211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373996;
 b=nvUv6oI9zyXqr5PAdQDOVx9XY3JPOKQrR6JPw6rgTzTO19HqTrvPpLiGgaLYh98HMTPM
 CXqR7x1LTNxMzA/g79EZ2+zVoUmDlNtMJZn0r3pecVcK4quQSf9VhY/EwJn/UG75aMhOw
 EH6Mv5DDCyZS+6o6ODl+CIHUYYtckREzHY1l/PFvoK/hXI+FJlBrOg3ZMRgI2K6MbzP9f
 hfqJpBvI75Cidy0TZI4q7kD0Mj5onLC4OpO7yYnOesaHIdM/wRY/Ab0Bov3i1rvIHq/jI
 ryOLBxJk1OtJPTIL9nUmNfvKtCfA6vtZwNkvfpzKagJ8Ndj+phGON9n88484DBGWkiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373996;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=N+o8d8neD+jE7eSJjCFNhvShtzqddkTXEbkvJjoKs6I=;
 b=q/PSl97AlmBZokSOUH0l5oxTVPSPU+S2uJhZomqPSx6djsNhpS8asLdrtHz7r8CvOA5T
 mJor8wUPqfnSpg40RqB2zPOJV/yKhUzU7EeqCjU6B0vZ7rhzmUTwPK2I8yCWSWBNTdhN8
 1WfqUIwR6lgWF620RyDFdHPhijv+kDJsqmT6SZXvYGf/tkXa0gmd4rrAAG87Flkyu+ID8
 lAFYBzaQQAT+LN3PBDJ938Mn6RZ8VNwQWB6kZE4J9P0cGg3WEhH/Q1/jja2SjTdwCnrrS
 iQROEbXOYp6Sy57P4Qw92J6s1rsLJBU5QKHaltOAewupozoWIZeU2AuF2/gfxwKLMhw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=E7PMYjgt; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26B1C40211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:35 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a5720b0a57so11052565e9.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373994; x=1793978794;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=N+o8d8neD+jE7eSJjCFNhvShtzqddkTXEbkvJjoKs6I=;
 b=B1yZgIOcOgQMA99lN4mm84l+Xwh7HaZMq/7Uhw2YYRZScg/swq6A931DYW0grY6iOg
 EyrxeBDrCvT4S0zZPYNW/Cutvdc1NwdLyGUmDpOmfOevFmeHiPSTY2S9yjwZ1aRCo6Zv
 /vv74XNxRLGEGAybdmZNK2GGK7o4FxMkTMW+FthU98XxTAvGN0MG1mGo5wP+qwHbqJYk
 JhKhtZH2pibclz35RRUhOR/iN6aG/DnW6hYa6brte+vDi+7O8YhbwvDLmtrB4JYkMfS6
 YaBxfeh4Aw7i5uFkzAh1xi4jtv5/olRILZa2951oFakyXaStJx+DSZN5i8rf6jM1BaMc
 CzZQ==
X-Gm-Message-State: AFq9FYJx4kgKli4/bF1sPy1OP9ll4VOGR4EROe2HwaOiFX9ZY/LjBbA4
 YK5Xh0TaxSbSgllTBUTvIC+M2n9PsuQkpUq63cIE6mC+3/7vZW1u9BJEX6IdVIlvyFDNR4k85ZS
 iNsjeZXk=
X-Gm-Gg: AYBFou2wqH8CutkpXz3XGpa5f7G/K8/iLNrA1o6dwJSlBqM2AsbpKotchvEoaZd7Gif
 i446GF+5HT2AedAwfbfHiFQdd04IQlP6BZMOERXbsIhVeWC3h12QnvUxrHVcOdCCN3F+zPkYAQo
 E+jEjg2Vj9scVxIB2jPMYhei8LnR1MfdzkckI17D5tE/zLre4hI4OHs66RfKi0C764ioo4OL2na
 VYIPsTpaCm3tLEMR9M+eZ1JTPjhiMYhEIfD2TF9UT7Ur78+pY1JwGUdLHHRrAxV5qXF/Rjs02d9
 GyR/wo9mqQn9T0ysJfrIDL49uh9Un5PbhzVOtdmW+r0saRToEeyZgyync3GDgpGPui8tUYJZPuC
 95cQrhAfTkHOV4Hwhe9Fs94xJgpJnhBerG5hioKxxjrKFCDP4+OY2f9uMglgcDzr9qRf09Hlym4
 WtStFx50kschJykt9OzWBxr9X4Q6OltAtUqhqvz8fNagXNOfVCa/usq5gUQNJoH0BjQwTHfTirD
 gptivAJ4OI6PG7QlecT6H5Rza/ciVXmT88LYhd2rf5qeRTzYVXE4oUpR3WC2WriU/AaTPXeFPBW
 Ojghvo8c7KKGO7ypJMX+f2V2TzjftrIHtJQPpz3PpmIqc+WTISlANfDZZXN8yBzokpzLXp/j
X-Received: by 2002:a5d:59c3:0:b0:48e:76ab:78f3 with SMTP id
 ffacd0b85a97d-48e76ab7f04mr9911f8f.15.1793373993659; 
 Fri, 30 Oct 2026 08:26:33 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b79059sm4007442f8f.30.2026.10.30.08.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:26:33 -0700 (PDT)
To: buildroot@buildroot.org,
	Markus Mayer <markus.mayer@broadcom.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:26:30 +0100
Message-ID: <20261030152632.1906246-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261015222908.760160-1-markus.mayer@broadcom.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2]
 package/linux-tools/linux-tool-perf.mk.in: fix doc build issue
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
> Address potential document build issue when BR2_PER_PACKAGE_DIRECTORIES
> is enabled.
> 
> The perf package wants to prevent the documentation from being built,
> since it won't be installed anyway. The trick is to create an empty
> GNUmakefile in the proper place. It did this by using a POST_PATCH hook.
> 
> The reason this approach works when BR2_PER_PACKAGE_DIRECTORIES is off
> is that the build system ensures only one package builds at a time, so
> Linux's "extract" stage and Linux Tool's "patch" stage can never execute
> in parallel.
> 
> However, with per-package builds enabled, there is no guarantee that
> Linux has finished extracting by the time the linux-tool's POST_PATCH
> hook runs. This means the creation of GNUmakefile could silently be
> skipped if that portion of the source code hadn't been extracted yet.
> If, in addition to this, asciidoc happened to be installed on the build
> host (/usr/bin/asciidoc), perf would detect this and enable the doc
> build stage. At actual build time, it would use host-python3 (not the
> host's system Python), which does NOT have asciidoc, and the build would
> fail.
> 
>   INSTALL libperf_headers
>   SYSHDR  /local/users/jenkins/workspace/[...]/libperf/arch/[...]/unistd_64.h
>   INSTALL libbpf_headers
> fatal: not a git repository: '.'
>   ASCIIDOC /local/users/jenkins/workspace/[...]/tools/perf/perf-amd-ibs.xml
> fatal: not a git repository: '.'
> [...]
>   ASCIIDOC /local/users/jenkins/workspace/[...]/tools/perf/perf-data.xml
> /local/users/jenkins/workspace/buildroot/[...]/host/bin/python3:
> No module named asciidoc
> make[5]: *** [Makefile:275: [...]/perf-data.xml] Error 1
> 
> Turning the POST_PATCH hook into a PRE_CONFIGURE hook solves this timing
> problem and guarantees that the "fake" GNUmakefile can be injected into
> $(LINUX_DIR)/tools/perf/Documentation as intended.
> 
> Signed-off-by: Markus Mayer <markus.mayer@broadcom.com>
> Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/linux-tools/linux-tool-perf.mk.in | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> The primary reason for v2 is the updated email address. While I was at it, I
> made the comment a little clearer. The actual code change is identical to
> before.
> 
> https://lists.buildroot.org/pipermail/buildroot/2026-September/810498.html
> 
> diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
> index 8c91c2cc6b0f..3271fd5683eb 100644
> --- a/package/linux-tools/linux-tool-perf.mk.in
> +++ b/package/linux-tools/linux-tool-perf.mk.in
> @@ -141,12 +141,17 @@ endif
>  # distributions.
>  # We name it 'GNUmakefile' so that GNU make will use it instead of
>  # the existing 'Makefile'.
> +#
> +# This must be a PRE_CONFIGURE hook, not a POST_PATCH hook. Only the
> +# configure step is ordered after "linux" (via LINUX_TOOLS_DEPENDENCIES).
> +# For a POST_PATCH hook, tools/perf/Documentation/Makefile is not
> +# guaranteed to exist yet.
>  define PERF_DISABLE_DOCUMENTATION
>  	if [ -f $(LINUX_DIR)/tools/perf/Documentation/Makefile ]; then \
>  		printf "%%:\n\t@:\n" >$(LINUX_DIR)/tools/perf/Documentation/GNUmakefile; \
>  	fi
>  endef
> -LINUX_TOOLS_POST_PATCH_HOOKS += PERF_DISABLE_DOCUMENTATION
> +LINUX_TOOLS_PRE_CONFIGURE_HOOKS += PERF_DISABLE_DOCUMENTATION
>  
>  # O must be redefined here to overwrite the one used by Buildroot for
>  # out of tree build. We build perf in $(LINUX_DIR)/tools/perf/ and not just
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
