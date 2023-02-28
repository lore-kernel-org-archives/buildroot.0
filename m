Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8E5C64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 07:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33660402F0;
	Tue, 28 Feb 2023 07:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33660402F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hodpdQiKUGMS; Tue, 28 Feb 2023 07:53:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28C5340339;
	Tue, 28 Feb 2023 07:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28C5340339
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 584221BF3DC
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 07:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30B36402F0
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 07:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30B36402F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x_vKJYWvAybO for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 07:53:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E623240469
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E623240469
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 07:53:30 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 0499B5C00F2
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 08:53:29 +0100 (CET)
MIME-Version: 1.0
Date: Tue, 28 Feb 2023 08:53:28 +0100
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org
In-Reply-To: <b1b4cfa7e898a9d9ac2eccd09e4758ce@agner.ch>
References: <330af443072a1a0716c5890eb87216a6bfbe99e7.1669645942.git.stefan@agner.ch>
 <b1b4cfa7e898a9d9ac2eccd09e4758ce@agner.ch>
Message-ID: <155bdecc9b001d1d078cb9e313f53a63@agner.ch>
X-Sender: stefan@agner.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1677570809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O/222WdI9LfvZr+pWOGkUQW7paR2I5GlmeFB4C8AGa4=;
 b=zLFjk/2N8Xj7lH+5WHXiiVxJpnLMQy/+JKSu5vR9KIQUHEa425pNx89T2LKXJI08ngSCNn
 zxwzp5wkT//XQtwhP2KYWmt8YW3nKNcAFDB2L+l5FK20Jfdn5s8m0NuLzFPBwh1YCU6Z1v
 ERCaAPy8OqN2mbQCY8IBkFiMVeniMHQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=zLFjk/2N
Subject: Re: [Buildroot] [PATCH] package/iptables: add option to use
 iptables with nf_tables backend
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

Anything I can help to get this patch merged?

--
Stefan

On 2023-01-25 09:33, Stefan Agner wrote:
> Any thoughts on this patch?
> 
> --
> Stefan
> 
> On 2022-11-28 15:33, Stefan Agner wrote:
>> Add a configuration option to let the iptables and ip6tables symlinks
>> point to the nf_tables variant.
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ---
>>  package/iptables/Config.in   | 5 +++++
>>  package/iptables/iptables.mk | 9 +++++++++
>>  2 files changed, 14 insertions(+)
>>
>> diff --git a/package/iptables/Config.in b/package/iptables/Config.in
>> index e6b12603e0..ec7fbb7eea 100644
>> --- a/package/iptables/Config.in
>> +++ b/package/iptables/Config.in
>> @@ -24,6 +24,11 @@ config BR2_PACKAGE_IPTABLES_NFTABLES
>>  	help
>>  	  Build nftables compat utilities.
>>
>> +config BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT
>> +	bool "nftables compat as default"
>> +	help
>> +	  Use nftables compat utilities by default for iptables/ip6tables.
>> +
>>  comment "nftables compat needs a toolchain w/ wchar, dynamic library,
>> headers >= 3.12"
>>  	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
>>  		!BR2_USE_WCHAR || BR2_STATIC_LIBS
>> diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
>> index a6143677d1..b53ae928af 100644
>> --- a/package/iptables/iptables.mk
>> +++ b/package/iptables/iptables.mk
>> @@ -49,6 +49,15 @@ else
>>  IPTABLES_CONF_OPTS += --disable-bpf-compiler --disable-nfsynproxy
>>  endif
>>
>> +ifeq ($(BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT),y)
>> +define IPTABLES_INSTALL_SYMLINK
>> +	ln -fs xtables-nft-multi $(TARGET_DIR)/usr/sbin/iptables
>> +	ln -fs xtables-nft-multi $(TARGET_DIR)/usr/sbin/ip6tables
>> +endef
>> +
>> +IPTABLES_POST_INSTALL_TARGET_HOOKS += IPTABLES_INSTALL_SYMLINK
>> +endif
>> +
>>  define IPTABLES_LINUX_CONFIG_FIXUPS
>>  	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
>>  	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
