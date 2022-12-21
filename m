Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD29C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 19:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B6B540364;
	Wed, 21 Dec 2022 19:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B6B540364
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rf8TKyf2kCF2; Wed, 21 Dec 2022 19:42:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 406DF40223;
	Wed, 21 Dec 2022 19:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 406DF40223
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 40BD01BF8C7
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 19:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 298CF82011
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 19:42:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 298CF82011
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id La7jpN2NDCiG for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 19:42:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37DE58200F
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 19:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37DE58200F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2355F86CB9; Wed, 21 Dec 2022 19:42:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 20:38:36 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3c9959c256273b58c8e13507569f52159211c844
X-Git-Newrev: 17a3f721c321ef5e26e2f7bb5fa8c65de2b97b8a
X-Patchwork-Hint: ignore
Message-Id: <20221221194229.2355F86CB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] utils/scancpan: update
 cpan.org and spdx.org URLs from http to https
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=17a3f721c321ef5e26e2f7bb5fa8c65de2b97b8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 072df09e2f62e6d797df743b0ebf42a6a5910ff9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scancpan | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/utils/scancpan b/utils/scancpan
index 075f193563..168619164f 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -31,7 +31,7 @@ $fatpacked{"MetaCPAN/API/Tiny.pm"} = <<'METACPAN_API_TINY';
           if $params{ua_args} && ref($params{ua_args}) ne 'ARRAY';
 
       my $self = +{
-          base_url => $params{base_url} || 'http://api.metacpan.org/v0',
+          base_url => $params{base_url} || 'https://api.metacpan.org/v0',
           ua => $params{ua} || HTTP::Tiny->new(
               $params{ua_args}
                   ? @{$params{ua_args}}
@@ -525,8 +525,8 @@ my %deps_build;         # name -> list of host dependencies
 my %deps_runtime;       # name -> list of target dependencies
 my %license_files;      # name -> hash of license files
 my %checksum;           # author -> list of checksum
-my $mirror = 'http://cpan.metacpan.org';        # a CPAN mirror
-my $mcpan = MetaCPAN::API::Tiny->new(base_url => 'http://fastapi.metacpan.org/v1');
+my $mirror = 'https://cpan.metacpan.org';        # a CPAN mirror
+my $mcpan = MetaCPAN::API::Tiny->new(base_url => 'https://fastapi.metacpan.org/v1');
 my $ua = HTTP::Tiny->new();
 my $new_pkgs;
 
@@ -698,7 +698,7 @@ sub brname {
     return uc $name;
 }
 
-# Buildroot requires license name as in http://spdx.org/licenses/
+# Buildroot requires license name as in https://spdx.org/licenses/
 sub brlicense {
     my $license = shift;
     $license =~ s|apache_1_1|Apache-1.1|;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
