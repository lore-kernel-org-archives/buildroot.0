Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3293C88E40
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 10:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B9D880DF0;
	Sun, 13 Sep 2026 10:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QpJHEBnox7U; Sun, 13 Sep 2026 10:26:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A55AE80E26
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789295201;
	b=ea/zkY0SDwMzkbIrNlNAUot0wkXZdjbO1EVemHJ1cjlU4hh4X70dL+vhsVRKICT7j6cI
	 /fRmbGxx46Sz3zhbS7GkRrPJDD8nxElk4Rmp8GGHsyhbrYgtEOVgCN5syjyEuvHsu2ykT
	 6EoeGvFC68JbauiinA+Skk2uFi2fG91m1TrjfM6jRH+4WxLWwZLKL8oaQGKjVigEYmcE7
	 QA5uFYRtL172qGydYNG95TF/Vy/LXyCABNZaoMiQ50n+sOW2Fa6lycVz94PJyjfsgvfFj
	 j4VFsjO14RnR3RPTbVHItNCUbzElbVqrkbcGZtWIGNlhjuJh7dWtoDDMrPI7ahINbHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789295201;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IOoNZTiwtl0eASpB5ktOiWfiE+LZgRPfSU+icRgrwYU=;
	b=k9/MYJoa1Gz3idamB24J+/d4ACL9CRD7FiH6DOj240NQIcqIoIrvfyUyQXcHkVsUbBcE
	 /TwTIwnyB+Kc2+kt0J04o6QwMw4NIO+xChveduipp2LS93F6Wchvn5tU7JwgrbQENr1r4
	 QHF2s0NG425E1mSf4BWxtbzMulM7/DnTXhB271gXSwtCHzZiiQ6Vk3F047IqxHcHMQziM
	 rTJMPSPfjrQM/8nq2XNSxmemWV2NlAze9DhKIyj68rrO9wfKgsVKtTi3lDMtFf2R7x/pE
	 Qbacm4z6ryACvDVx3NexYDJXJcWVx8QpGY1H5puukmbAsYkQ9TCsAUso85HaffwZ3Vw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789295201;
	bh=IOoNZTiwtl0eASpB5ktOiWfiE+LZgRPfSU+icRgrwYU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S4djAq2TxLjKZ6AXecVfocjlrOPdszKRpHK2EUPa/ZRfVr9WU3XZSVX/5UYUARJeU
	 NJ7GssLOsEvRAqCycrTX0ptp+oXIdE1mf5InJYRnyqqFuJBOWKPZmyd/CQ9yQdC1f/
	 ULg7QA8siK6oy+WjsC1+LdYuyILrDNZ6/1n3Nd3+nxlLASFHLmvuXTJLHPp6UL7r6E
	 3LMokw6Nw7ELDGkKer49KyrfW6fkaBICtAhDweeNCA6wTLRn0Cj85QNpM9I0RbeWjW
	 7PlakQe8JKKr3JkxQGJJV/vZSixlFJJmRkocHHG1wBwDc/woLlvTuTaBvHe8lqgCmh
	 GjJ8ypkWFUTvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A55AE80E26;
	Sun, 13 Sep 2026 10:26:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA64032F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0E95400CD
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n3ENjxEV2e0L for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 10:26:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org ACADD40022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789295198;
 b=qY2UzP7ZCnXGFW8BLE//HWwKwxDZml6fkPuK18j9UnBYh5rBNN77fYSi9jKyXdhPGqIN
 1MXcVhjWzkqwxFeyvYrCSTdh17zctdUvvMptnoT3peMGgKqgPRNRjfpHGX2DZB+cEorDb
 ye6V6iXhcX99ktobQpBme8IpGWfvuNARDRA1AyGbgGJuNsrIyh98z6l/P5JF025DpSL6W
 rFrx7FhxipvdWyyRHTiZlJJXXOy4yHIkQyJlWE5gr534qiuP2kdFOFVMYEGcFYUiVKWPR
 guVLKkO57UA5VLtod8YGyHcCZ1lW7zETshCE6jyPNbFhXZ7rzpFUibZg/s0YBTR0vDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789295198;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yDJa1me9nGkD2FqGVpub2J0OmnvcTHnsyV8dypmEJyQ=;
 b=kCN7yLCwZEdeL3DqItJKd9fxsIt8wG2d+xx+JiXJn4I2uR5W94oPRNNJEg7c96+KH64q
 J4fo82Avh8BwuhDjFJ1bZQMCC6MVdBNaycz4i9icNaUAbD4o9Jf22sd5Phijdk0AQDDy3
 0xASINKrG4OH6svZLb/4j1NCy02tNeiGq8H5GyMqI/NHieuQGavbmpte4J1nGEJEz9sH6
 sYaT8uxqAqlDdxf4pA2hrUhdSIrs13nQWaFv2RdefsEZMTkVJ+MHvnScAMyDvM8TS9tps
 V0LCP/9tT+aoFf42NaQkHEMjT+ML75YMBDv3BHrOKKw+hhIMaRVRujHN3Ok7iG2Cq+w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACADD40022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:26:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D754895B9E; Sun, 13 Sep 2026 10:25:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 12:26:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60084ced054b6347cd7b0e500aca2cc89b606682
X-Git-Newrev: be60575e606cbadfcca99e819141d1ea8c501a17
X-Patchwork-Hint: ignore
Message-Id: <20260913102533.D754895B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skopeo: bump version to 1.24.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/be60575e606cbadfcca99e819141d1ea8c501a17
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/podman-container-tools/skopeo/releases/tag/v1.24.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/skopeo/skopeo.hash | 2 +-
 package/skopeo/skopeo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
index abd68d13f7..8a9fb22133 100644
--- a/package/skopeo/skopeo.hash
+++ b/package/skopeo/skopeo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  de96bfc2bb523c852af675ffdadd934484812ce190aa8620e1d5fd6c51442e25  skopeo-1.23.0-go2.tar.gz
+sha256  1eea9364e344c4d6cb398fac53bc387663d19690552003b43c75819e8bb55527  skopeo-1.24.0-go2.tar.gz
 sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index c2fe201c7c..354998b175 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKOPEO_VERSION = 1.23.0
+SKOPEO_VERSION = 1.24.0
 SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
