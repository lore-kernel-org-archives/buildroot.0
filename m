Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECA5C4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 16:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 829B741719;
	Tue, 20 Dec 2022 16:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 829B741719
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jGL0xffqYN2K; Tue, 20 Dec 2022 16:12:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E0F141723;
	Tue, 20 Dec 2022 16:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E0F141723
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0109C1BF378
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 16:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE7E04015E
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 16:12:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE7E04015E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CDypxUYhbIxA for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 16:12:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BC92402CE
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 16:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BC92402CE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECEBD86AD4; Tue, 20 Dec 2022 16:12:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 Dec 2022 17:12:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9abb21ab314cb5d5000334fd9399521104d64043
X-Git-Newrev: 072df09e2f62e6d797df743b0ebf42a6a5910ff9
X-Patchwork-Hint: ignore
Message-Id: <20221220161230.ECEBD86AD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/scancpan: update cpan.org and
 spdx.org URLs from http to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=072df09e2f62e6d797df743b0ebf42a6a5910ff9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
