Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7353EC83F09
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 17:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E181681FD1;
	Tue,  8 Jul 2025 17:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AgbIFIKhDs9F; Tue,  8 Jul 2025 17:31:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0619081FA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0619081FA1;
	Tue,  8 Jul 2025 17:31:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D0171BF
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 17:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7D5B8179D
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 17:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87mXxfNOY1_M for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 17:31:11 +0000 (UTC)
X-Greylist: delayed 304 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 08 Jul 2025 17:31:10 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C5F4F81F2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5F4F81F2F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=96.102.19.46;
 helo=resdmta-c2p-566138.sys.comcast.net; envelope-from=fventuri@comcast.net;
 receiver=<UNKNOWN> 
Received: from resdmta-c2p-566138.sys.comcast.net
 (resdmta-c2p-566138.sys.comcast.net [96.102.19.46])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5F4F81F2F
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 17:31:10 +0000 (UTC)
Received: from resomta-c2p-555440.sys.comcast.net ([96.102.18.231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 256/256 bits)
 (Client did not present a certificate)
 by resdmta-c2p-566138.sys.comcast.net with ESMTPS
 id ZAJxuzOTLlXqnZBx6u5zqm; Tue, 08 Jul 2025 17:17:56 +0000
Received: from oxapp-ch2f-01o.email.comcast.net ([96.117.81.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
 (Client did not present a certificate)
 by resomta-c2p-555440.sys.comcast.net with ESMTPS
 id ZBx6ujjd2IRXxZBx6ujU74; Tue, 08 Jul 2025 17:17:56 +0000
Date: Tue, 8 Jul 2025 13:17:55 -0400 (EDT)
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <2034506680.177021.1751995076018@connect.xfinity.com>
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev59
X-Originating-IP: ::ffff:73.134.168.16
X-Originating-Client: open-xchange-appsuite
X-CMAE-Envelope: MS4xfOh5L/niDQm/Xj7gebn2pMMqpKxELgWSqv6mWgJL9CEEbP51Z6C61/GIRJ38rU0CEocqWbO450dPadErKKDTsLkR0WFqPelpFZCkxWhfD8bTAsfI0Iwz
 nLOlpFcM/ASPFXckYP7ze8s5RU/+TKPCRcjgnevk66OOiVnbARfmvVccHHvhUoDelZlRwy/1s7xv57TdpZBvyJWdrXr/FekW3LSN7fv4f4xjoxJ8gGGGkPTr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=comcast.net; s=20190202a; t=1751995076;
 bh=6U033vLn/MHhMBlXcgX5Tk1RTFnxnQtCfzcuFddNyro=;
 h=Received:Received:Date:From:To:Message-ID:Subject:MIME-Version:
 Content-Type:Xfinity-Spam-Result;
 b=Xt+VyJlcpTKtg5ca+QjXR8K6YzFQvJBiE7+iUTLsbQrAktzio4zeV/9/42rvK6pU/
 a8apMuW3ExMok4WLWvQWi4kJ7sXBsBN+8arujviAUB+SN5o7OY4DNZ2R39b29Dh0I4
 ecXMETEAw3UU7/9m4EdKM4xMKxf0xWxypkiZeWok48R2xoUyvOUvceSD1aa0zG9Ai1
 mZjyWYA03tSPPgDBkGWdoT2cKXuE0R4H/s17mb1glA8ek1tSKXVEVzYAUJ41PqDp7T
 dIVESFJ65+PC3R/88FWs8j7SnwgrYDNMk+6XOW6Z9V5KliXliCJcGW0A0nEYMFgHNV
 9+OSD0Jas2VLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=comcast.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=comcast.net header.i=@comcast.net header.a=rsa-sha256
 header.s=20190202a header.b=Xt+VyJlc
Subject: [Buildroot] Build failed: ftpmirror.gnu.org is down and
 binutitls.2.44.tar.xz is not on backup site 'sources.buildroot.net'
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
From: Franco VENTURI via buildroot <buildroot@buildroot.org>
Reply-To: Franco VENTURI <fventuri@comcast.net>
Content-Type: multipart/mixed; boundary="===============1764023187537614919=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1764023187537614919==
Content-Type: multipart/alternative; 
	boundary="----=_Part_177020_1295044403.1751995076015"

------=_Part_177020_1295044403.1751995076015
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This morning I tried to rerun a 2025.05 build from last week, and it failed when trying to retrieve the sources for binutils version 2.44.
 
It looks like the reason is that the primary site ftpmirror.gnu.org is currently down/unreachable, and the backup site 'sources.buildroot.net' returns a 404 error for 'https://sources.buildroot.net/binutils/binutils-2.44.tar.xz' (but I was able to retrieve versions 2.43 and 2.42 from there using curl).
 
Thanks in advance,
Franco Venturi
------=_Part_177020_1295044403.1751995076015
MIME-Version: 1.0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!doctype html>
<html>
 <head> 
  <meta charset="UTF-8"> 
 </head>
 <body>
  <div class="default-style" style="font-size: 12pt; font-family: helvetica,arial,sans-serif; color: #333333;">
   <span style="font-family: helvetica; font-size: 12pt;">This morning I tried to rerun a 2025.05 build from last week, and it failed when trying to retrieve the sources for binutils version 2.44.</span> 
   <div class="default-style" style="font-size: 12pt; font-family: helvetica,arial,sans-serif; color: #333333;">
    &nbsp;
   </div> 
   <div class="default-style" style="font-size: 12pt; font-family: helvetica,arial,sans-serif; color: #333333;">
    <span style="font-family: helvetica; font-size: 12pt;">It looks like the reason is that the primary site ftpmirror.gnu.org is currently down/unreachable, and the backup site 'sources.buildroot.net' returns a 404 error for '<a href="https://sources.buildroot.net/binutils/binutils-2.44.tar.xz'">https://sources.buildroot.net/binutils/binutils-2.44.tar.xz'</a> (but I was able to retrieve versions 2.43 and 2.42 from there using curl).</span>
   </div> 
   <div class="default-style" style="font-size: 12pt; font-family: helvetica,arial,sans-serif; color: #333333;">
    &nbsp;
   </div> 
   <div class="default-style" style="font-size: 12pt; font-family: helvetica,arial,sans-serif; color: #333333;">
    <span style="font-family: helvetica; font-size: 12pt;">Thanks in advance,</span>
   </div> 
   <div class="default-style" style="font-size: 12pt; font-family: helvetica,arial,sans-serif; color: #333333;">
    <span style="font-family: helvetica; font-size: 12pt;">Franco Venturi</span>
   </div> 
  </div>
 </body>
</html>
------=_Part_177020_1295044403.1751995076015--

--===============1764023187537614919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1764023187537614919==--
