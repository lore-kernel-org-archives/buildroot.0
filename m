Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58516606E800
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AVMLpi6P
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1484408AB;
	Wed,  4 Nov 2026 21:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jml-EIj8Rwj; Wed,  4 Nov 2026 21:06:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 98220408B4
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826398;
	b=crsPdizQ955fLaRFEg9Nrf3/rYhSPjdWesBcr3Si250mzaKprVR2K+j4Ypw/ghRdEGNM
	 hJjnMP+kYzYzynojOm0kvecBM5qwIGek2A+jFhG5GLJ8iyWy/xe9tKFO57Z8FRsiOSvkn
	 n76Yhr6Us/xt+lIrb/41CMmX37Kmk+yeeLtWuZwfFFQpDyzSQy5KiO2eUPPDRCRgYppxQ
	 Av/NtGPbIVLhrTV5fPZ1Fg3TPVALrkzotaaeh7qktjKGJz4z7pM2PhYOLZSjEQ8DOmdt7
	 BVpqJsruf5GnR5JXVFqK4rI/mIlGsYnqcqz0YzckFO5BqcuOC1NUpKHUa2Doi4ItSdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826398;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=onLAgRV1P3lJeRZhDN3aYdWCgVEG8y5+nAUpFSwIctc=;
	b=ctViJUgx5OI5WptVTR4Ltic3PasEmcSeXdiq7ARh5SmFhTY/mqr9w4BJ+hyVifSQNIns
	 ZI1QBr/2y15+D2gBvrgaYJFCOFloiY246Qj9zJt5zv/RsNuu+RY6ahPafZgl3KrvjCZVT
	 hs6FJirq/580DSnzQz6leV3gwauTJbCb6gll77nNspScy1UY1GgcmxUPoWvE0jAmeVkP8
	 MZ+Og5s3kRFtI9lA3h4tPMljKEuDXvUe0B+K4MpsJqu6WGTQyhGoKSd7ip7XnR3eoKrCb
	 G+ZYFRKoMy9id2Flt3Ya3XUvSsbWIgZ6MjlObSFub/H58kTKqKJBy6I276GW09uTLbQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826398;
	bh=onLAgRV1P3lJeRZhDN3aYdWCgVEG8y5+nAUpFSwIctc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AVMLpi6P0sN4CuQdVUUgIhMrpV7pb+Yx+YjKv0yOaL1iQKmpFCdaBvKIyEZ2o3UmY
	 lOM102TsAtFBolxTiFor9UUTHkOr+f9BZzCDeyESCtteo/rNgZZUbDn+fgFUhgDFZU
	 JVAUduxM2KDyXYdgCghgh6nHK+og6ouSTF3rYk0owGFkmVH5Rme5Fw9STG57MIRpSt
	 R18yYExQj4GBsTg4n5O4+o+0yju27hvq7kWObFNzXvGXoKzejuHHsedsebl4QhnekE
	 4jAdE+Zdqvy+dOFblCTZ489lbkCnUI2f+UBPl7OkVuxn2rhlY0r91aTgLZXqMXbnG4
	 IQ21qeYBX5pGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98220408B4;
	Wed,  4 Nov 2026 21:06:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DBFE31F
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FDF16080B
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IgDA-upg1Otg for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:06:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 847B66078E
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 847B66078E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:06:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7AE19DE69; Wed,  4 Nov 2026 21:05:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 22:04:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84bfd2ff64f90f7c4f993d017257f1a748792a46
X-Git-Newrev: 3dfbe4f682e6088d21bd23ae2f5ee74db09bef3a
X-Patchwork-Hint: ignore
Message-Id: <20261104210503.A7AE19DE69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] website/download: make the table responsive
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3dfbe4f682e6088d21bd23ae2f5ee74db09bef3a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The releases table has the same width on every screen: on phones, the
release dates and the download links are cut off on the right.

Wrap the table in a .table-responsive container, so that it scrolls
horizontally inside its card when it doesn't fit, and hide the "End of
Life" and "Latest release date" columns below the md breakpoint, so
that it fits on most phones without scrolling.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/download.html | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index 6bbb7c8a1d..0a47106921 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -7,27 +7,28 @@
   <div class="card mb-4">
     <div class="card-header text-bg-primary rounded-top">Download</div>
     <div class="card-body">
+      <div class="table-responsive">
       <table class="table">
         <tr>
           <td></td>
           <th>Series</th>
-          <th>End of Life</th>
+          <th class="d-none d-md-table-cell">End of Life</th>
           <th>Latest release</th>
-          <th>Latest release date</th>
+          <th class="d-none d-md-table-cell">Latest release date</th>
           <th colspan="2">Downloads</th>
         </tr>
 <!--
         <tr>
           <th>Candidate</th>
           <th>2026.08.x</th>
-          <td>December 2026</td>
+          <td class="d-none d-md-table-cell">December 2026</td>
           <td>
             2026.08.1<br/>
             <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08.1/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-10-22</td>
+          <td class="d-none d-md-table-cell">2026-10-22</td>
           <td>
             <a href="/downloads/buildroot-2026.08.1.tar.gz">
               <img src="images/zip.png" width="24" alt="">
@@ -47,14 +48,14 @@
         <tr>
           <th>Stable</th>
           <th>2026.08.1.x</th>
-          <td>December 2026</td>
+          <td class="d-none d-md-table-cell">December 2026</td>
           <td>
             2026.08.1<br/>
             <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.08.1/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-10-22</td>
+          <td class="d-none d-md-table-cell">2026-10-22</td>
           <td>
             <a href="/downloads/buildroot-2026.08.1.tar.gz">
               <img src="images/zip.png" width="24" alt="">
@@ -73,14 +74,14 @@
         <tr>
           <th>Old stable</th>
           <th>2026.05.x</th>
-          <td>September 2026</td>
+          <td class="d-none d-md-table-cell">September 2026</td>
           <td>
             2026.05.3<br/>
             <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05.3/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-09-10</td>
+          <td class="d-none d-md-table-cell">2026-09-10</td>
           <td>
             <a href="/downloads/buildroot-2026.05.3.tar.gz">
               <img src="images/zip.png" width="24" alt="">
@@ -99,14 +100,14 @@
         <tr>
           <th>Long-term support</th>
           <th>2025.02.x</th>
-          <td>March 2028</td>
+          <td class="d-none d-md-table-cell">March 2028</td>
           <td>
             2025.02.19<br/>
             <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.19/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-10-22</td>
+          <td class="d-none d-md-table-cell">2026-10-22</td>
           <td>
             <a href="/downloads/buildroot-2025.02.19.tar.gz">
               <img src="images/zip.png" width="24" alt="">
@@ -123,6 +124,7 @@
           </td>
         </tr>
       </table>
+      </div>
 
       This and earlier releases (and their PGP signatures) can always be downloaded from
       <a href="/downloads/">https://buildroot.org/downloads/</a>.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
