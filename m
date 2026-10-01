Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB23CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20FA6608B6;
	Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5PWPdrwCc9Zm; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5429860633
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624442;
	b=L5MDvMEjguHbO8czSh5k4VgOTGj+Z87x7/WOSHrL9IKajCRCBzN9HJN1gA/H/Fyyxw4m
	 YMI/B/dh8HvPkDQKrNUbQ20mzdKUBGiNhKLI6MFnMshGigqxdZDDEEU8lV+31VWHblNx+
	 sF909WM3YEAqu2pM+yVfQ7xePTcL8SB1VIQzeyMsz7VQhdDyO2ThQJLbZoPfBIgdAVEmt
	 zp1T6rW3bzBg7z6MWGubL/l5eYYLLCiIx0Uo90SnZJO5qooEZkyZPHZwrwQF53vo/MNJW
	 I3BPuqEjMY/ZmUBViOOMrnixvCvaFZXLFiKbNLHHCVTAy3FcEXKx7CYBFiIdUCAljQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624442;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=rtGNnqvgqX5gFYLU5oZvuGZDGiAHFnh5hYbqhn8jUMI=;
	b=T13aZiQLyNiT09FmWIK5e0zct6NIK2kuM0jzKqpDWYfCVXHyXAbl0Yxo7EeNeWEuGv/1
	 ge/Y/woPxHOLlfF/C+xeymr11i/0PuxMfgHDpOe8BIcSP5IAh4OSF9jQYOgjLn4pGOqLc
	 Bi01DtBJIhB8wbafE3azVUceyL/vyR6hxK20Uddtq4hiIpgiVBwP3/zTRFOuT/L9yqJ1V
	 ySXM72/Cl2NgttK9EeEoDNdKWffQnKoYSNOjJQ4FaGP8uA6eM5naZF7tQt0bVDBIJuTL8
	 uJztgFhNpdmZceVbKIqcseI3flYpLu0K6b/ZRiDE7u6V5dBY8ICuePYT0si+2ktOdUg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624442;
	bh=rtGNnqvgqX5gFYLU5oZvuGZDGiAHFnh5hYbqhn8jUMI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RcNf8E+jECnCoBu1cSJ9sxQXDjFUFSVilU5Pk7R46cdtlOfJ6BUURYQLE7aNMpGE6
	 VqBxy05jxrecylY/WTQDE27Ik9VYkE1F0Tdzfcu5BnecX9Uk45zUGKToB0uXyhqmJW
	 N3AOl/jVuNohCdUuBQw3M6kY8Sqfu+ckHWMMFqm/cKz7Xu6rxoFYuO1g15GV+r0w1/
	 RhLXcjMjDLsez3Wvtg7fkz4kfNuPpQ51PgLgbMCnEfhbdualosHjKg4O0CcE/DNj3m
	 qZrhCVyGshcuzhS1thRfbQ5QgueObY5JG5+iYNM5ZjjnU47cBzNPjONtJWSK+l8QEs
	 WoW0xDgZRYZUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5429860633;
	Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A0A6B9D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9150081172
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vy3pH-YjEL0p for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 00BB68111D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624441;
 b=ZpWYeujmYjWVTk8UTqN3+wB7ReDLUhuBfktloqF6mxTc7glF08/KBvizx4E+L0Lk95ST
 C6KVGnkOD80eiOwVTT7tahbB8Mb2OvqyE9wPjHQB13CvgrM+CbwIMJCFJFMrsx0ogsSpB
 ISV5j8RHrI2sEl9tX2aNy9h6PTGw1mCe2wABBteBFK/wXCep5u7/qDPGcM12xIbonTUae
 7yCty5yLY1CsnXC/+XwsSYdZJI4CkX7ntuUn/G0S9G/CSIDyYQjEZue8gKaLqh9rZxKHm
 BGsfW362BsKCnOIHDr4soyS96ZyZbocMNZrKkCz5G04ODWOe6VUomjKPimnRmx6+AYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624441;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=BWEK7Ji7VRbpFive4ZsVxQ90Pocdl9KogBEWb5yPj0g=;
 b=LpDeowHdS/C8AIf1wXKOP2c4kWF0VoX5xnLvHj5CD5dki265cSt9EIHSlLUojz3YGkXJ
 G3T6j/V5f3Ogd+3oH7h/NJ0TJARmbs+d7lg5s4nbscFq5Mxmxm0Pmfr12YNcPKZRzw+4Y
 HbW8JSsMW1beyhkDKxbzNZlv9G1NmSTZxiNsnVV2LUcu1QGilsVwGqHbBQMb1/SJKT6ho
 niF5Y/fXNhKpvlYgCmL+6XY40mAoebZB3HncVmefqKFFY87GSSfbYK1ccjd/K0QOVjRM7
 BGHn0bCXGDonU9ymagh3ISmoRJtkXM6IQMUl2mLDFn0Z13Z0VIAg4dWE9W2i46PwqyQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00BB68111D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC9738F0B1; Sat, 10 Oct 2026 09:26:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Oct 2026 18:00:49 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 393f0196a3d356dad8e736e7db09cf066fb044e9
X-Git-Newrev: d1362323bdd6bddf871be5f3b7943983127fbd1d
X-Patchwork-Hint: ignore
Message-Id: <20261010092602.CC9738F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] CHANGES: mention the
 wireshark bump for 2025.02.19
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7996840092144889472=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7996840092144889472==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d1362323bdd6bddf871be5f3b7943983127fbd1d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 CHANGES | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/CHANGES b/CHANGES
index 3fa203de0e..71b96f6377 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,9 @@
+2025.02.19, unreleased
+
+	Changes with potentially large impact:
+
+	- Wireshark was bumped from 4.2 to 4.4.
+
 2025.02.18, released September 10, 2026
 
 	Important / security related fixes:

--===============7996840092144889472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7996840092144889472==--
