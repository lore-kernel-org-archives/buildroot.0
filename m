Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF66F606A326
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GWXEPuXJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8B2B60711;
	Sun,  1 Nov 2026 17:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g7xhIjsLnipp; Sun,  1 Nov 2026 17:36:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D2EAA60619
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793554587;
	b=TyEU3pvImoo/BOHn7ewiugoqVUWhdMAT23wixBOr84VlXx34VexDhWLHKWF4a62auNTK
	 bv7d63FhkWRZKPV0Ur7dDe0bxDDHldc9GFyTjRW89Gd1jNMagQF6HhaFClM675HXz38nc
	 UAYsYCEnA3zfTDOIMyrXUUgWl4J5E6pB7SYs/WMSKStljQyoAbpqJpQnFSN083jtX4I2R
	 cV0A6pGvWj1XY7R1c1HWTlvcLQjsfxs7qCEuu0ZqZj3sJpWKWF9L7H2+b4XtEr2ZtVKFX
	 djd9JWrhxEP0KalRdqJa/SFGty6ae1b20va1HX3cq0tEInsjN0lp8F9PmepGIjoCRlw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793554587;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=m4litN8+jz0ByaiYSuHV8JV4EuDBw8jU19TQK8dxJFQ=;
	b=EzFheXUdWfHxWiKjvKyYI1LrM6fGThMeaqFOCBa3FzWD3GoVZ94TN3fsEj/l2ho9sh1w
	 TU4gzxAGbsBqmn3TkMf+3YTm0XRzDm7YnMNSdBqaWMJcg9/Xm+luEAfmNevkdjCo84V5Y
	 372nLrR+djYx24o+kl6PPEv1YuZyBblw3CqTdQis6AeGSJ/d0DiNfGpZGmTVslkUfwF6v
	 NCvGcmH8uwkP8vi+S1xnU761c7F0qGGvBdDAJtQ19+D8jf+u4u8yHlgjtfIquyFFIztgG
	 kePLo2TdmYc5kWl4T3jpOn4xCw+gdQtMDnoKWfmKNb9Qqs/fbGuR4oXl12QjyuoJkQQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793554586;
	bh=m4litN8+jz0ByaiYSuHV8JV4EuDBw8jU19TQK8dxJFQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GWXEPuXJP5rQh7lKPgqF9wK2mMklqhbfJCV8j2N2KKsJUwPlyW2nj8L4E4XAuxGbV
	 R0i/jZiQZjJ76tBJOo54MwUzGZSFM4EZuGCTxvGGoAO8AVH/spnQo1FGIfJCNftVoK
	 13C3mqapsukVq9MVLY/clQ3n1NwASLnU42VnXnBuv3ufO6CpeYRAlLngNm8Yux9FUX
	 U4Yj6gr+9AxBO+FwP3cY6NhRAVQyWgkuAlMiU1XcACkB+GsJ2D6AVvW6crDL2QeJo8
	 5+hGlMuRTV4t1rFrDnF8OPmhAvwucyjl0Zeur7XXDh6HnTUKdNgHfYvlhn5pKGvo9o
	 /7rZGeUl0+8WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2EAA60619;
	Sun,  1 Nov 2026 17:36:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C508EEF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AACE440076
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M1E_N2D9Yj5V for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:36:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 002D14004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793554580;
 b=j9kxDWXXaCwq3nu2TeIOZtrZyxnpyzyH8H6WWz69f15ircE///IC46lSr5rpbMdmKINU
 Q41Z5U8Q7cs04+JTljVgh891Wwj1u5nRHRB01PLOlwCOnbfr3SicaBNObZmHChwgocnEk
 aQW024ScAoHlhDwIPn+8b2sLiCXBHo50zGBPS0AyOS4eVGv0wwKdw33fMG4A0/4viovI5
 ayYzt6MTAotIlFvFIWhelHNksXeysfkIOxrAGiRilWnImGoRH+qPYjL4t0816gAugBIz8
 gqe/92yARNTUuE6YUdEXhpkkXL0g38QtEBYT8n+Uo1Ga06zkMBY6wksUuTBJKOh9NBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793554580;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=p1CoP1iS/OFwl8so2WPfKU/5KvJ3+1DqZJztVkLFY1g=;
 b=kXeSJkK1jSVIkCdrV68CqA2l2bQOwz4pMRCPmLqmzL68KJ7Bk0k6s3veqMidwtcgvTPB
 9AY/L2+E5udbEg7LWQ09EImTkZJv/a9HPpsrjSIqfCEEqHPdTQkA1bIR/Sltr+6bf3CSc
 8Cn+AT0BVSSI5usmrSlyMAozOS8ezAQ4taKwLaCLSvkAcFKlP35UV+ZZjZcfnBwpa7nMJ
 FSJ3YQ3iG1DxLhGEHzFVfccQFBWPiRdQOGVtohsgriUQOnQEvjji9lmg0qDN3/VmJx2u4
 E9JFuogJw80iZzSotfhMvo1XAeGhzflSkmg+cTvcFoh04U/+8d7YzDFnAET1t9KOgHg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 002D14004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E0779D4FF; Sun,  1 Nov 2026 17:34:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:16:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8b2c911faa952dfb5904273464ea21aaa347518
X-Git-Newrev: 2abec6fde97e5b2e23c09793c7d1a0008ac95c5b
X-Patchwork-Hint: ignore
Message-Id: <20261101173450.9E0779D4FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-watchdog: bump to version
 7.0.0
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2abec6fde97e5b2e23c09793c7d1a0008ac95c5b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the COPYING hash for the copyright year updates:
https://github.com/gorakhargosh/watchdog/commit/f3e78cd4d9500d287bd11ec5d08a1f351601028d
https://github.com/gorakhargosh/watchdog/commit/c556f8c26c73dcc411126d8878044897645b1878

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-watchdog/python-watchdog.hash | 6 +++---
 package/python-watchdog/python-watchdog.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-watchdog/python-watchdog.hash b/package/python-watchdog/python-watchdog.hash
index 508cf88b27..8026ead945 100644
--- a/package/python-watchdog/python-watchdog.hash
+++ b/package/python-watchdog/python-watchdog.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/watchdog/json
-md5  d3adf236e17e5747e397f7d0b93e05b4  watchdog-6.0.0.tar.gz
-sha256  9ddf7c82fda3ae8e24decda1338ede66e1c99883db93711d8fb941eaa2d8c282  watchdog-6.0.0.tar.gz
+md5  f557f9f886650d23ee3e5ba12ad54ad9  watchdog-7.0.0.tar.gz
+sha256  128583e0ffa0e5c0531f9f37e2e24be1e7b0503561f6aa8b0aac5a1d646e2bf2  watchdog-7.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256  39f081828db6f94c70123fa4fb30c1bce3e215a8fdece53a49991fe076a69c08  COPYING
+sha256  8dfd87df299f156db7dd6387dd025f914568419b10db3e074d224e67d7621d2d  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-watchdog/python-watchdog.mk b/package/python-watchdog/python-watchdog.mk
index 888cce6e1a..72d38e597f 100644
--- a/package/python-watchdog/python-watchdog.mk
+++ b/package/python-watchdog/python-watchdog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WATCHDOG_VERSION = 6.0.0
+PYTHON_WATCHDOG_VERSION = 7.0.0
 PYTHON_WATCHDOG_SOURCE = watchdog-$(PYTHON_WATCHDOG_VERSION).tar.gz
-PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/db/7d/7f3d619e951c88ed75c6037b246ddcf2d322812ee8ea189be89511721d54
+PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/92/68/6477c65315fd5b58ea5c7fbfe871c3ca6e5ec951be6c48c2f5fe8ee5e34d
 PYTHON_WATCHDOG_SETUP_TYPE = setuptools
 PYTHON_WATCHDOG_LICENSE = Apache-2.0
 PYTHON_WATCHDOG_LICENSE_FILES = LICENSE COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
