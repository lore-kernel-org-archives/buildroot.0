Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00535CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 10:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC03D80EDF;
	Sun, 11 Oct 2026 10:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDx9Dsyn72v3; Sun, 11 Oct 2026 10:18:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4A4E980DC2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791713914;
	b=I9JZIu9zoZivMhRH7LxCzNNAfK35FpbK/jF/NG+gwsqgzSFNHtROIec+9spEDG3bIDGx
	 uzUTLwX8rdNg48gHcKg8rfb+/C0I94NVj6WRQgWmuINFRDGbehlKoRlApdvM9En8eCm/p
	 2YGBc3dDAxPYkIsf37++2+OAnW/rlFuedjCTkSQPDAg72j5qltKEiq4+J/7vrnmWj1UUr
	 hGbV7pH/hjN/Uo0Ij7fDHC0XjzEIHgsZds1f3DGUKwUiPi1ga9NLJcvyG/NVn2iPaQ7Nd
	 dVcfUmIBK3lRaW3nrAVo7PhRwKRT2dwXTs4nq5x7ghPfO1JGzhhlzCy3l9sZ4i319/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791713914;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MryZq49PmmQCEPXERhbOcX4mSrMm6U2wcP9BQgF6Af8=;
	b=XEgsoWMekm9EMDOQfe5m54r+jTiii+9sgp/ozS2tUMc758c2TE3qjJmb3N9RJN/PUtyc
	 50tIoyGviKDliFdUUTNf6cynKv9EeJ6SiCcKrWXyOQFPiSWe45TuWO2NBYMXQMriAKt++
	 gE5c8gQwH4pCVCqSP22nPxtx6Yh+H1IozLL6UktelpvT1KPFoeqH0ECmxnjoezG8Km0dy
	 mTsJuLZnE0Mwc5y0uRa6TPY1B5twQK8qbJq+0/dNYnjh2/niiYgMvPpAKB1/031UwRDUN
	 fwFNkXi+crVN7mEZnWJzh+SOGYVdvnQ6U0zOucW/0By3NTitlYrAY5emYNs81n79VLQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791713914;
	bh=MryZq49PmmQCEPXERhbOcX4mSrMm6U2wcP9BQgF6Af8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NdR1VzNaPjdla5gcljOoKeCJJltnNBlv9h2AxXPMhjwLEYG5Eu6K5M74kGFQr/Phw
	 QneUdJjNO2hsG7CAnj3Mq8j6+xSxMkR6XMENXwm+7jP1Dq1SEorClANlZQhGkShZ54
	 Nr4B7my8Y2kcUyLPQAVGRSabnTWZ5SuCxOxUhKxXon178WSjpVirO9DuB8fl3VjRo8
	 PH4/S3AngmTAT8HIvzTZFPPKBsTLY3J5q/83wWnqesmbSOkuvGuELW67GkCvVi33pV
	 pcnaQ1sz/cRyYjaDydpY9GQqE0b+qDwkkZC7Vr+c+0G/30YLhRlam6UVbZvrn1kgJk
	 XOXp+uJWzmhIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A4E980DC2;
	Sun, 11 Oct 2026 10:18:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CEE71317
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B527D60611
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:18:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJyBa0LlbM8V for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 10:18:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0AE6B605FD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791713912;
 b=GpLAk2Eky89HBHOdX5OSuyxa+sQlRzrWClFQyFLZxxKAgZerntHz9R4UaLwqmbr+ue0g
 CnDr+7hRplV0JhdnCZ04xoI/BzvJKQ5ETAezyaCUi5Q+II78d7+UFn/jJqZyk4yo6Eoa6
 /cMYC3oTvoiETd3J4+KjHCQffVAe7SEv0sSBpp4Yr0EMs7loTBAmphWGK/EaXSnKpymUe
 0L4+VD7yFKe0FrThNhxR4pI2n/6mRsQbs+ur57Ic65KpJmdrATwMZ0k0sxEfXciFSWY5H
 GaKKNDU2WdM3XPSdarDamYgx29mNaip3Dj7HjqfdaYYnvnyxsdHb///b3taRIuio1/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791713912;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LXXiS3RnKzQoqKvgpAHCKGsQDasEe8EIv4XWroGxa5I=;
 b=CLZDv0Y0mLPGPu5CfH2N9a9wO0T7k1UruSiYUMgdbwN9pDsN3jDbQmoOaWDkkz5bNtsU
 RNGG7s7Gt3pX9t+3S41Ile9AYrHPlbfoMd/iWJujvw54a7zAfh4hjvXAqgH8c4X+Z6Qq2
 l/PftBpqKgqeWhYZpsly+3E3FlwaUfn4B5LjwWmrsyoX4L6sAVGecHckOGhOUTSj1uJXn
 ltOJ2zWAx3zW8LZ2PQi/GYOw1O0Xd/tEYXl09ke6Xj4HTuCKGyfIV3w7tJzAt52HRNgBi
 HNkPlfkeewgGxVnkx8ZbRyZPQVHR5JZlNT35Bu0zxUl4nJtMVF571HN4N8B6NeR6Pqw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AE6B605FD
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:18:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FF1A93996; Sun, 11 Oct 2026 10:17:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 12:18:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 358f22680949692a4fe503e57802f3043f8a3169
X-Git-Newrev: c13eabf18f6541bb264aa1b041ee56206c95c810
X-Patchwork-Hint: ignore
Message-Id: <20261011101713.5FF1A93996@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/generate-cyclonedx: improve help text
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c13eabf18f6541bb264aa1b041ee56206c95c810
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The argparse has a set of arguments you can pass to the ArgumentParser
object to improve the looks of the help message.

The example usage used to be defined in the "description" but a "usage"
field exists [1].

Also link to the documentation in the epilog [2].

[1] https://docs.python.org/3/library/argparse.html#usage
[2] https://docs.python.org/3/library/argparse.html#epilog

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 utils/generate-cyclonedx | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index c292ef7840..9d3baa23f1 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -529,9 +529,9 @@ def br2_root_deps(show_info_dict, virtual=False) -> list:
 
 def main():
     parser = argparse.ArgumentParser(
-        description='''Create a CycloneDX SBoM for the Buildroot configuration.
-            Example usage: make show-info | utils/generate-cyclonedx > sbom.json
-        ''',
+        description="Create a CycloneDX SBoM for the Buildroot configuration.",
+        usage="make show-info | utils/%(prog)s > sbom.json",
+        epilog="For more information see https://buildroot.org/downloads/manual/manual.html#_generating_cyclonedx_sbom",
         formatter_class=argparse.ArgumentDefaultsHelpFormatter
     )
     parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"),
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
