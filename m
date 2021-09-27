Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B01C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:10:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E412C60F92
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E412C60F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2D2B4040A;
	Mon, 27 Sep 2021 19:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1H2Ykk09FTCf; Mon, 27 Sep 2021 19:10:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17F9540418;
	Mon, 27 Sep 2021 19:10:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 459D61BF2F4
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33BA74014E
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XwgCIrBFvK6T for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:10:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BA42400E5
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1632769806;
 bh=gDXk4AWPKHWA/YP6OJDnz39Rca11qftBW66djSPNfto=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=WziWN1cYrQDS84pnGNnwEYFKjj6mX5jpcyLx3fUEHpBPbKLP5sY6kWtaqfC0P1yqu
 G7uIDMADY5K/sr60QqnwvixgQ+psAze1+4SiM5ZRwt7VyITmenYbZ6YHyoL0zytMhu
 GmUDQYvBIJr9N6E/0lS4DdZg9sTMzr5MmiD0rTtY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.132]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZTmO-1mIMie1lFW-00WYgv; Mon, 27
 Sep 2021 21:10:06 +0200
Date: Mon, 27 Sep 2021 21:10:05 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210927211005.7e200ca3@gmx.net>
In-Reply-To: <20210927163516.1472524-1-fontaine.fabrice@gmail.com>
References: <20210927163516.1472524-1-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:oGLiUMGEsbjnUhmCRf9fpqSPqn/z376Q+nbvetdBzmMx4BEWdIC
 9ElGRAv1jEEV926ni2sIbufwwB+hiC9FuOkaM+0RfnopGCXxXoT7CKHCDMbuoOxyzKePDv+
 rodI0bqPSjZd8mr+lrkcuT6jqr1HZJlv+DBRMZgUHZvaBiNb4C+4979oh52qiEo1WY7oiRg
 x31B9DZnYlWO3uiLToisQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DvBtGPTcHdY=:LAQavEJpRr+hQOVv9zNuD+
 vS7nxIqqNyZyGgOgIabB8O5PRS48wWOdBxSAa7ID/LBeTQqMwvW8jBe4tkQUguj062XpDR8kQ
 0d6Dpsu19CJdvMN7/jocc7WAujpTMo35hlzawvpzCcQPGol+4j/6nmnBBiG40E2Dlu8mZVVTt
 gE/RNk8ENc7tkZGsMwW2HuyvTPX4Oq19wGxH8nB7HqKYmb7kCtoE7ebQHOaS4ACz7m5m/1l1I
 OqoC7kv+cT6laPW5JAyohrA+3T11vlRxeana0WtKNNUSfJOCOFIihlyDK4qqhfoeKLWT41JXA
 UJ1vTQBM0cMRNHea4IhMHUScBXuI7KwXB93u/cUuU1uiRG842wu8MMbKprst245lS8bYUSeYT
 fSalYyQLyX7KClF7Im1oKZRNzOuxbVh3C1x0akAog6d0Tih7fia2tkhwNOumrgkaJ8KfXg+z6
 /fIp36l9VItey7KxdQZdeQB5j9nFzgxxFz7nJ8ni4InlY8rI96l1ZNmhhDnG7J/0kDU/X4rpv
 HaBFyPSHTIsYOALkIdsff3N/WZdMjoSy6XhhYOCZbpd996stJF4T8Qgc3n1IW+DZhUr0QqYeD
 7FBumBUkLDIVacvJPRzhUHRIZcy1dfP8obtybAYIKT8/ltzWdcdAgIeIb+DciA7+2+xVzfkTq
 0vJZb2+8OqtDRmpARzVOR/zKUBthNeFz5+P2kHWXJVNQSeHwL3l3LXVpj76cvBvyg009RHP0l
 H6Qi/QCITgwy3hI5pH8wa+Fb4BZiyKQkswJ+Q06fHb5rch9unMUKgsZMQ+UDwDMPiTMJkFtkc
 6yzUEwAcjkGBBhgGzSebPHxkDZxlWUhA3Jr85iiRKBMGiTnYujJJpuSWl2GZ3OlUP066zWdCk
 QOUy/rjNn3v2XuVxd4su/ljwvg8vua5o4FSDzJ30wxX2qHz1WJ9NqAd/u9ZrdFwO4vP6p0B6z
 bMyWDgFqKZE5gFzta221m486eb2IFflJJqW0HiyettiXK8vao9IlRFXsEUM2Bs9byL+/UcMsF
 nWvYS3k8PVp/Hkj2cSVXb2b6dKNQZKfBXR58FVZO1UDlpjxBn6zsuVEJdkH+3bTZRVPImLUAD
 Nk8BKQzsKB0VFY=
Subject: Re: [Buildroot] [PATCH 1/1] package/iwd: fix musl build
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Mon, 27 Sep 2021 18:35:16 +0200, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with musl raised since bump to version
> 1.18 in commit 1a7be12e1e10cc09e3a28a8d04a352bbbb63ba3a:
>
> src/netconfig.c: In function 'netconfig_ipv6_to_string':
> src/netconfig.c:188:18: error: 'struct in6_addr' has no member named '__in6_u'; did you mean '__in6_union'?
>   188 |  memcpy(in6_addr.__in6_u.__u6_addr8, addr, 16);
>       |                  ^~~~~~~
>       |                  __in6_union
>
> Fixes:
>  - http://autobuild.buildroot.org/results/2c4e6cf22e6fb5582470930241904878070f1144

Thanks for fixing....

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter

>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...nfig-Remove-usage-of-in6_addr__in6_u.patch | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch
>
> diff --git a/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch b/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch
> new file mode 100644
> index 0000000000..f6b3d24516
> --- /dev/null
> +++ b/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch
> @@ -0,0 +1,32 @@
> +From 42bd5ba7c2665c5bf95ba102a8115c4cf01d31d7 Mon Sep 17 00:00:00 2001
> +From: Andrew Zaborowski <andrew.zaborowski@intel.com>
> +Date: Thu, 16 Sep 2021 01:58:29 +0200
> +Subject: netconfig: Remove usage of in6_addr.__in6_u
> +
> +in6_addr.__in6_u.__u6_addr8 is glibc-specific and named differently in
> +the headers shipped with musl libc for example.  The POSIX compliant and
> +universal way of accessing it is in6_addr.s6_addr.
> +
> +[Retrieved from:
> +https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=42bd5ba7c2665c5bf95ba102a8115c4cf01d31d7]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/netconfig.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/netconfig.c b/src/netconfig.c
> +index ce95db0b..421270c9 100644
> +--- a/src/netconfig.c
> ++++ b/src/netconfig.c
> +@@ -171,7 +171,7 @@ static inline char *netconfig_ipv6_to_string(const uint8_t *addr)
> + 	struct in6_addr in6_addr;
> + 	char *addr_str = l_malloc(INET6_ADDRSTRLEN);
> +
> +-	memcpy(in6_addr.__in6_u.__u6_addr8, addr, 16);
> ++	memcpy(in6_addr.s6_addr, addr, 16);
> +
> + 	if (L_WARN_ON(unlikely(!inet_ntop(AF_INET6, &in6_addr, addr_str,
> + 						INET6_ADDRSTRLEN)))) {
> +--
> +cgit 1.2.3-1.el7
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
