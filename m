Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B79606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JaMPzspg
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F64E80D5B;
	Sun,  1 Nov 2026 17:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCWnXSLQnPty; Sun,  1 Nov 2026 17:07:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9DDB480DBA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552843;
	b=XTmP288iAFVm6BD01Z+8GQ2yT+Xt37CzndAMB3+Yitj/EtU/Eqgh57Lpm5NlTnnM6egx
	 3GP1S3XlQUBzcDXTEs3BGQSwNR0+tz6R4RuPbxUUKZGPUQ8jGi7NOThZ0U3YXlk9Qkt16
	 5PIcXMmuA54Bo9g4I+fpg7jc5GBdZFvodAhOlqhMG409TFthfvhOGzsc+mv5chtOIyasZ
	 CSUfEudLjc5WCpo2FeSTU2UaAzqEzvmZsa/RgM7oGtlZobg/89gN+3Dl/AarsgKf5Frw/
	 Qk/1QJQ6BwIC3KPudqiMAu3ku8Pe1f3GQtZyEWkxuA9KiExfaosC+7L9h06io8Az8nQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552843;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hafWfHSQ7wrRPujIO40ZkXkDCx7d55XQeF27hq+ZYL0=;
	b=RiBwjzfFJ7ZDngUKP/6NB/1/YGiQnHw1TtrBVrr/LrZi5F5yN8+xj+6xBSqCKSO0aVyE
	 vy/LDz/V4/XL8pa9EZR0YQUU19t/UY8xdGZNYwS/v8oP29ZYpLwrpSYoR7+QA7uz92TRo
	 cRDvlcjg7ys1GD19/pFMLO4OzqrXrGE+p3ug1W4OJ+bBlF+49NtGxD2GlBCY8FaIGkKzf
	 88dyT/NBtjed8Lx1YXSqcQ89OE5GD6H6Owx2ensATw8xFSg/Ju44L71SPMYpoSVx1UybM
	 Vc6K0tMgSDa9IDT6AFNt4PuCGabwIj33N57un+KkXfL6WcrMYs+lN+OanCLL5F3pM2g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552843;
	bh=hafWfHSQ7wrRPujIO40ZkXkDCx7d55XQeF27hq+ZYL0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JaMPzspg8UrZMFv/s8zzzTY6OPsXtqETFSWLRY/trBmSUA4QsJMu3OOyscY0njVCt
	 Co5ZM1TgcOAw452GO6uJECit4/C0mBcvlllalhLPrROyfUkuj6VH+lR0xu8/pX9CNZ
	 O6zhgmweyLg4ey7CtwRVt0roSD+rRyXVvx1GgGN3i0n6MxPAXf2oEStBrfaeQ1JqGE
	 Pir3D/QA6wyUZxYYplIMuAJvj+ETSPHXmHvy4Gb/+MzcUHWMDjjL0+ygWaCR+hJ2qJ
	 YhN+96d/IZ3UbmGKHwIzmrbkREkP367QmnoCQUVLU8VoG+FOJa/Rhf2PDWJI5x4Hqp
	 csORsbH1Yz2Rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DDB480DBA;
	Sun,  1 Nov 2026 17:07:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 621B0EF5
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47BF5606C9
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rqzf1G0Ra6nr for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8AE04605F9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552837;
 b=lT7svzbnD4+tVOx/JOCS3YNZZMiFqmVsxwBXG57NKAipUSuIGd9gPUH/pkdK2lWNNrlT
 hX5BgvW4B0qO8YYBUURc3HuNMotvW/oql0F5m5h7NOAucmvD9XX+Uv01FnVfv1DVfh7Ua
 09XYzCxUt2ScuPqefvblfKOW+vdwmKyXZ1wZ9Nvf8nrq9q8McJOlhuyPc50OdipclgJ8X
 wQIepd3wLkkLQkySRi4Y/e4hOJ7jWF4xiWk+BESHwQlkM7CVts99HbgKtGEXcsonJTKWv
 t2Nj953X6w0ickZLjVjwwQIcQlHxkmTwYn4mwkkTM5bUldrp2WPukfz3cWfZYbfBYUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552837;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Dheo4QTqmHZB8DDexVxipRpQdXueQJtM+fPo1cKrMHQ=;
 b=mzWFeOlEcDoYnUB+GgXEAY7dKhYQ1IUpfbLgLgTVczBTr2r5o3fX4/LEbcrCEXIIvnCM
 I6q29yXfdGCP9ES5sU9x21oe/0TuFoc1bObvw2EhDtc0HeGuLIzGdrumtmX4XhbShbaRe
 LXv7XGM9j85blM4l56UDd5iXSdyEAzIT/sDgzfgTCbOquC7sh3ADETByrJNvGRSevsCtl
 /yQaAld3mVrOW+2PXWRDC7vJFQmVgr6sd4nlRFW84WFltKSXbAgKKoapU/sFLnQczU2By
 RX6MHZThoY0oIyQ1EsIbAt50+fXzEWEgGg4I3wcpI6GmAtek7UCJ9hJKdDY92Eol2yA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AE04605F9
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BB629D4FC; Sun,  1 Nov 2026 17:05:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb55378294945d3d43833860f3bf8a16eba1e39a
X-Git-Newrev: 22fc84a150560b2a47454c3c41ea4b87063a365e
X-Patchwork-Hint: ignore
Message-Id: <20261101170548.2BB629D4FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-engineio: bump to version
 4.15.1
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/22fc84a150560b2a47454c3c41ea4b87063a365e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index 9057981efc..9a2ed24787 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5  0fd780d7f07b5007be10e3687ff8d7b4  python_engineio-4.14.0.tar.gz
-sha256  eaa1e386baf9c2c7959eef7f9d9165c5ea910c5b392f5316e78d29ed073cb43d  python_engineio-4.14.0.tar.gz
+md5  f1b5200c2ea4546cd80fa604a2d7dc57  python_engineio-4.15.1.tar.gz
+sha256  1a412e798a90c64fabe7b20798939ae6d4a03f34da8a33d5a21a25a8bbbc3612  python_engineio-4.15.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 68604bff45..0a313045b3 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 4.14.0
+PYTHON_ENGINEIO_VERSION = 4.15.1
 PYTHON_ENGINEIO_SOURCE = python_engineio-$(PYTHON_ENGINEIO_VERSION).tar.gz
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/fc/65/f8bae11b228647e2e2f45b63dec7448efaddb7cb51f529de1fdba69e63b5
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/dd/91/b565807fa922620ed575b412bf978d032e4c5d79558b400fdbfe1008c95a
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
