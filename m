Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9B0CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B87481343;
	Sat,  3 Oct 2026 01:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U_P_It2IZ5Sp; Sat,  3 Oct 2026 01:33:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3FC2781206
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991198;
	b=CGTkrmfBVNA/gSX2zVrEEg5aftIYpKssLbxlnBx4xoQUhTBrEOMezCQ+bpFHPPZWvdaO
	 wLeMVhzojUDYLdqvWg+HSnbhPQhgYNqshxzcD5atSYqslde07nuwoWINoRMHzZ4l6yXDW
	 qz6Wdc8xW7yUep42ySoWmZ0KFBdBqe7+NlU+plQhx1+rwkvSxutoXld8i7RSaTITnqUeU
	 q+mQb498WspwKf+ARNwOC8qsTDyzgoor30o+zv8ZhPsLhlmkLh4GN7rJ6qFfcGTPM867+
	 8fPSTRb6qAE3ka8qzQ4p+TPpGZV30GujW9oucxXW2ipZqYKjiOl4ikRbnau6Dbm1/Xw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991198;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nFN+j2dVysyOqM9TFAv1Fx6qRel5YhhN/dQxafadU8M=;
	b=lWeI9fHOaX+Lkbdo2iqc0t96mtMMiJLTpy5kSAdVws1sz6Rxaj9faEG0cZPJJCYiXtt2
	 V9p0sQzf9Is9ZNV0liZeThLVEXTdWES9Emmp75KIrs3XBb+Kr3rr5AntaPf90MencCO1g
	 n14/8cz8qR1sYf8b5ctXDuxyMS+8H0TLltjBIl/Xe/4DHjcO0rlKroXv0iOnGPJqgwZ9y
	 dc97+7lO7pOMchOqv6TNZvz4Dz8/jSdjYp5AyThFf0P7W25xTP1NXlp4NL/HY9hJ0M1fg
	 BeZaU729HsOreTIQvMSZtBULR9NJxfWLus0G+a6ANgS4arFbDwA0T8PFEwCtk3vvgiA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991198;
	bh=nFN+j2dVysyOqM9TFAv1Fx6qRel5YhhN/dQxafadU8M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=tAMEISSZX94W0v4HZyv+VYUEemTbWDF/62DzqzwaHtnkUjgR53jHrnK9npj5ByV9y
	 AHga9pzXAMCk02rsJ1lH+9LIdt4EPAe5Gmrn8OfRZPBRZa7KbUGsho80nuB/qlfCV6
	 al7St1/g2jzWE2ydTCZQqskmmoxanG8NZyjJFoHXNokA8FjdnHrcpWhYdRlGbKkW34
	 mN+JR3x9mmrnGcK5h9BPURTTwRzod2GCM+7rggVXHpUg3seKRzMsORl8w9F1UU+KzP
	 mGIjEJIeoeyNUL7OPxQWRkxCFWUi/wqu9MALgE0EpQ5HQpq6l2OSFFowk4bfOtK8NQ
	 C0nKy2F5rO1EA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FC2781206;
	Sat,  3 Oct 2026 01:33:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D8EF61D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA60040B26
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elAPBzRYrLPh for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 42D3840ADC
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::332"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991194;
 b=Ke2nWknX0HLy1DlThCLC17jdYtuYZayhdyq/LtaKbZ3WOacq0Sb+FA75T5Z9zfmrCOjV
 tKkiG+4ISLzzNvZbQd6Pp86MQc85zDeaA+6P70e7ZxKko1uefpkLXpBfgFnZfYuZ+gvNL
 CcyEykF0vyVrD4TNWBpNRZ8N0F/K+rkOxqfI2e4kGLhIU2XierzyY65zesQDX2AGA9ADi
 DDLn+We/4AaUZv49IzNXxcjc/H4O/3HA7da5FFMJS8Ms5Ye6JywPfXMaH77kIi47MyDES
 1bBw7uZykI896r3hrIU6HqAKNJWcqsoupXk8bjBm6kcuNjaZ1rK+d9I5ujwzaqF3K6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991194;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=uXx9epCLdk4rB349/mtt7eIV5/1Q89bX02x5DhTN6pU=;
 b=CHw6DGi6P5n7TaqDSnMdCZwL1S9V5hlyBWNVRtyOVajeKUMrw3GafSubP03uDV7sd/iG
 JyRlIe2gzTdiUpCJKoj6Nz1I+VmpOTYN9kMp028Z3mp8YGQ3CjZijKe1oag5KwtOWtWmE
 8EQc+zKnyYnlHv0TZwD23GPub03yCVimaurCA7ysjry9ajtTwGuqH9mtZnV3CMsCE53ja
 W3DbCTzwly4PKgIOhzF7JAlLfbu3sYfP6cmzGS1mkAIj4Xs0wPaIGO5QRDZtiHy3yQlFO
 TQ05RExHFn8bKSlVgneOYDLBHY8LJ/gtRwb84s1zUdFiTdtUmh1rTogZxQzTpawPu1Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=LrEmGt5Z; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=LrEmGt5Z
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42D3840ADC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:13 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-81eaf8e18bdso351884a34.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991193; x=1791595993; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=uXx9epCLdk4rB349/mtt7eIV5/1Q89bX02x5DhTN6pU=;
 b=LrEmGt5ZfembpSoXu5L3sIK2LVAnHo1aqwko+LL8NbF79ij7yduOMod7pvs/dagLTC
 ZjbQ7TLFgIk/7pI+zo/FudKpcvyIa8iVkTyH/torDd6WM2dN4wy6NXhQnRmsPVY9aZCm
 KXNGgIpOGIUS1Q8zuAOEf2z8+hi7FqglD8eoXM8P+2jxrVzyX8Zmz9STWv5yslcI6caY
 Zt6HkDlbh6XuhV5UhfjTkDe/jgKjkbyiiwINpc9YFv4avR93f3FCQxsDgRJuNN9Rdk0k
 HgmdV2yHtXD7H0dVAzh+okaw4ruBTF2K6yMKoHvRnJEwaARzSDT4BO45zfMl6zlywmCi
 zd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991193; x=1791595993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uXx9epCLdk4rB349/mtt7eIV5/1Q89bX02x5DhTN6pU=;
 b=13QCDRXpqJ8P+YMoJeECO8RdjX9RkspfkaLTciAOIZqtlFe8WRxReAAqvc0SjSkDFr
 Y6I4dNxLJq9PvB/1hr6qBkR0RxO+nRxhElSQiakaG1hs+Vt1Wp9AdmP7ZsWlOtqAv3rf
 PLHlcWyhVl+iCOlq63yB8unh1r0GBV/DM7MOpd04QcOQOScIrrFOgrlGIS+fmBYRYcSl
 SG5rdz2yWRcJBwPFn4leJLfqznve+IKtkOtZsGIMYYY9Dc/jMF5EQtP0Yynka75Dnpg+
 ir5NDKJXEAYdufNOWuRCZ9ZE18DrDUYlVNtRbkq/mflC5/FS2WlDzGAV+1VQWlUGXQ9J
 L40w==
X-Gm-Message-State: AFuF++mPlEM+84ldG8ZLbx9AW7mbvEEaK9LuOWQBZFCXiFbpbDnUhVAL
 SyJHngHnsC4xTISM/+OjyzWzyYdcRQQoElGzJvwOVE74UT+vFWM/lPGjiZBkgg==
X-Gm-Gg: AYBFou0HBc6AnDlBclaxPI7MRFlJ5fviKMAziivX3hHm/raIjmy7zSwVi2h3NYBTpv9
 EZXvrXxDhiKl05s1/AwJv+ZTn+5Jd9FjhCAC6FrRf/Pp0LWnObEoU2Uq3YuQkhmpCj1C2g08F89
 Gz1spkzmMW0HldLx23PXo3HR1Z9g30BSsPoygA3JShMSySirXWe9XFt6KguQnsvhVvdlVdAGQkQ
 t+z9yteVKYFucyaz09oTV2pa9WjehuINu1P0mQdxgcptYgJB1Slt5XOMBhLRj7GX8psr9tdiTLj
 jJOiEsRiJPvfDS2hTtNHdBKuxpwY5qhD1fJQyH83T/3aBdTr6kTpA/DfdGnWDgsagnKkFm/FaMP
 wP61wzl6upeRuFZw6lTr25M+EnzJR1TUhsjL90AoeKe786q8sUx90abvgvPghoyoAxWhWcBimXe
 H4z8I4vfnf93RMZYzamc+NzNt5LQsp2E5LrsowYkukqcrRfXKXxSsccggKl5XK1r/2oWQa4jIco
 1emzdzi2m00OjkRbbFG9B2gTo344izo0dSP6rj+VAumVAcxakA8WQpqCXo/V2i1wiWPDl7NUiye
 BFdZex+Z7b0+zFxklYXnCu++bbOJq9xbUUFbBUvHk+wS8lLpOIRhYwoYCW8DbAqAOXHKRnw/sIO
 fdcYRMmDo6r1xR3bTgAq9EGmhvrPqWbNddX/FpjJI8A==
X-Received: by 2002:a05:6830:719c:b0:822:a76e:95c9 with SMTP id
 46e09a7af769-823fca269fcmr1043404a34.14.1790991192836; 
 Fri, 02 Oct 2026 18:33:12 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:05 -0600
Message-ID: <20261003013304.400979-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2026.7.22
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index 5f4706fd37..a0c24e66f3 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  238385f505d22767cd1860661f1c5743  certifi-2026.4.22.tar.gz
-sha256  8d455352a37b71bf76a79caa83a3d6c25afee4a385d632127b6afb3963f1c580  certifi-2026.4.22.tar.gz
+md5  926857e560a3ae443ee35c2de270d75b  certifi-2026.7.22.tar.gz
+sha256  741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55  certifi-2026.7.22.tar.gz
 # Locally computed sha256 checksums
 sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 474b147873..17c6925ae7 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2026.4.22
+PYTHON_CERTIFI_VERSION = 2026.7.22
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/25/ee/6caf7a40c36a1220410afe15a1cc64993a1f864871f698c0f93acb72842a
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a3/c2/24167ea9858356b47a87a50d39908bfdb72ceeefe0041586e704e5376b3a
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
