Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F6FC30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 12:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B48DD400D7;
	Tue,  2 Jul 2024 12:31:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5B8XAStknnX1; Tue,  2 Jul 2024 12:31:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A58740490
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A58740490;
	Tue,  2 Jul 2024 12:31:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA3FD1BF30D
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 12:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3EBF813BA
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 12:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7qd3u546Urrg for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 12:31:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4BA4C813AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BA4C813AB
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BA4C813AB
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 12:31:46 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 0A60844051C;
 Tue,  2 Jul 2024 15:31:01 +0300 (IDT)
To: Niklas Yann Wettengel <niyawe@niyawe.de>
In-Reply-To: <20240702122149.1026781-1-niyawe@niyawe.de> (Niklas Yann
 Wettengel's message of "Tue, 2 Jul 2024 14:21:49 +0200")
References: <20240702122149.1026781-1-niyawe@niyawe.de>
Date: Tue, 02 Jul 2024 15:31:42 +0300
Message-ID: <87sews3rgx.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1719923461;
 bh=rNsEJQOkw4UgOdD5hJCJwotQzav1gaLWAZdrNfS/S2M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=QDVEaQyd7h4U/q6syrdyBCMLzyzhS/1jiDs1NueS06RYFU5nb/O898olmCh55GJBB
 G3VIrpRtwssK/Eu9GDn3zzC7ZglRq/B7PYV2bGl3VRtGWlcSfHyhfLQnR+R5NLhgQi
 tFG5syUMkyo5Zb8wWmyhtRC+cFGhc0VuR3JzBo6n6Rav6iU2RgLSQCEnQfi1KTngeo
 9swlMA6qiaQLNX/qw4/DKFlp3x056qWI0RqPd/E6GveWIeOxB3H2kM+bb6EZlomzHz
 p2K6tUhROg/A5NYm5wPyw63DviVhW59hGUNoUBWKq+pm7sdwMaXcoCv7hSEq6dpGU0
 IvgFaHQOuSdxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=QDVEaQyd
Subject: Re: [Buildroot] [PATCH 1/1] packages/openssh: install sshd-session
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Niklas,

Thanks for the patch.

On Tue, Jul 02 2024, Niklas Yann Wettengel wrote:
> In OpenSSH 9.8 the server is split into two processes: sshd and
> sshd-session. This patch installs the sshd-session binary

Does that mean that sshd does not work after recent bump to version 9.8?

Please add this information to the commit log. This must be applied to
stable branches after the version bump.

Thanks,
baruch

>
> Signed-off-by: Niklas Yann Wettengel <niyawe@niyawe.de>
> ---
>  package/openssh/openssh.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 6d846f64df..7065c3ae4f 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -117,6 +117,7 @@ endif
>  ifeq ($(BR2_PACKAGE_OPENSSH_SERVER),y)
>  define OPENSSH_INSTALL_SERVER_PROGRAMS
>  	$(INSTALL) -D -m 0755 $(@D)/sshd $(TARGET_DIR)/usr/sbin/sshd
> +	$(INSTALL) -D -m 0755 $(@D)/sshd-session $(TARGET_DIR)/usr/libexec/sshd-session
>  	$(INSTALL) -D -m 0755 $(@D)/sftp-server $(TARGET_DIR)/usr/libexec/sftp-server
>  endef
>  OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SERVER_PROGRAMS

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
