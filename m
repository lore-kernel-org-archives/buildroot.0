Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2916AC4332F
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 21:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A40E660BDC;
	Mon, 19 Dec 2022 21:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A40E660BDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 79BA5To7vqJN; Mon, 19 Dec 2022 21:46:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D805460E7B;
	Mon, 19 Dec 2022 21:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D805460E7B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DA9D1BF368
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 21:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 058DA8133C
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 21:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 058DA8133C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dcFM7d_G97xm for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 21:46:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F106281335
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F106281335
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 21:46:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.168]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M4b1y-1p92OB1yTO-001eJt; Mon, 19 Dec 2022 22:46:21 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 19 Dec 2022 22:46:20 +0100
Message-Id: <20221219214620.28780-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:jIkAAp04viEtOfF9jBwptYKBsZ8hkZZkp38plJ8ZTZdvVJtKAT4
 sklyViOErgAMWdcZRQmZEe2m40Not3LFfjFjCFh+N3XBQ3dfBMO+fPnBez7bI1YLekz+zH+
 xxjfh2DBbkEXY66JJAY1TbbFqSWnrCV1IS3Rr3FaYAePq1Vr6cTD1PoYh7GpItKJ7VWo6ok
 REYz2wQAuyoCNfLhg6hPg==
UI-OutboundReport: notjunk:1;M01:P0:uKbDxjCE0fs=;/o5iQ6cN46GwAhWS8VvjiDjCHTK
 EPx0ZvIZknHHngBSGMZmVd/oGMKqSHAbEv/Vd341UZXh38qCGkmm38ugLmx7nhe0owz4Pcdiq
 wVt3cRgD4WIofhHPHp8IJ7KDgCQA0p92iVASP9OLdYn5uDibFvJmpLxFdexsL4REFrH643Nck
 Vsc5LXkcNbayxmMp1aZGqV+1jU26I0Avq7j/euQjG8Qk4M9NP+j+q7aPKiEAiKTt9FoSsgLUl
 k2PnVFZRg1/AC237yZjm+6yPDUTuNQmePLS0+QHW4ZpaGqSxmdv7AOI6vUZ1ZN3BMKBlwnEaK
 SOXC452Awgkbok9Y4XPa9L769INUGWVcD+zexxFMerz7u5UId/B9zoFTJRxLcKVsBl0+hcgtH
 NmZ0+5aO44S/xxZi+UnjYO/JGs5O+rHxc+2nCgpCTs9qbcXvMzv05VNBYoW04NHntT4XpGjaX
 PRTeDHuFmIkr7S4jjsdBHyV/DkldhoMR1fIzfbXfiPvcPTBOnls+7gz6K9vP53/vnqDMgxysC
 MSdwxpQti4qWQPh6JDnGsu2qTuhCnORJcVjBMhv51kgjAT16IeAjQJYZAnAsqeFdBbyxQZzj1
 yaoto6vQ5P4ATbRtwmdXMsMqRtyt6BDizKgQQf6DvShE6oUdIw9234/GIld7UfOf+WzvFjW/i
 ZPn4aCL3UV5CGcISJQjWy4QVxLDshvDn1r+EwymkxwcP89uv9HiErzoZa+XXoDPubRMo/JEBq
 qw3JuKKtARnLE4cQt9AR+SZPVxVJdZxUYiTcIzcsZlQNDcmTcL9k+ZjjkZ8fukautNBACOKLE
 WBd0mUkgbJ2vgfelco1a38zhWusYjbAfNlB6VQxheAFPxwj4gR7tiQyoa2VdjTrKq63p1Q/OC
 k6k63I/hHRAkmKQ4DRM1smMrhWXTS1Epwy2f4nVxC9kzKHVuJuguIu3IBRoIEXbE4ep4n1TgZ
 Nf7+SkqCt0+X2UFi/XaxeVd2kCI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1671486381; bh=PUIytrTLdk7veYzYD5CQMrEzidbzyNU5oQI3txr9y2k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=rjiG4g+ySRmey1TQrehco9yfAqFGZZ9qqqTbmalSDS2+UIl858S+AdhwavM882Bmw
 Uqx7hbKUbMltUq50hJN79s+MD4J4cWWCINRtVgeQ9p9g+rzfPr4rJ0XXaoiI99iCJi
 oGLfr58P4cLhlinKsOcD+QSh5dwx2m6lPWvgATrzSozH6FthUVaPMx1qc7ZGTONuE7
 EQelwUJK9uE3b5upr4dGMWA715Zxo+ccZ/fBTrh2U3AyfTUrjKjh4cJZ0XlRMRRy5n
 liU9zGkcJ/oxDyI9h54n2Hr7GK91i4c4fc16dLdfEvoQw30fQezXqYaeykvDd4Q9E3
 gCZTdXdPUIHdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=rjiG4g+y
Subject: [Buildroot] [PATCH v1] utils/scancpan: update cpan.org and spdx.org
 URLs from http to https
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
