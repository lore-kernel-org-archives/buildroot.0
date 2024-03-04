Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CB0C5478C
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 11:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CB7D820BC;
	Mon,  4 Mar 2024 11:48:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Z6-WGbzi0ji; Mon,  4 Mar 2024 11:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87FB0820EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87FB0820EF;
	Mon,  4 Mar 2024 11:48:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F109D1BF2F3
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 11:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD4F740BD5
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 11:48:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7FTWxm2x8I_s for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 11:48:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 78AD140BC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78AD140BC7
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78AD140BC7
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 11:48:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7640E40006;
 Mon,  4 Mar 2024 11:48:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rh6nj-00Cf5s-0E;
 Mon, 04 Mar 2024 12:48:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240303215832.6236-1-fontaine.fabrice@gmail.com>
Date: Mon, 04 Mar 2024 12:48:11 +0100
In-Reply-To: <20240303215832.6236-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 3 Mar 2024 22:58:32 +0100")
Message-ID: <87le6y2p6s.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/fluent-bit: force libopenssl
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libressl dropped engine support since version 3.8.1 resulting in the
 > following build failure since bump of libressl to version 3.8.2 in
 > commit 21eca49ed5110872407b76ab9337d2877c4cda24:

 > /home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/armeb-buildroot-linux-gnueabi/12.3.0/../../../../armeb-buildroot-linux-gnueabi/bin/ld:
 > ../library/librdkafka.a(rdkafka_admin.c.o): in function
 > `rd_kafka_UserScramCredentialUpsertion_new':
 > /home/autobuild/autobuild/instance-0/output-1/build/fluent-bit-2.2.2/lib/librdkafka-2.3.0/src/rdkafka_admin.c:5909:
 > undefined reference to `RAND_priv_bytes'
 > /home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/armeb-buildroot-linux-gnueabi/12.3.0/../../../../armeb-buildroot-linux-gnueabi/bin/ld:
 > ../library/librdkafka.a(rdkafka_ssl.c.o): in function
 > `rd_kafka_ssl_set_certs':
 > /home/autobuild/autobuild/instance-0/output-1/build/fluent-bit-2.2.2/lib/librdkafka-2.3.0/src/rdkafka_ssl.c:1384:
 > undefined reference to `ENGINE_load_ssl_client_cert'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/dd74eb4e31e0e4d23e7638cff47c6876fda59952

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
