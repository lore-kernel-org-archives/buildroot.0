Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B71606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 14:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=q9/armBo
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D1EA80BF7;
	Sun,  1 Nov 2026 14:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V2MNvzgbnM2k; Sun,  1 Nov 2026 14:50:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 97BB080C6A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793544647;
	b=l9GF86fAxOPvoT6uwAejLwkCaT9j+CY6T5qXgQAGHBxq3h7Z+5CircnCwTr+KQUOvU/v
	 rlCG0oAFIiTVz02sDG7bEAwLQS6gWc52ZCR6Kt3wjnZje8qS+wYivcCQrOh+zgMP8/G2n
	 +MktfK5vnDpA2B0+h/m9NATe6M6l71kpz59E4cWeedYwC27Arb+9kUd0Hgo12ylLy863i
	 1CMFJa5FLoWIVqbdk8wVvRhfgZJKVgULcKbaPdZp2pCm2yDPF9mBoK0qXHAs7jOEFHKOr
	 6AqVy/VWBnLN6LKhkCejEYQ8dnEP9fDSLqdm3iyCzJU2OG+BD/KI/+k7E7aOywXk7WA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793544647;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mdW8URVKF+hGIxWKpOrdbs4vtQSMaRS/gWyAr52MXAo=;
	b=rvHwgkuff/A7yXxFGUkllpo/Bx6vBEjcfNuy42Z8A7ycAcl7khG8j4N5xx/D3jcsEnb/
	 RwDtT84Or6Ltlfnn/gzd5CkK3cbvbasb6U8ivvC6BECsaSO41zxLFyobykUrqHPnUjt89
	 8TYkiXfw417WeIcpxt4ORHSlGXAOQ+1i8EtQB5+BxF6+FsjOnAd1OWwVZBQ6agegoIL2Z
	 +51KMT5kO3ujHceLsOP1sVNLCPbWzWv1oRmNNOl7PXC/+Afqk+za3Xw2AsqTp32Psxt71
	 7ciFaj7d1cQgZgs58yLCB3/ZHxmoODvuP7U/zPrDFeZNuHqkbE2nMxYXeFgYVG2JqdA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793544647;
	bh=mdW8URVKF+hGIxWKpOrdbs4vtQSMaRS/gWyAr52MXAo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q9/armBooOjK+N7jOV+G/ITZ7K4uotWIb6l8jEQUh/VEIZscHDFcC+RptRC9Hh/pH
	 DtoBWhK9ID2SnQztfHhRlIQggM3pSgg6/4WvVEyfvyF/ViUVjmweSCxy68etG04DFy
	 H576vmbr7lcbDibH1gqcybcsbYLUa8AAFa7GhudQGZc8meg+luMspWVYeNXcqhhBJT
	 2GxTU1N1gyq2pcKTzL5A/Iah/UlTAGjg99/SQrk/uOLapniHVYcdauUX0JJp/rCq9F
	 YlIGVHvJG12WX39WBawqvGTBli3t/TB0g2Pe1zZmXqF1Ssvr/dQxBKltzU1taNs6E3
	 m5r98lTwuecpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97BB080C6A;
	Sun,  1 Nov 2026 14:50:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E0BE323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 14:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9006560619
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 14:50:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXaqj_K-6Dse for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 14:50:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C561F6060C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793544645;
 b=gW0+GgOjOZZw0PHxiZ60TzWkL3uDXTbabwaoSDNba6MTYPml7dkPYm/ahBajdAU2rmrl
 kkQsEDN4/gX9M5XohwjT+IeEgbGvK08RMVRWuqacRl6LDpT0NQc74PhR82HLNox2lc3+r
 km151GA/P/sB8wUa5jUU+T6fJhxfkz8QayWtgMmLrqQ46r13Di031WwQvj24hAODWxxGS
 NZq1xXHhLFIFwOWGwZKqgrg+gn4r1z8ZZDrlTnky37nMs0RjAJJzFKoCk6+ncpZSHVIsd
 cRd4moNwN/Uc+j5GThWqHHPbWOzd5VydpqXcgbEOsxu0ygfQH13SQ2EXw9cSv0OhlcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793544645;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FQ+1lZw3jXXOxQUoQ9ZDHil52nKsoseAcAoX8JKLzto=;
 b=ofisIKYxilZRjNzCpCpVomMDrlAI4Lyua3Cbe20CtYFObPli2joPDS25BuNHGKeA13Re
 X7pvXMN/R09ykJYc+67EwzqSjaO1W728CP/QKGdGeDgJMfxjRSRFm5068mIeD3AKOvKUv
 z5tYtO0cfSe6at7QHe0XzwdlAgHvLKUrXpNP7tEEW0ebW1VVfWA/V9+EfRBAdKYsQHK2J
 8QJ1tE+4vyjBH76MOHzeuSn0Z4eg9rfPfgo/qGBU6CD5IpnLAvHUJXT90Wm+6JHnswGWT
 Pq3zY7H5e3se48cRniYY1ujDwlOanzVDEaWDe8LYeqiLyczyvN5YaVoDd9W1bKk9xbw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C561F6060C
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 14:50:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A9889D48F; Sun,  1 Nov 2026 14:49:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 14:54:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f98708e081903e3b08f18d273ac22b6a01f14fc
X-Git-Newrev: 3e1a371a47c5abbbdae8e633aac8130a37aa2688
X-Patchwork-Hint: ignore
Message-Id: <20261101144916.3A9889D48F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: security bump to
 version 6.1.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3e1a371a47c5abbbdae8e633aac8130a37aa2688
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes CVE-2026-77050, CVE-2026-84429, CVE-2026-87890 and
CVE-2026-87975, and an incomplete mitigation for CVE-2026-15830.

https://docs.djangoproject.com/en/6.1/releases/6.1.2/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 6ec3078744..0cab9700bb 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  130e6e23a095440bbf3e720b932792e9  django-6.1.1.tar.gz
-sha256  7ab93536d8e677aa14554c56426290c69480bf2ee68d7513d4a22f57d6bfeb84  django-6.1.1.tar.gz
+md5  7c2461ccfcea3d11464ef207fa0bcbed  django-6.1.2.tar.gz
+sha256  a1e92451ccb8b514e91bbb3b6d186d20b4030558f116b5d9de6535455ff210b7  django-6.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  be30dc0e3f7010af6c453d205feaece1f89494789b6e92f0c255ef597a1e6864  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 26fdad76eb..b5b4a322f7 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 6.1.1
+PYTHON_DJANGO_VERSION = 6.1.2
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/f8/d4/8314b5bdef20832f0ac6ae3b3e4d4924e4759fa3b4af27609dd747e7a6be
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/89/24/20d187a22ac821288b53c53b8f696019dcb0c7b4f973f052ade19392c74d
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js), CC-BY-4.0 (admin svg files)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
