Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A593C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 16:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4034404D7;
	Tue,  2 Jul 2024 16:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uufgdV4e9PGK; Tue,  2 Jul 2024 16:25:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A880340656
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A880340656;
	Tue,  2 Jul 2024 16:25:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F2151BF366
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 16:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C22780F80
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 16:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SxO2_V6VEOsE for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 16:25:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED51380F5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED51380F5F
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED51380F5F
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 16:25:17 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.108]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1ML9yc-1sgtvF2KjS-00YJwh for
 <buildroot@buildroot.org>; Tue, 02 Jul 2024 18:25:15 +0200
Message-ID: <cd185816-1219-4415-8370-6100385ec279@gmx.de>
Date: Tue, 2 Jul 2024 18:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240702123615.1028278-2-niyawe@niyawe.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240702123615.1028278-2-niyawe@niyawe.de>
X-Provags-ID: V03:K1:t1Ug43Dl072liCCfO/LgZWn62KA9otGcE+30zA/CvptCBUgvVkE
 a0EYVVjVbQGt1F9ysHjXr5V6E0y7ufWKE7UWWRt6tKGDXlUXO1k5jnAJUpaOSOWtUH/I+u0
 /jD55fpIvem1tqAx80Xzkdf+fUxwhK/LLi3JM3N9VQMLzSyhtaEDdVee0UvmyKLf+5P2IY4
 ZzlQej9eYzS8ODRqOZsrg==
UI-OutboundReport: notjunk:1;M01:P0:nq62SLun4PU=;vZO4fKWCHuW5SgO6pngJjWotKKu
 Nx918oonOvrWF602pb2WpF/HA+6J4QTXMoLcBIUb/ic/TnGSnLGEKjqI5BQ0fvPWzbrjcvJxE
 zyodvySIVe9nQiNpnGLWmzjChAqtAnuS6g+wTCRU/Wm0sFLbc79zA4T6YLcngrrguZ/AZIO2f
 G5LTgRzjuAbV/leI4tdRDbjls9/OVP9NV02//oP1rk2ZgA7nSeL8ZVU0Joq5SX8SFWO0irTNQ
 jw0YiuB16lu+jc6BzGJ3QcXRgLV1cJHKKn1MfmhETikJS8+fmTCL1qItjN6pQ4a1NRFgUDClv
 +dM+y2ZjKyvuPzOnmdOr9/Xym2chFSZdF+CkCaFRXbjSIzi1ZQgknXy3FptB30BoNao0MZhVT
 CXHsC4pRTEhslhC4Lb8I8OqxLL2e/K8s5a+W6gCb79rhSOaJwxaMEy0xkTUo+lzsLFh7toXZm
 a7ld4rCZV00eCtxv+6SBsD6jXE2AVeOAlypA6jPSRETCiqzy2Cn04eKFVX7UfsKwf9F65xZ8Q
 d7TGXyiXxVt/mmjDHvwcmwg/sbz1GZxAfUgUDqOtwgHs1gVrM75xrctP2WfWZhKbhWBogPsDN
 Xw4QZ2cjCKl6V8Xbf1vUN1meF3Co06tr3UwOVeL49pENUGKzKqhKRYBBTtG0XQCJpb+Et3ntr
 l9tU6EpExkwuhKyepteHPX+WQOTknBXJcDpNsUjGZMQ8PxszhzV/Kd/eDYBXDsFg1gTZgsKh+
 qHO9x3JURcNQT8f/I1K/LqNUjeZscZPUZYEP3OxUo7O/l9PGfw/YiKAjD8zBTM5ktAlboe2mc
 9w4EHv3cMl+XPim2GP4dvP4iaTRm7pA+PxNK2YPbuXSEA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1719937515; x=1720542315; i=fiona.klute@gmx.de;
 bh=lXbnrRs3mq5EldqHVZLxklnuqMQSntxLZ/WNXE7bRrk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ATjcvkfg5rc2digk0yUuW0F44J+Ww+2VG4zn2mRa+EB1zAVGvGhKfFZoFI1EWCE9
 WWVCIavPbPKVa9Zepa7a0KC5SdX3Gr7+Qm6t6mOdAyuVooG4YhLHcOmoAIG0PNsUf
 MDgOhE4LOhQz4eZulbJvkRs1HV5PajA0LY8pETEsWnasHY26tP/9CaUHg/kbOw3qh
 UTZfiwRPxwywOUQAijro8HQSEl2xjYjFKhoi5U+iroiEOIQ45tAoFxOHkaSQ1+XQI
 lzzxGmYxuj5fAuZsy7TaU3N1kSKXMKbJlzMLV4WAmS35/c25GGyYRSoO4vIl5ZNBG
 XNiT/UBCeFCZrxzTtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ATjcvkfg
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 02.07.24 um 14:36 schrieb Niklas Yann Wettengel:
> In OpenSSH 9.8 the server is split into two processes: sshd and
> sshd-session which results in the following error, when trying
> to start sshd:
>
> Starting sshd: /usr/libexec/sshd-session does not exist or is not executable
>
> This patch installs the sshd-session binary
>
> Signed-off-by: Niklas Yann Wettengel <niyawe@niyawe.de>

Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Thanks for the patch!
Fiona

> ---
>   package/openssh/openssh.mk | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 6d846f64df..7065c3ae4f 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -117,6 +117,7 @@ endif
>   ifeq ($(BR2_PACKAGE_OPENSSH_SERVER),y)
>   define OPENSSH_INSTALL_SERVER_PROGRAMS
>   	$(INSTALL) -D -m 0755 $(@D)/sshd $(TARGET_DIR)/usr/sbin/sshd
> +	$(INSTALL) -D -m 0755 $(@D)/sshd-session $(TARGET_DIR)/usr/libexec/sshd-session
>   	$(INSTALL) -D -m 0755 $(@D)/sftp-server $(TARGET_DIR)/usr/libexec/sftp-server
>   endef
>   OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SERVER_PROGRAMS

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
