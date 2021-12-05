Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E82C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 15:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84BFD82F77;
	Sun,  5 Dec 2021 15:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QPbhblK-AIDJ; Sun,  5 Dec 2021 15:46:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCEC5831F2;
	Sun,  5 Dec 2021 15:46:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 68D151BF57C
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 636F74044D
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:46:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iw1cEb69UaKj for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 15:46:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F275040484
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 15:46:10 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id g14so32365364edb.8
 for <buildroot@buildroot.org>; Sun, 05 Dec 2021 07:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=vTUZGH+c2/JT4gC3v8P8mSYg60SfSPHgsiTamsrSLcg=;
 b=hERKIPJtDN+kIc8DaTXrkDVNe5U+syq/dAQa+ELuBmg0pqYgTCGAyn5dFITduLRQrt
 UcfhTwTQElwTI8nxB5cOcHSeEweCdAYq1nCUK/jTT1uq1dZtWEMfLNeE6u2zFLetVg2t
 PWtpBLB8/tjnGlLrgOd+AowZmAAi0al2OAmsfeSPhnjbcrf7EFBN6eOu1VUZ0ncpKtnP
 uravj0GyiG2MDspP533qf1m0y1hsIORl6lOuj1/uSG3enCJPOil6UkrSkwUC6zRnTXFt
 +GqhxawPEL11C7gsPQNLR6BU2iAAXrkTgul7JweBrf2ZFJBXyilPIAdN7QCs+nusEjsk
 /mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vTUZGH+c2/JT4gC3v8P8mSYg60SfSPHgsiTamsrSLcg=;
 b=lw93bDNS9c71aUKZLjfL4HrHYj4S38rUZeBA3T+55BfeB+6bJj+6hoveEdN9AxUL/N
 A06QYROtomMm8ZT2VM8sR5ETOVbR5nclJ+hkIXX79Y9ddMBYOmKAylVfzVKf47Nr/Y5q
 jiKR4DPVXrMCwkHPUIAUNY7MWT67SsLUIR3sPGQbhuFdoOk3WUgKDxtJQgxuKz/ZgAO3
 bNzY4Kjp+4NsFHY+85WTUuyTJEdUttdiNQQxaxZQVn/Lg7c4IFlcN2pJ8l1JfKaPOgb8
 XfiJ+Qs8UZyfC2B38tKFshLNkvlVGmgjxhp7SLFNXl4Tl354k/EQX0gBwxj6L+QRC1Ua
 cOaA==
X-Gm-Message-State: AOAM5302y/ELFQIFJmFeS0rknpXT1ooHNZf8YP8rDh4iHHxRsyv0NwSd
 RTv1MqT/sOgkuXkZljtKn1ZzD5pZTM1Irg==
X-Google-Smtp-Source: ABdhPJwCuKW8HZjJReA/lNcfJ3n4gw+Pb0vNHp5acec8KoByqIxahUY8Gfn2xxJK4N3bMXSY3XeU7w==
X-Received: by 2002:aa7:c406:: with SMTP id j6mr47092110edq.76.1638719169092; 
 Sun, 05 Dec 2021 07:46:09 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h10sm6142262edj.1.2021.12.05.07.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Dec 2021 07:46:08 -0800 (PST)
Message-ID: <5d329246-5288-fdcf-7262-9ea96a0d2ac0@mind.be>
Date: Sun, 5 Dec 2021 16:46:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211121094254.3425966-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211121094254.3425966-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: fix mount -a
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



On 21/11/2021 10:42, Fabrice Fontaine wrote:
> Fixes:
>   - https://bugs.buildroot.org/show_bug.cgi?id=14351
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...cache-as-probed-if-sys-not-available.patch | 141 ++++++++++++++++++
>   1 file changed, 141 insertions(+)
>   create mode 100644 package/util-linux/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
> 
> diff --git a/package/util-linux/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch b/package/util-linux/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
> new file mode 100644
> index 0000000000..bfc8f60834
> --- /dev/null
> +++ b/package/util-linux/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
> @@ -0,0 +1,141 @@
> +From 84d38ae3eca523ef990cb848563cc63de25266e6 Mon Sep 17 00:00:00 2001
> +From: Karel Zak <kzak@redhat.com>
> +Date: Fri, 19 Nov 2021 14:19:03 +0100
> +Subject: [PATCH] libblkid: don't mark cache as "probed" if /sys not available
> +
> +For "mount --all" we need to read the cache more than once in a short
> +time. The library checks the delay between probes, and if the delay is
> +too short, it does not read devices. This is a problem on boot when there
> +are no /sys, and the cache is empty. In this case, we need to check
> +for /sys until it's available constantly.
> +
> +https://github.com/util-linux/util-linux/issues/1492
> +Signed-off-by: Karel Zak <kzak@redhat.com>
> +
> +[Retrieved from:
> +https://github.com/util-linux/util-linux/commit/84d38ae3eca523ef990cb848563cc63de25266e6]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + libblkid/src/devname.c | 26 +++++++++++++++++---------
> + libblkid/src/resolve.c |  2 +-
> + libblkid/src/tag.c     |  8 +++++---
> + 3 files changed, 23 insertions(+), 13 deletions(-)
> +
> +diff --git a/libblkid/src/devname.c b/libblkid/src/devname.c
> +index 90a8245fc9..9a173e3489 100644
> +--- a/libblkid/src/devname.c
> ++++ b/libblkid/src/devname.c
> +@@ -429,6 +429,8 @@ sysfs_probe_all(blkid_cache cache, int only_if_new, int only_removable)
> + 	if (!sysfs)
> + 		return -BLKID_ERR_SYSFS;
> +
> ++	DBG(DEVNAME, ul_debug(" probe /sys/block"));
> ++
> + 	/* scan /sys/block */
> + 	while ((dev = xreaddir(sysfs))) {
> + 		DIR *dir = NULL;
> +@@ -533,14 +535,18 @@ sysfs_probe_all(blkid_cache cache, int only_if_new, int only_removable)
> + /*
> +  * Read the device data for all available block devices in the system.
> +  */
> +-static int probe_all(blkid_cache cache, int only_if_new)
> ++static int probe_all(blkid_cache cache, int only_if_new, int update_interval)
> + {
> ++	int rc;
> ++
> + 	if (!cache)
> + 		return -BLKID_ERR_PARAM;
> +
> + 	if (cache->bic_flags & BLKID_BIC_FL_PROBED &&
> +-	    time(NULL) - cache->bic_time < BLKID_PROBE_INTERVAL)
> ++	    time(NULL) - cache->bic_time < BLKID_PROBE_INTERVAL) {
> ++		DBG(PROBE, ul_debug("don't re-probe [delay < %d]", BLKID_PROBE_INTERVAL));
> + 		return 0;
> ++	}
> +
> + 	blkid_read_cache(cache);
> + #ifdef VG_DIR
> +@@ -548,7 +554,13 @@ static int probe_all(blkid_cache cache, int only_if_new)
> + #endif
> + 	ubi_probe_all(cache, only_if_new);
> +
> +-	sysfs_probe_all(cache, only_if_new, 0);
> ++	rc = sysfs_probe_all(cache, only_if_new, 0);
> ++
> ++	/* Don't mark the change as "probed" if /sys not avalable */
> ++	if (update_interval && rc == 0) {
> ++		cache->bic_time = time(NULL);
> ++		cache->bic_flags |= BLKID_BIC_FL_PROBED;
> ++	}
> +
> + 	blkid_flush_cache(cache);
> + 	return 0;
> +@@ -567,11 +579,7 @@ int blkid_probe_all(blkid_cache cache)
> + 	int ret;
> +
> + 	DBG(PROBE, ul_debug("Begin blkid_probe_all()"));
> +-	ret = probe_all(cache, 0);
> +-	if (ret == 0) {
> +-		cache->bic_time = time(NULL);
> +-		cache->bic_flags |= BLKID_BIC_FL_PROBED;
> +-	}
> ++	ret = probe_all(cache, 0, 1);
> + 	DBG(PROBE, ul_debug("End blkid_probe_all() [rc=%d]", ret));
> + 	return ret;
> + }
> +@@ -589,7 +597,7 @@ int blkid_probe_all_new(blkid_cache cache)
> + 	int ret;
> +
> + 	DBG(PROBE, ul_debug("Begin blkid_probe_all_new()"));
> +-	ret = probe_all(cache, 1);
> ++	ret = probe_all(cache, 1, 0);
> + 	DBG(PROBE, ul_debug("End blkid_probe_all_new() [rc=%d]", ret));
> + 	return ret;
> + }
> +diff --git a/libblkid/src/resolve.c b/libblkid/src/resolve.c
> +index 641b022860..16653fa8e1 100644
> +--- a/libblkid/src/resolve.c
> ++++ b/libblkid/src/resolve.c
> +@@ -32,7 +32,7 @@ char *blkid_get_tag_value(blkid_cache cache, const char *tagname,
> + 	blkid_cache c = cache;
> + 	char *ret = NULL;
> +
> +-	DBG(TAG, ul_debug("looking for %s on %s", tagname, devname));
> ++	DBG(TAG, ul_debug("looking for tag %s on %s device", tagname, devname));
> +
> + 	if (!devname)
> + 		return NULL;
> +diff --git a/libblkid/src/tag.c b/libblkid/src/tag.c
> +index 390a648648..178336505f 100644
> +--- a/libblkid/src/tag.c
> ++++ b/libblkid/src/tag.c
> +@@ -326,14 +326,14 @@ blkid_dev blkid_find_dev_with_tag(blkid_cache cache,
> + 	blkid_dev	dev;
> + 	int		pri;
> + 	struct list_head *p;
> +-	int		probe_new = 0;
> ++	int		probe_new = 0, probe_all = 0;
> +
> + 	if (!cache || !type || !value)
> + 		return NULL;
> +
> + 	blkid_read_cache(cache);
> +
> +-	DBG(TAG, ul_debug("looking for %s=%s in cache", type, value));
> ++	DBG(TAG, ul_debug("looking for tag %s=%s in cache", type, value));
> +
> + try_again:
> + 	pri = -1;
> +@@ -366,9 +366,11 @@ blkid_dev blkid_find_dev_with_tag(blkid_cache cache,
> + 		goto try_again;
> + 	}
> +
> +-	if (!dev && !(cache->bic_flags & BLKID_BIC_FL_PROBED)) {
> ++	if (!dev && !probe_all
> ++	    && !(cache->bic_flags & BLKID_BIC_FL_PROBED)) {
> + 		if (blkid_probe_all(cache) < 0)
> + 			return NULL;
> ++		probe_all++;
> + 		goto try_again;
> + 	}
> + 	return dev;
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
