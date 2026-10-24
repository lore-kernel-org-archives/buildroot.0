Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36410606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 15:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=L8mP1S6m
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1269981747;
	Sat, 24 Oct 2026 15:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OEb-bIFSNTBF; Sat, 24 Oct 2026 15:01:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1F7798174D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792854081;
	b=OqoiAL8pvkAl35X6XpQh7A6XO5f4Mt3wlVR8mXdkuuD3S98Bqu7dm2GZSbs2spUms9hB
	 nNBGGGDY91m/NQxAtf7cUCiXuS0aXBuuhJpihpff+8BvrK9Cv+ymN9Ufh/Q0RUZGbN6Cq
	 HihNO7rwPoW7VWCvEH46qIZSij2F8uhK6kWqNVYwgnlVE+XTDGF6HWO/WmNI2uMY6xK9i
	 0PSZIL9OP6JAncatybnptCtFgX8zk0I9sUsBGVo8XcW7dhv4ClA79Ky+m0zJKr++s3JUb
	 c+GiPcT2/9UXYUdXQRIuARdCDc0BMiVawMVjasofnsyOAU6RQPE85taJ93/nrv/9rBg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792854081;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ht8W7FjeqBvZozaraseaZP0STdxZ1JGacnFvIE7QOag=;
	b=Nex2OugqzSszuqFWD/BjZs1Jfb0e/+o7CAcKfx0V8ibPh+KLzxPt/YCnKlKzHKavxt8p
	 cw8f3IYlg6HaVfTfBo0G0Ar6fQDzMET334lH9OX/4B+2bgfRQ5s/ADsecCphsB3/ugCtK
	 dqzd8i5xPjTdx2QdyNzcclXjRgJUhdqnPBgaTBoRt/W/SR2bcxYBO2a0iolnIZPwcb7tm
	 z/+Y8InnUZVi/bXFXoqrukMDoIE1flua3Kjw+eDIO6uPN6Tasp11jtwyDyFEpSDaBYnks
	 c36vMtWqpnk7YdoYVR46QAShEBPWnqB5a2gmdsjme6wegFo2EXKAI+6GMhtfiVJ5vaQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792854081;
	bh=ht8W7FjeqBvZozaraseaZP0STdxZ1JGacnFvIE7QOag=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L8mP1S6muiOo9iunljVAO/J6JDDCx+OTAsh9vVY4WmhpcwgvG5IYffycaLxd1H7BX
	 czRk0VxtQ+TDEyXQ2hnbCooYsCIJlSD7Qv1g93xgWS7Bth2n5STtmerqUAY56y9r4P
	 iEpx0n8BN/8ubFcZlVrSc/0igowYAGv3Z2r7QGyAd6+KjqhMrEalj71PsTbXHIWiUI
	 IhftmQIX4vK6l24bX9NtUYUkjb9Cw7owO2iMD9bwAEBd2aXWSNEYER+6rCq4W9ykdS
	 zjOE6YanKbEQHbfW+sW3ysu8xAXbL15OKI+jMZ7PJ/1xNRS9b80E404vrt9zoIp/nF
	 4Pp1/Fpo2KgcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F7798174D;
	Sat, 24 Oct 2026 15:01:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 261BBD35
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0833D40A04
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n7A62zg3wdI2 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0AA9040A24
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792854054;
 b=I+Cc3U9DBIRLI2axp0glJhDdjGbmJh5mlYAyxCTGN7yHSX6MvyYs2JcgKMIC4nyPbjZj
 YomV1eZtUPSk5qsyJfICW4GeA20TWb2g2yK/SvbHAQMzqMXlydyW8we5iCYPnp0o8X1LK
 gnWvXuQ5mj2AmEqdyflTN5hn/CNew49cvIYUg8lYXV84xzASJ97+0ou4aioOA9L4+jy5M
 5PaK/jvNgIzara+njk/4/QYxwcLkBYPqQU7sel/9yJULDnaJSKBvRSzJb/EdP73YG/npe
 /czI8GNy9IMTlAD6NjclGnFniyfj8Dba4/vxgOyl9jviWFRzGvYOO+1fHqCkGrTnEaw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792854054;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=MUQKp5fFv0PQVLvfWjLrHrgDN+EfRSfIrkSVZF+6G+E=;
 b=DfxLcTWCNkO8aLO5E18dWT+Gv0dJd/vyJAm8WyIFg3O4K8k7RsVJNv19LU3tr0tpMKGM
 BlJtDLjsf1Aerb3o73DKVTFsRCgj7WjyJjFuLt1V42jh0Vsx0sg14La6VTGSUnvFCWGAX
 dKzdRVT92BaotxJhpa5B49DYjL1FnrbCM/YTvY74oE0lZ5TyFikLEegr+I4SQXPXenNJ9
 Db1aN7y6vpdyyb3q7QhTQc4OUSZ9Tp2GzNgnVHNHKCgOPVfSjI8cHTH3eFx7yWVwoOdWz
 Evt1DfOMGiIXIHMUy5GjmQTiDRWw0T3QYnZPiWy2W+ZliZsnkn8ghh+pdQgBxVrTcGA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AA9040A24
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1070D9C7D5; Sat, 24 Oct 2026 14:59:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 16:57:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d07bd9794ee3e5479bb1cbd623321a186bf0f3cc
X-Git-Newrev: 9179755dafc37f564c77d0482e649cf205195cfa
X-Patchwork-Hint: ignore
Message-Id: <20261024145929.1070D9C7D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typer-slim: add host variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9179755dafc37f564c77d0482e649cf205195cfa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Enable a host variant for host-python-jaraco-text, which now uses
Typer instead of autocommand. Include the typer runtime dependency
and the pdm-backend build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-typer-slim/python-typer-slim.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-typer-slim/python-typer-slim.mk b/package/python-typer-slim/python-typer-slim.mk
index 0be49b20e8..e6114b09bf 100644
--- a/package/python-typer-slim/python-typer-slim.mk
+++ b/package/python-typer-slim/python-typer-slim.mk
@@ -11,5 +11,7 @@ PYTHON_TYPER_SLIM_SETUP_TYPE = pep517
 PYTHON_TYPER_SLIM_LICENSE = MIT
 PYTHON_TYPER_SLIM_LICENSE_FILES = LICENSE
 PYTHON_TYPER_SLIM_DEPENDENCIES = host-python-pdm-backend
+HOST_PYTHON_TYPER_SLIM_DEPENDENCIES = host-python-pdm-backend host-python-typer
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
