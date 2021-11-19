Return-Path: <SRS0=y7vk=QG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF224C4332F
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 17:06:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2206A6141B
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 17:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2206A6141B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C479D828F7;
	Fri, 19 Nov 2021 17:06:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fZ9baLyTIzOE; Fri, 19 Nov 2021 17:06:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2059F826FB;
	Fri, 19 Nov 2021 17:06:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 865F01BF37C
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 17:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 833D6826FB
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 17:05:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iH7busdAxMpR for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 17:05:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B27C82572
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 17:05:54 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id o7KjmhI0eumo4o7Kjmbgl7; Fri, 19 Nov 2021 18:05:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1637341553; bh=v7RR5FcxvjsshN8Z8duhS2dH0iPYkHLA0ZMCkMyu424=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=F6pT4LE/izITTKH6Qe+ynqOQc/eW5S8pOLovp2ZBY8xrNNtZs5uxbiDInvnxj0OJp
 RIDT43WsmPuWEzp15Q+VHMWgkDf8ISrjIW5ryMTNL36AHD65y+D1SYgCN0PdOxd1jx
 slJ85GKDOlJ0vPo4mNFlWB5L/d+w3xCvscbsD0p2liF/AkiYzJZqID8db91BtMSMft
 K21JXT4/64LGfLsyYKfRfzqAQsAoH6IhsylJRabrKfFU6JbVtIOPV6MMQUxJwdDqVw
 DI+SRC5LZkS0tsH8vdUC4LMsrD26xq0h+04/hqYHUjG9G+cnxsCorGdkpxwHzNUrEt
 /JBl9pQYvO8/Q==
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211119164926.2410106-1-fontaine.fabrice@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <6104fb05-368c-1d4c-33cf-62c5b511a8ac@benettiengineering.com>
Date: Fri, 19 Nov 2021 18:05:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211119164926.2410106-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfGywHhoGZZoWZZgHAqLN47FCqeGJPLiw/jEAZhawUNHwmncTzD6bsfZVgYKq6jaTgJFJcTqccnvYLBgQB9t8Z6S1myLhjDM4sbHm+r/fKk8rZY/HI3hz
 fouL+5vw5D7qj9dMiYVk9rIyf9Uk9hXzXKovvBI/fZVfZhkuP1kzMEO+oEk/yHwuFMwYsdMPO18/cBYP1ro/bIi4X9UfjB1YDf2kEouq2ZDODhPlz8eAfZqP
 2+squd2mhsudZxENytgJ7g==
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: set CONFIG_NFSD
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

thank you for the patch.

On 19/11/21 17:49, Fabrice Fontaine wrote:
> Fixes:
>   - https://bugs.buildroot.org/show_bug.cgi?id=14346
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
>   package/nfs-utils/nfs-utils.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
> index 763dd57ace..07b44b5a93 100644
> --- a/package/nfs-utils/nfs-utils.mk
> +++ b/package/nfs-utils/nfs-utils.mk
> @@ -90,6 +90,10 @@ NFS_UTILS_CONF_OPTS += --without-systemd
>   endif
>   
>   ifeq ($(BR2_PACKAGE_NFS_UTILS_RPC_NFSD),y)
> +define NFS_UTILS_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NFSD)
> +endef
> +
>   define NFS_UTILS_INSTALL_INIT_SYSV
>   	$(INSTALL) -D -m 0755 package/nfs-utils/S60nfs \
>   		$(TARGET_DIR)/etc/init.d/S60nfs
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
