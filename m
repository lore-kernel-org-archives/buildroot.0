Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B64606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SDcChpMs
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B9B940597;
	Thu, 22 Oct 2026 15:42:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kCoOIV2kCfXg; Thu, 22 Oct 2026 15:42:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8191140877
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792683733;
	b=iQnijnOh6FdOoY+BjupZAd30U5ccxflYOZyIrhS482+h/YJJ0Uqw3cSJWrSEZKfz/HOd
	 IiiJDP8/vp4e9VH8TunIrt8biX+e8a0zH3a96liwJWP2uhnEaJh8IIxNwlfTvTlLIlVXO
	 +DiuabbnD4o32vQUunXgv7NTbHMO4kewGuCuYYBEoCvT2mUoddyLiej8HrSan0JIyuKN0
	 qud8KAVlnV77K+n3XvH0XZ3jjLf7pGCeU/ppt8SWBedXVzuWK9s25ZWt530/XAzkJjQni
	 RYHTPA14Wss/5IyEb5dhRXdZ1i5swwTVdfJUOmY3GGcHGiVN8YWdnxfrzsp1V2tf9jA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792683733;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=G+DUbx40Bhmw/1lBteMgtHdCfdi7GDRxa8PzHeqM1ko=;
	b=B4LU5HnepJSUzEl2DvjJ2FDdw/LuLID+r6cknv4IFjveL4sxyE7kIShJBhdC5RuB2uwH
	 kLPa/ROoI6VIz0SCvLx3PXl9qxt2vv9BRDQj9TJ6ley9PdjBcU4CpFPnNBNK0eE4uU89J
	 qHnefxBr8pIo2Y6oxTVYKtsr+B76KAr2zXeZvXaa4mdsMOkdoIN+RyW3KWWvXBgk9d2RH
	 J1yr1ugQEcPLGGJ22JViqk7l4/jZ2y7sQ54JusFZGiN9X8QTFkGAL1KSZg0QGSAgoe8QD
	 d7tpudYTjH64CKKCiaCcSI+thdKOBFGYZw9DcU6P1j0wbqnfk9+rU3LFmbymRSM54rQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792683733;
	bh=G+DUbx40Bhmw/1lBteMgtHdCfdi7GDRxa8PzHeqM1ko=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SDcChpMsz2y1u7owNAxQpsdk52myGLkksA+L8a5oyyai3mhHX+MwnJCm3oOzHtqol
	 q3mr9ynmCjORerCZXYEAQk7meH31hzM3f1jbRphJi3Q6Zt+kkTmKbMZTp2idQx67NU
	 V+o/iPnUYS1c69BrAEJMvD6nOmL2WK760rfz9UoWIKdHlm/9U0wvoaBbOlZzFq+Oub
	 cl7fSG+vkH4Ry09QOyulpuwkDbNdX0ob9jpYntPujn5SAn2kh3yIlWgpL7SoPo8/U6
	 I4hZA4NXMatHSUcNSj91aTpIInAt8cZaXcqWW7bjRvfs8E24Xqd+9/r4NEI1wOIsGH
	 dUq9Qop5EvUug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8191140877;
	Thu, 22 Oct 2026 15:42:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DBEC3A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AB3560677
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bBrMTDlO6Vev for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:42:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4CACE6063A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792683730;
 b=paWeECZSya6Y8BB5jkXvm2+K/sJUwrsK0iCN8WxCP/7fbDqAqWL0Gy9HS5VpKDPO1DdK
 EGOMXSCwO1i9kS+l/LUlD9PF8FA51PRKwr/rpHJIG+ZFUEfhHQpKyQNiCcFzTpvVDrE/b
 fNZMVupCW0NDfhTNrk/ctNR2805eAKEG7QUgXIf/PoU6qWqw9+hhsACrvoWVvuQGg9og8
 QWNkIEdmAAGg8+Viy2po/cxSv8bOGrwxr/s0hgRN6Ve3p80QSkrbrm0XyNRs1xCWF7n6P
 eDhoJl09AYqSJC8TyPInJynTHHmPMycv3kBnejlYYXOd4Pmfq1fC16Js0tmdgxEvkDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792683730;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=SdXuvPQR2dnSIDXsOuhtIJueUA2RoQ6j/Pv5O2WdLqU=;
 b=j7CLWMtp8VJZTDOHP+Tk1Zj4Dmm97Mun/Riu7EzkH2F49egtzURm+MU0opGqyFeoncNI
 +zQ4tXpG+pCXra++Hl5vUvHnIEqLW9pPSd0OjCk5lZpWS5+YDQhBD7NLuYbeo6SVfgbyk
 aqs3+nS7pgRIGgX0UUtVCEQ7zmPnp1PipbWHNK+thUU4+36q+EAVcuaMzRBApNJ0u6H0W
 t9tRwsgHdat3X8hls5PsNmaG5vVVyDmT3hZwzvai0dS2hR/FK/WoOVzxorb8oz8bFvw7l
 V1L4V3cv/OO8bGAPpH9KdkDT40FO7IYj28ncQ6d4f6l/6MV2bC1Nb2FoJDBIGG76yjg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CACE6063A
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:42:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39E109B9FF; Thu, 22 Oct 2026 15:40:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 17:41:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 333517125c1ae1798a39415292f1d242bf3f598c
X-Git-Newrev: 0cdd17f381350857038d9953f854aa4f317210de
X-Patchwork-Hint: ignore
Message-Id: <20261022154046.39E109B9FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update news.html and download.html for
 2025.02.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0cdd17f381350857038d9953f854aa4f317210de
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/download.html | 14 +++++++-------
 docs/website/news.html     | 19 +++++++++++++++++++
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/docs/website/download.html b/docs/website/download.html
index a940e6f7a5..3089b1ad03 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -101,25 +101,25 @@
           <th>2025.02.x</th>
           <td>March 2028</td>
           <td>
-            2025.02.18<br/>
-            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.18/CHANGES">
+            2025.02.19<br/>
+            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.19/CHANGES">
               Changelog
             </a>
           </td>
-          <td>2026-09-10</td>
+          <td>2026-10-22</td>
           <td>
-            <a href="/downloads/buildroot-2025.02.18.tar.gz">
+            <a href="/downloads/buildroot-2025.02.19.tar.gz">
               <img src="images/zip.png" width="24" alt="">
               .tar.gz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.18.tar.gz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.19.tar.gz.sign">[PGP sig]</a>
           </td>
           <td>
-            <a href="/downloads/buildroot-2025.02.18.tar.xz">
+            <a href="/downloads/buildroot-2025.02.19.tar.xz">
               <img src="images/package.png" width="24" alt="">
               .tar.xz
             </a><br/>
-            <a href="/downloads/buildroot-2025.02.18.tar.xz.sign">[PGP sig]</a>
+            <a href="/downloads/buildroot-2025.02.19.tar.xz.sign">[PGP sig]</a>
           </td>
         </tr>
       </table>
diff --git a/docs/website/news.html b/docs/website/news.html
index 61bacda51a..9ce4ff5427 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -9,6 +9,25 @@
 <h2>News</h2>
 <ul class="timeline">
 
+  <li class="timeline-inverted">
+    <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
+    <div class="timeline-panel">
+      <div class="timeline-heading">
+	<h4 class="timeline-title">2025.02.19 released</h4>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>22 October 2026</small></p>
+      </div>
+      <div class="timeline-body">
+	<p>The 2025.02.19 bugfix release is out, fixing a number of important /
+	  security related issues discovered since the 2025.02.18 release. See the
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.19/CHANGES">CHANGES</a>
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/buildroot-2025.02.19-announce-1792683580@buildroot.org/T/#u">announcement</a>
+	  and go to the <a href="/downloads/">downloads page</a> to pick up the
+	  <a href="/downloads/buildroot-2025.02.19.tar.xz">2025.02.19 release</a>.</p>
+      </div>
+    </div>
+  </li>
+
   <li class="timeline">
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
