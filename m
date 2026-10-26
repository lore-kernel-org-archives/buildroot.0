Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE55606A32C
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 22:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=crq39vut
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5391C40603;
	Mon, 26 Oct 2026 22:02:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9MTWqiHo3Rj9; Mon, 26 Oct 2026 22:02:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 54F3340604
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793052121;
	b=TvEXyJ+uIio2nWFzpZFZ+5+FVu6Am2IjbAPnXKgeVlE8xQYzc8VrM3JXuN2PG5GgrBqo
	 UQJAuP9Nlb/mmRF4HjM1VoyEI7k+MGzfnmYcq3rBf78aqEt0GFKBouKg6JyuAnTk59Mx/
	 +qCqN5rS/NiyUqFg1D8HbZAO+zI+PPd8t7YNaktjcyUrT3RbD27XzhwlUazzfnvjcmus0
	 7tzRugJiXKWUJHCJNWUZ8fyjhKnViDN1OeofF7NE4QuFI247YMubQQsBSM53Chmfby6mm
	 C/0zsudO4CHLVwXfCsEHYNASnoWhJxL5wNNFKELy0WXtLP8CgIp4vCWhzx2/Pq7o+Iw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793052121;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GCowcTGVJgUhcsZwRmeoj+Cpt1Y/5cxVVG0CCdAnIg4=;
	b=SkKt+7g4TDawo0DYimtM0ZodABJWtG8LApym2nCa/tneIHB/WWjHtBMvBK9+/g8tslbF
	 M7ftIoYdlBFB9iuo5kIE2uBKCSATVLJzL8IZOzb0izYBUfjuvsFYq5PmREMZ/4wozYyOb
	 /e5wPNoWcGKdGqwbsb9hu64qn423IvtdIdcyTzeRVfhjbwH9zAZWBEYwEsizLbKW7Ts7w
	 s+xdTaXY1zQHip34djEUlbeaTlGThgw+c/ANpL76URH/SZKTELoSINvs/dix7iXVMgUSY
	 1dAHwNhBCFP1z+X34EtLQrveCgqX1cJZMaVU8SIARLAJhTjfH5p7nLNK3ho5Ux9SxqA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793052121;
	bh=GCowcTGVJgUhcsZwRmeoj+Cpt1Y/5cxVVG0CCdAnIg4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=crq39vutFga+FwAbzGjEaacxle29xl1ic+mZVysXSqOrp1nTdYwUrn170WH8C0jq2
	 gsf5VGnCGLDKXP0Z7TPjZHswQ4LkdDqBx2Vv6q+DMPcfem93tgEsmRowHe2KdVUS0x
	 e7/UUAHMzclT0M2c+eACnHY60oYb/fAttyl00qHDQ+J+bPw1E4W156lssfVActpwrX
	 GAXlYO4k+zCyErITQ+1lpMCPLfQ99SyvmpasViWlhobRUOzcGcY4wyfYhtEPRkZAaB
	 xYqANC3kM8nKIa09Gc5BmrJMR8v09je+FlGX0QbX9+rFXAOjK5jTqS3g17IWKqGnTR
	 7zN9IZcSdBNlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54F3340604;
	Mon, 26 Oct 2026 22:02:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AA9E3421
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 22:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00FC740604
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 22:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id loUPyxl98h6p for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 22:01:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4B7BD40603
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793052118;
 b=b57VqxfPPrp8/j6JaUf7mefK3JArM3boWXHmTCM/EgUyaumNC4xOtUBG7QIhbldzAD2+
 abHTfUA0ay1ZLppeYTzKuhDFX8tpPq/TM7EbZOJi6o5Loe3rE8/NHCWLO9knyFacLpCx7
 nxqJywNyAEuxqAMTB1beOIbtg4/3BPI0Jw9spv0gp3iIcMS0269Dj3keDC+6DJMbQs5i/
 WmzCUGObipXcXrCkL0kOhHZqabIg/n7PtrzlOYf3pExPyfJ6vB707TjKlPCtK1BhYvjc9
 eMdkOijughiWHjxfzGGfaQsGbzppZJXefCPDtcpkQzzJ7fd724CZQE0bktAclck6cgg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793052118;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Cn4REDzlcpuyW34u/GsYlhF8xaV1Pvh1UHPcitL8xp0=;
 b=bMfOmFmXkFpgffUcLCEhGSYTOrumOArMxF8vAk4iMNAjkg1j6SqPhKO/xpu9TSORxdgO
 DDYAmtj9g41H31VCK36o9nJS7DmoqPKeMnXU0KogWWV/FaCEKs1El+Rrl6wDh1/L3gMKj
 pVXJEnAX2Mh8CnwtAyCSAMLcYiG/nSoFEKM+0Waf0f5rNxoVT8pIvtqadbXVRXimz0b6a
 /4BqC5b2EMqx/uoNeW/07dgQWtlFA70JCkq6aOzDNMX1jtNv0WnsjiC0yMT9rXNX/kYC0
 l18NRMMx5N1PgMYOMf5tvqmQlQZ4RWTSMrYqbICUmc+bawjDWL+tnVMNfVLOvCtxgiQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B7BD40603
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 22:01:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27EB39D037; Mon, 26 Oct 2026 22:00:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 23:01:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d69c401301a717418d5db0a1d5ce8a137e6cb0dc
X-Git-Newrev: 8fcca1794b352223f868daab062045860a827a45
X-Patchwork-Hint: ignore
Message-Id: <20261026220032.27EB39D037@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: bump to version
 6.1.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8fcca1794b352223f868daab062045860a827a45
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to JavaScript formatting changes:
https://github.com/django/django/commit/fc0a0ebd4fe573299a5f978e77fa3bca8424f661

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-django/python-django.hash | 6 +++---
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 993b7b0d68..6ec3078744 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,12 +1,12 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  b45e074d29f85e1417fb2d2ea97c2df3  django-6.0.6.tar.gz
-sha256  ad03916ba59523d781ae5c3f631960c23d69a9d9c43cecda52fc23b47e953713  django-6.0.6.tar.gz
+md5  130e6e23a095440bbf3e720b932792e9  django-6.1.1.tar.gz
+sha256  7ab93536d8e677aa14554c56426290c69480bf2ee68d7513d4a22f57d6bfeb84  django-6.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  be30dc0e3f7010af6c453d205feaece1f89494789b6e92f0c255ef597a1e6864  django/contrib/gis/measure.py
 sha256  570a045a8372b6cd6a00e30ebafe8e3e8dfc0a7fe3d4ef2cc5f16d419eb63aeb  django/contrib/gis/gdal/LICENSE
 sha256  08bf24b7551238ae325295245425b1caeb9ad0f42f9e2d303c7b353502632045  django/contrib/gis/geos/LICENSE
-sha256  d48633adb736dac091477ec2206feebeee88e3e6e486aedb21c584e4b49be0ec  django/contrib/admin/static/admin/js/inlines.js
+sha256  b49eebe24624d23591417ab5b163a27d40bb89889a24b2c1699194e309aba826  django/contrib/admin/static/admin/js/inlines.js
 sha256  d4db9ebe6f29f5168eac45ad713f055623ac5d0dcd5ba92da23d650ae012020d  django/contrib/admin/static/admin/js/vendor/jquery/LICENSE.txt
 sha256  4ee0cbc51370afde358652a0f977972053729ed578b6a42f5e2a037d114f0b39  django/contrib/admin/static/admin/js/vendor/select2/LICENSE.md
 sha256  73af2949bff9296cb0f816c3be19a4da4e95adc94c1f924796e8bad3f03f2f29  django/contrib/admin/static/admin/js/vendor/xregexp/LICENSE.txt
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 764e72084c..26fdad76eb 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 6.0.6
+PYTHON_DJANGO_VERSION = 6.1.1
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/source/d/django
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/f8/d4/8314b5bdef20832f0ac6ae3b3e4d4924e4759fa3b4af27609dd747e7a6be
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js), CC-BY-4.0 (admin svg files)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
