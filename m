Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC54606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bnODUnI1
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5AC681756;
	Sun, 25 Oct 2026 11:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cdagLC48UOwt; Sun, 25 Oct 2026 11:56:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D8D7E81266
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792929401;
	b=ckcN/6nvTDGknU+fKkdwuD1+smRkQdA1n+olStjVDvLNdMvyo1nIIsaODm3yTwW0pgbA
	 UUtZFIkR7hOV6V/Xwzu27Vyffz1Ch90FgbOi6fVdi6dFAM4Sbq7N2IyaRmIip3ObQQs5E
	 /qnZIqqlY1FlUW3JChfx7sQXTG5/0c8tntVFmVDqex8PP/qHPPiVHYiH87BY0AUSa1RP5
	 GigRUtX6D8khUJrYHe0QndlY4KND58fjQ8w9aHGQ15aZvDuYwH7k0IbGNup6wh3Uq0/KN
	 MHryecO8PenqpMElk28loerZfOioPIUOhnENypLDDzzCebOWERW0dMwnRtuQLTyFvpA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792929401;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wFpdLc/6gtgBfnqK+pW7DNB57ULqAWnqGa39GB+9V6A=;
	b=UxjmuIc+dPig6BkExYUbR9t8aFQM9d3wf8rfWlnl7/n8Ld/mFdw5irUP0P99W73T6/B3
	 9EKK9GLjip+Uuh+kk7CuNLPaj8yUWYbOYQGrJ4nQ1dgW1mWnnhBQqibAjE3zutt/c40L6
	 n6WF/0OJTF8/vypxCuz42oXKqom32LThh7KqQM0kfjuBkcfgjxiprSZV3k+dGI40t/jfi
	 59548Ux9KE9CwbM/sVFdy/v5FfRSH+2r8v/o1zDUylmwM7yUZXeZWZ98HQJRvI9QWIyvg
	 LW7jpIAzG0Tmid4O0q1daecmseg0UpS5Q4IedosdShc6mo//GxySIgRl3QSSn48ps4w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792929400;
	bh=wFpdLc/6gtgBfnqK+pW7DNB57ULqAWnqGa39GB+9V6A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bnODUnI1bB0q/0KC21Ciz3KRm/tCDUsZy1XTynGIl/vjaXyOlrUlH42ALKov45k0w
	 h6bTANHgp6+lThOikHppWOXAbLG6YaenauqYgRVGVe+pr41UybCefaK4q0ofAZZLps
	 bq/fLUhc2qavcQhzdma3rrUHwCabvzKfEt8ubO6pnwUYu7VeP2lDzEjMZlkMH2pJJq
	 ptMvhJ4oL7whf+eS5vW+Z2D0/SELRgHe+wjMH58PIB2HHaQijuQPrQizdgso8Cvg0c
	 guinVVSxIpCwkl2iqWioSx73SBkAyeiDNaFTVNav73aErLDaVl1IsqZox+th98hG/a
	 YN7fZtvKmMB6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8D7E81266;
	Sun, 25 Oct 2026 11:56:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F063CD36
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2697406E4
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nGRorXJ-T-Yl for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 187A0406CD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792929387;
 b=O3IX6XGtZRLtCl6PneK2m21jgCYaHLjpLTFTglBrN9uOtYbpXwPWh5rLHbxcr4tzphME
 z2KbI9+tZqq/IjSN+D8CrX48/DVxqZNf7ySLQhlMbFpTFZT4f/B3oVKFVtIypUnksbk+B
 4A4Zj8+MjtooKepfDJtHDmLh3DPq0wORgGdpCwhXxYzsnDDN+pcITPWnOeQzetEQy7n8Z
 IDCGjdoAr6oc7sJwVKGjeiuXO/EAdxTolo4xyznqRfFWRM3uJn4TGPjabVWc0lXkKV70R
 M4eR6PLo9YBeHB4U7ryfPzMqCpLa8coTz3piJiNPKpei1rQaGar2fi/b3cy6vsDOOvQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792929387;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KQSnehokQb3PlPJVVQQugKgeQZO+RBO5o8KEUl+djhE=;
 b=OtEGFZFx25o1Pm64Tfeq/e1qwRczwunJbrNLyfngAXT6B8UnEyjoz5BAkkW1hSpn+RVb
 IWpsPHDB9leTxKSn1LUuH2E2N7X6XT1Twale/zpPySDsUH0yYgPtxPMLFOB3MR6lZ1nsc
 GHPtROWZ5RR5PXeJlXBsO6qA0HZTuqxtJl2dQvgAJLUSuXo5tkSJiOfWceJ+50dic6zWU
 W5cO0vhr3CjUDPqvuMz3UXHvzN/Q4Gt01Si3+J/FitXUwI5nZHK/whNiOpUZdY+xdfQf9
 SKiCqk8NYagJiZ3BiFhIh2NsAuWHRw13PVTEhQR3Kbkp82UTdJTvjMjsKEsLx4YpenQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 187A0406CD
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC21C9CE81; Sun, 25 Oct 2026 11:55:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 12:02:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6f8e21803ecc9fee68c7a16feb9ead8e636e40e
X-Git-Newrev: d753c88e4d689623358509b6e14cc1182d88533c
X-Patchwork-Hint: ignore
Message-Id: <20261025115501.AC21C9CE81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-types-python-dateutil: bump
 to version 2.9.0.20261021
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d753c88e4d689623358509b6e14cc1182d88533c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../python-types-python-dateutil/python-types-python-dateutil.hash    | 4 ++--
 package/python-types-python-dateutil/python-types-python-dateutil.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.hash b/package/python-types-python-dateutil/python-types-python-dateutil.hash
index 99eff042b3..dfe2101fab 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.hash
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-python-dateutil/json
-md5  e6fb2bbea5ab3d9c1756cef961e2806c  types_python_dateutil-2.9.0.20260807.tar.gz
-sha256  e0b8a90d464c8684c66b7b8e4556d9074afdddcc56ca45323f0987134f9e7034  types_python_dateutil-2.9.0.20260807.tar.gz
+md5  4f25106ead8ee6917e5015036cfd170a  types_python_dateutil-2.9.0.20261021.tar.gz
+sha256  62d66fcdd293e38745eae644e5da4cb399b98799c0ae61f03a54896fb51b3140  types_python_dateutil-2.9.0.20261021.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.mk b/package/python-types-python-dateutil/python-types-python-dateutil.mk
index f5b44c836f..dfa8661a5b 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.mk
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20260807
+PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20261021
 PYTHON_TYPES_PYTHON_DATEUTIL_SOURCE = types_python_dateutil-$(PYTHON_TYPES_PYTHON_DATEUTIL_VERSION).tar.gz
-PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/c8/4e/b3fa538f9cb38dfece0d6ccf6d3d0d925bdedb144fb9c8129dfc007cd003
+PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/65/66/4783d826afabb22f29f47b22514298efaedee4718eac0a76c37bea381a07
 PYTHON_TYPES_PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
