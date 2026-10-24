Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C895606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 15:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cIVQEjHI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2677E81A47;
	Sat, 24 Oct 2026 15:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4CATEX5mgwld; Sat, 24 Oct 2026 15:01:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BA00E8198D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792854074;
	b=pvZwkA0OcmrGv9aRpv0o6RKq6DbjAOlfX3ymLGX1HF5uAu9SKYsNHfok9m9zfvG50YCf
	 Qv2WPUNxLm7ZK6nH62cvnN90KPA9E5Pio6vRBDzOEo1ZOINxRlTzye1e7yN+s1WZBRwCb
	 NxSIIM2uUM1tWcO1kJXOSn/NygiawVgzI4aUbHlJBg4B/jZ4uWlE+ijASRpB7r+nESiUn
	 /RqcpVrEoSLCrk4h6L3gNs6H/IGuQj+n/t9nu5eGHrB2LR9pDoblKdxWYUXlYlz2cl+kE
	 UT0DBO3Pl0c+1/vw/EcIejqKzJavvlaymdGHCaZMRD0DVhedWKzL3gG2pZtmbt2iOKw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792854074;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+nGLoEX+4/fcJ/MMer5qibI0zss73kVp7Uadz6ftUsA=;
	b=q+PuBRXrdac7pqgn+u0KeXv6aT4KG3amk+i/s2IjEua0vJexU7vHSmHH6nXkXl9jCpXb
	 AyAJM2P/gRZFMSvbnwDwHJDzNCnDgAA2vBq6qiAGZesAymAPlFl0i5u8hLryOUJRlh27y
	 3vKsCotox4y8UzWYOEvXZsOoM0kaDRByBQMHfrAZhDkM5zHJK5VMU7nW+gG8xA+3esXzJ
	 VOwe0mlQHDRcjHnoPC8MnDVDP2gTkVVsiSzjls1JgSxRtwGKe50fiQmJJ9YtR90oTB8wh
	 cPVr1w1ipv3vNSg0fhJvY4hvLDIR9zifc/jQtyZETB4aBLXFoAWn+lJz2tJclhJyhLw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792854074;
	bh=+nGLoEX+4/fcJ/MMer5qibI0zss73kVp7Uadz6ftUsA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cIVQEjHIyyRfFF9maaEVQjdgjQDxIbr3piygtNUuktjyLt/Xc+WUZfCYvLkLjKXPF
	 ATTM/Rg/A8LLM0HlYOWU1laODq0+NObPPhUdC98L/Nb6l/gQJqRW2v2qYaBs6ogn33
	 MtCzzKWNm/Od8eUufoGm06+faQK5o2oZ06jVsrrYcq4dOCb4X9288a986crxd0BIqK
	 d14ea5rU9WQVBr8QwKjzQaQmOB6m8G3Tl9hfXIs3so06T3J9eSurqSyJvzX8Hd7VG6
	 CF2jM9sZV9LVOAB1U9LxeEQVKX5zmPcTVtlVUbqJRlPtuKM4OxPkHGqS0FRTrq6rDb
	 6jAvYtfCZ1aJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA00E8198D;
	Sat, 24 Oct 2026 15:01:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14BE0D32
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF3F040978
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VaNj7wWo1U4p for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 15:00:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F236140A21
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792854054;
 b=VlPFqTPOEldQiXniAOndX52mS+0zsp9zpe5gJzJIyYTAlmRxdB7XTK8d0Drd0cTwbglU
 MILzXhOdojZtYq/voikXc0dugRZK9d6BrjUO439Dpi5MtooZxXxGnBYxzplcUaCDjUE0/
 kzRu4YJP1V2IRCAUiScZL+4IaGyLtX3YZUDeCWHEfNxQ9SPYKF0BgJ8R7dED05S5r79iV
 wdmoPhuldVXOVtSu/hjQg3iAdRzHvNxtNJRqu8R9wG5oWUaNhDwLss+NDMk3ztLHgLxO5
 GRI13bMrJQj/kwb3ILIB2/OTHtAvP+xKmNbLWPOco9z09L4aWUfPwpsHm/IZGxwIBrg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792854054;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=mZpjlFWTO7rn6I/lCUcGden2sjxtOZLuzQWvlQkwbbs=;
 b=Xi4pp86lEi9XfLV6Veu04cVYCzSO27ZI4alk3E0cFBAKecMWNtDzKCzB8ePB020/KUZo
 EH/aC3Ej0wsBLtO3rdSmEIVsCOlfxffyYs68dkW5BhvYeSZdlJpXHf2RqDhk763U+ZBVR
 gF9guLmdDRm7NFQ6i+GwCNeiTMNYGqofxiPjxrJ1NuwrtPKPbt//Q2XrHj1tTeITmBOCP
 Zr00JWcwU45Xl3wzOlFOqJ8Jz9QtBrpv00JOGbIFFkQSJNiHo+RC9xO+hwwPrWRWkRzTF
 7NQ/3c3TxOcE1K8IAjilXmgiebsHebue9V1MMNRUbQFufVMY9e1SZKe0Qld6i5tT0+g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F236140A21
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 15:00:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01D5E9C848; Sat, 24 Oct 2026 14:59:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 16:57:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 536265f780237301fdf8df7c9ffcd1fd89d6af56
X-Git-Newrev: d07bd9794ee3e5479bb1cbd623321a186bf0f3cc
X-Patchwork-Hint: ignore
Message-Id: <20261024145929.01D5E9C848@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typer: add host variant
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d07bd9794ee3e5479bb1cbd623321a186bf0f3cc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Enable a host variant for host-python-typer-slim. Include its runtime
dependencies and the pdm-backend build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-typer/python-typer.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/python-typer/python-typer.mk b/package/python-typer/python-typer.mk
index 14d4be771d..44555488e6 100644
--- a/package/python-typer/python-typer.mk
+++ b/package/python-typer/python-typer.mk
@@ -11,5 +11,11 @@ PYTHON_TYPER_SETUP_TYPE = pep517
 PYTHON_TYPER_LICENSE = MIT, BSD-3-Clause (vendored click)
 PYTHON_TYPER_LICENSE_FILES = LICENSE typer/_click/LICENSE.txt
 PYTHON_TYPER_DEPENDENCIES = host-python-pdm-backend
+HOST_PYTHON_TYPER_DEPENDENCIES = \
+	host-python-annotated-doc \
+	host-python-pdm-backend \
+	host-python-rich \
+	host-python-shellingham
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
