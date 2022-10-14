Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EEDC433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 09:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2868A814BB;
	Fri, 14 Oct 2022 09:10:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2868A814BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6-mi2XKHTymL; Fri, 14 Oct 2022 09:10:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50E0B813C9;
	Fri, 14 Oct 2022 09:10:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50E0B813C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C15B21BF39D
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 09:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CA7B813C9
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 09:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CA7B813C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iEblLVaV-i12 for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 09:10:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4549813BA
Received: from mail.dallmeier.com (mail.dallmeier.de [212.77.172.125])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4549813BA
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 09:10:23 +0000 (UTC)
Received: from mbx1.dallmeier.de ([10.2.1.127]:44637)
 by mail.dallmeier.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 (Exim 4.95)
 (envelope-from <feedback@dallmeier.com>) id 1ojGhu-0002JR-1C
 for buildroot@buildroot.org; Fri, 14 Oct 2022 11:10:18 +0200
Received: from [10.2.4.202] (10.2.4.202) by MBX1.dallmeier.de (10.2.1.127)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.27; Fri, 14
 Oct 2022 11:10:18 +0200
Message-ID: <59335227-32d1-9d2f-ce9c-4a7a45ea913b@dallmeier.com>
Date: Fri, 14 Oct 2022 11:10:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
To: <buildroot@buildroot.org>
Content-Language: en-US
X-ClientProxiedBy: MBX1.dallmeier.de (10.2.1.127) To MBX1.dallmeier.de
 (10.2.1.127)
X-C2ProcessedOrg: 2d8b9317-1e46-4b99-bf0b-1ae0db9755e6
X-Outside: True
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=dallmeier.com; s=maildallmeiercom; h=Content-Transfer-Encoding:Content-Type
 :To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0xYQwlS2JiNABFSq51I9VpSJ4gjxIvyN6D5hIxP7hh0=; b=US2XeFY3Fap30aylkTw4demanu
 cMZExLyAQ4/DFGPZR79vUEsKndiw1Sszbk47zwo6tYcDjit2gzD1BDquuT4mw/R9pbVGMRLmLdLtz
 vI33qzqilnA+3UInRn1ibhzej//uZ2eZwM61cCK9cG8hYEoqHxQcCVnNc5gpYNOALRB0=;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=dallmeier.com header.i=@dallmeier.com
 header.a=rsa-sha256 header.s=maildallmeiercom header.b=US2XeFY3
Subject: [Buildroot] [PATCH] package/dhcpcd: Fix kconfig option for
 privilege separation
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
From: feedback--- via buildroot <buildroot@buildroot.org>
Reply-To: feedback@dallmeier.com
Content-Type: multipart/mixed; boundary="===============3535448384830341487=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3535448384830341487==
Content-Language: en-US
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="monospace">Hi all,<br>
      <br>
      we are not sure if this is even a bug, but
      BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP is not selectable via
      'menuconfig' without setting a string for the bool value.<br>
      <br>
      --- a/package/dhcpcd/Config.in<br>
      +++ b/package/dhcpcd/Config.in<br>
      @@ -12,7 +12,7 @@ config BR2_PACKAGE_DHCPCD<br>
       if BR2_PACKAGE_DHCPCD<br>
       <br>
       config BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP<br>
      -       bool<br>
      +       bool "enable privilege separation"<br>
              default y<br>
              depends on BR2_USE_MMU<br>
              # Audit headers were only added in recent kernels for some
      arches<br>
      <br>
      Best regards,<br>
      Andreas<br>
      <br>
    </font>
  </body>
</html>

--===============3535448384830341487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3535448384830341487==--
