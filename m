Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261DCC54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 07:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D77D381DAB;
	Mon, 25 Mar 2024 07:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOzqK0qM1v-Y; Mon, 25 Mar 2024 07:31:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2286D81D67
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2286D81D67;
	Mon, 25 Mar 2024 07:31:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38E901BF909
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2627B813F2
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWix2Lim47Te for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 07:31:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0FE5181D67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FE5181D67
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FE5181D67
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 07:31:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BAFE20008;
 Mon, 25 Mar 2024 07:31:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1roena-008QeH-29;
 Mon, 25 Mar 2024 08:31:14 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240317140505.803596-1-fontaine.fabrice@gmail.com>
Date: Mon, 25 Mar 2024 08:31:14 +0100
In-Reply-To: <20240317140505.803596-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 17 Mar 2024 15:05:05 +0100")
Message-ID: <87edbyhinx.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/mariadb: requires DES in openssl
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

 > Enable DES in openssl to avoid the following build failure raised since
 > commit a83d41867c8d69a77d5cd0a665aa216af5340359:

 > In file included from /home/buildroot/autobuild/run/instance-2/output-1/build/mariadb-10.11.6/libmysqld/../sql/mysqld.cc:50,
 >                  from /home/buildroot/autobuild/run/instance-2/output-1/build/mariadb-10.11.6/libmysqld/lib_sql.cc:34:
 > /home/buildroot/autobuild/run/instance-2/output-1/build/mariadb-10.11.6/libmysqld/../sql/des_key_file.h:26:3: error: 'DES_cblock' does not name a type
 >    26 |   DES_cblock key1, key2, key3;
 >       |   ^~~~~~~~~~
 > /home/buildroot/autobuild/run/instance-2/output-1/build/mariadb-10.11.6/libmysqld/../sql/des_key_file.h:31:3:
 > error: 'DES_key_schedule' does not name a type; did you mean
 > 'st_des_keyschedule'?
 >    31 |   DES_key_schedule ks1, ks2, ks3;
 >       |   ^~~~~~~~~~~~~~~~
 >       |   st_des_keyschedule

 > Fixes: a83d41867c8d69a77d5cd0a665aa216af5340359
 >  - http://autobuild.buildroot.org/results/bd067de9c2699dc9628c00b929a01890b14d53c1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
