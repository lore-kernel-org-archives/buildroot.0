Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70847C624D6
	for <buildroot@archiver.kernel.org>; Thu,  3 Sep 2026 03:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B03F440A99;
	Thu,  3 Sep 2026 03:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWoR7uEIMMqt; Thu,  3 Sep 2026 03:25:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6209440A87
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788405947;
	b=c96dxURAGlyS0m+Pqzb2WIYcEmlTEgXXThhiWJe1GQ2MpqELzaXyNyeSP+9ZzXZCfgQX
	 yG1+JOIT/4YciEd1dRTfXVTpEg32EGgPYoHNvOvvMFwk8vzo5EM5uUAgRDopUZY2IOolJ
	 /wSIr8I3T/SPRnYcNnaDNo7Bx8s07ieV2YaPI4VEz+FJ2TmE/cSiMwo3L1yyaNVi1ap9P
	 xbkSNuYcPvGb47pm8nDy1dNl/mOzr+UWoizqDWL5+OFp4TVIE1q0XzV8bOv9Rtxu9ern9
	 CY/AtM+6e/OP/o3c17AIOxT3KvgAgotWTvdXEcHU0eF/Ulr/811nmoIQ9FNvRAuz8Vw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788405947;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ER7LLwi+kB/sHocvdWpCIqIcS4+gatvSvgOzxj2uYpo=;
	b=PB7znclF7dR4wbc0ZK1JyOo60b+vKLTFS/SAKYAtRvxYieBTELkYWXPmeSOmD8/bE3CL
	 dAQzvtXNKYn/cg8rHSVbBaxnmUPIf/r89ojas7wNcSrePQ9a0+F2O95VGXWkuEZcwM9Ij
	 FXjm/puyABzkEhtb7xS7sUgnMw5/ncJID0xsJUoi96st5yzgwgH2MVqghW2OdQnq1RRwT
	 y6lkxCr6CxfqwlCm4cBf0dV1jNjvZjry2oqdYOzptjfFs1dEOsyvNo6TN1ZFpaSMZsBq2
	 fdRTQP5VXlstoHeIWClh6sa9DG5sHJj5D4JdwBOuPULJbbGOkDklYw9Hu/Z8B6nx1uw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788405947;
	bh=ER7LLwi+kB/sHocvdWpCIqIcS4+gatvSvgOzxj2uYpo=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YCA7YVvjhBG46BlcCGI4c2PfAy/Odc3lIHw+VyDSgtm1m62PLtcMC5aZMcEPzq6dW
	 /wVyUe10iNzKIb/N9ewgCEnYSVfYMsXcM8NHhCD5jX3I6tXoGZFU1kwO//nQc8p3kF
	 qXeEX7ELIW6q5t80ZksSni13voDcz0jBHDu9EzyFHKqmIGY6dWilU3uWTfFhWHO2Hj
	 ETFcx1zytDgWAv87w/LBRkxsFUnnwAmHWyjJ1rPR3Ovo3jHChklK37PoGzRzUj6M5v
	 6+6p5riGboN8c2uS5hgJUQVATY4Go493x4/C0blwkZhz3gVrEAOisMnnn7Y3WoUIld
	 nL8/fkeVXLaHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6209440A87;
	Thu,  3 Sep 2026 03:25:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 09A0A22F
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 03:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF78C60840
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 03:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlTnkS-rZ1E8 for <buildroot@buildroot.org>;
 Thu,  3 Sep 2026 03:25:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org ED67D607F5
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788405944;
 b=iueViWVgzpB66lBuzvnwaC8kr1r9ZC6xEM0uNQcxcWjcXhITK7ZZlkwHIAQYTyiWJ5iz
 9+tD/i7mh1UivzvGE6GQrrh+I0aVfSPrY2Aiqe9SumHizwquHef4CKXgRRuZPS8DCTzN6
 6C4Z8fWMgMYHeH+WIsTv5zli9wjrL9pbefV9BIMEfKbd4C7Qphq5Z1fjSd9o/xfl+Q5RR
 qBK07dLAkF4LmpP5Aeq00Ii+xNGdapRCsLXGCvTe1mX9b8Wxh71mQcLuU/Utt6n7kvBE2
 GOFs3B4TtNDs9brWsZZ93t3jgUU+Ad6tEtDMiadlYFiPEmPP2aUW3QRi/1TdPYZ+f+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788405944;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=x+v+h3g8v4XdZ918wf2Ymq7I6fmFUjGyZQ2jzn4KVyg=;
 b=g7XajFE2q8iz0EfmPIGLAgeGns2MDg6C/Gjh1ENAh9u6Td8JRzv4V6sHb+TEA3qI4ZHx
 h98WYvfnL8bO1cJ0bkrnJP/99w0Teg4fg3na2Y+Let36lzlLi59jnY2q+/H1RfrD6oKy0
 KMnyOLgYW3rQSbWuUKfbmVNpPhTer0pQyYLsGfpW3dF+sRkBcGEgYVeK5QkLnytLWI7uQ
 JNPd1JYttvs12xtCU6zJeO+3FMQnCkW+74zD0pt2rqg3e/+zs7dlGEckolBKfdC0yzrL7
 cQ9l2oTCX9dIgWtlR1kGw72r8xgVk4dzJzIZUQL7a0GVg2Op1vZijTWTVxNRoOooX4w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=LNJRpj0P; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=LNJRpj0P
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED67D607F5
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 03:25:43 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48441fa5c37so1268812f8f.3
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 20:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788405941; x=1789010741; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=x+v+h3g8v4XdZ918wf2Ymq7I6fmFUjGyZQ2jzn4KVyg=;
 b=LNJRpj0P3z758HeDESroGAxLcw7eZrP1Eq4KfRKkHYDtYGxNsztZ+GpFsZVdR/IWyK
 /Hm8VUSzDq+foJEieEu7ZHR+Z/DPLNAOoOZVTU0U6JbqTwvE1tzq+dJkBVF0jvWgvnlH
 3aQ8cwTTV9yYX+QCoytV2YT8/2u9ZfVuaSxk86VwJHLlym/G7wdyictV/V7mGQYemqIM
 FnN45LNicU5kb5AO6ikeyStgKlxi9Dc+1/C9InMvTa4Feq3CokiUHZ4/cMQ5AGASIfrR
 0Ub0X5ReBst8fMNScso4LKkH/p1Q9fVpKNDtUj6jdH10r6BiRYGiw3d/iey7iUf+l3aJ
 E1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788405941; x=1789010741;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=x+v+h3g8v4XdZ918wf2Ymq7I6fmFUjGyZQ2jzn4KVyg=;
 b=oVDyqmp4EHgx7QIT6TyRj9ivMT+7CTcXiEjMpK9sUSLRSk4Lx3We07LbY6V2qmssnj
 dZnHID9vS21jGQQS1G5uTSFyUtlinNt/S6TYsLfHWJOfEoMf8GGnJ3ArWDkUXdlA8+Zb
 j9aEhmM5mWpY+x6sE/fN76Mwx8srucm+kcO5VuFAta0NQQaWTJXD7bxhm4SfnlFt/G9z
 GcZZdbtYcW9RVNegYPJ91HyI/Fw58DK2Ak8wK/S+dJeXUmEZvn9mNTS/fTU8Qd6mmi5B
 G/UBhjx60EK4dX3wArsrQFAERAjDRQzMSXZAgDhGxws/+yoyApM+p6uAMNxA76hV6Vz2
 Plhg==
X-Gm-Message-State: AFuF++k9N5bmRKJ4nioO52vqacelAKXSGlw//bjveWZdTgv3G11p1Gt6
 L0wk65qL4KyzWYYEpyK2fuqfarQSGj4I1eUyDZmnQtxGGHjtNi6DywmCv2H8UigL
X-Gm-Gg: AYBFou3saw1+9cW+v1lOfcIa+TNoRfUozxzCtvh+teydWS60hKfuQlOFznHHqPf9nVB
 c8q85XVFFHWBcwA6ZIImDJuyWIv/ZemFgmHMftTOJQInhuK03Q+E2GbgYgOL35EjlQ57Jus1i8q
 Ar56KZ2OnRuBNCJLoqsUf0BXBkgbe1L9/vt71SdpR5/xKn+DwAXF6RFkKdgu40RgWd3KIp6lr4C
 MHNqIELUQIfxE8kP0xOJSk/zCxuXd+grK7t7JjAJ4hpq1Q/yYF10oXCERjdrn6edDjxBR9pMefV
 nlT4G0zZjr3cSSlQS2K8QLlQ53FIWeKAYZ2/hLb1C6+BNUztX3ivL/yR9cvn/hU+OxdAA0LLDiz
 HW2GqVVHPmFbc3hUgWzzt2WpeKDU2ca8lvaNG6ggmHHQ2mhxYXNZ1mDxWB+KDkH6nt07VYcD7tJ
 qycCEyF4DFAZIyZYDiBZxcd5E1XxI1v+cMAEpm8WxvLJqOdmzNg0jc4Bz6nU6giZE=
X-Received: by 2002:a05:6000:4b02:b0:482:f528:be4 with SMTP id
 ffacd0b85a97d-48488f20a04mr19683591f8f.16.1788405940933; 
 Wed, 02 Sep 2026 20:25:40 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448eea96csm8690406f8f.29.2026.09.02.20.25.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 20:25:40 -0700 (PDT)
Message-ID: <6a98e8b4.0823b035.10e876.9d96@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 03 Sep 2026 03:25:40 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-02
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2026-09-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  | 21  |  0  | 28  |
  2026.05.x  |  3  | 10  |  0  | 13  |
    master   | 37  | 72  |  0  | 109 |
     next    |  5  | 14  |  0  | 19  |

Classification of failures by reason for master
-----------------------------------------------

               linux-pam-1.7.2 | 3 
          lua-lunix-20220331-1 | 3 
             dahdi-linux-3.3.0 | 2 
        edk2-edk2-stable202602 | 2 
                   gvfs-1.57.2 | 2 
    host-mender-artifact-4.4.1 | 2 
                openscap-1.4.4 | 2 
               pulseaudio-17.0 | 2 
               tcf-agent-1.8.0 | 2 
                       unknown | 2 
             alsa-lib-1.2.16.1 | 1 
                   atop-2.13.0 | 1 
                    attr-2.6.0 | 1 
                   bird-2.15.1 | 1 
                  boinc-8.2.11 | 1 
                   ccrypt-1.11 | 1 
                   exim-4.99.5 | 1 
               fetchmail-6.6.7 | 1 
                  ffmpeg-6.1.5 | 1 
                flannel-0.26.0 | 1 
  gobject-introspection-1.86.0 | 1 
           gumbo-parser-0.13.2 | 1 
hare-dbus-e9a89f8bc5ce783fa... | 1 
          host-automake-1.16.5 | 1 
            host-go-src-1.26.6 | 1 
            host-mfgtools-0.02 | 1 
              host-rust-1.97.1 | 1 
                host-wine-11.0 | 1 
                  iozone-3.508 | 1 
                     kbd-2.9.0 | 1 
libdill-32d0e8b733416208e04... | 1 
               libepoxy-1.5.10 | 1 
               libgpiod2-2.3.1 | 1 
          libmicrohttpd-1.0.10 | 1 
                libmpeg2-0.5.1 | 1 
          linux-5.10.254-cip72 | 1 
     linux-5.10.254-cip72-rt32 | 1 
                   linux-tools | 1 
        ltp-testsuite-20260529 | 1 
           oath-toolkit-2.6.14 | 1 
               openblas-0.3.34 | 1 
                 pixman-0.46.4 | 1 
                  prboom-2.5.0 | 1 
          python-grpcio-1.76.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
            resiprocate-1.13.2 | 1 
rtl8188eu-cca7c28087db740d7... | 1 
rtl8723bu-ac3d2f564bdf6816f... | 1 
                 rtl_433-25.02 | 1 
                 rtptools-1.22 | 1 
        s6-linux-utils-2.6.2.1 | 1 
             sofia-sip-1.13.18 | 1 
                 systemd-258.7 | 1 
                    szip-2.1.1 | 1 
                  unifdef-2.12 | 1 
          usb_modeswitch-2.6.2 | 1 
               valgrind-3.26.0 | 1 
                    xen-4.21.1 | 1 
                 xenomai-3.2.5 | 1 
                 zabbix-7.2.13 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/0f79e462496bea9ed036eddd8726883296c5c53f |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/ec4f66b6d96901d5bed97c2fff1ca452bae4e766 |     
  mips64el   |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/4800b5d2421cfe06e4335acfad5d05108077b0d2 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/5d7aa7a2e5bacad9bacdc83538fb9b6d0c220575 |     
    i686     |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/ed3ce1f27d67b24f1ef12f17a05864e40a74ce5f |     
 microblaze  |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/c8bf97be17d59531412a23d3ace276b6447ef7d6 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a62213effa4da65a85ceef03fe8e680466fd5319 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e5edc781c0542b18bd7a9e48e6ef217730e2d186 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/06c70b3b069d79716b3841cacac76672cfa01809 |     
    i586     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/c1a702f2af3a32106a647593af0f4084b3684f8c |     
  riscv64    |          exim-4.99.5           | NOK | https://autobuild.buildroot.org/results/ff7783876dbd8d8fe49ca0680444bcf089f82f93 |     
   s390x     |        fetchmail-6.6.7         | NOK | https://autobuild.buildroot.org/results/339fae06170369c52289b4890bcbbff96d0d7ac6 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/b8f487f396ead917d409d50c07e6b8ad21bb481a |     
    i586     |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/7f9a33239ea440b65fb2ea09154dc86e1bad7b6b |     
  aarch64    |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/9e201529ad2f47558983e106929767dec0a520aa | ORPH
    i686     |      gumbo-parser-0.13.2       | NOK | https://autobuild.buildroot.org/results/44ba0788cc43eb4c2087a30864d896713b5a1be9 |     
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/a16c090f25d7c018f8224333c435bfde8c63b0e7 | ORPH
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/f60c1288085d1d1bca7c702b3642544062619cfe | ORPH
  aarch64    | hare-dbus-e9a89f8bc5ce783fa... | NOK | https://autobuild.buildroot.org/results/c483eb947399decfdd2e5487680678d040c0f7c0 |     
    i686     |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/201f45bee0372bb33d81dc45d44eb5df13e3b650 | ORPH
    i686     |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/49e132977da390aab8ea4a17f552b1f60acfff0e |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/f30ea31758294e1b218cb39cbb303f4d14081730 |     
  riscv64    |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/f39b8da576f180ba9616e7d52f90a09ab35ef70c |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/2d797198732acbe200bb9f3c060398ec7bfafd62 |     
  aarch64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/645e6231f9b3ade06f347461db7f96d41c3e622e |     
    i686     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/f936bc09ad967300fb8ec29a8b26d900160de942 |     
  aarch64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/b6915c1cb0c053ac2c17ac03a1e8e230a38ceb31 |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/aefb7ddf6c9d62bdf5447ff98e4ec16dfb6ed1b9 | ORPH
    i686     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/cb505c845cc3b529eccc6f96c9d8b3d6c54902c2 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/d8dcbbb53475fd79b42bfc8c020792a617940d25 |     
  riscv64    |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/75bb0c331d58770de668104692c4ec2e6d3dc315 |     
  riscv64    |      libmicrohttpd-1.0.10      | NOK | https://autobuild.buildroot.org/results/1040c402ad584fc413874c947fdfcdbce44bdee6 |     
  mips64el   |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/593d59e168f976b5016e7cb978f771cf4761413d | ORPH
  mips64el   |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/c9c66a87577ac280779cc7583b3366cbb4bd5c20 | ORPH
    i686     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/5ae5337c7532b62f3c176b508d9714d99df884b5 | ORPH
  aarch64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/8f8ad5981ce8d704205bdbb8748ef5a8984b1ab1 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/32dbcfb166e126d5d5119236270edc64233f2b15 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/02d710b36866536c936c47e314563daa269f8b14 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/86c2123968588b4cad59ccf36cac3acd97e9ee2c | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/d09d611805f7a5ed1ccf7a654dd38562f0a51e46 |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/9032be622d2b3f54f0739814b9a891c497393d37 |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/09e5bb54e701ce8fb630cfec980a6f6e21ed89f9 |     
    arm      |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/847a2c070d61420713a8ee720f659e853bc4dbc2 |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/89e8076887eed8e87c9207da3cc799986ac18271 |     
  riscv64    |        openblas-0.3.34         | NOK | https://autobuild.buildroot.org/results/9c6ac0b60e7b362290cffa9e1acef73ea8823c48 |     
    i686     |         openscap-1.4.4         | NOK | https://autobuild.buildroot.org/results/70147699ecd39c3e5634c33fec64ec6ad65eb5bf |     
    i686     |         openscap-1.4.4         | NOK | https://autobuild.buildroot.org/results/7a40d4ca572a9791adcdc705352ad4371dbc54c5 |     
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/26b9c839c91e50eba26a483391e32da48fc1a7d4 | ORPH
 microblaze  |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/4357658244d5680731b477c64047a2758195f02e | ORPH
   mipsel    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/784971c4bec09bf9ba47d72321c6742a868eced9 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/3d899363bf3b06c110c45a8f71e1dcd169591754 | ORPH
  mips64el   |      python-grpcio-1.76.0      | NOK | https://autobuild.buildroot.org/results/90405c0a3d0b2e929d5074305906e6fe3679298c |     
  mips64el   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/cf84aa819240a1f37a6e7bfc4029fa54cebb4443 |     
    i686     |       resiprocate-1.13.2       | NOK | https://autobuild.buildroot.org/results/de05171d1ca85e02158e0e0d339d703a47fa22bc | ORPH
    i686     | rtl8188eu-cca7c28087db740d7... | NOK | https://autobuild.buildroot.org/results/f801462c1036810fbf48cc9ccb78e4e0c15085e9 |     
    i686     | rtl8723bu-ac3d2f564bdf6816f... | NOK | https://autobuild.buildroot.org/results/35dd4da539ff444580c7a4a51e2d35052ec85c72 |     
    arm      |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/5e2a53df915efd8a43a234e16a00a70b83024f5f |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/80d234db16608063e8cabb85cfc8eb453be7b422 | ORPH
    i686     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/6b07c848be9abfad9468aeefa4b677681def6a37 |     
    i686     |       sofia-sip-1.13.18        | NOK | https://autobuild.buildroot.org/results/25bde2b174d272054cbb2b50d7facbd2df02d1eb |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/95a11b549db0caf3d1f35a2a4961248a7e63eeda |     
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/6ecf85c3f83c9a1a4558f03558d93c591483b960 |     
  aarch64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/809d0ebb286b5ac8b8aa7f480e2c681f0a2ce1d4 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/3fb6b43f847f433aa4f0fde732fc4f0be205cf40 |     
    i686     |          unifdef-2.12          | NOK | https://autobuild.buildroot.org/results/fbdca9aa7757014f7a08195b1b2bd43821e33efe |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/1c95ddcc2b24e535c217605e6a3a7e831a793719 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/2fcea16e75235e0555e53033cb66cd14e29c2a6f |     
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/743edfbb4bdd4fb4c60726c41208277a8771c108 | ORPH
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/e2dc8954c623b166e4cbb05b192a999fb3b77204 | ORPH
  aarch64    |           xen-4.21.1           | NOK | https://autobuild.buildroot.org/results/fd4a281348ac5dbdaa45c4b56798c92c040ff437 |     
  mips64el   |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/a77fe1b1ee1b2dc9dff51816f1f9dd806701cd1f |     
  mips64el   |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/cbfff764d345e17d7d7bff4a560e1713a38b771d |     


Classification of failures by reason for next
---------------------------------------------

                 avro-c-1.12.1 | 1 
                   ccrypt-1.11 | 1 
                cryptopp-8.9.0 | 1 
                   dante-1.4.4 | 1 
                           gdb | 1 
  gobject-introspection-1.86.0 | 1 
               libgpiod2-2.3.1 | 1 
     linux-5.10.254-cip72-rt32 | 1 
                  ntp-4.2.8p18 | 1 
           oath-toolkit-2.6.14 | 1 
                    olsr-0.9.8 | 1 
package/vim/vim.mk:88: host... | 1 
                 rtptools-1.22 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         avro-c-1.12.1          | NOK | https://autobuild.buildroot.org/results/1b9a3e58701d94a6b78266c9999ac4e4868fbecd |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/adbcfcee42924462ef4f112a9b0282b705a68e04 | ORPH
    i686     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/fb260bde6244a4ed26269af8c1aacd079603333e |     
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f1b11ee4cc9d2e6c26a7ea942a37e7636287a055 | ORPH
    i686     |              gdb               | NOK | https://autobuild.buildroot.org/results/9850ef52bbd5048919f69fa30ac8ba388d36be08 |     
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/f239af4d9ff50cefccf680a32648a4a5b02b9142 | ORPH
    arm      |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/01e3c3abe9d2e5a43dbcf28d64b1f627ec018c9b |     
   x86_64    |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/d95f78abdef0c2cd5a936d63097aa3ebefcf0071 | ORPH
  aarch64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/0567b5ec2113a74f9fbbd2d2b466ba0a92bc2276 |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/e08642fb0856b520c392b0ef86b62bee095c874f |     
   x86_64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/4920343e013721d84e1974268cb3649064880692 | ORPH
    i686     | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/f7cc485880dd36adaa4ad3cb394cf6781ea727cd |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/741d247c40ae7bba22eefa805bb5a698eedc4b8f | ORPH
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/a2ceb150dce549c998baf5cd750b31b778811289 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

          host-xfsprogs-6.19.0 | 2 
               tcf-agent-1.8.0 | 2 
                acpitool-0.5.1 | 1 
              e2fsprogs-1.47.4 | 1 
              libeastl-3.27.01 | 1 
               nushell-0.108.0 | 1 
package/vim/vim.mk:88: host... | 1 
                   perl-5.42.3 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/b899d289ec8900d41ddc471e09ff7fbad7d0ea2d | ORPH
    i686     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/46cfe9f684575de48d750fdf0a889c1ae454ec05 | ORPH
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/12692d9110ded72cca019bef694c38ce60248d87 | ORPH
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/579a1072312ee92411a8abe4c92a820c83fd9ccb | ORPH
    i686     |        libeastl-3.27.01        | NOK | https://autobuild.buildroot.org/results/34b491a89f0e25bbfd1837b34b4b1d2664d5f479 | ORPH
    i586     |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/26150f075777d0d36a5df9388ecc04daf56a59b6 | ORPH
    i686     | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/edc9937082bcce6e2774664fecf7c2619ea48516 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/4b2a25749faab063e0d1f65ebe9eb56c48332053 |     
    arm      |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/64bb899819386a4f3ce97fc6fab39ede513c98bf |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/7d334a462d85a0dc3f70172134e6e161bf24c508 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        ltp-testsuite-20250130 | 2 
                   bird-2.15.1 | 1 
                    brltty-6.6 | 1 
                   dante-1.4.4 | 1 
dtv-scan-tables-7098bdd2754... | 1 
                espflash-3.2.0 | 1 
                 fwupd-efi-1.7 | 1 
  gobject-introspection-1.82.0 | 1 
               host-ola-0.10.9 | 1 
          linux-5.10.246-cip66 | 1 
                linux-6.12.106 | 1 
                   linux-tools | 1 
           oath-toolkit-2.6.12 | 1 
                openswan-3.0.0 | 1 
package/wine/wine.mk:347: w... | 1 
                   perl-5.40.5 | 1 
python-remi-2022.7.27-37-g1... | 1 
             python-webpy-0.70 | 1 
rtl8723ds-52e593e8c889b68ba... | 1 
          sphinxbase-5prealpha | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/5daca60821c6d863bbb438583d5d2c6720ed91b6 |     
   sparc     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/dc6a83f47bce1f3fb3b0d51e7fab08126ef37d52 |     
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/9214091f2ee46f023f75ab328f692bc2bff72205 | ORPH
    i686     | dtv-scan-tables-7098bdd2754... | NOK | https://autobuild.buildroot.org/results/19eed6bdcc5209462b2b66e9bdbbe2a47ad5e3a6 |     
  sparc64    |         espflash-3.2.0         | NOK | https://autobuild.buildroot.org/results/37d5de10fd46cad1d8b2aaf6bde43a9f933f1cb6 |     
    i686     |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/b8406b5410b6ae8b2d49b2a900d052d55cb5efcc |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/da6059bfd8f0485d1dac59d5a22ec015efb9cf22 | ORPH
powerpc64le  |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/dbfeb6472844652144f4ba4e88d526e7b8a935f9 |     
  mips64el   |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/a8ec5880fb77bfaf3ae348bf925d97777c7a40c7 | ORPH
   x86_64    |         linux-6.12.106         | NOK | https://autobuild.buildroot.org/results/90071da3d93dc3cb8fd84c185077d1048683430b | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/e403cd25ce6389d1a6d804380ef5924feb8b6287 | ORPH
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/5e1ef99c6910e58ff18e813d11590cd6597be236 |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/4250bec1442c002ca0ee0b059274bf7c8fa57123 |     
    i686     |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/236fe10a1ba762e5bf39d33835b8c19666f2d1ed |     
    i686     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/cda9f35ad05a2e9c83442560a0f64550fe44be40 |     
    i686     | package/wine/wine.mk:347: w... | NOK | https://autobuild.buildroot.org/results/dc948cdcdf947a9f6de29380cf54137523b6c1ce |     
    i686     |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/e7a07451c1eab685fbe6b0fe01ce205118e6768c |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/223b37dffc9e8f6c73a60c10cb45a9e0e0db4e74 |     
    i686     |       python-webpy-0.70        | NOK | https://autobuild.buildroot.org/results/2ee03b1945c818116185e8e6e4dd6ed715dc6c8d |     
   x86_64    | rtl8723ds-52e593e8c889b68ba... | NOK | https://autobuild.buildroot.org/results/bf013f042ac2e4d45eb8bc01c074e29df523c6dd |     
    i686     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/5c8b39ca4b1b0c09bb8841dd830059d1bdb98225 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
