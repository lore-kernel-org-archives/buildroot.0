Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C8DCA101C
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 11:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D733402A9;
	Sat, 31 Aug 2024 11:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PdLs60GYC5xd; Sat, 31 Aug 2024 11:41:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50456402BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50456402BE;
	Sat, 31 Aug 2024 11:41:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E97B1BF484
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 11:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C32D81858
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 11:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tpAqJlABWyHw for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 11:41:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B0A1817D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B0A1817D3
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B0A1817D3
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 11:41:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E1E320004;
 Sat, 31 Aug 2024 11:41:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1skMTg-009osW-1Y;
 Sat, 31 Aug 2024 13:41:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240722155909.53198-1-fontaine.fabrice@gmail.com>
Date: Sat, 31 Aug 2024 13:41:12 +0200
In-Reply-To: <20240722155909.53198-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 22 Jul 2024 17:59:09 +0200")
Message-ID: <87y14czzqf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/faifa: bump to latest git commit
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Drop patches (already in version)
 > - libevent is mandatory since
 >   https://github.com/ffainelli/faifa/commit/d2339c2a7680e7c87555650e19123e27e1f12031
 > - This bump will fix the following build failure with gcc >= 14:

 >   hpav_cfg.c: In function 'pushbutton_request':
 >   hpav_cfg.c:256:37: error: passing argument 2 of 'send_vendor_pkt' makes pointer from integer without a cast [-Wint-conversion]
 >     256 |         return send_vendor_pkt(ctx, mac, HPAV_MMTYPE_MS_PB_ENC,
 >         |                                     ^~~
 >         |                                     |
 >         |                                     uint8_t {aka unsigned char}
 >   hpav_cfg.c:123:64: note: expected 'const uint8_t *' {aka 'const
 > unsigned char *'} but argument is of type 'uint8_t' {aka 'unsigned
 > char'}
 >     123 | static int send_vendor_pkt(struct context *ctx, const uint8_t *to,
 >         |                                                 ~~~~~~~~~~~~~~~^~
 >   hpav_cfg.c: In function 'main':
 >   hpav_cfg.c:406:48: error: passing argument 2 of 'pushbutton_request'
 > makes integer from pointer without a cast [-Wint-conversion]
 >     406 |                 ret = pushbutton_request(&ctx, mac);
 >         |                                                ^~~
 >         |                                                |
 >         |                                                uint8_t * {aka unsigned char *}
 >   hpav_cfg.c:254:60: note: expected 'uint8_t' {aka 'unsigned char'}
 > but argument is of type 'uint8_t *' {aka 'unsigned char *'}
 >     254 | static int pushbutton_request(struct context *ctx, uint8_t mac)
 >         |                                                    ~~~~~~~~^~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/5a65337366e52c6234d8d154b7e9a0296e02f1dd

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
