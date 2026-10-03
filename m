Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C2ECA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFF9560EAD;
	Sat,  3 Oct 2026 15:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DeugbEoqRPld; Sat,  3 Oct 2026 15:55:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EFCEC60EE2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042949;
	b=sqynHFnbz+IeTDtuQB1qMULgHUW6iBKJNaL0Qc3S/zqQZyr4yhGD4tvkZ3XaM+cRNRqa
	 Q7oQnuZ9xKx2zr+Vb22MCVQpxWCAezw+jwGF7wn3nRVk2LI0asNxz6cHUuZK9udXtAVim
	 8C33heAv4tldTleNs4CxtCA0gyfYPlnLCKNvde2A+IlH8HyqrTNENVDfXP+hGwIVRsdS7
	 EjwEVASREVC/3QqFOY7VNSY0NeeVCFDyseCsJRdgE2fRc9dNcUSMIfM835qe7OI1ZiL0j
	 n3xKML8v4nPn3ajP4RSNISUShoqpzgNYlZ//9g7T4EyEk0XCO7oV3f8uLP5nkTSfSng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042949;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8Cy1jZ3thb9F5S5PbWZfP0x3aELHQEbvqsQjXJuMMiI=;
	b=dYUB0SWam88LNE5tNssmsL0v4E+fUy2v0iJSNrbWdEqxvod+jNPSbuB9Tj+4HR1z50Su
	 0JNXR095tba2Ip291nVUhW1ZxwLGwMqNpWQWExlt6AekWfHfdleYK+H5dzGIyWb4oVYyW
	 NjGig25NDsCT/c/gBw4oDm7kTk8sT2gura1h8GlvGy1Bbyb3dB+PmtGoblkVuVdnewEdn
	 AeyOij/Q7hNZMacQ64zkPXsYc5NKNzsSgFMU/LdJ9GHeWURBVjNGZHllDeeBNxs8A7eTO
	 CW5VvzqCI8kKwYmWAQYARgfRCSRvPqSwokY8xs5skyM68uajV92JO0zeZhd4GBci53Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042949;
	bh=8Cy1jZ3thb9F5S5PbWZfP0x3aELHQEbvqsQjXJuMMiI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZdE3drBtH/0JfuJGGs3DjxgLOWMzmqtgD7hkpb6pC6OjcqJCngYMj3pXpiTux/4cG
	 EvHAYJdaUPsUyPvhF9Cqk7gEbWQ8AQcW7RxAp1iLw1e/N4Mz4J4hzcWa+FufuxGszI
	 T8fSzWIe48zwK5fzUcRDM3IdGSImhkCS36MPw03c5YEctRpseVZxlOVE4+do3O/0+n
	 Q3BQjbrx2AkKwi6XnqIj2/sTx0J1z3qOvyE1QZMFjecx7K45D4j5QbL1qHWnDvyAcH
	 0/dBPMtAuw33EGaAtCnJ5/UGT2vnx/P5Ndii2eryo/ypVjq7afMCq8rzeEBGB3mWK6
	 S1LEbPkpENSrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFCEC60EE2;
	Sat,  3 Oct 2026 15:55:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BAAE1476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96747606C7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gMgZLH8C5XTi for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 37A0A60673
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042845;
 b=nUgrI1HsaBIUYVzqLuuEXPncQ7ol40cGY9jyrpS3qi51te8AoyvyJVh4wBmAKDj+IQ6Z
 49OP93wozGzWRNKYC0TCFcezDzKX3GUyQpbUaFVfSxKgIlo2EpTqED12ivFIoEY2+mB6i
 KXAdCvi/IxFJS1XYo3tYXLZAgkwl54+rqAo5vv1kJ3AtpvMXWrnTb04W2dBBypGv4OhyS
 5AbQk9ILVcYvgctHeJUW+dCubDT1lWP227iyYwlQd5fkpmv6Yup94n6YWF0ogIzOJs5Ai
 2tGiDXRSjPdQQybfEDSh4e0LBr5lwLPCk1rUQuqmPZtUnnLi1U9Vm5LN6sneti3UTuA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sx469CgxACdrJRSuSyoCo5R/S7vriDWFH+Ijo5jk2co=;
 b=ka+ipJStOP2eDnQGH+qIE8HOIAE9eyk09p9qPRgyqRYQh3xClmjl/A7PJ5OBSqnjjGkI
 Tz1Sn3lqGUG+15tPGntpsCHj+iyaM6D42pnp8F2wQfgXzLzh31TW0orEhjzOhiknYjImP
 xGrQcEx1fc7qKP4fFStLgUzyhxrg1N2s2Fi1Bu1k2VzA6qYbGKyeLUI/T5C7DnGQIizIV
 2zLtgAOug7vQvwlI/2PDvr3pXWXcwkvhUAwuJ0jlltg3tDBalazL7b7JATSPczqqfR6gk
 2YfEcQlKUvWkbkWJhea9lUf4BtNbRH8iMWP34Bz4qS86wmghwi6PSiZ4TTjEbev/Anw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37A0A60673
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77A5D886F7; Sat,  3 Oct 2026 15:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e276f369a7faaa0dcb58c3d11badae94c63d917c
X-Git-Newrev: 1fe5daf68ef4b4f5091e3cb6ff813bade3db4eef
X-Patchwork-Hint: ignore
Message-Id: <20261003155250.77A5D886F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-simplejson: bump version to
 4.1.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1fe5daf68ef4b4f5091e3cb6ff813bade3db4eef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-simplejson/python-simplejson.hash | 4 ++--
 package/python-simplejson/python-simplejson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-simplejson/python-simplejson.hash b/package/python-simplejson/python-simplejson.hash
index a8614cb260..2601899777 100644
--- a/package/python-simplejson/python-simplejson.hash
+++ b/package/python-simplejson/python-simplejson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplejson/json
-md5  bd06bf5c6db9fdef4b220d0aebb03c43  simplejson-4.1.1.tar.gz
-sha256  c08eb9f7a90f77ae470e19a07472e9a79ebc0d1c2315d86a72767665bd5ba79f  simplejson-4.1.1.tar.gz
+md5  ceb8e049dc1d531998d321f6c1bc4e08  simplejson-4.1.2.tar.gz
+sha256  6ae4186f90362e9c03c80a1cd5062a20f3a11ac9d391f7ee0ef0701a0e2b7394  simplejson-4.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  fcaa1e313a99304322e2e0836ea4ee7d839ce9a480438f3922a853edfdde129f  LICENSE.txt
diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
index 1dc2eacdf7..8e6024bc45 100644
--- a/package/python-simplejson/python-simplejson.mk
+++ b/package/python-simplejson/python-simplejson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLEJSON_VERSION = 4.1.1
+PYTHON_SIMPLEJSON_VERSION = 4.1.2
 PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
-PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/0e/2a/54837395a3487c725669428d513293612a48d82b95a0642c936932e5d898
+PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/f1/e3/1cc7dbf4deebc16e9dc42db37f473b5b612d021eb10e69974be308425171
 PYTHON_SIMPLEJSON_LICENSE = Academic Free License (AFL), MIT
 PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
 PYTHON_SIMPLEJSON_CPE_ID_VENDOR = simplejson_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
