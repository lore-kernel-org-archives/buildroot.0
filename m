Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3F9CC6B30
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 03:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B90C260848;
	Thu, 15 Oct 2026 03:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSOvOlphmmh7; Thu, 15 Oct 2026 03:10:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C6F52608CD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792033852;
	b=hh70GbaQN9k06OYFqNIlhc/TpemJ6MtcpbYATqWTHnMKDU4HDAZeuaUIkhgz3lybH8Z7
	 6kRB3ED2jFhPMznyUwQi07PQSEpYmhNURnDJ+xd5ixyL4PXGqHhabwbi5jup2+Q4WmZbj
	 IY3uMe+cRxsAw1EZ1q8Bgk/p+/O0/iU6OSCmGxa5LxZcQVrSl4alISj4U2SxuiMPNfQMg
	 u95hFJ5la8xCb2ypjpHaAFKJjvsBDE6+JwxuW8DdSiGtNliPnzKBbcHgeCKPOfpyiriRh
	 iC26BYYZ+UUG1V3fzn/8kzBpS52NBRCaa1ltC1LJKIYPAziNscYoTorbG4Wq1EvDdOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792033852;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=lrCEo0yVB+ITaL9b0RvKvupfSSwHDCBhiDN4W8sBgFQ=;
	b=tNGFq9LL1mOonDUJG7GXHefb79PpznUIEzHaFHQjN6Ou4jJF3PGpmwo0dVUcxzNG34lp
	 5WCqfBBafbvIXWWAsH4ApPhYHZaKUriwxffHN8WucdzjzWjPCxYcF0gmT7pNxeuTJPnle
	 yX2x749CFt+KPaNXqj2VPLKiU0TyRBi+Gko2SPc8nJ06PxWreWqG7FGjd5mL2KS9UujSd
	 EwQhowfp+ZFb8jmVr0lexp3v131/omLGF6hniWxR00DlEUZ7yCCit1lYnWW8OiM9OGH5t
	 QygXy7dyuUdHQSluaT+9/dqz0GoEnWIvRudDGnom8EncvPQF4mvcfX79JOC07hnFRjg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792033852;
	bh=lrCEo0yVB+ITaL9b0RvKvupfSSwHDCBhiDN4W8sBgFQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=caFkguOPYJE0z2uNUDxTwKCUyZ5zNrV3bm33+9+6wW3Jab1ZvZz0rHid8l2S99l6G
	 kj2qGoRmqEdJAaMm63/smUD5vS04G9ZKY+Y4X9Y6Owi5TPBb97ITRv7nkLQ5CaKLxy
	 6Uvo5SpIj2JsMF9JetflJ2+XPWGprsifkX4vMutHo/qKfo6pGYg/jqxKbSbCrcKo6Q
	 ZhWHxzfbbGH8RlyQnj5cRpEE5gNgW3UGN1b5pOr2q8tnAtO4ajZXUhU+VRQE4B/BnR
	 TS1NnAyoztO9TehVxNz2amimX4Utg+BRAT6k57xCOD37MeCjfMR9ErLTgZYVQK9lRT
	 3nSC71bP5KHYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6F52608CD;
	Thu, 15 Oct 2026 03:10:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id 88534255
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 03:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with UTF8SMTP id 79B9D407DA
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 03:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id upKHkRJ5vJmY for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 03:10:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7C8DE407D4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792033850;
 b=aj93LbWXdUSxMxyoH/qU7LUq4aSIUE+GcT0UVO9bRh2aDzKPgjTF28KeS/Aczzk9UjxS
 3/D7VWX6fRwB6CKAazu2OSgaZSgrifIp2+OUfZwp1YsC9jk5F99U6ytdaTfRlqR4xj1J2
 rj36LOpD3WHMv3wEQ98jZHLjNDoZ9YVltgISFv+cOGljM9U4LJdytggx0Wp2J9XmvJECs
 ZnmtzFxgrNROOLkU4kzQhyjCh5M3IzXr+TSXAxltndDKe5zwZKSnzaWVD36qc4eGTefBb
 h1SMXNYhCYhBaErdKKRDmtyFrvoBMyBGFKplWZUTuwxI0qSlmMeznVLgFUVwCN+l3rw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792033850;
 h=Received-SPF:Received:Received:DKIM-Signature:Date:From:To:Cc:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=A7o/p5Nog3Nau5gl5nJMrHv8oErzxzlhNr8DGl63q+I=;
 b=Bn1OHnx8wuSjJdH7sVzjFrKFXOq1YhPAHt0OX9aqph+v49B6ED7a3FOBSMjcxt0ocXRu
 /cCh4dAyrkYgVQFxtd/q9n5j8y7nMMWduGTx8FSmIHcKbGeBvGJDlGEyPzLNj+PEtgHle
 f4GfeGhTIu3SBe3jpH5Bo9SYp6+uU65KSzLwUTSUBKdys3VG6FiuXv5WmkH4tOVZWht6J
 Gvr4Wo2bM37b/PzGl4V6cO3yQkESs+TnlYXSi9T7hh2gXGz3tJayR+04rMRrijESRFUPh
 ff5dhrskwPUhbbII6oibtkOa2qgurHnVatSQIIiU+LYL6yZfT8zYVQtTomZXPAF4Q6A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kernel.org;
 dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20260515 header.b=Qj8pIIbf; 
 arc=none smtp.remote-ip=172.105.4.254
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254;
 helo=tor.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by smtp4.osuosl.org (Postfix) with UTF8SMTPS id 7C8DE407D4
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 03:10:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with UTF8SMTP id 625036020C;
 Thu, 15 Oct 2026 03:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 8C8CB1F000C4;
 Thu, 15 Oct 2026 03:10:47 +0000 (UTC)
Date: Thu, 15 Oct 2026 06:10:44 +0300
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
Message-ID: <atBENLaaSiBfwORj@kernel.org>
References: <20261014164625.1474866-1-fiona.klute@gmx.de>
 <20261014164625.1474866-3-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261014164625.1474866-3-fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH 3/3] package/swtpm: disable building manpages
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
From: Jarkko Sakkinen via buildroot <buildroot@buildroot.org>
Reply-To: Jarkko Sakkinen <jarkko@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Oct 14, 2026 at 06:46:25PM +0200, Fiona Klute wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> Swtpm builds manpages using pod2man, and fails if it is not
> available. The patch adds support for --disable-docs, which Buildroot
> passes by default. Found while building in a container with minimal
> dependencies.
> 
> Fixes: 87b9b126d23be1e95b3d2b82438f65e28f554a87
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
> ---
>  ...ld-sys-Allow-disabling-manpage-build.patch | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 package/swtpm/0001-build-sys-Allow-disabling-manpage-build.patch
> 
> diff --git a/package/swtpm/0001-build-sys-Allow-disabling-manpage-build.patch b/package/swtpm/0001-build-sys-Allow-disabling-manpage-build.patch
> new file mode 100644
> index 0000000000..c134b75c23
> --- /dev/null
> +++ b/package/swtpm/0001-build-sys-Allow-disabling-manpage-build.patch
> @@ -0,0 +1,63 @@
> +From 43eff71dc1673c252352c584e129e5bce312d173 Mon Sep 17 00:00:00 2001
> +From: Fiona Klute <fiona.klute@gmx.de>
> +Date: Wed, 14 Oct 2026 17:46:51 +0200
> +Subject: [PATCH] build-sys: Allow disabling manpage build
> +
> +In builds for embedded systems (e.g. Buildroot) manpages are not
> +needed, and building them adds a dependency on pod2man. Allow passing
> +"--disable-docs" to configure to disable building manpages.
> +
> +Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> +Upstream: https://github.com/stefanberger/swtpm/pull/1186
> +---
> + Makefile.am  | 5 ++++-
> + configure.ac | 6 ++++++
> + 2 files changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 5dfaa6b..f7d15fe 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -6,11 +6,14 @@
> + 
> + SUBDIRS   = \
> + 	include \
> +-	man \
> + 	samples \
> + 	src \
> + 	tests
> + 
> ++if ENABLE_DOCS
> ++SUBDIRS += man
> ++endif # ENABLE_DOCS
> ++
> + ACLOCAL_AMFLAGS = -I m4
> + 
> + EXTRA_DIST = \
> +diff --git a/configure.ac b/configure.ac
> +index 188b1a2..7156a21 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -509,6 +509,11 @@ if test "x$enable_sanitizers" = "xyes"; then
> + 	CFLAGS="$save_CFLAGS"
> + fi
> + 
> ++AC_ARG_ENABLE([docs],
> ++    [AS_HELP_STRING([--disable-docs], [Disable building documentation])],,
> ++    [enable_docs=yes])
> ++AM_CONDITIONAL(ENABLE_DOCS, [test "$enable_docs" = "yes"])
> ++
> + AC_ARG_WITH([tss-user],
> +             AS_HELP_STRING([--with-tss-user=TSS_USER],[The tss user to use]),
> +             [TSS_USER="$withval"],
> +@@ -662,6 +667,7 @@ printf "TPM 2 profile support : yes\n"
> + echo
> + echo "Version to build  : $PACKAGE_VERSION"
> + echo "Crypto library    : $cryptolib"
> ++echo "Documentation     : $enable_docs"
> + echo
> + echo "        MY_CFLAGS = $MY_CFLAGS"
> + echo " HARDENING_CFLAGS = $HARDENING_CFLAGS"
> +-- 
> +2.55.0
> +
> -- 
> 2.55.0
> 

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Br, Jarkko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
