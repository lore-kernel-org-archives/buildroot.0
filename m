Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5ABE9A056
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B92F981340;
	Thu, 19 Feb 2026 17:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sJRMhRWG6Ohu; Thu, 19 Feb 2026 17:25:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE23E83935
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521958;
	bh=xEdHDI4H1Rw3clX/at109UHPd1rARfyqLec1aNTN4ko=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GjmC3Y9aDNJl4NLeNQt+7LlugC92EKTjPIg3V7zTuaSCi894VgUk3KX8gaBX2SK9s
	 nf97vHIAi9W67hC156T/mzdK6mcpZIV4Q7bhvock4mDQB5Q+Ngb9gzyd5XvVZwGOyK
	 SWM7ZmzPCAXFvTaP409R3SPflziufs6XlRSrHgxeSxJgJGSsbUQ7XkBuBqf0bXxcbM
	 8Vr3ZO6zqyI5FjNgwG/bL5jWnh1dk2pM4Ai4YspXKFUAdNB3WfXawWAKDeq0Ahxpan
	 dt83R4R4Iy2cP7yjHzElZJ/2tPsVRYXTnDsAFYEHWvbt6IIyLRiTk+mwI+lT8bmQnV
	 3852hICQvI4oQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE23E83935;
	Thu, 19 Feb 2026 17:25:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21111206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02E9E814AB
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5H0ilozrMu5z for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:25:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 12D6A80F66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12D6A80F66
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12D6A80F66
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:39 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so16589335e9.1
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521938; x=1772126738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eN11nV/wbFIYdHNON8olIU46652hXn38dV9OkRMmPeg=;
 b=V6isvuRMJwQhj3jgDdyVeR2tK+TYtjWKJy0U6rSrum3KNmi6pirkv9jfGjwaRofnca
 d/pAzEMdd0a3KleCAarZCcZJ+UBJOmfuaTvPJvAs4gy8H7SdPthCt37pCcaRyEThR2jq
 wPow0a4L6hlRaLErY0CLsjVqQ06sbiJJmrKd7lHo/3h0ZVnE+07YlgXjoP7IjariPkzW
 TyUcskoA5xTz9Vs62LsZZgLVXZRdM1YDnl/HIPQZB5joh0sHExuAyKbSY0WAUEioZNMD
 EBfUMZF/ir+jV8eS0emlY7IXYCJ5IR+EIpmF0lTfLTMaJJTTM3+pT4GGevZo2LUoWnFk
 +P1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN1JYrKPW56sm370OKGDTBB0K2RP80dPCUu+j5mXWN3ljTIQGc1FN4Qerq36MdvD1NQJ4aBFNtgPE=@buildroot.org
X-Gm-Message-State: AOJu0YyshSwi1RfmCeiF1NgWQNskQ3BpQ1omSJBiYvIK9vOs9j9Eug5d
 L14WRvJNYcIbeQl/Qp07B4V2XvEJbEHhi1ZQOx0CsrpBimW81KutKb+6fxmDEzvEGcA0OdT7J4m
 B8JeA
X-Gm-Gg: AZuq6aLlcGxgY1ALLCert+mSEb03Buvi/eNBBnR8tcmnN+qbLX+QK0UbPCdkg3sL+k/
 Ol2FB6tQCe9IhbfAfYMfhd3uxEYwfaB8q5ULngL9HoeVvMAxNL3f33llw7hiaCR26rnOWK9j2GL
 R8GsUjGVqr4tpq92AoJvJ8rMzd80Zfmvwig10yw7ViUSH6zVP4po7l6UH3lR8tk95IOlX7zf/i/
 vgBNamI1s/XUMM97VX1mcyV7PA6DIYDM3Tu+9mxkr0r+Q359ctB9FmpEwhTzu6UuCJgzNZwqg7R
 secq5NcTNSH0yKE5f3D3DjeqCUbk7vpFIS5ciO9YZumkhsVmcKv1uAmHuaP0Ly05ZZgiDU3GyyI
 QWtz5MdjQWzyzo2T5ZPF83tKRdIvCb2xT0exkj+DPAFnyeSXzoivqZY7nXGBPjaP/xQ5TQ3uCT1
 SSm1DGAZUBBAc6kxE=
X-Received: by 2002:a05:600c:45cf:b0:483:29f4:26b3 with SMTP id
 5b1f17b1804b1-4839fe96a8dmr43066095e9.1.1771521937963; 
 Thu, 19 Feb 2026 09:25:37 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abd259sm52835214f8f.24.2026.02.19.09.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:25:37 -0800 (PST)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:25:37 +0100
Message-ID: <20260219172537.340329-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260202144550.1877480-1-romain.naour@smile.fr>
References: <20260202144550.1877480-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771521938; x=1772126738; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eN11nV/wbFIYdHNON8olIU46652hXn38dV9OkRMmPeg=;
 b=gerMg/eEttNtXQBQMjPXDzKHsKTSEUojjxHbT2xXRzpKEIHVqDM+1/1w/JB3QTvbdJ
 HDOLKCiJ2NL5waCT8DFA4tnFDJ1KIzasLmzG954eckmbnvUlqCW3RTUGt1oIMtjKDjBh
 pSr1ApAWlqtp89S9UasU7fjSzSQ9n3srADMtu2XmIJbfYmllE5coJMQAc6uItFu6T1Ta
 j6w2Qv1PUGC2jJV3CHTtk/xtom+GkzrkLJX/X7Ip8W0wBdVqUldH/365EybmXxlgWWcx
 j6KG5YrwxxRtFyVViOrNY4FpznbSELs6IB3vlCH/RgreOoN1lViBu9ncG3IMj6e/JMuf
 g0/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gerMg/eE
Subject: Re: [Buildroot] [PATCH]
 support/testing/tests/package/test_firewalld: use ext2 instead of cpio
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The CPIO filesystem generated by the test_firewalld test is too
> large, and doesn't fit as an initramfs in the 256MB of RAM available
> in the versatilepb machine. This causes a "Initramfs unpacking failed:
> write error" when booting, and many files being missing from the root
> filesystem, ultimately causing the test to fail.
> 
> The test_firewalld test initially started to fail following a systemd
> update [1][3]:
> 
>   [BRTEST# systemctl is-active firewalld
>   failed
> 
> But really started to crash at boot following a python 3.14 update
> [2][4]:
> 
>   Run /init as init process
>   /init: exec: line 15: /sbin/init: not found
> 
> Also, update TestFirewalldSysVInit to use ext2 instead of cpio.
> 
> [1] 926e0504d06b5d61d7affb24b94b133b916b71f7
> [2] a0a6abc8b193e5bdab5326324d7299c19d5d8c67
> 
> Fixes:
> [3] https://gitlab.com/buildroot.org/buildroot/-/jobs/12944797059
> [4] https://gitlab.com/buildroot.org/buildroot/-/jobs/11856840940
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  .../testing/tests/package/test_firewalld.py   | 20 +++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_firewalld.py b/support/testing/tests/package/test_firewalld.py
> index 700337f637..1093873b38 100644
> --- a/support/testing/tests/package/test_firewalld.py
> +++ b/support/testing/tests/package/test_firewalld.py
> @@ -23,19 +23,21 @@ class TestFirewalldSystemd(infra.basetest.BRTest):
>          BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
>          BR2_PACKAGE_PYTHON3=y
>          BR2_PACKAGE_FIREWALLD=y
> -        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
>          # BR2_TARGET_ROOTFS_TAR is not set
>          """
>  
>      def test_run(self):
> -        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        ext2_file = os.path.join(self.builddir, "images", "rootfs.ext2")
>          kernel_file = os.path.join(self.builddir, "images", "zImage")
>          dtb_file = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
>          self.emulator.boot(arch="armv7",
>                             kernel=kernel_file,
> -                           kernel_cmdline=["console=ttyAMA0,115200"],
> +                           kernel_cmdline=["console=ttyAMA0,115200",
> +                                           "rootwait", "root=/dev/mmcblk0"],
>                             options=[
> -                               "-initrd", cpio_file,
> +                               '-drive', f'file={ext2_file},if=sd,format=raw',
>                                 "-dtb", dtb_file,
>                                 "-M", "vexpress-a9"
>                             ])
> @@ -78,19 +80,21 @@ class TestFirewalldSysVInit(infra.basetest.BRTest):
>          BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
>          BR2_PACKAGE_PYTHON3=y
>          BR2_PACKAGE_FIREWALLD=y
> -        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
>          # BR2_TARGET_ROOTFS_TAR is not set
>          """
>  
>      def test_run(self):
> -        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        ext2_file = os.path.join(self.builddir, "images", "rootfs.ext2")
>          kernel_file = os.path.join(self.builddir, "images", "zImage")
>          dtb_file = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
>          self.emulator.boot(arch="armv7",
>                             kernel=kernel_file,
> -                           kernel_cmdline=["console=ttyAMA0,115200"],
> +                           kernel_cmdline=["console=ttyAMA0,115200",
> +                                           "rootwait", "root=/dev/mmcblk0"],
>                             options=[
> -                               "-initrd", cpio_file,
> +                               '-drive', f'file={ext2_file},if=sd,format=raw',
>                                 "-dtb", dtb_file,
>                                 "-M", "vexpress-a9"
>                             ])
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
