Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DAFC7EE22
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 21:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F14C942BA9;
	Tue,  9 May 2023 21:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F14C942BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3B5czgb_TsGO; Tue,  9 May 2023 21:06:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 117B142B83;
	Tue,  9 May 2023 21:06:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 117B142B83
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 50BCB1BF335
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 21:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3426B42919
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 21:06:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3426B42919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BYQPxP81V_3P for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 21:06:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B29C842918
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B29C842918
 for <buildroot@buildroot.org>; Tue,  9 May 2023 21:06:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:3a04:4e20:1cde:35ad])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 429722003D3;
 Tue,  9 May 2023 23:06:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 09 May 2023 23:06:26 +0200
Date: Tue, 9 May 2023 23:06:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230509210626.GH252090@scaer>
References: <20230425171454.48802-1-aduskett@gmail.com>
 <20230425171454.48802-14-aduskett@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230425171454.48802-14-aduskett@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683666393;
 bh=+vkZWQ2wdCS7VeNNbDS+lc15wKZy0VPCheSYH4nENU4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oghKZcF+IPhLcnnjwn1rbVB9WB5q0K3Kf1mT772XHvLQbjFA+cDGfxIgiXGGdZ5mW
 UynzTayWvq0A68qJv3u3qMdFw2ZK2HFyBhfX5MB8iZ7gOTAuJBCOW46Mw5SY4Wdx5E
 zdYh3dQf+PBbcQxkCpH0fHxZjnXxkwSWmQIucu05TYnGBsCmP2KIdpASVTg9gmb0kn
 AbdVYiR6M7aUNOhZE0kGSbVKHNT5x7Cbfwq7cl2oZGssW252uAbGQ4zcUsT0Tcnfpx
 iIHqNuWJbr8YsQJFfPEK+DVcBI+0zz7OfKDitfA0IRYcIy4kCyruiO7EzaakpKpUEB
 P+USpgignowDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oghKZcF+
Subject: Re: [Buildroot] [PATCH v2 13/13] package/refpolicy: bump to version
 2.20221101
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-04-25 10:14 -0700, Adam Duskett spake thusly:
> Add an upstream patch in package/refpolicy/2.20221101 that makes dbus optional
> for the mount interface. The patch must go in the 2.20221101 directory or else
> the build system will automatically attempt to apply the patch to a custom git
> version of refpolicy if chosen.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Added 2.20221101/0001-mount-dbus-interface-must-be-optional.patch
> 
>  ...ount-dbus-interface-must-be-optional.patch | 33 +++++++++++++++++++
>  package/refpolicy/refpolicy.hash              |  2 +-
>  package/refpolicy/refpolicy.mk                |  2 +-
>  3 files changed, 35 insertions(+), 2 deletions(-)
>  create mode 100644 package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch
> 
> diff --git a/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch b/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch
> new file mode 100644
> index 0000000000..dec0af828f
> --- /dev/null
> +++ b/package/refpolicy/2.20221101/0001-mount-dbus-interface-must-be-optional.patch
> @@ -0,0 +1,33 @@
> +From 6c6be65ccf0891391681d4662cc11f508c0f4aeb Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@gmail.com>
> +Date: Mon, 24 Apr 2023 14:24:49 -0700
> +Subject: [PATCH] mount: dbus interface must be optional
> +
> +If DBus isn't built, the build process fails due to mount.te always using a
> +dbus interface even if the dbus module. Fix this by setting the dbus interface
> +as optional.
> +
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>
> +Upstream-status: accepted. 207b09a656c2c3ac5c286d3f7eef085325e35408

The proper format for an Upstream: tag is just "Upstream:" (but that is
a very recent change. so I just fixed it). We also prefer to have an URL
to the upstream commit, so I changed that too.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +---
> + policy/modules/system/mount.te | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/policy/modules/system/mount.te b/policy/modules/system/mount.te
> +index d028723..af84af0 100644
> +--- a/policy/modules/system/mount.te
> ++++ b/policy/modules/system/mount.te
> +@@ -145,7 +145,9 @@ selinux_getattr_fs(mount_t)
> + 
> + userdom_use_all_users_fds(mount_t)
> + 
> +-dbus_dontaudit_write_system_bus_runtime_named_sockets(mount_t)
> ++optional_policy(`
> ++	dbus_dontaudit_write_system_bus_runtime_named_sockets(mount_t)
> ++')
> + 
> + ifdef(`distro_redhat',`
> + 	optional_policy(`
> +-- 
> +2.40.0
> +
> diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
> index b08c22ed4e..a09e59c270 100644
> --- a/package/refpolicy/refpolicy.hash
> +++ b/package/refpolicy/refpolicy.hash
> @@ -1,5 +1,5 @@
>  # From https://github.com/SELinuxProject/refpolicy/releases
> -sha256  965f98f0b68a24fd0b8e8d973d319332aea88973e1d6c455ef9c2a31aefaeaa6  refpolicy-2.20220106.tar.bz2
> +sha256  44f88e62c8efcef54d019b9ca077520d5993de580926bd7575788cfa78515396  refpolicy-2.20221101.tar.bz2
>  
>  # Locally computed
>  sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
> diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
> index f11b72755a..8fea7cc254 100644
> --- a/package/refpolicy/refpolicy.mk
> +++ b/package/refpolicy/refpolicy.mk
> @@ -23,7 +23,7 @@ REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
>  REFPOLICY_SITE_METHOD = git
>  BR_NO_CHECK_HASH_FOR += $(REFPOLICY_SOURCE)
>  else
> -REFPOLICY_VERSION = 2.20220106
> +REFPOLICY_VERSION = 2.20221101
>  REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
>  REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_$(subst .,_,$(REFPOLICY_VERSION))
>  endif
> -- 
> 2.40.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
