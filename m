Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1D5C54EBE
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 06:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3401281516;
	Mon, 16 Jan 2023 06:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3401281516
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4cQ4VqqKlF_J; Mon, 16 Jan 2023 06:46:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C3F381570;
	Mon, 16 Jan 2023 06:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C3F381570
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 09ADF1BF426
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 06:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D49B16066D
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 06:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D49B16066D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XBcVazSPcC40 for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 06:46:07 +0000 (UTC)
X-Greylist: delayed 00:06:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35A4160ADE
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35A4160ADE
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 06:46:07 +0000 (UTC)
Received: from opfednr07.francetelecom.fr (unknown [xx.xx.xx.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr27.francetelecom.fr (ESMTP service) with ESMTPS id 4NwMpB6SSgz4wTJ; 
 Mon, 16 Jan 2023 07:40:02 +0100 (CET)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Mon, 16 Jan 2023 07:40:00 +0100
Date: Mon, 16 Jan 2023 07:40:00 +0100
From: <yann.morin@orange.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <1655_1673851202_63C4F142_1655_160_5_20230116064000.GA3045@tl-lnx-nyma7486>
References: <20230114181556.1371822-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230114181556.1371822-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1673851202;
 bh=0W0EdneQkq0G3rHzWXkjMfN7jF1w4tzcOZhjUmWT8fY=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=AmLvHBnN7veTf1wjHT508R9+c8EM3yjuRE6vorP8gO1p3H5V8BwpZ7Kg9kGZCi43N
 IywdQGf/IY/OSeKldtJlaRVc6Ii87K3jrjOJwfoRgoKEwOGYvhkzc55XhKYky+PkWb
 FjCDNgrYMIQwoXLFkrHQFs6vtoSvVwM/hoyIQTJPPkGjElpgFuDNXM3xu8RxCsKFhJ
 bKWhnVvrUuPajI90R2FtSrOTzx6KXcPc786HfW7byA7SqV7dqYfvB0KNrZq5R5uJC1
 aOOJQokJ1KTimNin1a3vxumOttSZZ3JEsaynOsKfdK9dIwXi14dXeG36B42p5G77C3
 +ENwQ+uvTtFSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=AmLvHBnN
Subject: Re: [Buildroot] [PATCH 1/1] package/gpsd: bump to version 3.25
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-01-14 19:15 +0100, Fabrice Fontaine spake thusly:
> Drop patch (not needed anymore)
> 
> https://gitlab.com/gpsd/gpsd/-/blob/release-3.25/NEWS

Hmm.. Why did I not receive the weekly mail informing me the package got
updated?

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Tested with a u-blox Neo M8N

Tested-by: Yann E. MORIN <yann.morin@orange.com>
Acked-by: Yann E. MORIN <yann.morin@orange.com>

Regards,
Yann E. MORIN.

> ---
>  .../gpsd/0001-gpsctl-fix-yodaification.patch  | 44 -------------------
>  package/gpsd/gpsd.hash                        |  2 +-
>  package/gpsd/gpsd.mk                          |  2 +-
>  3 files changed, 2 insertions(+), 46 deletions(-)
>  delete mode 100644 package/gpsd/0001-gpsctl-fix-yodaification.patch
> 
> diff --git a/package/gpsd/0001-gpsctl-fix-yodaification.patch b/package/gpsd/0001-gpsctl-fix-yodaification.patch
> deleted file mode 100644
> index 753ff300eb..0000000000
> --- a/package/gpsd/0001-gpsctl-fix-yodaification.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 72ae7ce646792b07061cbbb31ed47f55a1d2422c Mon Sep 17 00:00:00 2001
> -Message-Id: <72ae7ce646792b07061cbbb31ed47f55a1d2422c.1663075350.git.yann.morin@orange.com>
> -From: "Yann E. MORIN" <yann.morin@orange.com>
> -Date: Tue, 13 Sep 2022 15:10:48 +0200
> -Subject: [PATCH] gpsctl: fix yodaification
> -
> -Commit d5a672abd98a (gpsctl.c: Style tweaks.  Yoda style, braces, //
> -comments.) claimed "No functional changes", but mis-treated a comparison
> -when it was converted to yoda-style (simplified diff):
> -
> -    -    if (write(gpsdata->gps_fd, buf, strlen(buf)) <= 0) {
> -    +    if (0 <= write(gpsdata->gps_fd, buf, strlen(buf))) {
> -
> -As one may notice, the comparison operator was not reversed while the
> -operands were.
> -
> -This got silently fixed in commit 3219ab9f6a89 (gpsctl.c: First cut at
> ---ship sending commands to running gpsd.) but this is completely
> -unrelated.
> -
> -Fix that comparison.
> -
> -Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> -Upstream status: not applicable as already fixed.
> ----
> - gpsctl.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/gpsctl.c b/gpsctl.c
> -index cb342af87..ef59a6622 100644
> ---- a/gpsctl.c
> -+++ b/gpsctl.c
> -@@ -96,7 +96,7 @@ static bool gps_query(struct gps_data_t *gpsdata,
> -     if ('\n' != buf[strnlen(buf, sizeof(buf) - 1) - 1]) {
> -         (void)strlcat(buf, "\n", sizeof(buf));
> -     }
> --    if (0 <= write(gpsdata->gps_fd, buf, strnlen(buf, sizeof(buf)))) {
> -+    if (0 >= write(gpsdata->gps_fd, buf, strnlen(buf, sizeof(buf)))) {
> -         GPSD_LOG(LOG_ERROR, &context.errout, "gps_query(), write failed\n");
> -         return false;
> -     }
> --- 
> -2.25.1
> -
> diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
> index f415c3af0f..15e1181ed9 100644
> --- a/package/gpsd/gpsd.hash
> +++ b/package/gpsd/gpsd.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  00ee13f615655284874a661be13553abe66128e6deb5cd648af9bc0cb345fe5c  gpsd-3.24.tar.gz
> +sha256  b368b6a305e3f7a6382d23a0cbfc1d78923060b6b7f54cf7987a73c7b4a9afc2  gpsd-3.25.tar.gz
>  sha256  fdf339997bbca9eaf507476b82fbcac608fc39a3d89b86b51e16db4c9f933716  COPYING
> diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
> index 961ebde649..d7425513fd 100644
> --- a/package/gpsd/gpsd.mk
> +++ b/package/gpsd/gpsd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GPSD_VERSION = 3.24
> +GPSD_VERSION = 3.25
>  GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
>  GPSD_LICENSE = BSD-2-Clause
>  GPSD_LICENSE_FILES = COPYING
> -- 
> 2.39.0
> 

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
