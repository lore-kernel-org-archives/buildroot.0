Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F23606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 03:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XfmPSvnG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZpWTDrx4
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EDE260816;
	Thu, 22 Oct 2026 03:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTksGL_Qla_e; Thu, 22 Oct 2026 03:30:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 88F07606C2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792639836;
	b=AzV8Reu3N9RDB5tMm55nco/Mriwm3z+9X365Itk0XGEFFjOgdT8xhTzmpIejCvQ0fw70
	 zZ9Eb8/G7WHrrg9anltg7j5oNhcGRAg/qZQG756PE/14Q0P93H7ZoGN4uT8c6IjGKBYXv
	 rn4XgQB8iiM60jLgsIf1HdKRMRH2FNv4vIXp2CetYblLYgMGHZbl8iBRJqzsJ1qJG/mUo
	 RVrSJqUtHLI5qYrz9bRb978dMa9+oNeTlSPO3c026NWMQzJ4/NdbEOpAdu4/wfiFj7P6y
	 9GrFiNBjoM4xr6+sNNJS5sKl1cbxi9j87yoY6R02R6RpZNgtW0Dgf0Nf86F/J2GJV7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792639836;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fWW6Z9Ut9SMXMNY6SVMvvah3iQhMjG0VDuQTheIldv8=;
	b=AUwCko3p0jCkyA1P+LY7s9KvsDXM0WalpT3Ipb/fOy4Paf+sUuiAwUagh2iaVbfrdmYm
	 0F8S4X0oHT7EY+otwZX94JEY7HQAlj/DB+XuoSpHojA44BX8va8P+LksppVkwtQ8Q9zeP
	 +waDFDyDDKQxECKoY4Xy6Rgo5oUGeHxJvSMq8/pW452CoFOwWJ832/JXZyBSojqgWXRgV
	 9GjhNA7wG1ooIh2VBRbGHx1FigWsJqsgV9RCakkSBl8H6S+oemBnkV4eUiqryR0JK76Sn
	 /rViyT+ul/pjocaEugHPd5JFRrxlkTZXz1CjDsB82m7NKas5B4FG7s7Ecr6S0OYu7NA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792639836;
	bh=fWW6Z9Ut9SMXMNY6SVMvvah3iQhMjG0VDuQTheIldv8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XfmPSvnGbkKyOwaKVJLnUSaw1TqA/mkFb9XNRj3ygPPZoqWA5IrgsXr/Rjlg5A5Kf
	 YuzpzVD1vPRwO9BBiRfg9m46bmQ7OptleAoKcJZTPgLLoFfuY8K6sb9kzUUygAhHTn
	 PB30WAF3qoHTu/Qslpw9Qg/Y99m7qos9c+vS5CiCw/hlg3+thIvg+RXtNMcqtrIuUy
	 Z4PVRpR51YXa0Mm6XKIKQUp0ZFUbcFRlZKqz0kHHj+Ab93o3mkBRF+dvX74MK5RGOX
	 gN7syD1ORDpcW1JLZtN5EaCdU5HTvYx3ub3MzeY+0v51OpTr8He/Qa5D1dgYA7+C8N
	 P1HbWERQLizqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88F07606C2;
	Thu, 22 Oct 2026 03:30:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C929F371
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 03:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A556F406AC
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 03:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kbvJkhbQNfHb for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 03:30:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6BA9D406A0
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792639833;
 b=r6uU7WDzhrJRvTQe9qpcLyTpoHzK1xsvU+WAeiCoCH7vVUgsuhUKnTaJD/RWHxTGQOMV
 KibS/SCKQx/CHneZ07s36hg8iJZlWXatOFc1/IQZc6jJaAuGKXydmPOp8ilmtZPdbUXUn
 xvStiTi3ijoFE0WaYrsLImF3GK8VezgRgYjK4p5m8hBkYuDB5KfCnBLCHEVa3Um3NinhO
 3bPvMQllVyw2z+F851P8cMqflZ1eRThSyd4naoUt5CO9jfuK2f6XkEYt76gP6wlMpp6EJ
 47j5RlgUxg1DW0CZTznqjbPV9SZJSVS9EOvfKHhYYR76JBtohqj4HPdu7xNRwqpqnmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792639833;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=3hfg5v8rCHA+YnusllHmKxgZHnHwO6Ox6RIcff1xiTk=;
 b=NXtE+YZLO8udlJ39EXFeiABlRjXE6V5rekn2zxi/pOI1M+pPyq7DlGlTyY5EeA1wFF/I
 z8ozUrbEfluU3CTwu7wj+IjBKPHlsowb2ygAl7KlmiPAKhwXNARVbik0gjwdZiuihYhHH
 Di2mv+BWfcfldli5Vha9dXJH8WAXmxDGc4WZqF01HzssGZ1QQ7gxm6+BIPhGyKUijLtEj
 3Pry3JCKVYiFnUOcWAY/7jeCSehRTWyih7inpMMDh9GZafsf2HcEOL4Pi4Lvg0SqKyo4R
 cSDPzYCN5RGq78s0TDmP4yptpRw/UFSk5C1k7nqKQ55pKUDgXXGgMPlmSmhMozhDf8A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ZpWTDrx4; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ZpWTDrx4
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6BA9D406A0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 03:30:31 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a1ec92f655so4746775e9.0
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792639829; x=1793244629; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=3hfg5v8rCHA+YnusllHmKxgZHnHwO6Ox6RIcff1xiTk=;
 b=ZpWTDrx4woQudXwTgngl3GgQfug7fPlSjFLxHhkZuSSDBARH/AJ7aPHeKWuE3Ch9uY
 LD63MRkmXJu9hyZ6AbwgpBRoP6drw7NOjKDbH6d+IHgDt7eokv1Pe5GfAFY+0JIRotUs
 yw4as21qOLmG/Ltlb7622+CcWGbgZWwEZ2H4Ud1L0Z/+eqay1AmIKJrCy97o51CU08D1
 NoEXM5TStaFz/15ILDAHaZtxWuJ4KnCi0hGQRjOCT22BuyWBoVly+daLW6MeD/7Nueeh
 9ti2vdIRbqIJ8k7HMUYSXJRvgCuu6rWh5qBmmEYHEux8ifeuyucKgMZ4xMOftTMSzZ1H
 Gm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792639829; x=1793244629;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=3hfg5v8rCHA+YnusllHmKxgZHnHwO6Ox6RIcff1xiTk=;
 b=gpJGRp+cc9e9tk4Lr0+rWqnksBtoZmCc9xD2p1Wgtv5MDP0k0sOJkV4Qf4W5GxB7DS
 xRW7rrz5ymlIQ9/GJT2ryPKIX5OOuhaMC2GI5lKZYkqB7bHHy3ES0P9O5aEqhmsZNp+I
 kC8Lm/xgykCm0tFeq1sBMJebOIyqSZxavHPoZLrykdDVIY/lcsrtgn6gimhGMVmX2P2Z
 9//Ob8nSqGAdVziUxLrytyIk1enmAWFA06v3PTPAcDQWjCdoOt+AvNo4YlKZllWAYnDN
 M8YOdnIcFi0TocLlsE8EmaVQBMFCxvt9pruW86m86c5UQ/emujQxQd7Mo0TiC6nX7iDO
 YyDw==
X-Gm-Message-State: AFq9FYJ4t8iIjA3QT+3vBcEWjkkjFMDR58wrcA9NDZn6W7FlpOYEZgaC
 yvths7fFRfuyt7lhKAg9559bi/5isxaKXfEc9CSt3Pfb6RIrrTFspkw3mWtmg7FO
X-Gm-Gg: AYBFou3pXm5not/1/0WTX2ipwlb5eE1Z/x7IFJxpPDFF4WuVVmcPTl5W7J0bVi71sMt
 uXRx+3N1LvIufDHJsmr3HYhBKP9mFFpF2akJdtlG8OtZo45w1SRhb6ZYeWXtyTTQDpANUfpxWQ+
 yPM506N+9o1TYV+aPbKjyGP7cW696VQjD1tG1xppLnJX0Cy+B4fdXWW7/ShFpnpAZ40Oc+zRYds
 RhjqoQOj0t9iJz6M6lV296XAdo5a7SVgelX2vRrt1sgLQhPOyXczrsP7dOuWQ0+3fphcC5WgaG7
 3k24LXiRa2ZxAHqBndC8h63iXMQvu89SflSzMa7wg4F8oLkJBT6UFM2R/5FqLO3QVOrGldhZ/KC
 tO5aZrg+M08zSEONL2lqs4My/qf0x75G2R59C+eTgFFumey7S9n/iHORRxh50Pu/jINfupD5F69
 Ft2+xjcDMkEBb9/QhmXuCi8m+BC5umyaBtw3Hs2AZtN5K7zsC0tpVW2t7Im+0a8/M9cR1wHNm4W
 cxU0yEBDHq8DMRSpW+uH8yf2ynWEmX/RlnAhvB6OFw8sJ6+9jclN+2nuGY=
X-Received: by 2002:a05:600c:6085:b0:4a1:a7f8:c124 with SMTP id
 5b1f17b1804b1-4a204b04321mr21021665e9.7.1792639828772; 
 Wed, 21 Oct 2026 20:30:28 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1fcd2eff9sm89765595e9.4.2026.10.21.20.30.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 20:30:28 -0700 (PDT)
Message-ID: <6ad98354.4c9c0cae.385e6a.f4a4@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 22 Oct 2026 03:30:28 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-21
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

Autobuild statistics for 2026-10-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  | 10  |  0  | 14  |
  2026.05.x  |  0  |  3  |  0  |  3  |
  2026.08.x  |  4  |  3  |  0  |  7  |
    master   | 44  | 178 |  0  | 222 |

Classification of failures by reason for master
-----------------------------------------------

              libmodbus-3.1.12 | 25
                  chawan-0.4.4 | 8 
host-gobject-introspection-... | 8 
            igd2-for-linux-2.2 | 6 
                   perl-5.42.3 | 5 
               tcf-agent-1.8.0 | 5 
            host-gauche-0.9.12 | 4 
                 libclc-23.1.3 | 4 
raw2rgbpnm-f28b903ca63b4c22... | 4 
                       unknown | 4 
             dahdi-linux-3.3.0 | 3 
host-google-breakpad-f49c2f... | 3 
                host-odb-2.4.0 | 3 
libfutils-c326ce0cc2a735438... | 3 
             batman-adv-2025.4 | 2 
                   bird-2.15.1 | 2 
                    ccid-1.5.2 | 2 
      docker-cli-buildx-0.25.0 | 2 
        edk2-edk2-stable202602 | 2 
                 haproxy-3.4.4 | 2 
              host-rust-1.98.1 | 2 
 ibm-sw-tpm2-rev183-2026-08-26 | 2 
                  iozone-3.508 | 2 
                  linux-7.2.11 | 2 
               linux-pam-1.7.2 | 2 
                   linux-tools | 2 
        ltp-testsuite-20260529 | 2 
                  ndisc6-1.0.7 | 2 
               pulseaudio-17.0 | 2 
                 uclibc-1.0.59 | 2 
            18xx-ti-utils-R8.8 | 1 
          aardvark-dns-v1.17.1 | 1 
                    attr-2.6.0 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
                  bcusdk-0.0.5 | 1 
               binutils-2.46.1 | 1 
                   ccrypt-1.11 | 1 
                        chawan | 1 
            compiler-rt-23.1.3 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                     crun-1.24 | 1 
                cryptopp-8.9.0 | 1 
                  delve-1.22.1 | 1 
             docker-cli-28.5.2 | 1 
                 dovecot-2.4.5 | 1 
                drogon-v1.9.14 | 1 
              erlang-26.2.5.21 | 1 
                flannel-0.26.0 | 1 
              fluent-bit-4.2.0 | 1 
             fswebcam-20200725 | 1 
               harfbuzz-14.6.0 | 1 
host-am335x-pru-package-5f3... | 1 
            host-go-src-1.27.3 | 1 
    host-mender-artifact-4.4.1 | 1 
host-python-types-psutil-7.... | 1 
          host-xfsprogs-6.19.0 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
      libabseil-cpp-20260817.0 | 1 
libdill-32d0e8b733416208e04... | 1 
          libmicrohttpd-1.0.10 | 1 
                linux-6.12.113 | 1 
              llama-cpp-b10702 | 1 
                  lldpd-1.0.22 | 1 
                  mender-3.5.3 | 1 
               mosquitto-2.1.2 | 1 
           oath-toolkit-2.6.14 | 1 
             openjdk-25.0.2+10 | 1 
   openvmtools-13.1.0-25218885 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2026_07_28.f8df3f1 | 1 
       python-dbus-fast-5.0.14 | 1 
        python-pymupdf-1.23.22 | 1 
           python-typer-0.27.2 | 1 
python-types-python-dateuti... | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
                      qrtr-1.2 | 1 
                rdma-core-62.0 | 1 
        riemann-c-client-2.2.2 | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 
                 rtptools-1.22 | 1 
        s6-linux-utils-2.6.2.1 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                 systemd-258.7 | 1 
               trousers-0.3.15 | 1 
uclibc-ng-test-132c6134d691... | 1 
               valgrind-3.27.1 | 1 
           virglrenderer-1.3.0 | 1 
   webrtc-audio-processing-1.3 | 1 
                 xenomai-3.2.5 | 1 
                  xvisor-0.3.2 | 1 
                  zeromq-4.3.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/59c7d3c9f3ddcdece1c11ead986f55f34c57ec9b |     
   x86_64    |      aardvark-dns-v1.17.1      | NOK | https://autobuild.buildroot.org/results/90f35048dcfab428a058fb196816211acab5250b | ORPH
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/be7db8b9eded3682c5f6bcf54154714f6df4f845 |     
    i586     | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/3329c49398e4ff777961ce3bd464fa3998613d39 |     
    i686     |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/d7df8e1ce18e870fe4e529906f1a807c1d2d4eff |     
    i686     |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/4c0ecf307b79152628a80ce30d091deecd6905ec |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/549348c1d17d59f5508490cfc6735a146c69880d |     
    i686     |        binutils-2.46.1         | NOK | https://autobuild.buildroot.org/results/daed842d8bd9cea94e09cba58391055e7453ea2c |     
  aarch64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/5e76c88dedc40b7d55cc198a69a46b515fc0b261 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/b06f09ebd3c35372c3b0a3f61547a4a4ec3f714d |     
   x86_64    |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/7c9892fc7352f007210db91df0617926c289fd71 | ORPH
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/c4bb39358c7ae5131cb4b7f623737ec20d66bd6d | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/5d0867da12a415ac6873e5adac8c27553c0b38d0 | ORPH
  mips64el   |             chawan             | NOK | https://autobuild.buildroot.org/results/d136c28b7c372f9ba12bd2ef9cdcdbe1ed0ae61f |     
    i686     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/4acbe495e061a1a19fd9686e33857f9532edaa8e |     
powerpc64le  |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/9bc1bc9dfb6e8837300835db0fbedd4c6cf512a3 |     
    i686     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/88ff8f0d3b092269585396a80b0ebe5ee701b53c |     
    i686     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/b45bfa18db4ebf44e12458e0ab875f83bde49870 |     
  mips64el   |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/deb8e488f522cf611aa75def435aefc8d3a75be8 |     
    i686     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/1f3a6e1a5422752e63bdee1016d0992d5165d6ec |     
    i686     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/95e5dc63041a01a4c9057168705a9beb608907fa |     
    i686     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/2b91c84e7034a50308de6c0db42a17aa91f18fed |     
    i686     |       compiler-rt-23.1.3       | NOK | https://autobuild.buildroot.org/results/1bd9727b4fad060ce9b275e07c91cb368f7baf20 |     
  aarch64    | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/e2e15aadba9d47f33cc05a2d93c3b2b1bfdcb225 |     
    i686     |           crun-1.24            | NOK | https://autobuild.buildroot.org/results/ccd89c7936b55face23e5f5136b6d5890049b61b |     
powerpc64le  |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/c71bcab9a6b09125ecb72d2e56195bbca3130863 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/24b033c6a1ff54acc7be0c15bce92f67f446dc22 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/be1d8157e574a958c9ac4416bafa129cbb187806 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/72500addc359bbd68f9f17a79133bbe44cfbdadb | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/055ac522bebb4e1d167b3445bab9b56bc8a0f0f2 |     
    i686     |       docker-cli-28.5.2        | NOK | https://autobuild.buildroot.org/results/9e467fa02decd32934ae4cb40d889bc99a43f373 |     
  riscv64    |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/8af103de02bbbe8e7966949155fe41c7bbfc2c4c | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/8affc614988571dd392897657f24caecdc39c418 | ORPH
  riscv64    |         dovecot-2.4.5          | NOK | https://autobuild.buildroot.org/results/ba64a0b2ac7f7d5875f3142aaee3eda3c41a77d6 |     
    i686     |         drogon-v1.9.14         | NOK | https://autobuild.buildroot.org/results/6b893fea68e25fd928daabff5cf034de76062ac1 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/3e6c4b8108da9d5a21b5de4f9dd87d104520fced |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/cffc9957b67584c1f9e4e5f4379a2d091f1e338e |     
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/b36b55c1151482dc373d317c79055d71f264b9f0 |     
    i586     |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/cde239165e2ca23fcd636dcf12be013aaf867ab2 |     
    i686     |        fluent-bit-4.2.0        | NOK | https://autobuild.buildroot.org/results/75144aad018fbc57baaa60070c23ee0d795d9374 |     
    i686     |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/d792eff9ccaf37c42ac6d437067ebf92998949b0 |     
    i686     |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/e8741168d8feb81589799f2b5b121d9c1c1af253 |     
    i686     |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/0931dba40933ab2b709c8998dfe573782f546c71 |     
    sh4a     |        harfbuzz-14.6.0         | NOK | https://autobuild.buildroot.org/results/34a4dcf172e5fba1db8206d7b2f9858da131d6f8 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/42610556a3d3ebc6da6eb89cc52a257e171c32e6 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/14af1c847c09fd8df35c8923194c75931d8a568d |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/10bf5d7b3b4631a35c46932787e56d34b23808d4 |     
powerpc64le  |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/221b234ddb30a13dca3374959e8a7c9e497f783c |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/c662574ea304dfb9b68d384cdf07fa84ff5878e4 |     
    i686     |       host-go-src-1.27.3       | NOK | https://autobuild.buildroot.org/results/dbfa65d4160eca52dd76d3dd66a6aeb1c18957b1 |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5fc88123d5ec01a9dd471b9243e82d7f71e04dca | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3f705d6f8ffe232ed896fb88a6b1822cba798837 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/041009bf0ba0f3953bd5fea63d551726a9010f6e | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/55251ca777da328d7a153efe332924b96becc857 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ac55683b825fcd7c4d25ea438787a59b82246723 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/23c9d2868d73ad96cbb76fa0fa86d05cffb53444 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/611bcca8482dd4bf9d270ed23cdd35a29d0c52ff | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9aa22c12fe43c95aebb12a0d75a4f5cf369b6a87 | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/f473444b22973d45c7ad43967bd5d751403fa094 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/f2040327ad99b4d29b7add4e384a634de2debace |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/485b0200702b76d7c71185d301f21349d5006b98 |     
    i686     |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/c48305dac483a5bf4d8d0db5fe40a21fddc256e2 |     
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/d0ccc9a6bbab39713daf57f9892b0cdca1aff9b6 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/d4901e18ec74e7fe341c7c4259051374534953bb | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/15f1d6b0b33809a8846ccc69fd13e603513ac67b | ORPH
    i686     | host-python-types-psutil-7.... | NOK | https://autobuild.buildroot.org/results/998aceda1f44b69c3af22bc88c0f3d5ea5b3b185 |     
   x86_64    |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/9067e5181a1cdf377090df1f0c53db3837e49a95 |     
  aarch64    |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/6bd0a51bfc4e8e7d363b676050e092339e6a9fa8 |     
  riscv64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/c792f2a2e61462ad25cb936ac3f75c7875114299 | ORPH
    arm      | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/1edbd4147cad00ddd8cbc3cddd8acb7bc2a30845 |     
    i686     | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/373260ec1a8e7519d4881a178d76edfb128152a1 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/ebf49c7a22c3e1ace50a28eb8989ab6a606be2cf |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/0de6c96a6bb29c129a1169ed71d66b071209dede |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/cb7607bf9d7c1526a966494059c5be86d10cf532 |     
    arm      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/6d2aef8876625077b6b26334385ce2bd0e95e0b3 |     
  aarch64    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/c545bec5cbf38463a1d0ea2d6bc5269e3567ad9d |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/66d51e26e6b36bb6c2765bf7ca3b22ee6211d966 |     
    i586     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/4090fb0d0a3b8bee60707b1672c35dada744bff5 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/0fc5a952c9f53e2208652eb2504c0cf7f9256f34 |     
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/501e0790e1e805400008dc300186b44d0386c6b0 | ORPH
    i686     |    libabseil-cpp-20260817.0    | NOK | https://autobuild.buildroot.org/results/a4e1ccb395e43d57ed72ae338d03d70a0069225c |     
   x86_64    |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/acce14e1d09fcf159e7048bcf2dbeae6dbf8de9c |     
    i586     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/1eeb8ceafb0daea679ca9bbac70f416e590ccbd4 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/6be5cbe3e2f345c76348cfb5303d2e03ced92ad7 |     
    i586     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/84da091e07b58648c917969135b71e36efa97440 |     
    i686     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/2f9ddcd21c53fc346ea7df0eb655536cfe4cd426 |     
  mips64el   | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/35e9f6af4a0e897f019ba91ef7b52d69324a054a |     
   x86_64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/a935127e64a8051abd7093586e30b36f42b8384a |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/a8617c08c511046d6fbf522aa86ed3c1d0abfdd7 |     
  riscv64    |      libmicrohttpd-1.0.10      | NOK | https://autobuild.buildroot.org/results/33df0a10f813f61f3b578f0f5d2fcebdcef12b13 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/162fbabb6308362b271f24ce9dbb1c65945ba22b |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/ea36911c6bafefac35998a4d6f7bd23574fa35b7 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/a1b7f17070766bb2160297ab052dab9afcd9d745 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/5e281e938d66e63510bad8fbf0bd77ee2f10e636 |     
    arm      |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/85c8825626736f03fb3d0d545636c5b0aa3e0e23 |     
  riscv64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/696219af1d562c9cbc8210531718d27c2ed82057 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/c917d67041b90522bccf7cb34724df1d33c9e195 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/1e01182e5d8f622e74af91836badf332678786b3 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/3546fb313300122825b43a67164d84569a01603e |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/670cb9c52da64ed8cf5e565fb64b6197a783b00d |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/625225b044ef96933c1c670d5c6de488b7b3c6d6 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/360b5728cca60e72ceabc4b4c2d32882ee102579 |     
  aarch64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/4306f53c524593a15b8c1b387c48c238392d773a |     
  powerpc    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/e76e06124f7298d13af07280f46b13e9dc6fe24f |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/697de757b47bd2ae974f6736624191cb03112a0e |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/4603a1d303751c714499dbc4ffe92cb67ddc192a |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/d670712e5b09f30dd80d4cd5b7eb76337dfbb8d6 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/5fe69b8915338fe41ff20c4a126d8d5cb65e0099 |     
  mips64el   |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/b77559dcdc42843504c71e819886935726bd5b61 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/c33a2c2243c57a8382298a7367107a76a87964f1 |     
powerpc64le  |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/e1da41274a071f955b964db49fbb75579e5bdd0a |     
  aarch64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/ea22177db15f67101a53eb37e2073a80745b9791 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/ff4d45b9eb83582963d368ce28cff4b448473ecf |     
powerpc64le  |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/94475bdefc521ffb4aca2075841c856c455de654 |     
microblazeel |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/b4eb36b8764415178d8d1ee575097d766491193d |     
    arm      |         linux-6.12.113         | NOK | https://autobuild.buildroot.org/results/9b6565dfc186cbc7216a7140a95522518e5155a1 | ORPH
    sh4a     |          linux-7.2.11          | NOK | https://autobuild.buildroot.org/results/f8d6fe6c3e298d6821bae16ba2666477a093caa8 | ORPH
    i686     |          linux-7.2.11          | NOK | https://autobuild.buildroot.org/results/a87b4ef8fa693605430f2f3f80f2d55ce88e44a4 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/6832bb7cdb60ccfe56a0f48a5350cca698459543 | ORPH
  aarch64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/546a3eb925cd6c577e6b0419d8d1d24954cfc8ed | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/100e209f808e2b299fbfa7d364213e7213ff4d81 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/a6d6f6f8ba170e37d2e0ea605ca84ac7ed9fbc6c | ORPH
    i686     |        llama-cpp-b10702        | NOK | https://autobuild.buildroot.org/results/0c98fe3075e93d4a1dfb6ac3537a93c7eb397124 |     
    i686     |          lldpd-1.0.22          | NOK | https://autobuild.buildroot.org/results/aaefc88c5f45ced58ab0b63ce28cbaca30cc8263 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/1305ccd9819edba50eaa208aedc2069db46a3f97 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/e74449b685675e3274f24776a84d3108fb6ee7a8 |     
  aarch64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/951910f2aeef71197dba0b2e8aaada0691839f20 |     
    i686     |        mosquitto-2.1.2         | NOK | https://autobuild.buildroot.org/results/22f86c281d524a08bc03b32612ab6d499a2710ee |     
powerpc64le  |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/e6b009c5e379b4499284f314eb48f3b7172574ab | ORPH
  aarch64    |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/7f7f827886610f766570b1312c80d872b46ca0d9 | ORPH
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/d7cdb98d520b7a361464cd4277ea2e08eec3adc8 |     
    i686     |       openjdk-25.0.2+10        | NOK | https://autobuild.buildroot.org/results/e60c2586b57b8525179aff0f08262ca0dd8c01d6 |     
    i686     |  openvmtools-13.1.0-25218885   | NOK | https://autobuild.buildroot.org/results/228bb36af6ff0d51b7aae9a747d8348db44814b0 |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/e8e405c8d3a2b053d9ab03df3d3259be55985af5 |     
    or1k     |    passt-2026_07_28.f8df3f1    | NOK | https://autobuild.buildroot.org/results/602dc000d3cf42d5664e3fe8ab56543a3a5a79a1 | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/f44ceea524d56183230fca7e8a12c4ee50529292 |     
   armeb     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/f1de21be0454b40096e7f30cffe3d756465e2ffb |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/ab563f5316410ffd49106309dbcbde1ccbdeea26 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/f6ed6db14e1cde68ca21771c1722e44a34c4edaf |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/368c434c97066c4e08e0e9d4276dd8e160eaa9c5 |     
    arm      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/ab707a3e841aa005a3085be1cbb2b42b1e9dda1d | ORPH
    arm      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/1b4dc153e9ebea9a94cad97352ec969dce8e195c | ORPH
   x86_64    |    python-dbus-fast-5.0.14     | NOK | https://autobuild.buildroot.org/results/abeb56e1c0e21eeb8acc457c8289d2ccb626f15d |     
    i686     |     python-pymupdf-1.23.22     | NOK | https://autobuild.buildroot.org/results/61cc36e3639c2e7810164e196ac3f58d5152110d |     
    arm      |      python-typer-0.27.2       | NOK | https://autobuild.buildroot.org/results/dd801f1abe601ecb1f943cf7643024ec2c37fd8a |     
    i686     | python-types-python-dateuti... | NOK | https://autobuild.buildroot.org/results/d249abd724e32e39f087a269ecb0763ceb77722b |     
  riscv64    | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/667600c29752c8da0fe1de991ce26539154a84d9 |     
  aarch64    |            qrtr-1.2            | NOK | https://autobuild.buildroot.org/results/524764bcf20a5962448f5317a3a74e6c10bd827d |     
    i686     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/7fd094e7a2ff767460c7982ed8df27809e291204 |     
    i686     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/71cade6c53509a1caff15f2cb22ed01ca7ac8c43 |     
    i686     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/1190fb4b6c0d6f03272d38be81ffc9c59d5f10ef |     
    i686     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/4934d05b8d2f4461734043332d58c35c01393581 |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/886e4f2471a7c6b5724672adea05541dc75c887d |     
    i686     |     riemann-c-client-2.2.2     | NOK | https://autobuild.buildroot.org/results/6fe08f0970922154ae082ce1ff14c19a1e99dbbf | ORPH
    i586     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/a9b98498c12f65cb1f3cf2be0c6c4c41ab10a5b2 |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/ab4c1e3e33fd82e9237e284e0ebaedfddacb95e4 | ORPH
    i686     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/3b7f3ec717a445d3a95b3bccdbb6c978ace696dc |     
    m68k     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/8ea264b5a077d181a8e4212c746287695d2ed787 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/0addd74a9fbefeba571a495ad51050b2ae1bfe8d |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/4de4459454be809d0a31eb14b0a119dd3015af58 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/372ae498e69621089fd8065de9195d3779d03505 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/3cce766bfedf16965be86dc38b87e269d7e53319 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/cccbdc439b7ce340407d12a02dc3fbaf47bfe567 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/7415e83f1c044af49c6aa6ab541aea17b9bfa50c |     
    i686     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/a78445bd7e6df709d30aeb0dbd26a9d9c54c106e |     
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/5e1f0ffdb5d2c631ed691adbdd7b0c019ea13696 |     
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/e9d96642781b9e6da9a0b934a409d75d0240ae22 |     
    i686     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/6ab59cfc0508d3dd5e2f774702450cbf90bacc36 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/6c22a6a50a8898dec0c8f7d044ab1c827ce0191e |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/4f65f812fb86422b07cc26ef6c3fa0d10a3d8a67 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/0f2178f8e913de3c1af9baca52a53a2c5e3cbedc |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/9f7be9bde1d731accb876166acf3e4a856af172c |     
    i686     |        valgrind-3.27.1         | NOK | https://autobuild.buildroot.org/results/0a95b0536a65e1ceb1a131172c1e824006790d1e | ORPH
    i686     |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/0ca321d6f4fb3edf07337f8d5bcc7ffd167c84f9 |     
    i686     |  webrtc-audio-processing-1.3   | NOK | https://autobuild.buildroot.org/results/117dfc1c3e43e0f847e1067c0a097b07df2a8f6e | ORPH
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/29150dba95d5d673ba483975cbe020859a7c7182 |     
  aarch64    |          xvisor-0.3.2          | NOK | https://autobuild.buildroot.org/results/cf93e53ecdd25aee820cbc4a1e62c27b3b6ec25c |     
    i686     |          zeromq-4.3.5          | NOK | https://autobuild.buildroot.org/results/ed164bdcc09474901b669d7f899c975631f73284 | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

              erlang-26.2.5.21 | 1 
               linux-pam-1.7.2 | 1 
        ltp-testsuite-20260529 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/ead1669f3dba51980a917683d7dde75d40bd7b00 |     
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/a8f93904f9adbe2f10dabcac15d066a82a47861e | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/b56a7ba1ddac827d377681ec84e20d955dbb0584 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 2 
                       unknown | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/c84dc72d026ed8a753b5c75a3eba16335adf8a79 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/1e1dcf6529351f66efdc02010fe6550e3fa7c389 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/7e058bb40f25d2c72a2bb18b472dc9e281567394 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                memtest86-7.20 | 2 
                bpftool-v7.1.0 | 1 
                   dante-1.4.4 | 1 
        host-python-lxml-5.3.0 | 1 
                 logsurfer-1.8 | 1 
python-remi-2022.7.27-37-g1... | 1 
        s6-linux-utils-2.6.2.0 | 1 
squeezelite-71c012ad9ba102f... | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/f2b2106d7a6e77da492756008c892c8ec6ecde30 |     
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/641dc41ef4d9f6a0eee30a7b09a1c3e531de2832 | ORPH
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/c4cc6d64896ffdff7ee1d6851ce5c75c2c672b47 |     
  mips64el   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/b3e91e16ed4f736372ff87e2138cb552b6a090e6 |     
    i586     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/9bd7e8369a7b689782ef3878990dd621581db4d2 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/c9dd31e8ec5d84d44c272c09fbb5ca579a61ed26 |     
 microblaze  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/36e51b72a905a7d72546d8e161a1a414cec82005 |     
    i686     |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/a0bd96c7b0ffe8ebc2ef0ca01d07f536440830f4 |     
    i686     | squeezelite-71c012ad9ba102f... | NOK | https://autobuild.buildroot.org/results/d6b3494c28af4d3fdaf1348eae9fd61696edbc4d |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/8e51b2f8742ce46c88957b862811fd63ba058e62 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
