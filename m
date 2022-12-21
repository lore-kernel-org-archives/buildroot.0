Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE15C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 19:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D49CB8201C;
	Wed, 21 Dec 2022 19:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D49CB8201C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H0Q_q_mLZJjE; Wed, 21 Dec 2022 19:43:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AFDC82016;
	Wed, 21 Dec 2022 19:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AFDC82016
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F8E41BF8C7
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 19:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B84961086
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 19:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B84961086
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5xivjapoJOXq for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 19:43:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4322B60FE0
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 19:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4322B60FE0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32F9786CCE; Wed, 21 Dec 2022 19:43:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 20:36:39 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: d878588b532014da392c19030dd03cb804ce8739
X-Git-Newrev: 944394a849237f1d63c7731e3c4d9fe065a52682
X-Patchwork-Hint: ignore
Message-Id: <20221221194338.32F9786CCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] utils/scancpan: update
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

commit: https://git.buildroot.net/buildroot/commit/?id=944394a849237f1d63c7731e3c4d9fe065a52682
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
