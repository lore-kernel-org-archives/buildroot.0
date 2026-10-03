Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8373CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD8A080F5D;
	Sat,  3 Oct 2026 15:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0W3C9-jzSS9; Sat,  3 Oct 2026 15:57:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E61A481372
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043037;
	b=ZNI3Y+goRFGIGKEjQ/0elJys6639neU8+grF4Gf7vvTtwZJcUefro/ZjsHd2NNzmDrf9
	 8PoNG4tXkeA46LCO0c385aReJhDCGx8sIAhKAd/yh9855NpB5T3GVs9REiT0Baa3zsQIk
	 1J+O3lT6wmDVRPmeJTdkZLdkweBtq9e1G4L6evIO2ERt426cYPxQQ6siLGlzCsdZ7Me2h
	 eHbcyFtoOy3JRiwVeOahViIjUJkq2aJeTQjflUtMZmVXToL1gLCoE+/cD00jhIY+rmcG3
	 idREcIRiXUWTI0ob7IbTTuPn7GU3wY5uuXqNNsktsIl7v/eJwoww83rrjL1LoCmMkhw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043037;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NjTH+sLvErpp2jX4o9Q4B/6p+5/rj2zBA3xFDlt3MIw=;
	b=sMRCLqndZzYEpbVYJfLbgMAWDEvpLMSzQKy8iCkwqmn5LVsTJQJiXqHhwmxTGaxk4F39
	 nFlsh9603+ThdbfbHNXVUbrvE4nBoOxQIBri/biKnZiBM/ikCwPLc4iRFYiAxH/EhjLDx
	 jnYlZf/DHg22s/8ZcTNIHKEqU0z2sDP57ZhcsTEgwScy28VShKxsgnrwaaearNTEYTld8
	 UXxYlAUvj1EtgAqVFyWLaTt3a9pF5eggq3FtxhDddXkhA9s/wQ/1MZxmtxO8wReegy5e7
	 zqEyI5Mg/qf/l3RjorXIiKFs+cQ0I0cRuPbXHWWXgtaEzMV+30d5LgZw1dGl+aPYsBg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043037;
	bh=NjTH+sLvErpp2jX4o9Q4B/6p+5/rj2zBA3xFDlt3MIw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XIB0FEAFt3cGB6UvB7SgovG8Ypl3M2GqPTFxaBv3qCnva0iefCxPyXBBKX7baBDT+
	 4W3eUtLrD/UwX1F0WksWB3UuONhvlJX9KxxDJwbNq1i8HlW820ztOxShyCn1zmirLk
	 KENrV6TZ0dF3zka2apNVMcHc51Iky3NQ07+NlbMKtljOM+bRLank6E3N+VEVdlbozl
	 tL9DJEXS7mCu3FPaEYk605N0h1z6XghgX1EyLL+tBsvFWFy+NN58OS7Eqqt+yopc5W
	 fbG+tG51hDcwtXo5U1uGhvIIOXTneZb0FgRzlFjQz2azsK2h1C5t3ilcgHDRYLV+sM
	 86CK8gfUe2ARw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E61A481372;
	Sat,  3 Oct 2026 15:57:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C2FB3335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A73D76067E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xHBgohL1ayhp for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DEE8160628
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042848;
 b=OWxw2qiPDr6Hu94yG5uIbW5cini2zY2GwPzi7PHdCssK3jxQ5nLvSGyQTrKO2dhUT5c5
 zfuYeO9SIeLfg2llUW1nBg1OIpPXdG5sLDVSq8dx6md/5HhLHvo99wycqhiVT/iSyJgoB
 Zm3FJFCcB1rIk9W9exc7Yh9TYTbg6Rp095clH8qlO5SFHfd148UHgptYZLZ9PqCx/6ZaP
 H0nDCLzxYyysARwSajtnHD+pbnzREDKawkmjj8eHdbEDNEg07nr5IUjXO2rbokWSIUBxh
 u/aChCWcg5D6ido4fZqiFx0VQZ/hRlsqMaE10LzFQbGBfP6L1cWQ+JTG8OW5eixy4UA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042848;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=92+pBMklCw3G8Mg1B3bZW7kL3zg/6xHDIcwIveqNt3g=;
 b=pd/E3V+yIOYiyWlxq4cSrapO8QwV1mLg3YI3j3wPaOLfp/tcvrdR3HElDyXUoNKjFeuk
 G2swNC5Ds3bqbAho3cdR/c/4cnh8Kql/vm6Ym9zjyIpcjTearbJLaZ5ox3jy6d+x9QDXN
 OmHCze2MIAWogIRQU5SzYHxS7wiabBXe7yUPjcvfhRMs0Sy1YsnlY7RMrYu9RIlPHS+YS
 wdpCjtHgM35SkhPGLBxfx1N/R0mJ3yt6pg0cnfELNI9ln6IjKAFmeojCoE+V2ct1P/MdI
 9siVizHFhuE9UOr7xtF9h7yrjbIl+/x53k6ReZUdPCvTetCY/zUrjLZX6Dg++KGc1tQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEE8160628
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C50D8908D; Sat,  3 Oct 2026 15:52:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac14a83e91bf00034d83933766e4611e8c419f06
X-Git-Newrev: df9f3836d8908dc09be7572ce8e30043848bafac
X-Patchwork-Hint: ignore
Message-Id: <20261003155254.2C50D8908D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-prompt-toolkit: bump
 version to 3.0.53
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/df9f3836d8908dc09be7572ce8e30043848bafac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-prompt-toolkit/python-prompt-toolkit.hash | 4 ++--
 package/python-prompt-toolkit/python-prompt-toolkit.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.hash b/package/python-prompt-toolkit/python-prompt-toolkit.hash
index a9fa1ffe3e..4fdf564b46 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.hash
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/prompt-toolkit/json
-md5  8d75b89a1478259c17130d4fab6de475  prompt_toolkit-3.0.52.tar.gz
-sha256  28cde192929c8e7321de85de1ddbe736f1375148b02f2e17edd840042b1be855  prompt_toolkit-3.0.52.tar.gz
+md5  9f85b26fbf7285d3cabe6488d1b939e4  prompt_toolkit-3.0.53.tar.gz
+sha256  9ec8a0ad96d5c56148b3f914aa79c1564c3fde5d2e6b876e7bc327e353cf8fa6  prompt_toolkit-3.0.53.tar.gz
 # Locally computed sha256 checksums
 sha256  303574d9bdd85c757d6025017942bf17baeedf2778f62bd7f425d07d880f4c4a  LICENSE
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.mk b/package/python-prompt-toolkit/python-prompt-toolkit.mk
index 280a6561e2..c56b2fd2f0 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.mk
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.52
+PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.53
 PYTHON_PROMPT_TOOLKIT_SOURCE = prompt_toolkit-$(PYTHON_PROMPT_TOOLKIT_VERSION).tar.gz
-PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/a1/96/06e01a7b38dce6fe1db213e061a4602dd6032a8a97ef6c1a862537732421
+PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/7d/ea/39b988c938f75cb75d7045b5c69f8bfed47ee2152c8837fb403de29d6fb8
 PYTHON_PROMPT_TOOLKIT_SETUP_TYPE = setuptools
 PYTHON_PROMPT_TOOLKIT_LICENSE = BSD-3-Clause
 PYTHON_PROMPT_TOOLKIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
