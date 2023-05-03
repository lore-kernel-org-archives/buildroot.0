Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C987FC77B75
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 18:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35A5781E84;
	Wed,  3 May 2023 18:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35A5781E84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4anK6OOXKimj; Wed,  3 May 2023 18:10:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 656CF81764;
	Wed,  3 May 2023 18:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 656CF81764
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7800A1BF334
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 18:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E61D40A4D
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 18:10:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E61D40A4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bXViQb-uBHhx for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 18:10:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D34F40597
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D34F40597
 for <buildroot@buildroot.org>; Wed,  3 May 2023 18:10:37 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.65]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXp9i-1pkRBm1VT2-00Y71x; Wed, 03
 May 2023 20:10:34 +0200
Date: Wed, 3 May 2023 20:10:33 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Christian Stewart <christian@aperture.us>
Message-ID: <20230503201033.060ccbb0@gmx.net>
In-Reply-To: <CA+h8R2qSe6OepJMJr+KOUOAOqCRD9EX690Y+Yq4kx-M6x4uQBw@mail.gmail.com>
References: <CA+h8R2qSe6OepJMJr+KOUOAOqCRD9EX690Y+Yq4kx-M6x4uQBw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:uPSpKmatCibe3d9s+XNEGxUvjl61IS7flOLru7Uv3QtY16cMrpn
 TlA+CqK/lH6xQ2fliSSC2/TTX6tnue1OlS3YoBR2pMjGM+P5HBM7k50g0Nl2J540+PBKxX1
 C3xKWhbskRyyorbGzqSDiYEaxPnX7mHdlowZVr50VFpwzezWM1GSpamOy9ijRViiLlmn9zF
 uGLJLR+6TfHKdSJ7KC1JA==
UI-OutboundReport: notjunk:1;M01:P0:4awmUcrdfGo=;czunJrCl2znrAOzcKyNCC+b6SVL
 zsIjGjIgj9HyOcGUxeXeAJgaRGfh45weoYjK3A4ZlVd720N3/5JZlty7bplJXneJjOWfiVp7L
 fDJ9/0Ae2Sts+4KKcmvCYDE1Stb2KzY6AbOpOIFTZYTnmutmVuAFgW/ost0XnhNEwDHRe+MWY
 3EQ4KXF8LLMduBQRjd2kbt7X4LYvtf5EUcK3sfrCmhpjJeXPY1cRSGMHfFtDNmd3oxeIhCdc2
 GUsSrAVZNo+4XvNWxGt1yXVXiN4Zc7rTnW/mPyg6pdtJday8tAmSz64pSP/Uw+8i86zeS0orD
 VOfNsYwLVYRRWmbFwxCpJXlhs/D9JZl3xIsgEV2OfXhnS9F3qDrUEMgU4AaXYqpFi/9gLsVg7
 jWBYbsER3inB4uEQMNghk1efi8GfuuzSwnKi3/hsdFcRNP2X/eGB44TunvzyOdXbXUf8ibDCk
 faIZ8HAr2/sp/Ns7s20/029OBZGr0GJx3fCvIXKWLxD7yaFAMcsCbeGNv8yktEkBgwH8QtgCE
 Xif0fxbVd0mrZA3Yt11C6w07TOrg/WiaPfifDU38xyUAaiMuUSzDtiJALEBaalX7tDsiglJ0O
 jZINRV9XuxWifOiizWBEyCmxHpj8WQSrsU7BfvisGQLPjmWGR+45gig99B+cwJ6mzZl0qLQhJ
 3spTqQaNqOEmPfeRmS0fKbqCSFbFP2eqZz5epqzgAUt/RB3pcRFCSKYT9suVgYTi4ZW6DQ+zh
 fdVSkkOPytbhlVUJEOw9Yj3ui3SesQ/eR0XRH+PmBlXOAWRyYgvbIzXUutYOQOSPL/3NQH/d1
 gTs0FNJmRjayANeDsCpMcmW/mOI7zxXeAEnDVstGBC6IAAVYcboZIlteQqGMeMVfeDeLAaPxy
 UHv0rHAWKr0qd9OGgYldu2BzMVLxSCavz44CcvmcLYQco3csaqvqCEslK/OQsfU/nDrKEXTB8
 uyMO+ZE+dMfIhcx0uw6SW5yTPgY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1683137434; i=ps.report@gmx.net;
 bh=1Icxwf+LnlDW5Pf8iwPdRnB4M2ytwH0NwEjXhNfryRI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=JkuKiW4EAQyVBfTIDnN6SPpgtHT2uMP7MBtawWn7xpCSc4fHReFR/eYs1owsfr2ZY
 TGRXfL1TJqFiT7n/6aV04U3HlevVKYmtp2MTGAgE4k047HcwlmQJfrK2DBuwnBgwVp
 Tmz3KHMHTgQrK4A3mtiXP5VeDfFHurh6Du2K4l/RAkfjRhkO2IJp3izrsm/R6uYg6k
 DwM3YXbZ17bUavy3VNzm6xKMQUM0bXZv9ZUeVjzP+k1p54CxqSNz9xHqiJCcXQGEa9
 BeyO7X5D7KQXXQrrZ4RXkL99bl4Z/wL+yF+6mbEUu8UjVboCXRY/qxoyQhl5s1NVRS
 kuhkxtNnbBEtA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=JkuKiW4E
Subject: Re: [Buildroot] coreutils-9.3: build failure
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Tue, 2 May 2023 19:01:33 -0700, Christian Stewart <christian@aperture.us> wrote:

> Hi all,
>
> The update to coreutils 9.3 seems to have broken the build:
>
> configure: error: cannot run test program while cross compiling
> See 'config.log' for more details
> make[1]: *** [package/pkg-generic.mk:283:
> /build/coreutils-9.3/.stamp_configured] Error 1
>
>
> Minimal reproduction:
>
> BR2_x86_64=y
> BR2_KERNEL_HEADERS_6_3=y
> BR2_BINUTILS_VERSION_2_39_X=y
> BR2_GCC_VERSION_12_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_OPTIMIZE_2=y
> B2_INIT_SYSTEMD=y
> BR2_SYSTEM_BIN_SH_BASH=y
> BR2_GENERATE_LOCALE="C en_US"
> BR2_PACKAGE_COREUTILS=y
>
> Thanks for any help debugging this.

Thanks for the bug report (and specially for the minimal defconfig for
reproduction), the build failure can be fixed by:

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 2c12e8ef2f..cf42a8aff8 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -51,6 +51,7 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
        gl_cv_func_tzset_clobber=no \
        gl_cv_func_working_mkstemp=yes \
        gl_cv_func_working_utimes=yes \
+       gl_cv_macro_MB_CUR_MAX_good=yes \
        gl_getline_needs_run_time_check=no \
        gl_cv_have_proc_uptime=yes \
        utils_cv_localtime_cache=no \

Proper patch will follow...

Regards,
Peter


>
> best regards,
> Christian Stewart
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
