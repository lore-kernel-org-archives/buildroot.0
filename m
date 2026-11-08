Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E592606A31A
	for <buildroot@archiver.kernel.org>; Sun,  8 Nov 2026 04:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aG4Bp6/i;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ETE/21++
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2AA080DCE;
	Sun,  8 Nov 2026 04:28:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5UFPvyj06kw2; Sun,  8 Nov 2026 04:28:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8F7CE80D3D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794112132;
	b=IKdFlOxeP4ErYDz9K9p8LMYheaD7+vZX8OazcRzj0CCUpRPJ/bhJqq8z4bE+6tzNbcgg
	 nCFSQSMKTOwtxELxe9I3meZwtIamquYPsWSEprN5Ve0/gQgzRFLAKoBSabHlGs1s9qvvz
	 7DL8WYPRisIPscvAbqlgn4im5+aDfn+xsEyPe6TfgV6W2uwg1JX6OewpeXNm6Bfj1oTnE
	 a2XGP6W0Gb1X2RkA+hB2MmhMV4PE1P3SmXN05DG2RjJeJrMtr+mGaXwB8XpzWdsPaMq26
	 SnqCC8ztcDj/dzA1KoXwRiIY8Dr1wfwwvBUlyWnVR7y9swSAEBK099w08+yZ5W3zv+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794112132;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ctJrUkhveHW1WypxhUwQwLXAGg/xZlaxatfqmacy8L0=;
	b=kaJnUNRouilxtu9OCfGq0O3nUxHn7IQKU71Wg6w8sbNh2swvNZjW/UYfq35lIXF0p2bj
	 XxyxeYOnMLY5M2blzBKpRzG3Cj7weyEZd9q13vUybXO4yswFhdzqy+s7jNuhpmdFEIeZ+
	 1wFkqeVtjYIQkVUjyTb3J6VURwB1bdVBT7SnhPSKFE9ySE2sfyPUTDlDfIwMgcGAO2ekF
	 LRRJW81nr7HJoAO/9ltJYNbTK06FxD7H0UeAM4wHnFANN91/sloHUZs90jC+kOB91lV0V
	 4Ktisol3wcWpONVIx4iJulsRob1X8HQMvBTpnroGJojpYnnQNqhzM9tT+BtMSk8PDjg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794112132;
	bh=ctJrUkhveHW1WypxhUwQwLXAGg/xZlaxatfqmacy8L0=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aG4Bp6/i+SU5/EpLDWUHUvRwgli99R41mS2pHhjbMRLJ/cxtZ+eAkS4yrozzJB1y6
	 LWbLXiXu2FJUl5Ga9eaz/SyBS4cRWTeVDkZyzPEm1ekRTq8XB73LzUXETw9HgREi4B
	 L2Ys8LxruLs3QZ/rBMFDokjJl8wiM/1+9nLJzY+XoM3QRJT3iZXyMW6d/HwPyblly+
	 6Gs1RaXIoP0CimrJh+cFcyJeWtPAkIDnkRC15NmX8GBHSjGs07onBwHLT4nzfCgpp9
	 wzM9rDo/tcjGurlhS0gRrSOQf5fqEsNvmiS9VL/zt3Aju7rMY22PdPrtL31PZXtID/
	 L6fEIujjlAu3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F7CE80D3D;
	Sun,  8 Nov 2026 04:28:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DF4632A
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 04:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EF1B40607
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 04:28:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8u4Z6LfDBbv for <buildroot@buildroot.org>;
 Sun,  8 Nov 2026 04:28:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B839240604
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=ETE/21++
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B839240604
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 04:28:48 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4b467581b98so1130355e9.0
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 20:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794112126; x=1794716926; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ncaxmksryXlT6CwCN06eDdhEQZrU8Nbi0+lYxny5Bvg=;
 b=ETE/21++tZXmjivKEsVZPSH64WlwKsSats2qqnfOJGCYs/r1IMLQ0uvxsl06bg9wMx
 q2qjlqyKwAP85GUAZff2vpXG49O+wlzmQHwStCdlbf9GHrXb7+3R9Kq5T/liJgb5LKQ/
 yr2kOLN5+g3PIZ46JRPq/lq2Qh7Jl155Ihn5gClFq1N6FkNKNYQ56HETJjfSYJeSt4mB
 hKDX1yLZj53mXLReaDtzZqdVJh5stMpX0IJOQUq6QNlEJbOLSQlJ8FI55orBkiPDtX61
 S5aKbMN+O2omw+VhphzcGhKwHjIYvuQuANT3qoythLMxgCB+zdb3M9PCvjKfC8O6qPlX
 0Tng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794112126; x=1794716926;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ncaxmksryXlT6CwCN06eDdhEQZrU8Nbi0+lYxny5Bvg=;
 b=eG5t1qYAuM8vSDTJbE/n9zFIKMScjRcHseazyQZDHIGsXcQb564OTE7cDlJ6l0ntvX
 +5uq9m1NIAhcnAQoM4r40oXjy5yPQVgEoHUwNXZY8krfCtlKfDyrZLXcAB/UCftLZJ6t
 VNp/l/W2P/DwUIZJwbCsDO9A4W1Z0n0JQk94Se8QHW2wNSZBHdjPpgvSkLpvnt8mZm4r
 ygn3HuHehMHdlRKJdFA9kiWvrYGvRYxYh+8Y3kr9VmymCF2X6IOvpaQMjJ1F7vMhXyk/
 t1+tzk69qHU7W8jza47DNF/EHnHk4ka0VaRLzC10SjpW5W7iK30Kom15xOOKFtBjtDVn
 jfNw==
X-Gm-Message-State: APuU4Z92opHwL41q55lj15vkP3BG0K7X12T5tFNydKaiMpgzwbUNKwdH
 RxpXzKpw2som6dIkwuMwC1RkdpGxBn5Z9vns5hxqkeH0UWXJzkwr0uhd6YGtnBD3
X-Gm-Gg: AYBFou1XDGA7TmW6ApH31SA8BfRuZyWUFbP3T0e/ebms0wdapeAccoDQiCitX/n2Fs9
 7UtwxJXYWAkDRXY7zO1BWkNmxzERf0DgNaWwem2Ktjh/ADLeBYfmyML/65alm5k6xy+Ukc+ZBza
 fwj1bbk9GEdq0ZRKFZspD600+4Jp+vg1ozmyxbLlnYYRUZubXX5odpjmTmSbG34llsqn24ZYWzd
 Lpqz9//G67vph8Y4Ijx0vVeSOaPlEDajvxNVUG/2JFAeBw5ExcUpkLNjV2uABjHxokncI0q3fCp
 2XzieuH0XbC5sO0rS9BIXGkGNC9QzLHG9ds6FEvJfi/A62GD5jGvpil1BLjY13Ak/hNPk2Sw6v2
 HDqwJOMl1wsqFwZF54O4uIIX200Dpmr2H9r1qQStmJ2Zs6RLzEIHs1e6U5zvn31vOUPSl2aI9NI
 1Nlvkpt1VDYVLatZbsy4Hz/wIAWX4EOe5NL+ffhFJ3HToirMEnpN7ugwu3FRocsy5jN9Kdx9uFw
 CqRKbi+ozw1MG6weiA1uSE3BYTlzuuFPgHtb0z7QpTmLUBvcpXhXJd0vGSDe8rC/YrzgRTO+m35
 zkujKyQV8VpQ+8v6nHGB8zLi8IDtBysq2xPK
X-Received: by 2002:a05:600c:3d96:b0:49f:fd40:80fa with SMTP id
 5b1f17b1804b1-4b963c8a047mr8956915e9.34.1794112125824; 
 Sat, 07 Nov 2026 20:28:45 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b76cb75913sm96357415e9.0.2026.11.07.20.28.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 20:28:45 -0800 (PST)
Message-ID: <6aeffa7d.42cbc100.2a3c3e.7801@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 08 Nov 2026 04:28:45 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-07
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

Autobuild statistics for 2026-11-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  |  7  |  0  | 15  |
  2026.05.x  |  0  |  5  |  0  |  5  |
  2026.08.x  |  1  |  4  |  0  |  5  |
    master   | 55  | 174 |  1  | 230 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 14
                 glibmm-2.76.0 | 6 
             fswebcam-20200725 | 5 
             open62541-v1.5.10 | 5 
rtmpdump-6f6bb1353fc84f4cc3... | 5 
               tcf-agent-1.8.0 | 5 
                  xxhash-0.8.4 | 5 
                   bird-2.15.1 | 3 
                        chawan | 3 
host-am335x-pru-package-5f3... | 3 
            host-mfgtools-0.02 | 3 
      host-uboot-tools-2026.07 | 3 
           libwebsockets-5.1.0 | 3 
                      mksh-59c | 3 
                  ndisc6-1.0.7 | 3 
                    opus-1.6.1 | 3 
                tpm2-tss-4.1.3 | 3 
                    attr-2.6.0 | 2 
                   babeld-1.14 | 2 
             dahdi-linux-3.3.0 | 2 
                 dovecot-2.4.5 | 2 
             glibmm2_66-2.66.8 | 2 
              host-rust-1.99.1 | 2 
libesmtp-v1.1.0-14-g335ee8d... | 2 
              libgcrypt-1.12.3 | 2 
                   lmdb-0.9.35 | 2 
                    ne10-1.2.1 | 2 
  nxp-mwifiex-lf-6.18.20-2.0.0 | 2 
           python-typer-0.28.0 | 2 
                rdma-core-62.0 | 2 
                 rtl_433-25.12 | 2 
                acpitool-0.5.1 | 1 
             alsa-lib-1.2.16.1 | 1 
am33x-cm3-fb484c5e54f2e31cf... | 1 
                 apache-2.4.69 | 1 
                bpftool-v7.5.0 | 1 
                       busybox | 1 
                  chawan-0.5.1 | 1 
         cloudflared-2026.10.2 | 1 
              containerd-2.3.7 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                cryptopp-8.9.0 | 1 
                   dbus-1.16.2 | 1 
            dt-utils-2023.11.0 | 1 
firmware-utils-c42a3bc53da8... | 1 
                flannel-0.26.0 | 1 
fs/tar/tar.mk:38: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
                   fwupd-2.0.4 | 1 
                     gdbm-1.26 | 1 
            gdk-pixbuf-2.42.12 | 1 
                  gnupg-1.4.23 | 1 
      gst1-rtsp-server-1.24.13 | 1 
             gtkiostream-1.8.0 | 1 
                 haproxy-3.4.4 | 1 
hare-dbus-e9a89f8bc5ce783fa... | 1 
               harfbuzz-15.0.0 | 1 
            host-go-src-1.27.3 | 1 
                host-gzip-1.15 | 1 
    host-mender-artifact-4.4.2 | 1 
                host-odb-2.4.0 | 1 
             host-swipl-10.0.2 | 1 
          host-xfsprogs-6.19.0 | 1 
            igd2-for-linux-2.2 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
libdill-32d0e8b733416208e04... | 1 
               libdvbcsa-1.1.0 | 1 
               libecoli-0.11.3 | 1 
libfutils-c326ce0cc2a735438... | 1 
               libglib2-2.90.1 | 1 
                libressl-4.3.4 | 1 
           libtraceevent-1.9.1 | 1 
                 libv4l-1.32.0 | 1 
                  libva-2.24.1 | 1 
             libxmlsec1-1.3.13 | 1 
               linux-pam-1.7.2 | 1 
                   linux-tools | 1 
           lttng-libust-2.16.0 | 1 
                     lua-5.4.9 | 1 
                    lua-ev-1.5 | 1 
               madplay-0.15.2b | 1 
             matchbox-lib-1.14 | 1 
                  multicat-2.3 | 1 
                    musl-1.2.6 | 1 
           oath-toolkit-2.6.14 | 1 
                   openrc-0.56 | 1 
                  pdmenu-1.3.6 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
                   qemu-11.0.0 | 1 
raw2rgbpnm-f28b903ca63b4c22... | 1 
rtl8188eu-db2131b227dd43958... | 1 
rtl8192eu-c9314e0d846d2823a... | 1 
rtl8723ds-122a574f780da32bb... | 1 
                 s6-rc-0.5.5.0 | 1 
           sane-backends-1.4.0 | 1 
              sigsum-go-v1.0.0 | 1 
       sp-oops-extract-0.0.7-1 | 1 
sunxi-cedarx-b8f52d913f7372... | 1 
               trousers-0.3.15 | 1 
        wireless_tools-30.pre9 | 1 
                 xenomai-3.2.5 | 1 
           xlib_libXfont-1.5.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/7515d590795b0002603c5ba2f55ac37f31afb488 | ORPH
powerpc64le  |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/32865860a6e03eb4486f1b33e8eeff91e1786cd8 |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/78d5b3a5afb7b814163093f02144934749333062 | ORPH
powerpc64le  |         apache-2.4.69          | NOK | https://autobuild.buildroot.org/results/3a70081c38e56d9e2fa781abc0e33dc792cc1ee0 |     
    arm      |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/72c41958a203aba200b5db4430bca8029aca93e2 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/9a09a0a7cb28b9e4be9e8c05b07112918717dd7a |     
powerpc64le  |          babeld-1.14           | NOK | https://autobuild.buildroot.org/results/b1525e4765e074478b013286af345f496bb8e86e |     
powerpc64le  |          babeld-1.14           | NOK | https://autobuild.buildroot.org/results/395fdbdce8a42fddc6789486b1bd086f821a0e6a |     
  aarch64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/0bc37571c8755c1c07cf3d25c78e6da15496ee4a |     
    arm      |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/a5066e76281d51430af64d77d85886b3c9373c6a |     
   x86_64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/ac249938b4571409922630cf73684fe77ae561a4 |     
  aarch64    |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/aac2323dcbb41605bd2872f2e3ba45a9f7e47fe4 |     
  mips64el   |            busybox             | TIM | https://autobuild.buildroot.org/results/0d9981d92597e01532928b8f3d6f61627eeb143a |     
  mips64el   |             chawan             | NOK | https://autobuild.buildroot.org/results/610b729fdc4fa9ddc0cab0ac82d8db90843a3a98 |     
  mips64el   |             chawan             | NOK | https://autobuild.buildroot.org/results/4156bbc65b9b889e5f1aa6bc33921a5f5b621ee5 |     
  mips64el   |             chawan             | NOK | https://autobuild.buildroot.org/results/11585ee67bc26ab26d0fcabee46d38310e391cb8 |     
    i686     |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/8c2ce9747b3f890bcc316809d3e2e5b7cc2de9cf |     
   x86_64    |     cloudflared-2026.10.2      | NOK | https://autobuild.buildroot.org/results/fad08c26a84db3400bdd07bca5fb00267c4104d9 |     
   x86_64    |        containerd-2.3.7        | NOK | https://autobuild.buildroot.org/results/86494da48cb5609aaf1d46611c0add82e85c18d3 |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/1bdf6e02f20ce6ac20d71fd499a281eaacb52419 |     
   x86_64    |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/8ef17e14ba5678f49b466683169bf2b9a5bcac5c |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b26f45b6456e9b008b2db9ddd056e9f1bcff88cc | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/032d0ff84eac60effaba9ba054c4bb2846e1d8ca | ORPH
   sparc     |          dbus-1.16.2           | NOK | https://autobuild.buildroot.org/results/4436fe4c8f9c871e88f14cc9d6077d90cbfa76d2 | ORPH
  mips64el   |         dovecot-2.4.5          | NOK | https://autobuild.buildroot.org/results/2e81f1234b7326dfdf1d814a42a815803b1fbf69 |     
  mips64el   |         dovecot-2.4.5          | NOK | https://autobuild.buildroot.org/results/cfb987952c7e08cd25982511fe8310e3696cf200 |     
   x86_64    |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/a80df61bc6da78c0ef368d64da2f9d471118a8af |     
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/616b31cc024957a768dda8cd489e0aa70d6ba6e6 |     
   x86_64    |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/a0cd09323fe589f638d7028fe89bc05a649ca8c2 |     
    arm      | fs/tar/tar.mk:38: /home/aut... | NOK | https://autobuild.buildroot.org/results/20c504d926290970d89bbfce1aa37df283a1b821 |     
    arm      | fs/ubifs/ubifs.mk:49: /home... | NOK | https://autobuild.buildroot.org/results/d42f3e7101aaccc8eb9e516b7637558b82e0d30e |     
  mips64el   |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/5465a0340a81e8f91927f59763981cf1b24658f5 |     
powerpc64le  |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/c80868983feb30990d9502df2a1a467a0a460b24 |     
  mips64el   |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/f7bab022b408c8d244130afab08de80914770906 |     
    arm      |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/e8745226699c26d77c9ff46140fd15bd9b7e12ba |     
   x86_64    |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/2c3b6974d22fd14966315feb9e63c10605212b2e |     
   x86_64    |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/1ad561551e511b4f45bac28914ec701d33865653 |     
  mips64el   |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/42bea9dd41b8e6bfdae346c2b428155bfc95e9ab | ORPH
    arm      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/62b046f05ba926c9f54f333f1536ddb6b8f1ea05 | ORPH
  mips64el   |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/7eca302646c5469921b1699d579198ec95cf9276 |     
   x86_64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/79ceea2cb65f42f3ee1f9355b8f34ddc704380c9 |     
powerpc64le  |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/164b15eecc63f10a69aa94c46a9d1a34bec3393a |     
  aarch64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/ff36f929ac6b60ea7a3e80b5b0aa1ee5b71dcdc5 |     
    i686     |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/ad15c276a6ba31925917765f1b328ffc8de02135 |     
  aarch64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/cb2ec6c2013bd65486413ec71bc009dff63423a8 |     
powerpc64le  |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/c41f23c3555270acfaa0c7ed4e7d03071fdd6050 |     
   x86_64    |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/164c2d789c9543ddd5bcd923aab8567e62af146a |     
    hppa     |          gnupg-1.4.23          | NOK | https://autobuild.buildroot.org/results/eabd9e5c4f8806e666c01f379422504fa31b396c | ORPH
powerpc64le  |    gst1-rtsp-server-1.24.13    | NOK | https://autobuild.buildroot.org/results/931648f4469e36441d11969514ba7537799ecb32 | ORPH
  mips64el   |       gtkiostream-1.8.0        | NOK | https://autobuild.buildroot.org/results/e8978f251fd4d81a89c45b59c756203e1011aa0f |     
  mips64el   |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/32c722d539f74e059e751a1ccf017ef91a186bfb |     
   x86_64    | hare-dbus-e9a89f8bc5ce783fa... | NOK | https://autobuild.buildroot.org/results/e693a6d01e1f473d4b0462d2bb99e498f2d66cc2 |     
powerpc64le  |        harfbuzz-15.0.0         | NOK | https://autobuild.buildroot.org/results/193a32ac581e5ebf67e10b97db9e556cd72b9dc8 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/99aaeffbdd1bd5c613aec67e35c3a27e52d8c15e |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/e173abb478ea9f48f2cab70484003931fe5c2124 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/796b43906587b235661321c99143de5ea80e4205 |     
    i686     |       host-go-src-1.27.3       | NOK | https://autobuild.buildroot.org/results/78437f18c2f0003baba6c4f2ba67c15a9819ab76 |     
  mips64el   |         host-gzip-1.15         | NOK | https://autobuild.buildroot.org/results/cc8ab8bc4da64b29238af86a61a8cc93d90e83f1 | ORPH
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/2f431fc29bd7548d6fc05fe3696dca5d3d3ccb06 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/5398feaeaeacb0403cd22fc1e8f6c885b73906f0 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/9dfe123fdbfe6c4cfd4625c411e86383e748f246 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/b4ad1a53136c879d4d20e82252d891ef1c207862 |     
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/89e074b79412e5fb7617751ef4e94b4252ca0b61 | ORPH
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/1433fdbddfc775cf06d4a4e587db3d0a72a1b975 |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/38335a38ce5023fd1f1a14d2f83fa42c97e30606 |     
  aarch64    |       host-swipl-10.0.2        | NOK | https://autobuild.buildroot.org/results/36f049f0171195bdbf4476cd57379cdfc9b2aad6 |     
   x86_64    |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/46b9164ca3901ebef4b4f980206e4940319b08c1 | ORPH
    i686     |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/7d1390f3ada39e61d7b365e4ea64438f62367158 | ORPH
  mips64el   |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/353403b0547b66566efa5743998bd66857f455da | ORPH
  aarch64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/a141e28aa36af0829abcd0a583209ff4db52d6ee | ORPH
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/7be24864a98c103cfcc2323b1e3290953d4d8750 |     
  aarch64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/4275f587b185c8da0097babfc5b477d203a9732c |     
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/e7e19f30e01c80733b41a4f19bcc4fc90f154fc6 | ORPH
    i686     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/9bcfd2a06be912b72f8f96727dd4caabf70726b9 |     
    arm      |        libdvbcsa-1.1.0         | NOK | https://autobuild.buildroot.org/results/e6c46dac7362e7977297e1087eff17224f6f145a |     
    arm      |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/0afb2e0361617ffdada94cd4f9bcb02bd2e4f57a |     
   mips64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/ce83e131b08294b6a2a3a677d9b34b67cef989e4 | ORPH
  riscv64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/51ba1a404725acdc5b58fc231aedda8bdd5abf43 | ORPH
powerpc64le  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/1d2c6e6d75cfd962445a4d553a4ada5e9e9ffef2 |     
    arm      |        libgcrypt-1.12.3        | NOK | https://autobuild.buildroot.org/results/19fc53d3ff35745cfb06574de45726a0b9d3b1a5 | ORPH
    arm      |        libgcrypt-1.12.3        | NOK | https://autobuild.buildroot.org/results/d5dfa7001d519d119cee34aade9205b0e543d320 | ORPH
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/b4d3444dc6c66cdd3cc65fbb8d7e42b2a2a0b1ac |     
    arm      |         libressl-4.3.4         | NOK | https://autobuild.buildroot.org/results/5b23dd53187cf8a8acbdece8fd6fdf04ac559b42 | ORPH
powerpc64le  |      libtraceevent-1.9.1       | NOK | https://autobuild.buildroot.org/results/40966999bc222d8dfe8f4607770311ba97379585 |     
  aarch64    |         libv4l-1.32.0          | NOK | https://autobuild.buildroot.org/results/ea3462e6bf4bb4c9d5bafcdbf27eb737b221c050 |     
  aarch64    |          libva-2.24.1          | NOK | https://autobuild.buildroot.org/results/1c35d7032449e95ee7728c7c9f3292dd524f1408 |     
   x86_64    |      libwebsockets-5.1.0       | NOK | https://autobuild.buildroot.org/results/f42af43f53d00363a6db42200b1325210d8a63a6 |     
   x86_64    |      libwebsockets-5.1.0       | NOK | https://autobuild.buildroot.org/results/343e75c5743e1e07c3cc30b69343a8b3597a3b57 |     
  aarch64    |      libwebsockets-5.1.0       | NOK | https://autobuild.buildroot.org/results/b4face7bbc9e668e05810b890831234874489769 |     
  mips64el   |       libxmlsec1-1.3.13        | NOK | https://autobuild.buildroot.org/results/55d16f8aa62bcdf8ef25ad64e81e77e2ed25936d |     
  mips64el   |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/455da16d91d6f87a1a7d412c4b1e0de403c5cbcf | ORPH
  riscv64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/db3d4d53a5fa00c0d1ad74446a16402bc9ce7510 | ORPH
powerpc64le  |          lmdb-0.9.35           | NOK | https://autobuild.buildroot.org/results/f719c91095a2c13083e10b48ecc847cfc14a4cd4 | ORPH
   x86_64    |          lmdb-0.9.35           | NOK | https://autobuild.buildroot.org/results/06cc971a474e7be5f234bbbed9f2106ccc7954fe | ORPH
    i686     |      lttng-libust-2.16.0       | NOK | https://autobuild.buildroot.org/results/2234b4f80aed7861c182702c05364ba1ddf3be0a |     
    arm      |           lua-5.4.9            | NOK | https://autobuild.buildroot.org/results/0f4f753f6bbd3216f3b355ec606b014bb21cc9dd |     
    arm      |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/b8c539db7ccd347cc89411b648753cefbe6cc9ed |     
powerpc64le  |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/bba70a2c3ae14f747a46dda9bae9f07042cfa152 | ORPH
  aarch64    |       matchbox-lib-1.14        | NOK | https://autobuild.buildroot.org/results/fa5f317f5b95340986afd0323604fae3021b4561 | ORPH
    arm      |            mksh-59c            | NOK | https://autobuild.buildroot.org/results/a0b8469c4ba4cfa8ce881f8b3a1e6f762a731d23 |     
loongarch64  |            mksh-59c            | NOK | https://autobuild.buildroot.org/results/477fb787b6bce8755111a9a6b7926f5854737245 |     
    mips     |            mksh-59c            | NOK | https://autobuild.buildroot.org/results/f25c840145f6734f4e20b2d1d82e6c012a10a8d5 |     
    i686     |          multicat-2.3          | NOK | https://autobuild.buildroot.org/results/c3b8a5ae5ba60372a091410f15b5e358686fb509 | ORPH
powerpc64le  |           musl-1.2.6           | NOK | https://autobuild.buildroot.org/results/d670949ac2a88fa849983eaeb1521812ebd69ae9 |     
  mips64el   |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/c887021fa5a35b51b5659559e8826270e11b18cb | ORPH
    i686     |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/600c5ad61f05ab5ce629335b87344fcd56bda0ac | ORPH
  aarch64    |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/89651fc5630ee496e21fcc024b39513c043c4809 | ORPH
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/d4f4afb032fd90acdf1ea2e9d91524cee60c2cfc |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/5e39c499b531797d90672eb0b7a0a5bccb4a45fe |     
  mips64el   |  nxp-mwifiex-lf-6.18.20-2.0.0  | NOK | https://autobuild.buildroot.org/results/f267c4ea79b4e5095bf98b4b4839824860ca7389 |     
   x86_64    |  nxp-mwifiex-lf-6.18.20-2.0.0  | NOK | https://autobuild.buildroot.org/results/0621fd27cca69f4759577f2ed1bf64365fb80e36 |     
powerpc64le  |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/3350068d9a9a5b1675b1283e5dc358acff4cb30a |     
powerpc64le  |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/2e519e24334dd87562bb94f2983fc2270797c0d3 | ORPH
    arm      |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/be0ff63e815da0491c3c6544a0721470f036eb16 | ORPH
  riscv64    |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/a9929124aeaff89b0b2056e7ed09c59243446121 | ORPH
  aarch64    |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/201df575798946fdd50bb49b43f242bb7e752408 | ORPH
  mips64el   |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/ad7ac592a6fe88f7033f184de04cbd8150dca881 | ORPH
   x86_64    |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/2d2a6d1ac293a13e7f8994332f300c91e7aa80de |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/a1a9d93317ccb9c83ce2c2b14a810dd6e9d19c30 |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/0821e1134f9ebc191e9b92b1e34af81de587918e |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/70ba2994a6550d856d804a841ccfdd64378d1e51 |     
powerpc64le  |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/1499f9b3cd8938462af78c69b50638d04476fdc6 |     
   x86_64    |      python-typer-0.28.0       | NOK | https://autobuild.buildroot.org/results/8cb8714f9f8f04c731aa32518e8202ebad6377ca |     
  sparc64    |      python-typer-0.28.0       | NOK | https://autobuild.buildroot.org/results/88f3625b89644de439e947d0fcd30f39bcff926e |     
    arm      | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/9ff3dcfee4cacb1bf65bf71ba1d874859b987df0 |     
powerpc64le  |          qemu-11.0.0           | NOK | https://autobuild.buildroot.org/results/85def2debe485258f8ba67ec192d55bef38c7f7f |     
    arm      | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/f322db3d671d219cb1846dbb3d410d7f1d035f3d |     
  mips64el   |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/c88c66b3026ce2dcb3bd5fde7c289e7254847f41 |     
   sh4aeb    |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/f4878f98f736ddcd1324ff772bf3f0219895270f |     
    i686     | rtl8188eu-db2131b227dd43958... | NOK | https://autobuild.buildroot.org/results/f8a6265a209a4b007b465c3499ad616813e7df1e |     
 aarch64_be  | rtl8192eu-c9314e0d846d2823a... | NOK | https://autobuild.buildroot.org/results/f8e1d4cb2eac24d508f923c6ca77109d1fa0016c |     
    i686     | rtl8723ds-122a574f780da32bb... | NOK | https://autobuild.buildroot.org/results/9f59601d90aa6d764e722466be990ca039c1e349 |     
powerpc64le  |         rtl_433-25.12          | NOK | https://autobuild.buildroot.org/results/afcf70838510ac5193b20e16dea6bf446d18c6d3 |     
powerpc64le  |         rtl_433-25.12          | NOK | https://autobuild.buildroot.org/results/12c3037354d41da13f7605a9c7c6828bdaee87cd |     
    i686     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/5b0b1caaff3dc96e4e1b885869f9782dadf116bc |     
   x86_64    | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/7e76214290eb3594fd79af8abc1de7e434e8b645 |     
    i686     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/dafdb1a2ec61101c5a209e7523f3892d9fbe175e |     
  mips64el   | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/aa0ea94af90f36de9a3ab8c845f9ff533cc2dbb6 |     
    i686     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/1387392e472217d6e760087482af0675bb2a6470 |     
    i686     |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/c713b839b56cb6d058dfec2d7dd4a16eae09d195 |     
  mips64el   |      sane-backends-1.4.0       | NOK | https://autobuild.buildroot.org/results/5777dd345ed1351e0e257808254b6c56d0e0aac4 |     
   x86_64    |        sigsum-go-v1.0.0        | NOK | https://autobuild.buildroot.org/results/7ce4d5c449e185a413f7a3f2883dec7958d81adf |     
    arm      |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/bde9d6d7dab7a5f6ab76c29e44d5e703ab9fbd9f |     
    arm      | sunxi-cedarx-b8f52d913f7372... | NOK | https://autobuild.buildroot.org/results/f8268d8fc17a42ab7cb1b1f27d7b1e6cdfb141b7 | ORPH
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/b143b151b18f06b85b91e551b3504c0ff57071c6 |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/19a9cafb434bc8fc0818a5e2dd350471ec2621f7 |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/5ddabb79dd432db6d94190a85ab3fc511b8ddb30 |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/af86f27d178c83d3a41512a26a44cd42679e2ac5 |     
    arm      |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/a0e551c3585090ba034161c6bd0d1d56f164d6cd |     
  aarch64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/137e29b1000346c26121387d0d4793ce85c1fff2 | ORPH
    arm      |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/afc7084dbca284fdc72ef969d6c577837a5102f5 | ORPH
   x86_64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/24f10933f301dd91b391ef52de07d6d397ffef38 | ORPH
   x86_64    |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/e18bb54ed1b036a66b77cf53c3e3e88f8f52c524 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/3e8d1d5733f6a03a78bc6b0c94eddedc8b14ae4c |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e0f4ac8ea1389ff80fc173b17e71b9bc5dc547e7 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/ab5d00c9d1aca7229f54335fd99cf0c7f3f7956a |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/eac6309aa7359033f5e96954f3d7d274a47babc2 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f613332b9e57a59a5f47215f1334100237f9965c |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/281fb06c4f981ae6de6e93679d1a676de3e8a0d9 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/fea64f6539c8adeb66c9f9e13607035622846ee1 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0ac2f4cf75f3ee9d5368132f6786a978971d2695 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/32727b1dc512dd9a90c0b0e7d6fdfb96ea601985 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5e3eb22da06b030fa25683053e51677772fd946c |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a62479798d59969795468c141ea161861cc689ee |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/83b82f3a6444b5fb0bd87c85fb4d8e17b5e2fb93 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/10822024d650a7d087389bac08b74c358c5e7251 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/db6bf88608b5bebc9ad689a8db0a3f1d07c2b199 |     
  mips64el   |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/8f0f0ef98024bcd176cdc7fe4fba3c2b0bb99143 |     
  mips64el   |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/d5dce35c4b65a69869431a64d1c054182086595c |     
  mips64el   |      xlib_libXfont-1.5.4       | NOK | https://autobuild.buildroot.org/results/56e6b3ce4e8204953cb8b82d66165fae9b7e38f7 | ORPH
powerpc64le  |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/c2e5bf1a22972f6334594862533250dc7ad493ad | ORPH
   x86_64    |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/7238dc8fe1e05a05352f806a2683dbe291c9ce40 | ORPH
  mips64el   |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/c495b6972ac08c9f6ac74d1a8610d5071ac00e91 | ORPH
  aarch64    |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/15b4179f2f809385a0265a5f5c0ff303a8cba51a | ORPH
    or1k     |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/160a619be36ee734c3d12c6a4b2901f535d8287e | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                       unknown | 2 
               firewalld-2.4.3 | 1 
              host-rust-1.97.1 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        firewalld-2.4.3         | NOK | https://autobuild.buildroot.org/results/64011140334e02c7f5383b6f89e51fd04fc8746f |     
   x86_64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/6c5680139fb0399d6114c868068920ef29e0c89f |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/d287ae9dc2e357ad15a1a979cc78bc0d6bcb83ef |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/e0be72a4ae891090e22599939ac39d04814e7b44 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 3 
              host-rust-1.96.1 | 1 
             util-linux-2.41.5 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        host-rust-1.96.1        | NOK | https://autobuild.buildroot.org/results/5ddf9f37d029819d47099387256d4944160da4d5 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/0de02e33b9aaee71d8d7d9368e6a908d1527a12b |     
powerpc64le  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/2779d96524bc4beba2bcd299f57d2c8522cd32d4 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/4fe13200b2d30d9f25e1c6b5ceff6e0d3a30d9f4 |     
powerpc64le  |       util-linux-2.41.5        | NOK | https://autobuild.buildroot.org/results/c394b057991827b2a772f50ba399314f2113f918 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                lesstif-0.95.2 | 1 
              libmodbus-3.1.11 | 1 
     libphidget-2.1.9.20190409 | 1 
                  libsepol-3.7 | 1 
package/linux-headers/linux... | 1 
                    polkit-125 | 1 
          python-django-5.2.18 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         lesstif-0.95.2         | NOK | https://autobuild.buildroot.org/results/96eeff9f4fbfa514d46443f05ed87f0236e9b6da |     
   x86_64    |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/ac86febd1cbebf42852a4474a7fd8ff7b9d7fe13 |     
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/95123d74046d0b94a5332a0528bec72804c4add2 |     
powerpc64le  |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/31161046dc0985cd1ccf78ee024118243b13d231 |     
   arceb     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/7b1f4d772abc39ed1396f447b67b5d0354ef1bca |     
   x86_64    |           polkit-125           | NOK | https://autobuild.buildroot.org/results/465663ff5b7975a7ad4bf80e7aba35c9381c4330 |     
powerpc64le  |      python-django-5.2.18      | NOK | https://autobuild.buildroot.org/results/4ee28d52c1ea8883b8c66c899322a0c6f5d3fe83 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
