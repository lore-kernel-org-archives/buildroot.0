Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC0B606A31C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RuyMMiES
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 295934087A;
	Mon, 16 Nov 2026 15:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GJ6i2qn_nmuG; Mon, 16 Nov 2026 15:40:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 292FC40867
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843656;
	b=Eb0i4Ye26EkC/PUe7xHjHmepfrTk5wAksU1fINPs58PCHKn5vHavGvtLIz2gEgwEjyHW
	 uLath9O/9vt1QXw/yV67eg4zNFya7RDnoXhCgqg9jCdCwkO2gs7FjzuP/mJ73d+5qRFtM
	 ta7ql+Crgyu5w5erw805c1lxHLBMBaPk2gk0cYBKXpnxxStKhJn2BLtOe52IaBQ4yl4Dl
	 Xxcfq8aw07A9SpDr4qC2j5wPi1w64bHoc3vSn4Q2Q4ViCII6strHxGCdFU6igBNwOaqJs
	 8e/EgUkQU/7XFi0AToejKxRCUuuL2oNkjq+UPof9nql8Iy05E4bsprjd+rwcd2f6CHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843656;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8RUzh+eHl50QAr8YSR/o0kXOnzuRhL2FsPLvWeCxCBA=;
	b=g0tH2JoPUuANVJR3MOdSSgA2LcI1YIkkQ5cYzRJAYHRcctglhijXy1MLJexHNAL7cPVp
	 2NyjddpqhIaf9E4/pyuPxDz9qyxcUtSOkLID3Cx5pEtHHEO0h+rDxbPzCcIgNtpGOMLVz
	 wtQlSqGDI3VAy6B+8PftfqzxzD8EZ69jgkNk0dloaXusg2XOnIh299UQ+DV0GVOyHhTkl
	 0KZkkBFpiabo0P4cOCuDynnOBCntBwRhtE0W+QQwxLNTZM4je/EDASvqDtjZAioyG1d7V
	 fBLHey608Kt/0Jd4EWq7lrUw3I8arBJ9jeT2a+2fFDWmtPGq8ZmeM1UBJzcoz7eow4A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843656;
	bh=8RUzh+eHl50QAr8YSR/o0kXOnzuRhL2FsPLvWeCxCBA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RuyMMiESARO6sJuN3uLZWL/CgdJ+M8TG/sJsPh07S0yRjw5qgrMcAluj1ysHH/08d
	 EAOtAzLGAuW78j+j7yqGziArqVdP3DmO6Gof0wuafBoOWRTNHV4np/HcwEtR/3WasZ
	 RioMcE/BTiQ6GEsLl3VwW1YjkJdt0AN/5+bxFvg4bv4vPJLXWqho8wXOaIEB/sUty3
	 85GkimxywnGoQUOm8Cnz3sGDttj07AY/dUGDOj7Rf52d+V492HpIyA55dQRVxBnqTS
	 6utTXb7JWGyvCe8qhrrVLyZHOBmW420Xcaitkgkdjei2xn+6O+ZhiN1yuqCKUjuwYF
	 NEC4IZPkKG1XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 292FC40867;
	Mon, 16 Nov 2026 15:40:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E13CF109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D346340282
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7pXfj2wl1Jum for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:40:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C6A694009E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6A694009E
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:53 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4bb6c7b6dbdso16626155e9.0
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:40:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843652; x=1795448452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9ClX3q0CL4Nx105SYGZfI/cFcIucv+AAAmFRodzZmcQ=;
 b=F2XPPe2omOEc58zEwRJnOvUfaSD7eXL8tg2QziacdvAYPg3gntB048IINJfKW60IrI
 rzY8aVx1Y76LBbMfbNykXP5aTIGd9Rt3+NNj3c/q+6x3zTWJ92v00vNAjrwoM0rH8WZI
 T5VeNBz+H0MUHTOiPmjxfAtIr/7pH5ekJSp7ScAixgH1+Xu/oqLDYx6y1F8XvbO6q3GR
 iylx2x03Iyak4FClONG+w318ZJ+Od7LEbMpsH8Eb67SHQxpON9yrTXokodoPsMlIklTZ
 Qk0Q7G2e1x7NQbzVobYEUNTWWMvyODQ/W8NGeWHMcjHFjXlPqb4Z37F+8xpPSn9SXyYB
 03zw==
X-Gm-Message-State: APuU4Z/OObikIR0Cq+R/4UF80fnKN7JtlydUztIek3FL2NiskwZ8YscK
 wkBhhtMwtDUccrx6q2mtVmY+F/SiQjCyjRvWmH5QZW/A1Zb7AW9sVUlkvDay4AmgGzfYR9pE3NP
 4rcE+HVo=
X-Gm-Gg: AYBFou3Ev8FU9Qusl6RB08CTM3cpn74rnno24uu1Tdb96l6hESdEnwCjcHyFrDxP6U/
 KArehw3GNf0NP7c+JtVy5nKBpEuyq59JBgNFEzs4vq2t6NPPieNZ30uoUORqCNqTDC3mWkp2+9x
 ijndrPQFFu+3QmqPfp73f59BoHaPUz0R0BbnzeEWgJLS124OTZ5OcIN9mjTnNzR7Q1JT8JQq6Fy
 hWfAqdvmpoaMqDYPHQKnuTifjeJIlsFRP4uSo3wzwieAxInprhkKk4GzbN5C99vfHm7IG77yhwv
 rO6ihniA0YrOxkNRzhhrT3oHLPsJRqO0jrYuiF2Nyyg5pbypvMs8WeySxt4mMqAydLYcDaeW9e+
 Iz/n3wRzgO+KWdB8AdfsKER8BhdjDqZjTUKi7wJR0FzBTZdXMhHdmQBl4dARgGP0jjNHPvWn6VN
 98+adW9kwHNC6r0zMS72bpSxWlQmiurL3DIYEp3lDQ89eyMGpWHlv+WlfpRaudaaMqu8HBOAm1E
 ND1Odd3KvPpSQ4j4J1Xp35/CETK0Z5sYdynPr5GSOfs67mznerJWlZ9F/DCK8wcEIEIUp92htGE
 a1QrKc5ObGpLBrKF6fYNUO9BdFenVVc=
X-Received: by 2002:a05:600c:468d:b0:4bb:741d:ea0 with SMTP id
 5b1f17b1804b1-4bb741d103amr51605435e9.17.1794843652015; 
 Mon, 16 Nov 2026 07:40:52 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e252f7fsm403195055e9.2.2026.11.16.07.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:40:51 -0800 (PST)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:40:49 +0100
Message-ID: <20261116154050.726156-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109161949.714131-1-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x 1/2] package/python-django: fix
 build with older setuptools
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
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Buildroot commit [1] bumped python-django package to its latest LTS
> version. This included the following upstream commit [2] which bumped
> the minimum setuptools version and broke the build on LTS.
> 
> [1] 8c1e897d56 package/python-django: security bump to v5.2.18
> [2] https://github.com/django/django/commit/cd5ad8c81bf221868e3c33d90d6e021d067829b4
> 
> Fixes: https://autobuild.buildroot.org/results/4ee/4ee28d52c1ea8883b8c66c899322a0c6f5d3fe83
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...ped-minimum-setuptools-version-to-83.patch | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/python-django/0001-Revert-5.2.x-Bumped-minimum-setuptools-version-to-83.patch
> 
> diff --git a/package/python-django/0001-Revert-5.2.x-Bumped-minimum-setuptools-version-to-83.patch b/package/python-django/0001-Revert-5.2.x-Bumped-minimum-setuptools-version-to-83.patch
> new file mode 100644
> index 0000000000..e26b8d904c
> --- /dev/null
> +++ b/package/python-django/0001-Revert-5.2.x-Bumped-minimum-setuptools-version-to-83.patch
> @@ -0,0 +1,28 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Thomas Perale <thomas.perale@mind.be>
> +Date: Mon, 9 Nov 2026 12:00:00 +0100
> +Subject: [PATCH] Revert "[5.2.x] Bumped minimum setuptools version to 83."
> +
> +This reverts upstream commit cd5ad8c81bf221868e3c33d90d6e021d067829b4.
> +
> +Buildroot provides an older setuptools version and no Django code depends
> +setuptools 83 feature.
> +
> +See https://autobuild.buildroot.org/results/4ee/4ee28d52c1ea8883b8c66c899322a0c6f5d3fe83/build-end.log
> +
> +Upstream: N/A
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + pyproject.toml | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/pyproject.toml b/pyproject.toml
> +--- a/pyproject.toml
> ++++ b/pyproject.toml
> +@@ -1,5 +1,5 @@
> + [build-system]
> +-requires = ["setuptools>=83"]
> ++requires = ["setuptools>=77.0.3"]
> + build-backend = "setuptools.build_meta"
> + 
> + [project]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
