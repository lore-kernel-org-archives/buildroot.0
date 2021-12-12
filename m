Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C803C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6D564204B;
	Sun, 12 Dec 2021 12:20:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZeGL4MPjmyrc; Sun, 12 Dec 2021 12:20:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3135A41D0E;
	Sun, 12 Dec 2021 12:20:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A4091BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3930341D0E
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:20:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R65rR3VOwAZv for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:20:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1804C41C99
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:20:07 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id o20so44130805eds.10
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 04:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pOJ3sKKYKVBPrrpGYombKkDvrI5a9m7lmpMgjiBY2PI=;
 b=Q+Q6yibad1xoRKIvVoq++QBSNhkIU12F1Q/TuB1ubEzlbZ65KoB6SmFVBkETHYF/+5
 dQlNzrH+//hX1zhwNoo7SDjB1v7a0zj6sn3ZCVUmvgV3i3Qv42ECFayQdl0FnTuzKbvJ
 6aLl0+BQjfn6cSo658Tja38Ni5IpdlrkWbwGbsbryK+E2zd57E/0Z1tBAHSCv9X1uCEz
 LvrJw3sSbHSm08STswrxg00etF0x5Uk0Ba2OE/duL58lGcQStN0v4diJr9momZizsKvT
 ooB0nukRDTcq9YZv91Du8paG07vCjYWOcYabGTPj0awDyPaCYXsQapHdCY1zFEbmnSl4
 FWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pOJ3sKKYKVBPrrpGYombKkDvrI5a9m7lmpMgjiBY2PI=;
 b=ivi2lpem0dq3c+ohVfqDUwt/xeuLgWu7lZKBRNgrsH7/vls3q/MCjydzzAJ6dCZvTD
 lrxY7PPdPmx2rRVs85frlkO0E6byzImBt0vixihNuC0IagJJfxW9HwBFrUmZFzh3JGDG
 zXx4LWRKvPyvY8nSiqEcwSFQ2UTKxF9svqpSBIDvzBYM39btxnBc2VIymmjBQTcU4S3D
 bbL7dbOPRYg4IjOaEabJu22Fp8Y36a9cjkQnHj0rqi1aPn7zg0qCS6pHhY0Ua6B6BVv0
 o6KhaFSiKQytw9asa/PdGKNgpMggiqYC7Uz/lyjKnvMfNfVLuE6QUmQ6vNCEiX/kURLf
 S2GA==
X-Gm-Message-State: AOAM530TACqBcTNSAzZHgid8jfDgB8+sWzIC5/G8Kh30Ug7D0ypDM9Co
 UGK/S6e9tN5OcOpGXtCfLqmq+g==
X-Google-Smtp-Source: ABdhPJxFfKNiiZATZoa22UMjX8F717HkSLAYA69V3IHwzpovflk/8E8iF+ZdfNJbqRCd2A6nc2PVhA==
X-Received: by 2002:a17:906:3b18:: with SMTP id
 g24mr36835154ejf.27.1639311605355; 
 Sun, 12 Dec 2021 04:20:05 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id c11sm4828256ede.32.2021.12.12.04.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 04:20:05 -0800 (PST)
Message-ID: <ca3c1e83-64b6-2862-8390-ab382025494f@mind.be>
Date: Sun, 12 Dec 2021 13:20:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211207220407.3320031-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211207220407.3320031-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/keepalived: fix CVE-2021-44225
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
Cc: Ilias Apalodimas <apalos@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/12/2021 23:04, Fabrice Fontaine wrote:
> In Keepalived through 2.2.4, the D-Bus policy does not sufficiently
> restrict the message destination, allowing any user to inspect and
> manipulate any property. This leads to access-control bypass in some
> situations in which an unrelated D-Bus system service has a settable
> (writable) property
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...us-fix-policy-to-not-be-overly-broad.patch | 42 +++++++++++++++++++
>   package/keepalived/keepalived.mk              |  3 ++
>   2 files changed, 45 insertions(+)
>   create mode 100644 package/keepalived/0002-dbus-fix-policy-to-not-be-overly-broad.patch
> 
> diff --git a/package/keepalived/0002-dbus-fix-policy-to-not-be-overly-broad.patch b/package/keepalived/0002-dbus-fix-policy-to-not-be-overly-broad.patch
> new file mode 100644
> index 0000000000..6287d6117d
> --- /dev/null
> +++ b/package/keepalived/0002-dbus-fix-policy-to-not-be-overly-broad.patch
> @@ -0,0 +1,42 @@
> +From 7977fec0be89ae6fe87405b3f8da2f0b5e415e3d Mon Sep 17 00:00:00 2001
> +From: Vincent Bernat <vincent@bernat.ch>
> +Date: Tue, 23 Nov 2021 06:50:59 +0100
> +Subject: [PATCH] dbus: fix policy to not be overly broad
> +
> +The DBus policy did not restrict the message destination, allowing any
> +user to inspect and manipulate any property.
> +
> +Signed-off-by: Vincent Bernat <vincent@bernat.ch>
> +
> +[Retrieved from:
> +https://github.com/acassen/keepalived/commit/7977fec0be89ae6fe87405b3f8da2f0b5e415e3d]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + keepalived/dbus/org.keepalived.Vrrp1.conf | 13 ++++++++-----
> + 1 file changed, 8 insertions(+), 5 deletions(-)
> +
> +diff --git a/keepalived/dbus/org.keepalived.Vrrp1.conf b/keepalived/dbus/org.keepalived.Vrrp1.conf
> +index 2b78a575c..b5ced6085 100644
> +--- a/keepalived/dbus/org.keepalived.Vrrp1.conf
> ++++ b/keepalived/dbus/org.keepalived.Vrrp1.conf
> +@@ -3,12 +3,15 @@
> +  "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
> + <busconfig>
> + 	<policy user="root">
> +-		<allow own="org.keepalived.Vrrp1"/>
> +-		<allow send_destination="org.keepalived.Vrrp1"/>
> ++		<allow own="org.keepalived.Vrrp1" />
> ++		<allow send_destination="org.keepalived.Vrrp1" />
> + 	</policy>
> + 	<policy context="default">
> +-		<allow send_interface="org.freedesktop.DBus.Introspectable" />
> +-		<allow send_interface="org.freedesktop.DBus.Peer" />
> +-		<allow send_interface="org.freedesktop.DBus.Properties" />
> ++		<allow send_destination="org.keepalived.Vrrp1"
> ++		       send_interface="org.freedesktop.DBus.Introspectable" />
> ++		<allow send_destination="org.keepalived.Vrrp1"
> ++		       send_interface="org.freedesktop.DBus.Peer" />
> ++		<allow send_destination="org.keepalived.Vrrp1"
> ++		       send_interface="org.freedesktop.DBus.Properties" />
> + 	</policy>
> + </busconfig>
> diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
> index 5d42cab741..e31c02dec5 100644
> --- a/package/keepalived/keepalived.mk
> +++ b/package/keepalived/keepalived.mk
> @@ -12,6 +12,9 @@ KEEPALIVED_LICENSE_FILES = COPYING
>   KEEPALIVED_CPE_ID_VENDOR = keepalived
>   KEEPALIVED_CONF_OPTS = --disable-hardening
>   
> +# 0002-dbus-fix-policy-to-not-be-overly-broad.patch
> +KEEPALIVED_IGNORE_CVES += CVE-2021-44225
> +
>   ifeq ($(BR2_PACKAGE_JSON_C),y)
>   KEEPALIVED_DEPENDENCIES += json-c
>   KEEPALIVED_CONF_OPTS += --enable-json
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
