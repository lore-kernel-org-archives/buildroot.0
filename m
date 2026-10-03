Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA93CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 14:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2479581492;
	Sat,  3 Oct 2026 14:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNkx64mnQOU9; Sat,  3 Oct 2026 14:01:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5C6288145A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791036074;
	b=rd/Qg/xAzqTEAjTEPaA9kd0uUUB/Vik8TKz/80yczhAC9w3XfwAAQSqIfeIb8przWwZy
	 YRhc/kPi8/4NVoU+qtCo+jPBe9h7WUom50Fv7d7A301YRTAw+xyuzP30H+2vHgnssPl1Z
	 w1HRPguLy7ss3Fay6P1Pq0T3DRYDL5TEx5CIB4crti+vYFzVr5cOUWSiX354ZMmXlyKbB
	 BP5uf1QYgWn8JgA3K8wT1MgjY3dH+PxiTvMb9OO3YqZXJXKB5YOwglImUCIGakE24Mngu
	 szpIympqVZQGQLCPmagEW58OHG9NFhoFMlU9wFIcq3/cXIWgbfpmMUZuEzZ2LOhdhqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791036074;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=D9BoyciVCCiVPLb8zAy6mGlRiAyC+E5J6Tzm9XWX42M=;
	b=pthHwW7//mVjewHlTtvgEhZ5d1OedOH1WsCD5P6uUS+HYC3IpzotJ3R/zYBft5QBPt1e
	 z061uQBzZndO+LRdd191xrCOTSaSn5bKV7s4EKJkfrAkpdFJVVuTba1TBx7d8vB5P8e47
	 D46DBrscOKH5TqvlOraAg2oEkd7uLo1JlKeYNfCBmaZDhml7q/wp+5CDyPJUW1DEeTSk1
	 rKMWLcTeN3tERJ/m0Ujw5r8CoHSfmxLykdSz/lK+EZ+rzCHjDdOL25nj8mgQEzaFx58H+
	 BWWrs81Umg+748M2lfnV2hV9TGHF6+OpbMh08uxcDP+uY8er3WtDqpkC+dqV/1oge0Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791036074;
	bh=D9BoyciVCCiVPLb8zAy6mGlRiAyC+E5J6Tzm9XWX42M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nIL+rQ/oxfqucsDPdB5EH4bBaYX5rGu0wVemviqbGTHjcXEp5KsMQGAEjik1zX+C7
	 +yJqD8IHNOsQFFtjoHDGIlofCqoGljpMTmdVTwDx2b7IEoH7cG83uIksf6d5HtweCi
	 TWtDtXXKZOVXh039JcHDkl9m8+cMhVid/OjhEzwczVPFo3HYZsviXgP3gywqeNvdC3
	 cItRRA/YGpHPIDqL4w4h9bGAihFYhzi4c9y6HxqWPgsHroeJsabxEGl/kzYijERHtE
	 eWQ73eKJKN2VG1DlixQ9yYja1YYyaW4bmwaD8J+GgQue4b7mS/5irqxM3s4aK+prc9
	 17/HfBattkhqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C6288145A;
	Sat,  3 Oct 2026 14:01:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 26B01476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18BE240064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SsCEDzkKf670 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 14:01:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6AFC340063
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791036071;
 b=hUR2PIU56eI0pv/L79gQ8w2RQqC7HW7rpvth306+5bBJX+osmc3l2BKU2ikyCZVfFDPU
 M5mbPHuHDBCztJQ6iJ9yz6kKrwWbuMzTk20sHz9YCi8OjY5L4cW9sLSPSSXUf9pKBrh0k
 nq8WuWroghTymJ4EY9hvfYYLmlPQ4NC6+KXUsdkBUOgzguCfLIsR1yTY00/xKaH1nx61I
 OLqBla7/HT62IiRb6Vzif+Vm9Sc6UppYMeu+hYluMhDPz+9qVYzJ9OVpYlpzs9/3O0+tn
 A1qtpS53ynmqtJsrVLqX72ra+6yQoW/hC30N0fzkqjR0N6YGAELbUUvqmTNPmap4+0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791036071;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=hqEvVu2Ru1nSlJBgHCwaRneyv/4Ew2z8h6o98n1lfhY=;
 b=HiOhLbC26Abl7RtH4eUFti91QHJv9csLwdprMkRDE9zw9kxXAGEGBG6UfYzZEMPuwLSj
 11z6ug29yXzBCVU4cru8tm0wFc7NsHV0cHrOl+UHNSNhDCmCp8JbHDmN46R9gBp1yODzd
 Sq2wUvw470GnFD7kEhCK1m8EoEI+DJgB9jKqHGtKMgz1gtlZwEp+/T6dvVRhsRDN/rzee
 2j4qEfyvP3VK5QRPFdf61Kte374p40X5O+eAIuV6VrU3B2QyvVWApd7FwTJW2Ne1KZC03
 pbKsYq2n1V7ZDG9QfRNxwfog/wbZedgop+6S+MkT7oF+c0B/bXZ9E0X7WSICm2CWbzw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AFC340063
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A86CD8A3F3; Sat,  3 Oct 2026 13:59:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:58:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a205fa58d2261a33479cf64ad6bcc96b374ae948
X-Git-Newrev: 9611b785816f2546bd69a56b9329f09b0c246874
X-Patchwork-Hint: ignore
Message-Id: <20261003135956.A86CD8A3F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rpds-py: bump version to
 2026.6.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9611b785816f2546bd69a56b9329f09b0c246874
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/crate-py/rpds/releases/tag/v2026.6.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-rpds-py/python-rpds-py.hash | 2 +-
 package/python-rpds-py/python-rpds-py.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
index 32593a1f7c..6da82fab0f 100644
--- a/package/python-rpds-py/python-rpds-py.hash
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  9a3d3078a2fc34efd16e22b73c61f6a25ae61e26d5b3dc84d656cc0b716de4b1  python-rpds-py-0.30.0-cargo6.tar.gz
+sha256  0bcddb46502750f8e9547ab666db13115d798364b6a21a59c6474a3fa157a522  python-rpds-py-2026.6.3-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index 12ff7e1fb9..40a0080a00 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPDS_PY_VERSION = 0.30.0
+PYTHON_RPDS_PY_VERSION = 2026.6.3
 PYTHON_RPDS_PY_SOURCE_PYPI = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
-PYTHON_RPDS_PY_SITE_PYPI = https://files.pythonhosted.org/packages/20/af/3f2f423103f1113b36230496629986e0ef7e199d2aa8392452b484b38ced
+PYTHON_RPDS_PY_SITE_PYPI = https://files.pythonhosted.org/packages/aa/2a/9618a122aeb2a169a28b03889a2995fe297588964333d4a7d67bdf46e147
 PYTHON_RPDS_PY_SITE = $(PYTHON_RPDS_PY_SITE_PYPI)/$(PYTHON_RPDS_PY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_RPDS_PY_SETUP_TYPE = maturin
 PYTHON_RPDS_PY_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
