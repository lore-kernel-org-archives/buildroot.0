Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE85C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 19:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E20BE814B8;
	Sat,  8 Jan 2022 19:00:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cOthcaMdQNX6; Sat,  8 Jan 2022 19:00:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 116C681493;
	Sat,  8 Jan 2022 19:00:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF2721BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB86081496
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j7fFMoXhoC96 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 19:00:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FED38148D
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 19:00:50 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id o30so6121485wms.4
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 11:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WG1WOo7hIf5wI54VVwd2NxkL17ljxIKFRdqFa5VxQ0w=;
 b=Htd8ZrYsrNes5p1bxca2uzyEBYAv9d3GQhkAw5UgTYA+HzNKvI7xY6ohxjQnERvXe4
 Pwg8U7ZbF3gNzpBwqyz/9fwezoDw/g2EA/MP9QlGx7KHPjXO4EBDYEpLPjUeJs1doD2J
 uS1H44sjd+NDYyKliE7d+le/Dp3kwYwsqTqCe8hjn3ZXf4YYxE6i16JZsI3TErfdNZUe
 0L6RxJv7zZt1/pSCgl3FwwydVOyTi6oTZ9i9StwLURvedUVXxOZlnbucBG6gpvC4+ea0
 L6v868Pmanx5kVkq6SI+voPBeacRiTTbOALnESQ6YHEySrG3YfBiWvLqxdymr9oinzJn
 KDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WG1WOo7hIf5wI54VVwd2NxkL17ljxIKFRdqFa5VxQ0w=;
 b=2cyOwtATQE0YpMHddhZzinCjwVPGZOLmGdoVZTgcvgc1ypwDBpkXwuyxSOOd42Zq8F
 J7EtIQePYiB7f3Z7uM9cUy4kgU3M7UOrADyewOU3zPXoBg8p6rPwB5Wh5UmfyypcN+SF
 NUOFPtdoCw9oT/1YiZNBKhQrAdf2ay++vlHxiiC92dk4arrwUh2bTxZ1ZDmMdoQvQaNM
 lZ9a3zc9dDDWqb14YAQkDiN1QeGC/ssVrLImBbiStCfAhdp41K0eX6jOtcpP1inuFVwh
 qaDTUCs/Tn3lkdjEjLzna0jyzVpjF2IaSBuwaQi1FByVRyv8VeJ136I/5fSpdGGg27ZI
 j1ZQ==
X-Gm-Message-State: AOAM533byW9JXZ9b3UB04U2yj7bxWBiOFPJhs21RDOjZCrvJF1JYYx7Q
 OIF9/Zs3OhUU6v4kz6pL2/+21Q==
X-Google-Smtp-Source: ABdhPJz42YpmCyEO5YKS5TaUZcmo8sHMWyC2iAfkd6fIbdz2Afz1j+EVzsSORyqYDg/bxyUFt2j1QQ==
X-Received: by 2002:a7b:c84a:: with SMTP id c10mr4770667wml.21.1641668448442; 
 Sat, 08 Jan 2022 11:00:48 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id m13sm2182639wrn.57.2022.01.08.11.00.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 11:00:48 -0800 (PST)
Message-ID: <5d4ae946-0cca-183e-c6ee-ad08518d4e78@mind.be>
Date: Sat, 8 Jan 2022 20:00:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220108174749.2898891-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220108174749.2898891-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/refpolicy: bump to version
 2.20220106
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
Cc: Antoine Tenart <atenart@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/01/2022 18:47, Fabrice Fontaine wrote:
> Drop patches (already in version)
> 
> https://github.com/SELinuxProject/refpolicy/releases/tag/RELEASE_2_20220106
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...ervices-samba.te-make-crack-optional.patch | 83 -------------------
>   ...ervices-wireguard.te-make-iptables-o.patch | 54 ------------
>   package/refpolicy/refpolicy.hash              |  2 +-
>   package/refpolicy/refpolicy.mk                |  2 +-
>   4 files changed, 2 insertions(+), 139 deletions(-)
>   delete mode 100644 package/refpolicy/2.20210908/0001-policy-modules-services-samba.te-make-crack-optional.patch
>   delete mode 100644 package/refpolicy/2.20210908/0002-policy-modules-services-wireguard.te-make-iptables-o.patch
> 
> diff --git a/package/refpolicy/2.20210908/0001-policy-modules-services-samba.te-make-crack-optional.patch b/package/refpolicy/2.20210908/0001-policy-modules-services-samba.te-make-crack-optional.patch
> deleted file mode 100644
> index 2dae5d4a76..0000000000
> --- a/package/refpolicy/2.20210908/0001-policy-modules-services-samba.te-make-crack-optional.patch
> +++ /dev/null
> @@ -1,83 +0,0 @@
> -From 7c58f2508efc115dea03e18e1fa611ebf81f6ee6 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Wed, 4 Aug 2021 11:12:01 +0200
> -Subject: [PATCH] policy/modules/services/samba.te: make crack optional
> -
> -Make crack optional to avoid the following build failure:
> -
> - Compiling targeted policy.31
> - env LD_LIBRARY_PATH="/tmp/instance-5/output-1/host/lib:/tmp/instance-5/output-1/host/usr/lib" /tmp/instance-5/output-1/host/usr/bin/checkpolicy -c 31 -U deny -S -O -E policy.conf -o policy.31
> - policy/modules/services/samba.te:399:ERROR 'type crack_db_t is not within scope' at token ';' on line 360232:
> - 	allow smbd_t crack_db_t:dir { getattr search open };
> - #line 399
> - checkpolicy:  error(s) encountered while parsing configuration
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/ab7098948d1920e42fa587e07f0513f23ba7fc74
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/SELinuxProject/refpolicy/pull/407]
> ----
> - policy/modules/services/samba.te | 32 ++++++++++++++++++--------------
> - 1 file changed, 18 insertions(+), 14 deletions(-)
> -
> -diff --git a/policy/modules/services/samba.te b/policy/modules/services/samba.te
> -index 9d4665ae6..6c37625a9 100644
> ---- a/policy/modules/services/samba.te
> -+++ b/policy/modules/services/samba.te
> -@@ -396,8 +396,6 @@ userdom_signal_all_users(smbd_t)
> - userdom_home_filetrans_user_home_dir(smbd_t)
> - userdom_user_home_dir_filetrans_user_home_content(smbd_t, { dir file lnk_file sock_file fifo_file })
> -
> --usermanage_read_crack_db(smbd_t)
> --
> - ifdef(`hide_broken_symptoms',`
> - 	files_dontaudit_getattr_default_dirs(smbd_t)
> - 	files_dontaudit_getattr_boot_dirs(smbd_t)
> -@@ -413,18 +411,6 @@ tunable_policy(`samba_create_home_dirs',`
> - 	userdom_create_user_home_dirs(smbd_t)
> - ')
> -
> --tunable_policy(`samba_domain_controller',`
> --	gen_require(`
> --		class passwd passwd;
> --	')
> --
> --	usermanage_domtrans_passwd(smbd_t)
> --	usermanage_kill_passwd(smbd_t)
> --	usermanage_domtrans_useradd(smbd_t)
> --	usermanage_domtrans_groupadd(smbd_t)
> --	allow smbd_t self:passwd passwd;
> --')
> --
> - tunable_policy(`samba_enable_home_dirs',`
> - 	userdom_manage_user_home_content_dirs(smbd_t)
> - 	userdom_manage_user_home_content_files(smbd_t)
> -@@ -505,6 +491,24 @@ optional_policy(`
> - 	seutil_sigchld_newrole(smbd_t)
> - ')
> -
> -+optional_policy(`
> -+	usermanage_read_crack_db(smbd_t)
> -+')
> -+
> -+optional_policy(`
> -+	tunable_policy(`samba_domain_controller',`
> -+		gen_require(`
> -+			class passwd passwd;
> -+		')
> -+
> -+		usermanage_domtrans_passwd(smbd_t)
> -+		usermanage_kill_passwd(smbd_t)
> -+		usermanage_domtrans_useradd(smbd_t)
> -+		usermanage_domtrans_groupadd(smbd_t)
> -+		allow smbd_t self:passwd passwd;
> -+	')
> -+')
> -+
> - ########################################
> - #
> - # Nmbd Local policy
> ---
> -2.30.2
> -
> diff --git a/package/refpolicy/2.20210908/0002-policy-modules-services-wireguard.te-make-iptables-o.patch b/package/refpolicy/2.20210908/0002-policy-modules-services-wireguard.te-make-iptables-o.patch
> deleted file mode 100644
> index 4cd1f96558..0000000000
> --- a/package/refpolicy/2.20210908/0002-policy-modules-services-wireguard.te-make-iptables-o.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From 67394d078c2e1438293b25d08cf408b0b0d55755 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Wed, 22 Sep 2021 23:55:59 +0200
> -Subject: [PATCH] policy/modules/services/wireguard.te: make iptables optional
> -
> -Make iptables optional to avoid the following build failure raised since
> -version 2.20210908 and
> -https://github.com/SELinuxProject/refpolicy/commit/7f1a7b1cacd5d211077ce62fbb4e91890e65c820:
> -
> - Compiling targeted policy.33
> - env LD_LIBRARY_PATH="/tmp/instance-0/output-1/host/lib:/tmp/instance-0/output-1/host/usr/lib" /tmp/instance-0/output-1/host/usr/bin/checkpolicy -c 33 -U deny -S -O -E policy.conf -o policy.33
> - policy/modules/services/wireguard.te:66:ERROR 'type iptables_exec_t is not within scope' at token ';' on line 591892:
> - #line 66
> -	allow wireguard_t iptables_exec_t:file { getattr open map read execute ioctl };
> - checkpolicy:  error(s) encountered while parsing configuration
> - make[1]: *** [Rules.monolithic:79: policy.33] Error 1
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/a4223accc6adb70b06fd4e74ca4f28484446b6fa
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/SELinuxProject/refpolicy/pull/408]
> ----
> - policy/modules/services/wireguard.te | 10 ++++++----
> - 1 file changed, 6 insertions(+), 4 deletions(-)
> -
> -diff --git a/policy/modules/services/wireguard.te b/policy/modules/services/wireguard.te
> -index 7241f65e6..33fd3c55d 100644
> ---- a/policy/modules/services/wireguard.te
> -+++ b/policy/modules/services/wireguard.te
> -@@ -61,10 +61,6 @@ corecmd_exec_shell(wireguard_t)
> -
> - domain_use_interactive_fds(wireguard_t)
> -
> --# wg-quick can be configured to run iptables and other networking
> --# config tools when bringing up/down the wg interfaces
> --iptables_domtrans(wireguard_t)
> --
> - # wg-quick tries to read /proc/filesystem when running "stat" and "mv" commands
> - kernel_dontaudit_read_system_state(wireguard_t)
> - kernel_dontaudit_search_kernel_sysctl(wireguard_t)
> -@@ -75,3 +71,9 @@ miscfiles_read_localization(wireguard_t)
> - sysnet_run_ifconfig(wireguard_t, wireguard_roles)
> -
> - userdom_use_user_terminals(wireguard_t)
> -+
> -+# wg-quick can be configured to run iptables and other networking
> -+# config tools when bringing up/down the wg interfaces
> -+optional_policy(`
> -+	iptables_domtrans(wireguard_t)
> -+')
> ---
> -2.33.0
> -
> diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
> index b8f6f023eb..b08c22ed4e 100644
> --- a/package/refpolicy/refpolicy.hash
> +++ b/package/refpolicy/refpolicy.hash
> @@ -1,5 +1,5 @@
>   # From https://github.com/SELinuxProject/refpolicy/releases
> -sha256  4d3140d9fbb91322f5de36d73959464ce1d8946dcd149e36fcaf60e92444e902  refpolicy-2.20210908.tar.bz2
> +sha256  965f98f0b68a24fd0b8e8d973d319332aea88973e1d6c455ef9c2a31aefaeaa6  refpolicy-2.20220106.tar.bz2
>   
>   # Locally computed
>   sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
> diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
> index 975c3b584c..44c50af278 100644
> --- a/package/refpolicy/refpolicy.mk
> +++ b/package/refpolicy/refpolicy.mk
> @@ -23,7 +23,7 @@ REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
>   REFPOLICY_SITE_METHOD = git
>   BR_NO_CHECK_HASH_FOR += $(REFPOLICY_SOURCE)
>   else
> -REFPOLICY_VERSION = 2.20210908
> +REFPOLICY_VERSION = 2.20220106
>   REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
>   REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_$(subst .,_,$(REFPOLICY_VERSION))
>   endif
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
