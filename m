Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80862606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AdWbjmNk
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5963440D35;
	Fri, 30 Oct 2026 14:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NjKvv0XpqR-B; Fri, 30 Oct 2026 14:18:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 865AB40C8F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369931;
	b=INYjkKmtlbDuIvwivuBA7ICFSW+ygkpMMW4yOXy//3JArYvqSvkXidu8SfbChNFTRc7+
	 vavgdRS1TPF0pUHVxnxpNiMG+juhBTtSI4K4KJF8kdN2oYhKkhbdlrjVvvgTVZloqbGsa
	 Ox4ENxDhldyXuB79Tb9GDDnsmsrmpcLlzglEwMMIKHKbLXr+zZiGuw/VjyKwm8MYotPkW
	 04gMJlvArlSVAZ8hT+J15jbF9UJhR0EIe63NqzSEA2eLoB4GAivCE/PqZNwkWmtPy72up
	 y57OK6KlUYg7Tbm93/DRbWRdXSzMXDHdyUpba5KIYpLheS2EFY+NhS59VS6FUt2jhlA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369931;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=BSyiDjpMcKIdE8qyYlw91KCaIRvAUXwTdijAbCzwT2c=;
	b=jUD9GtL0OiRjjZ5MrYFkSJbzU6Wh+DBo4ALfS+EwSiJ6tgVxessOWg0O8e3KcDolHPsn
	 nWtH4ZBPKahGvnCATrSmM1yd+9Id9knUJaMSLjWAa6D/sdqs6OV7Y4yg2akyFaaXEBmev
	 0YsGBJDkQvYWACVQzIXZcYXggsKfSE1vU5LO3ez5MrOpRwnbVNKvWPfHPvKKYXUwKBa57
	 /Z0hadlSQqE0bHePsunoF5ud+8YL4TB+IcqXHA1MMpMxEX8uZnhLTn005BAAUAU/ejn9l
	 iLgQhi9na9le2rcIfUP9ehXRtqFYJzBdxw8MhDsgYaDDXW9XJVvZsG3oyKtnfVLbJsQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369931;
	bh=BSyiDjpMcKIdE8qyYlw91KCaIRvAUXwTdijAbCzwT2c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AdWbjmNknrVYHQ9WUb47VBk22rjcOw/vxF8Hev/nea/d40bRYH45XDoI+K2JVk4m/
	 HVCzROdrjdxLHfoWgVpXLygtXM7ECD8ZQqZfQ1G4UDVGLWat/nRJ21efmsOQ0ggpmK
	 LwRlLb+CmdnkrdAAz9FBMSl/4ZIt3sb8qaa1yJO3lagSzf9AgQJKfU6adireQ0lHRl
	 NBvUpXxQL/PAo9OtvplH1OjNCj632QMR11TraNBApCr6jBD14vVy7VkvNO9J53dNpD
	 Jj2vXakCmV7K9PlyBEljterzHdDdhmPmw11WEXd6Zf75w/xywJeH6pngxpiLJAeNWW
	 fOYpff61GeNpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 865AB40C8F;
	Fri, 30 Oct 2026 14:18:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 467ABD43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 384B660AFF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1ADQL69f7Al for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8723F60AEC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369885;
 b=slr59J6kjx3HJr4a5YdMfWyAtoHlWNafC9Oy5Xck+FQwWbMFVxLUdJ8OKRdhXc2Sie1u
 MU9d1g0JKHjvIjgjUJXFoPmRYWjHa2327P7N1821AMATC/mRjcAFoX+GRKKhRo1jR1P8p
 +lTMsfR6eH+eHtfwHBD+bM/8IBZmvxDq1JH40QX4/WeR2rFo/Rkyl8ymFvAIUkZuE9+0d
 s6nBVNGLjQToNsjQAlPdBI1kSRs80499QmtsBZwpnwtiZ1k1ZMyDyPOcyA3qIsvAhT7rL
 gjHchP4w8MqoaRqM6SDP61neWEHE8W1yIKYKs76IEvPHSv3hsOvXB9AYxt8vNoAd+rQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369885;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DnjNdsTXWkB4n4cBPLX0MjfzRQyzBNv8/u1hmNstUW8=;
 b=ivF1LXKzPhmixTbgrTC+LL2YrPc3KFTB/0MpYZK5HBT86ZeBPyRI9i+7mK3QZV+DngR9
 D5cjvkH6imBQ62YstPhyrPyxndvft89p//G22BHu7tRsPCIlZUM+IQcIE/Vo9y/u3r+IO
 lOw87jvtF6VBG8F4lU1X3Qw3miZsOB4DUT3aVOkiQdl878KRGh7PYItRKDBzjCAO0MOub
 ou+kKXfqVaKzjXtwtyQ66RDm9pIpAKVh3AgTn8V089xWsbf3E3NfdfmwMBSYTOW6TOZe1
 GwDubZ+Zog4NYUviniylexDEhv8pSdIngS3decJYtFmKv0iB1LfDQCvr1YZjIIheIMQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8723F60AEC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98D719D388; Fri, 30 Oct 2026 14:16:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:06 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: d717b9b02620abdc0c995b59a3f9df7803a769ee
X-Git-Newrev: 62788bfac49bb62b8c70d76a7a2fa77596581164
X-Patchwork-Hint: ignore
Message-Id: <20261030141637.98D719D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] Revert "Config.in,
 Makefile: add BR2_HIDE_SECONDARY_TARGET_OPTIONS"
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5188266946775736413=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5188266946775736413==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/62788bfac49bb62b8c70d76a7a2fa77596581164
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The initial attempt to make secondary configurations to be selected
less frequently by autobuilders is not working as expected. It was
observed that the i686 architecture was selected most of the time,
because it is currently the default choice. We revert this
implementation to propose a new one.

This reverts commit 4642f903cd613bc52f9bb8ea94c4d0ab18464c92.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 07c23d76938c403ce3d1e6b4ca8849c07a3d7712)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 Config.in | 4 ----
 Makefile  | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/Config.in b/Config.in
index 34e9ec6705..208aa476da 100644
--- a/Config.in
+++ b/Config.in
@@ -15,10 +15,6 @@ config BR2_HAVE_DOT_CONFIG
 config BR2_BROKEN
 	bool
 
-config BR2_HIDE_SECONDARY_TARGET_OPTIONS
-	bool
-	option env="BR2_HIDE_SECONDARY_TARGET_OPTIONS"
-
 config BR2_VERSION
 	string
 	option env="BR2_VERSION_FULL"
diff --git a/Makefile b/Makefile
index cba31144aa..54a9edc3d0 100644
--- a/Makefile
+++ b/Makefile
@@ -258,13 +258,6 @@ export LANG = C
 export LC_ALL = C
 endif
 
-# we set a default value here to avoid a Kconfig warning about unset
-# environment varilable. This option is passed as an environment
-# variable to be controlled by autobuilders. The purpose is to test
-# less frequently some uncommon configurations which tend to generate
-# more build failures.
-export BR2_HIDE_SECONDARY_TARGET_OPTIONS ?= n
-
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands
 ifeq ("$(origin V)", "command line")

--===============5188266946775736413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5188266946775736413==--
