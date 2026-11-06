Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6318A606A334
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gQG8htFF
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DC8C81A64;
	Fri,  6 Nov 2026 16:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rfLwJ7TfYOGm; Fri,  6 Nov 2026 16:09:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 27D5381A33
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981391;
	b=OtsYysz4tOYub1uGZcEvs4o1nFSGpwHc81MpUepTU9WTxMmPhmzmS9Qc1lRVT8PGgFVj
	 dnwHAnvPwRJUnazukIFUZVPF+mYluW+JuRAQxouhzbclRbTFFlAeFpmTfIPFD6MVvGLPE
	 N0lqpH6eD3TS7IsenKEKQ/3Py4j4aZYKVi//CrJg1L/h0SpSFP3D//k5uUaVFlob9QYEJ
	 hMEUfT69z3GfExYv23O5+GLrrLWmGMOYyaUaQOGFRiO9fVmyeADhYAkeQHyD+SpJe4lqd
	 XEZ8KenEzZPothVC+fdHrJqR5h1BQIZRjz2ZVzJQNjP5a6XqNmIp770KpPSdtZdk6Ew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981391;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=KKEpQsJBw2fqdTO136Y662G6Mlqi4GhxYcazJdEApjg=;
	b=h4QdnzY1ynd+BE3f0qlAt5o39IbsC/qzZDIPf2B9vzHxOps2t0DynYQ0IMn9LVDuZIph
	 e9j8Mu3hcLajzoykxLmbBwyOpIJMDhNM+I9B5HptUQyEAGXEiXRvtbALgdCFC45ZFljiW
	 45xkslDGQhD64+///NEuf8AaLVbqppn6CDi/d5yqMGt2MV3ZfvX1VjOKSiGBh/6gywaKh
	 Z0P/mEOxp0AW9yzT46ATuBHYz6LeAKlvV07b4zCP/TV0mG8bThSoFN+Ju6anOyYbpbKrG
	 rGKGlLyQZ8z/JSP01B8MIheN6kbtRBJpNIvJmW1WWjGz66N9gsE8HSyBicjVD43THFg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981391;
	bh=KKEpQsJBw2fqdTO136Y662G6Mlqi4GhxYcazJdEApjg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gQG8htFFmMYAh+8G7wZ1G1aTKyIZNamGDmbBhjQ+SR5LHuVve/4xsPV8ANJ1r87W+
	 dlz35zO0xlIv90uyFHIYWxRw745tAPmvHvx9i2pYZyn23u/5vOezIQRsqWIrHb4dX2
	 i9V4DsM3mIL+H8/YSHj4N/2hDf0PpU/2lRzvQ0pOnJljlyE0yoN5m4aEbDvGyekK31
	 GWC1eXMLKODcO5NpkTCOvEQod6xP1t0B971jRMVfv52eE83oikvwnnkPtfvXppVNPk
	 jlr5p1RaBOhbm7x1FoA/YCC/i3MAMPS6nSMmdCPLJCcad3Op1PjS2OAOkDVpshq/AC
	 OPtqX0FEXNqRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27D5381A33;
	Fri,  6 Nov 2026 16:09:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3A214B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5F7B815C3
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sncI4ilrNK9A for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:09:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3DD2981773
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DD2981773
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:26 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4919a880834so480846f8f.0
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981365; x=1794586165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZSguJezoLMk729rBrJ4nnRcExeVFLDFAaqIooU0Rj4w=;
 b=x9REnyL0Fw1Y8X1xJTfZsWJEYVtIFKkJcY0fpTttG6QUoZfD/fyX1w2ael3qDJSNZi
 hBdSvhXyKgvafl85ovngsK49toDwWyNn7wSZzSce4zR6fEjNPvSE/2butxOQNEdO7iz9
 BwKQFaTViWKdRi6VuqjeClSrI8NUVX+ZExoYCkPCquPa6tCykDeYtdbgbrP9PaGOhw6P
 3VpoYEjYGcY7CpzGdAVgY1iD1YBhyWYIA65KBAjOqX+ikuQC97URypdSvpK9lsQHUv2r
 GjxU5ysF6cLuiuYrR1R737eGw5MGR4oYsd2rK8sMgzekUhh/xbMb3U7cv6eatTLn1KmN
 IWPQ==
X-Gm-Message-State: APuU4Z+mkPdEmPQoIObyjTns8t4mznVx/WMvkyJUCwxQ+MC8G08yuxGB
 PzPnDMzixFTFbvUShrejddGW+W90raeTfNy5SJ9Oxa32w2q+dCWg/NmSy0MJn9C+Y0VjuheOF6M
 AM3lRc1w=
X-Gm-Gg: AYBFou3oE0V7dFc0pQCr5prh4TXdXvMmaoN8ydvDEZuKi2T0q0tjLNLBb28X+c9J84p
 xPS6JF75jRehqbf4lLBxyrrv6f70X2gRRkIlmbfLSHSeDnDiI9ZIoD5bsGmBRkCa2zyiEvptI0R
 WWQA7DvkI3oBu8AcbPugQ4Xtc4fioeRrWkenW750Bev8+iBoC37jvcuPCX5TStcUcKYyuqp1NJs
 m0sEoWokEVhMXCzXfiUb7jt0Z4xHmv01XB1PNXOhwetv320GLDFSiCYe+UtUzjDsHaJheMkdDaV
 cato+h6Xx8FrMYtWZoYMcYU4r19oa8TLlhEYHHGZoXS82EUCuhy6tDeYLvz6tBKUim68qn/9Dhe
 FPYuWlIuBilDwZN9u+wzeQYsE5JxbAZRY6az8AAn7f1pZbQxNGLzuYQLdXpHzMaATHrx2fKGg6y
 InHpwrVDr2mUrlTBqkZIZhQ3MjZW/N0dSyLhlyHfXlEsvzXKEZnv81vWs8VDKzBO23D5Jl/OM55
 BHB2Xi1JG9mgSySZIa9iVW9V9Av94cH0qDhVKBHTnLE19fGxBH5e2YdJ3JuS2UBmCPvVoIVmwKp
 WrhVXoKTIAnL56V468/urNZ9m0620sU=
X-Received: by 2002:a05:6000:4b0b:b0:48e:4300:c6d8 with SMTP id
 ffacd0b85a97d-49275a271acmr5598912f8f.35.1793981364924; 
 Fri, 06 Nov 2026 08:09:24 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d6d63ad7sm4957504f8f.15.2026.11.06.08.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:09:24 -0800 (PST)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:09:21 +0100
Message-ID: <20261106160923.607137-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261026141521.1906205-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/dante: fix build on musl
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
> Since version 1.4.4, dante's sched_setaffinity configure check defines
> _GNU_SOURCE before including <sched.h>, but the actual build only uses
> -D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE. On musl, cpu_set_t
> is only declared with _GNU_SOURCE, so the check succeeds,
> HAVE_SCHED_SETAFFINITY is set, and the build fails:
> 
>   ../include/sockd.h:1604:4: error: unknown type name 'cpu_set_t'
> 
> glibc declares cpu_set_t unconditionally, so it is not affected.
> 
> Add a patch that defines _GNU_SOURCE on Linux in compiler.m4, so the
> build uses the same feature set as the configure check. This also
> keeps CPU affinity support enabled on musl.
> 
> This issue has been present since commit 7d95c34d6450 ("package/dante:
> security bump version to 1.4.4"), which brought in the modified
> configure check. It therefore affects 2025.11 and later, and 2025.02.x
> since 2025.02.8.
> 
> Fixes:
> https://autobuild.buildroot.org/results/0706b54c06cea6269d584bde2abeb8ee030e476e
> 
> Fixes: 7d95c34d64505214d56e452abc1f3502323266af ("package/dante: security bump version to 1.4.4")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> This supersedes "package/dante: fix musl compatibility issues"
> (https://patchwork.buildroot.org/project/buildroot/patch/20260413181614.371652-1-chakrabortyshubham66@gmail.com/),
> which fixes the same cpu_set_t error by defining _GNU_SOURCE in
> common.h. This version fixes it where the flags are set, in compiler.m4,
> so the build matches the configure check, has been sent upstream, and
> leaves out the unrelated egrep and pselect changes.
> 
>  ...piler.m4-define-_GNU_SOURCE-on-Linux.patch | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/dante/0003-compiler.m4-define-_GNU_SOURCE-on-Linux.patch
> 
> diff --git a/package/dante/0003-compiler.m4-define-_GNU_SOURCE-on-Linux.patch b/package/dante/0003-compiler.m4-define-_GNU_SOURCE-on-Linux.patch
> new file mode 100644
> index 0000000000..c2ce03422d
> --- /dev/null
> +++ b/package/dante/0003-compiler.m4-define-_GNU_SOURCE-on-Linux.patch
> @@ -0,0 +1,36 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Yegor Yefremov <yegorslists@googlemail.com>
> +Date: Mon, 26 Oct 2026 14:58:11 +0100
> +Subject: [PATCH] compiler.m4: define _GNU_SOURCE on Linux
> +
> +Since 1.4.4, the sched_setaffinity check defines _GNU_SOURCE before
> +including <sched.h>, but the actual build does not. On musl,
> +cpu_set_t is only declared with _GNU_SOURCE, so the check succeeds,
> +HAVE_SCHED_SETAFFINITY is set, and the build fails:
> +
> +  ../include/sockd.h:1604:4: error: unknown type name 'cpu_set_t'
> +
> +Define _GNU_SOURCE on Linux, so the build uses the same feature set
> +as the check.
> +
> +Assisted-by: Claude:claude-opus-5-5
> +Upstream: sent to dante-bugs@inet.no on 2026-10-26 (no public archive),
> +  Message-Id: <20261026141309.1892005-1-yegorslists@googlemail.com>
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + compiler.m4 | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/compiler.m4 b/compiler.m4
> +index afd1939..3546f87 100644
> +--- a/compiler.m4
> ++++ b/compiler.m4
> +@@ -28,6 +28,8 @@ case $host in
> +     *-*-linux-*)
> + 	CPPFLAGS="${CPPFLAGS}${CPPFLAGS:+ }-D_XOPEN_SOURCE=600 -D_XOPEN_SOURCE_EXTENDED"
> + 	CPPFLAGS="${CPPFLAGS}${CPPFLAGS:+ }-D_BSD_SOURCE -D_DEFAULT_SOURCE"
> ++	#for cpu_set_t on musl, matching the sched_setaffinity check
> ++	CPPFLAGS="${CPPFLAGS}${CPPFLAGS:+ }-D_GNU_SOURCE"
> + 	;;
> + 
> +     *-*-aix*)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
