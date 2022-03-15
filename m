Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D3DC433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CE8941635;
	Tue, 15 Mar 2022 21:45:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MnSb4HvecAdT; Tue, 15 Mar 2022 21:45:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31609415BA;
	Tue, 15 Mar 2022 21:45:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D221C1BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B30A260B79
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:45:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id izcZ6eJLnxAD for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:45:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96838605AC
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:45:41 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id a8so382584ejc.8
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qG/uH1MvExiI0BOOW92BFoaJmpoVO0sEH1AZgrASR5c=;
 b=e68zxZlVMJrgIeDlpqr4fVPjkAF8ZBRqIB916kTj8tFnMyK5q7t61Rra65OhG2K3Qt
 3Dp46fC81GGez7cqoRInvjErFM92b+ThK2f85XIVbRdzCT2S4fBfxG2PMM9ynqsctryn
 6EEVmKJi7QkROs3ObFu6UFT+WC1E5GKqbMyXoraKT0q1KJXO8D8kfPa9Uj5U6xVpMwQK
 FLadNwP6RLx3ZPAOtfrglmXAg2KGMuElG5VuTY2wBVi5DUtZ2a93nLFYE3sH9wtgVKC0
 daWlWPr6+ifQSWRwuCeVgsjqrmbX1LHTpoSqgmzBFs08wHXTLdycFmIPvZhE732w1mJS
 9YEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qG/uH1MvExiI0BOOW92BFoaJmpoVO0sEH1AZgrASR5c=;
 b=WeIo659ZaQm0fP3zfQdysltHdmSB7Tn/oJPz4me4oZelAjWtNRrKvKbmkPymbbsUFL
 q3NGo/Drh4QaOrza6MJ102aZ0+OzQKrS+x2hKxZhMWjX1JZFgSrkClR8zNK+SijfKJm9
 JPgZ4YIOZuU1hAqRYmnxNn7LcziG2Vf0YqrByDdCT80nXIdk/BsKytb4zHGy0NwQfOxR
 NCGO5zsU9riiTcGPhPEn2ej8guhfmPzpfMhsTV9QmplEhnXBgLLBUYDVdfgSN+jxnHPy
 t1+vifs+nDPofYNnzeNK9mjHFC7OQ1/6XsbZAQT6si3GkNYh/OiHXXrX1xlhoMZVICCY
 AbTw==
X-Gm-Message-State: AOAM530UWYys9PHuOb+B/bxWhnUZ2ofqtG7Ep/722uwOANsojsWkBMn1
 nRAXsrEdqRpYVEqEHhG9bNsU8g==
X-Google-Smtp-Source: ABdhPJycYPfKd0O3R6Zsc67L8Gtvwpt1HS3EXaThsNfsBoD7e8AS7J6cO56wnT4UmNKj2q2mHa0u1A==
X-Received: by 2002:a17:907:7e88:b0:6db:ad88:2294 with SMTP id
 qb8-20020a1709077e8800b006dbad882294mr17200086ejc.371.1647380739881; 
 Tue, 15 Mar 2022 14:45:39 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 a1-20020aa7d901000000b00416217c99bcsm76318edr.65.2022.03.15.14.45.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:45:39 -0700 (PDT)
Message-ID: <a83e2cc8-46b4-01a4-088a-e46912d2748f@mind.be>
Date: Tue, 15 Mar 2022 22:45:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220308231733.176991-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220308231733.176991-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/dnsmasq: fix dnssec static build
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/03/2022 00:17, Fabrice Fontaine wrote:
> Drop -DHAVE_DNSSEC_STATIC which has been added by commit
> e913527b94e2e47b4ea6fcf13e281d5969f54fd6 but is not needed and raises
> the following static build failure because dnsmasq will wrongly append
> "-Wl,-Bstatic -lgmp -Wl,-Bdynamic":
> 
> /home/buildroot/autobuild/instance-2/output-1/host/bin/x86_64-linux-gcc -static -o dnsmasq cache.o rfc1035.o util.o option.o forward.o network.o dnsmasq.o dhcp.o lease.o rfc2131.o netlink.o dbus.o bpf.o helper.o tftp.o log.o conntrack.o dhcp6.o rfc3315.o dhcp-common.o outpacket.o radv.o slaac.o auth.o ipset.o pattern.o domain.o dnssec.o blockdata.o tables.o loop.o inotify.o poll.o rrfilter.o edns0.o arp.o crypto.o dump.o ubus.o metrics.o hash-questions.o domain-match.o -Wl,-Bstatic -L/home/buildroot/autobuild/instance-2/output-1/host/bin/../x86_64-buildroot-linux-musl/sysroot/usr/lib -lhogweed -lgmp -lnettle  -Wl,-Bdynamic -Wl,-Bstatic -lgmp -Wl,-Bdynamic
> /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/10.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: attempted static link of dynamic object `/home/buildroot/autobuild/instance-2/output-1/host/x86_64-buildroot-linux-musl/sysroot/lib/../lib64/libc.so'
> 
> Strangely enough, this is the first time this build failure is raised by
> the autobuilders whereas "-Wl,-Bdynamic" is set since a very long time:
> https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=c979fa04a40ff12370c8d3a82ad27d9d3b5907e3

  I also couldn't find an explanation, except that static build with dnssec is 
probably relatively rare, and it can be hidden by all the other errors that were 
there - e.g. apparently before the last bump, the build already failed because 
of nettle.

  Applied to master, thanks.

  Regards,
  Arnout

> 
> Fixes:
>   - http://autobuild.buildroot.org/results/99b419ddb5a3be561d39e715833510a59519213e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/dnsmasq/dnsmasq.mk | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
> index 0569475fc4..230e4a8116 100644
> --- a/package/dnsmasq/dnsmasq.mk
> +++ b/package/dnsmasq/dnsmasq.mk
> @@ -26,9 +26,6 @@ endif
>   ifeq ($(BR2_PACKAGE_DNSMASQ_DNSSEC),y)
>   DNSMASQ_DEPENDENCIES += gmp nettle
>   DNSMASQ_COPTS += -DHAVE_DNSSEC
> -ifeq ($(BR2_STATIC_LIBS),y)
> -DNSMASQ_COPTS += -DHAVE_DNSSEC_STATIC
> -endif
>   endif
>   
>   ifneq ($(BR2_PACKAGE_DNSMASQ_TFTP),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
