Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C651C606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 03:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ft+ho4cQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dkvIFKXU
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7213A815C3;
	Sat, 24 Oct 2026 03:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IbZVaw5xd4AS; Sat, 24 Oct 2026 03:27:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6719A8166B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792812450;
	b=UfOsdq5l1aMX4JQETE69JIQUIhnDm0bD9x3IsEoG+TeMkKAgiTzI1q6+ooUpYE/SKude
	 vpZ7+J/ScS3lhB8Bas2dAp+IuzO5jfmMmmXCBm/Dlxk/4aukatohT7cUR0ri73LgKDfdu
	 87mboXzFRlvrN/o4SiObC9v/MKcqCxrMNyOO8K/CqaNYpGJKHe1x30ufmOuMb0I3hDjhp
	 FMzkVxap40nWiL2f2HRbTCBEZ1MgE/FFJv/UYVyZbYkeDRQKKMU+l2nMYQLai4WraQDCg
	 WRtReSFaECHH+a67LVFLD9iQzPGN/92AChfPyC/KelvYnIxZLSou4a/DSM8hXtDt4CA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792812450;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mWiT1IdcC0LsEg4iWIAS2Dm7Ch42/THVinkdG4hbPYY=;
	b=OEdL1gtfM1y2JzveyQWhbT9LvLjONjYs2aUmvmr0Oso0qn7s6jWqIVS7UXGqbYTjOR4X
	 F14dqUKdRwdhm5F8veLXhNjwAkqLw9lA88tghqt071tjyEpJnz33mF+UNV9xSDVuDvgl/
	 2R9diSKQmGmD3lAi5gXj/plrDvQnPcT4tFHxmdemdYuviR/GMpS9DRWs7zE/Nw3qjCT3V
	 b1CV7bAQbEt2z2SbNXH3xrJ8NsiRGZLp3gTGMBQV7SSAfiWsprAHMKPYSxSl+seAMN7hq
	 Qaa23pUVPay8KZuPWdU8lpztnurBU3HgslmyQzuHjEhh6h3EWTB9QiTXOFmSo+VoBOQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792812450;
	bh=mWiT1IdcC0LsEg4iWIAS2Dm7Ch42/THVinkdG4hbPYY=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ft+ho4cQPPGwK3XaZT6q1/Gw55OtR+53jvakl2Y8kk5ZDouhUacPvRGrT/oS67KZk
	 8KiE7OMgc+kO5wi/3hz7UE78el11UAIA+mj8afDbPg5I24L7DKArOvyV4RDVzhL0nc
	 QHQwpSS0h/WqAuB6RZDhBiKo9MPoKm+/CZF3THC3bkIdhb+ijEFkd6hPaLK1VhS9eT
	 dn53epR4bZqIZytY7nZDEXKDjV8k2tOPmy8rYgReShiCFOyZIsUWZbFeu12T6Rp3vg
	 rTARKMjVhRs7xT1s5EYgN9BeEejJkVGuNYR42Gp5sGbcmLiLeqkP2lelgI2OehdSVS
	 JLoG2JxaOsDqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6719A8166B;
	Sat, 24 Oct 2026 03:27:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D92FB43
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 03:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D70CD4009E
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 03:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mOIun0gCYoyJ for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 03:27:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8285440068
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792812447;
 b=NnzOWMWHL9X87zqtXd/1AE7aaR/gLhFPEvfM9g3RL8rp5pTwJV/mTIUdd1R/T5hECMom
 iyDAGPvOEQhVzvRqNe6v8k8fwT3v3tV4Y7emfDjUVCyZFkUhy8HKyNrh84FoNKcsEPM6W
 z16TblqYYs2rPDLnw2bYYFsDnoHt83AkaztWsiBXXQigH46Tju9HUvcpt1v9T/jZXTBmd
 R8+HXVHKwOiuGy+i29f6BBLAaRyQzlA25Uc6eUz+WfINgspceVm9+F3U0+O4jZ1EgaHFO
 9MsTzbbEsKPLk60CfzPOLfdjdi1A9PK37HmYsoiQNDYJ8U9xuDNCtQRaHbEtAzMfj8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792812447;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=w7sWMUWhbdzkaK7S1Ct1cEW/FQWnwy0xWKRJjLF3BKU=;
 b=Ye/7YKCE/teiTEsvrC+Ds9/7dnEgc4KzK0ra2wo1WIenqa64MgowJvfPsKOq1Il9OR9c
 nXio8X4i55Xd1X5Hx3nkhkkyGf+973x53uiOFlyA4ZzIR3G0RJB44UJ4dpmpNuRNXMFKY
 XGeBDUbM8lXkqFIHchlDXPOv3aExzrbd8NjALaebUoSrYNuYlkxEjDbfhRm/Q3u+c8Im5
 0l4CQt4UlEhwhdIZWaaUCViVlXeXczWmlaPZUIWfvkWJRiGU+WybrKuDdK/sjI0YQDyuy
 sRJjcfN39UF/m3Qtm8cJtKY2hIzfMPEgkGVUb0kjL+ORTDzL8tXlwXWUON9/lv94mQA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=dkvIFKXU; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=dkvIFKXU
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8285440068
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 03:27:25 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso1192495e9.2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792812444; x=1793417244; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=w7sWMUWhbdzkaK7S1Ct1cEW/FQWnwy0xWKRJjLF3BKU=;
 b=dkvIFKXU9DD6JGCfH6pArA7KEY60FJXrKO/DmS9uECpmYDRrBm5LAWluJ7bl+8jgqI
 VgwYqiS7hV/2f0IQu7/CfbqyvCOfPTbHAeuv+hrQeflDlklnn+mP75x+OIVOrfQWo/NX
 DfF0D7nt98j+eWs+B66kZcQ9s6afwxCJgeQRgISeDA1QKDFhJlpJshUsStadfmGNtAJ2
 zjAzbKLNN4UdENFCmg9wYRIuy28AZLtvGpgYAThJirQc6Q4YGy9z7miCmh8JXzNVXG8Y
 Q8ubt1NLx6+K5mdt1goeto06SG7hrhF9Ex5+PJbK+3ytCDTUjJktXfrCFUleZwVv4kil
 WbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792812444; x=1793417244;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=w7sWMUWhbdzkaK7S1Ct1cEW/FQWnwy0xWKRJjLF3BKU=;
 b=2z4SXwaJGinZSedb2Nn4pX2w3Yy3JdiGagld0jlO9zNYsQoHhdMDqyyrRX7pTgwjDo
 IeO2tXWtP53OxYMV6BCXk80qMmJ897RmO7rAhL67Zlz2LgE555icFao4SbjHC1Q9hbK9
 WBDR//of7EFRaYMH4AJUfZqzZzP6FEv2Lbwu47X5y+cX+RdAg5rkWpd+wvlRpavEdVV5
 g/hsAPDZ894vawiVJw11plD+qZDzYAMQoz3j21jwvYjmSbqiO8gwFzFFzmZ4tdcxHYhr
 1gpvdIS6qv4WUdbQY7cQs/zTRQDwZQcSNlwHaSZtkjnvdJF5R9LNocIrEY2odaWx6DWa
 4jVA==
X-Gm-Message-State: AFq9FYLrDxQ0sgWb/rFGL73JV56DXvFs+RU5npLlMh8QwDS8tDfGqI8e
 5UnhgpuljoE3ak6TzJRYkGK22tCKMSF4dGCeLiqy+1cTMzmaFj3AtMZjUOedN9gF
X-Gm-Gg: AYBFou2+pDYwxgBlFhaMH7Xm6mhq/f/ThwQf7cVuM2pE/i6n+4fjW0H1AVHOdfy3zMb
 YyLMjReTTh2+zipiShsMhkB1sALulWcagPT0gghv25sL84kO5JcxMAOMav4LI+m/wKxH18v1w2F
 B6VEtKdaNZUyLAJCMR8Fr1O/1Trf6ui2OyBuZmYPU6ahHA7x6e7Nq5cQTML2aBM4R+mZwkWaSav
 JeYyU2TGqH11iZ8ku/4LVd42MpT5dewZrr9PFHFImWK7yvdOWwu6ogi47antN8xlS9Bwl4NAZhs
 /G9pr+1YwMu+zYVX8ivnl2L9wcKs/xapzPyPp3pVF+uGDmuxTNqOPYDag+MBavn9WFgzqrbiPl3
 RpA/xzYmMGFKtBrcCNENnBifbEMZxBsU2+eY28SPJo+Ek6A++fEiELUEJrZGQ5efCGRyPmdcBeC
 SaBlfJirj12Xs2bfZ28nwwyAA87uoV5g/qbn2P6Llkx/nPw9cr0QchByrbwDh40RwvCe6plPNWr
 OC37JJPygUvt5UtZMZWPSnU3zjUiUeWud/HXuMyiXudEJmRqTFwcoLWyS50
X-Received: by 2002:a05:600c:a00b:b0:4a2:e0c:2b0e with SMTP id
 5b1f17b1804b1-4a35acb1206mr9748505e9.22.1792812443540; 
 Fri, 23 Oct 2026 20:27:23 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a00e1b0sm20945775e9.3.2026.10.23.20.27.22
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 20:27:23 -0700 (PDT)
Message-ID: <6adc259b.a1420ffd.1f4346.2200@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 24 Oct 2026 03:27:22 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-23
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
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

Autobuild statistics for 2026-10-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  | 11  |  0  | 15  |
  2026.05.x  |  0  |  3  |  0  |  3  |
  2026.08.x  |  2  |  1  |  0  |  3  |
    master   | 38  | 139 | 21  | 198 |

Classification of failures by reason for master
-----------------------------------------------

                     host-rust | 21
              libmodbus-3.1.12 | 11
                  chawan-0.4.4 | 10
                host-odb-2.4.0 | 4 
python-types-python-dateuti... | 4 
                       unknown | 4 
                 xenomai-3.2.5 | 4 
                    attr-2.6.0 | 3 
             dahdi-linux-3.3.0 | 3 
               ebtables-2.0.11 | 3 
host-am335x-pru-package-5f3... | 3 
    host-mender-artifact-4.4.1 | 3 
               iptables-1.8.13 | 3 
                 libclc-23.1.3 | 3 
               linux-pam-1.7.2 | 3 
raw2rgbpnm-f28b903ca63b4c22... | 3 
am33x-cm3-fb484c5e54f2e31cf... | 2 
                 host-gdb-15.2 | 2 
host-google-breakpad-f49c2f... | 2 
                  lldpd-1.0.22 | 2 
               madplay-0.15.2b | 2 
                   perl-5.42.3 | 2 
            18xx-ti-utils-R8.8 | 1 
                   atop-2.13.0 | 1 
                   bird-2.15.1 | 1 
                  broot-1.60.1 | 1 
                        chawan | 1 
                   dante-1.4.4 | 1 
                  dpdk-25.11.2 | 1 
            dt-utils-2023.11.0 | 1 
        edk2-edk2-stable202608 | 1 
                elfutils-0.195 | 1 
              erlang-26.2.5.21 | 1 
            erofs-utils-1.8.10 | 1 
                  ffmpeg-7.0.3 | 1 
                flannel-0.26.0 | 1 
             fswebcam-20200725 | 1 
               gst1-imx-0.13.1 | 1 
                 haproxy-3.4.4 | 1 
       host-gcc-initial-15.3.0 | 1 
            host-go-src-1.27.3 | 1 
              host-rust-1.98.1 | 1 
         host-ti-cgt-pru-2.3.3 | 1 
          host-xfsprogs-6.19.0 | 1 
 ibm-sw-tpm2-rev183-2026-08-26 | 1 
            igd2-for-linux-2.2 | 1 
                   iotools-1.8 | 1 
kismet-52bcb902e36b2df1562c... | 1 
                 lcdproc-0.5.9 | 1 
                 libclc-23.1.4 | 1 
               libecoli-0.11.3 | 1 
               libgpiod2-2.3.1 | 1 
                 libzlib-1.3.2 | 1 
     linux-5.10.254-cip72-rt32 | 1 
                   linux-tools | 1 
                    lua-ev-1.5 | 1 
mali-driver-fd0865346db356f... | 1 
                 mdevd-0.1.6.5 | 1 
                  mender-3.5.3 | 1 
                 mpg123-1.33.7 | 1 
                  newt-0.52.25 | 1 
                openssh-10.6p1 | 1 
   openvmtools-13.1.0-25218885 | 1 
            optee-client-4.9.0 | 1 
                    pppd-2.5.3 | 1 
                  prboom-2.5.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
           python-zlmdb-23.1.1 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
                   qemu-11.0.0 | 1 
                      rtai-5.3 | 1 
rtl8188eu-cca7c28087db740d7... | 1 
rtl8723bu-ac3d2f564bdf6816f... | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 
        s6-linux-utils-2.6.2.1 | 1 
           sane-backends-1.4.0 | 1 
                    sbctl-0.18 | 1 
              shellinabox-2.20 | 1 
                 systemd-258.7 | 1 
               tcf-agent-1.8.0 | 1 
                 uclibc-1.0.59 | 1 
                   uhd-4.9.0.1 | 1 
ustream-ssl-5a81c108d20e247... | 1 
             util-linux-2.41.5 | 1 
           virglrenderer-1.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/25e1611bb63b268ffc4dbb312beb9de965b28bee |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/ed7d595b3408c1a0bf2736f68d8bc07ee35e4d83 | ORPH
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/a4e29db134be8fa160e1db4f6174c0db97f23b1a | ORPH
  mips64el   |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/db8454c8de05c16425bd920feb120cdf0d1b4b85 |     
   x86_64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/6741e5cabecc44afbcee02d630eed62741b37775 |     
   x86_64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/77e97f8cf39a4549b99fafefc45e0acd3e3e20c6 |     
   x86_64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/af67fb01c9132239840b2d850c3a60532768488d |     
    arm      |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/5ea06850ea117e5e3fd0106bbbe9160f7ec96db5 |     
   armeb     |          broot-1.60.1          | NOK | https://autobuild.buildroot.org/results/7b0256c64581ef4e426a959d1d3e0427fe5916f4 |     
  mips64el   |             chawan             | NOK | https://autobuild.buildroot.org/results/90e5d6c5da9d1ea7cb299471ff86bd01f6ccadc3 |     
powerpc64le  |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/5af013fa4154fe4e4d0bd19f074a48cb071f5ffa |     
powerpc64le  |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/9ef71ce86fdf877bf99397fb3d48897d74a36da7 |     
    i686     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/d859694ab5d28ffd101374bc22c3ff02b4348043 |     
powerpc64le  |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/fe17b59fd98759cc9de8156e4a71e60d942dac39 |     
    i686     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/d0e9a0d521639ed26ec3f2acc98a464af5c5a809 |     
    i686     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/915135b14f0ac350468d14f73aa7ffc03da8aec8 |     
powerpc64le  |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/d8a583389a5c773048af7b72f889dddd64fdfcb9 |     
    i686     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/6dcb7476adf6b1d696f8b9a9a41253672e487e94 |     
    i686     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/0f143abd7dd51c3aabc5096a916c3eed1de54ad2 |     
    i686     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/4768c4ab383bc720d61f6cf3adf6828ce510dad4 |     
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/675efc95b58b5179127c037dd531a2dc559df4d8 | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/aa4a2322e8b894338fdcbd02b96086a2c0cd43b4 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f98d342da17f96763651c425c6bb0a4b151653ad | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/7c807f73a28d0f499d75ae00eef56b9e94b18017 | ORPH
  aarch64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/e0819e2b4754b2616e001523fbecd551fb01d78b |     
   x86_64    |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/c22e826352b0d7861e62ead1a1c21bc8594d479a |     
  aarch64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/1592718d493415d7f1bb54b34f56a46a985f23c3 |     
  aarch64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/1a05ca7276ef86510ac75e4812aca53eaade56fd |     
  aarch64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/fe2742da97a1f99295add998b3a3c884ae0aec25 |     
    i686     |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/b8b4e77b961044b845130603a8f99cbb8aec39ae |     
   xtensa    |         elfutils-0.195         | NOK | https://autobuild.buildroot.org/results/77d650e11ca992c070771c1301858665d72122fb | ORPH
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/9af131598454b016fcb4a7303c3f057e4550a159 |     
    arm      |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/88a82e55f03dc32ae30a622286a9772ff5b5246c |     
    i686     |          ffmpeg-7.0.3          | NOK | https://autobuild.buildroot.org/results/c3ae9a6e6f6c4060feaa1d62dbc2b08da2437f38 |     
    arm      |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/5500e07c74e4fe26921769de69ff7454cfad0862 |     
  aarch64    |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/988373b9d7cc5e56d8ed62465fcc5d3b4b56d704 |     
    arm      |        gst1-imx-0.13.1         | NOK | https://autobuild.buildroot.org/results/847a040e50bc94e74c3c613be563a61fc2cdc81f |     
   x86_64    |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/987c8c5deb5d275b9220322fc0941b520c1c2b84 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/9def71a40d166c9583677ccf981ee7419033cf53 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/ad85fa8eabe2c3980e5ffb920d3354053b93cf1a |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/a8372f17e706015bb7da3545517fc5ac73ffcd80 |     
    arm      |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/e7c5a948b8d0c6462f7a5de1a1e24c14553c32d5 |     
powerpc64le  |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/ea07e0ed12d099cc1f3ef8f2e450c9f9249d6dc8 | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/3ba22ecec30c06ad1e0ae8579fbef5844e1fd6be | ORPH
    i686     |       host-go-src-1.27.3       | NOK | https://autobuild.buildroot.org/results/a28a3881ceba0b4ced7fda5b9f676b17f23e33b8 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/517e0ddd99e92e26f9f9569e4a8380d758158c41 |     
   x86_64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/9d974f124d956ef48ec29435da99be27726c87e6 |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/4b882be2308ea098aa7fef098bec51ff6c7b3bd5 |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/c372c736d197fbf1275585c277c6dcc89478561d |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/d145052aeb3c6e97c229108295afff576359b254 |     
    arm      |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/6dfd9a37ca4e4c85b4ea07464fd6cd907c575acb | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/ba96996d92d6b7a0005d4f68e7f720f686d94413 | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/cf95077d286fdb41849192b9e0eeed4fc1f0dce3 | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/519d5a744f614fd5baf10630a884ddd46c101c71 | ORPH
  aarch64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/e6196f408ac535380a7297e798591ef4005e7c42 |     
   x86_64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/e08c29cf02ec4fde5c5d3bb72975bfd918c6a2c0 |     
   x86_64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/a076cbc7e9590fff27a3d2c2a9bd8517d7d43df6 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/259001bd51662021f1eeace2c5c8d251ed1dc297 |     
   x86_64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/d2242b62680a9a3aac488e196de980ed313d2166 |     
powerpc64le  |           host-rust            | TIM | https://autobuild.buildroot.org/results/5e2d58daeff22a3e7219f69be793544106c8957a |     
    arm      |           host-rust            | TIM | https://autobuild.buildroot.org/results/946a0b3ba8211fd16d215c6de3ddd2f63edfd487 |     
   x86_64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/10a7b0d1538b2ed667919104878430c3cd7c9699 |     
powerpc64le  |           host-rust            | TIM | https://autobuild.buildroot.org/results/143b120c7ac1b4369f3e92871118dc6c239b26ce |     
powerpc64le  |           host-rust            | TIM | https://autobuild.buildroot.org/results/7e71edd216881098ee7de25b97b1c2b62528ccf8 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/3cae3462c0e25ebbde9484b343da13e7f5a5f36d |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/54cc91b01ac6da3d09a7d07f4d95f17583952cb5 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/62131e19929d8b6af57fd735a63c0372a0276d9b |     
    arm      |           host-rust            | TIM | https://autobuild.buildroot.org/results/df5b1670a417f597b75284f8529c34c780432eb0 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/ab986ac74811ccecf4ce8409d9e8b62788e9da40 |     
   x86_64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/b1aa138f90f9dbc1e022675734c7c7ea74aa3208 |     
powerpc64le  |           host-rust            | TIM | https://autobuild.buildroot.org/results/adc106a9cf1e7e56021244faea6db2a2d5bf1125 |     
  aarch64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/76d82b49d62cf50faf18c35c40997a66d749ebda |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/1588b6aa7a4bcf487c9f00704e9241b698235a64 |     
powerpc64le  |           host-rust            | TIM | https://autobuild.buildroot.org/results/30ae8dfc1a207e554e0d96efbaa83361baf306dd |     
    arm      |           host-rust            | TIM | https://autobuild.buildroot.org/results/e7d4d297e088060e3951622e5883c00077636cbf |     
   x86_64    |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/f5fb8664049351ee41a638d5dce79eb436b8104a |     
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/c23f242dfb71c8762f28827699ea4e1eb56ae384 |     
  aarch64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/f8a3e3454375c3f5e7e5c6d9535354078f68ef2a | ORPH
   x86_64    | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/42c9f3cf55839d500cc4420ebaf18b1c9c7cd412 |     
  mips64el   |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/891e5e0ecf19d2b9e159908aea5e1ff0e8bf5f7c |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/e659d0b9e068e125d92da8692657617975bbe3f9 |     
  aarch64    |        iptables-1.8.13         | NOK | https://autobuild.buildroot.org/results/3d3d40449ed637fc7cfe49872f35ed6667510058 | ORPH
  aarch64    |        iptables-1.8.13         | NOK | https://autobuild.buildroot.org/results/c177c8d27b47c382245b2a7c1619a584d4e82dc2 | ORPH
  aarch64    |        iptables-1.8.13         | NOK | https://autobuild.buildroot.org/results/1ce517911163fd850873de28a5331a9787ed52c4 | ORPH
    i686     | kismet-52bcb902e36b2df1562c... | NOK | https://autobuild.buildroot.org/results/3703fa7f1ac8dd2cd094f539efc3212b48c96f98 | ORPH
  mips64el   |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/928d8fbeff1471ebedaaa63cbeec5c747d967888 | ORPH
    arm      |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/e7725066e577a388e88e41d314b12610a1b478a2 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/12737798798670c64ce30f649266f5376c3cbeb7 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/9b0dc5b8cf7f0b5f9c5a907900821ea51f3d899f |     
    arm      |         libclc-23.1.4          | NOK | https://autobuild.buildroot.org/results/b739adf1313bff6351851e060113007ca6356282 |     
   x86_64    |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/d379ac76abfb9e129701e6f7262ff5ed6bf43399 |     
    arc      |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/7dc84554b75a370136bfa2451f4b4c3dde0d92e8 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/275e5f1a7eab49a9155b2bfe344e1babf2ab40d3 |     
  powerpc    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/ac118eaa1c5a7013802ee00b28ff45e5b9e3ac61 |     
  mips64el   |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/98264a90a5ddc5cbcb3ff7f0904dee4d058b9d67 |     
 aarch64_be  |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/9af63131c96e509e56da227dc5b8062a34910043 |     
   x86_64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/55a7779a327fcb9f6217242e1b0e34069f602d58 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/d36ccac1da696ec3c6edb6dd97c56dfa928fa8d9 |     
   x86_64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/f2e01fdd8acd7c8f05760fa39bfc86caffa5fe1f |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/f5063f6534bb40a238df644bdb01c60170f267c1 |     
powerpc64le  |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/dde2af6f0161d7a16a901f8d02c7b13b1fe79b0b |     
  mips64el   |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/4528c2dcde4a403f47989bd2932f0c9c1e03531d |     
powerpc64le  |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/dccbdf6a8af80d95530910ed37cf648238f3fcf2 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/73d1ab849f2640fee4f6d6890ef61e0b85f7b98c | ORPH
powerpc64le  |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/ac3a64b24d68771feaa22ccd2dbfbd2594972760 | ORPH
   sparc     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/b7c0bcc0c311180401f4f14c397dd184ebb903a4 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/96dfebcc3ac7166035b3441ea5617f14e7032fca | ORPH
  mips64el   |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/90eca96c425c3c7cad5de226920acaa85566bd03 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/cc5858a0c1b0b310c96c93b628661ce609b6e92c | ORPH
powerpc64le  |          lldpd-1.0.22          | NOK | https://autobuild.buildroot.org/results/9390c17e0b7e1e51ff157bce2dc5778e95241c40 | ORPH
    i686     |          lldpd-1.0.22          | NOK | https://autobuild.buildroot.org/results/ba3f9789d58b0b43c0886bf4b32ff0c3563f2aa6 | ORPH
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/e32acde9e3affb3510ce2a351cab8f558dda8c4b |     
powerpc64le  |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/23627ef64fb2aea0d3e0e64ffff38011a1957fa6 | ORPH
  aarch64    |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/1ff43a05e97dbeeca3696274777e5659c07114b2 | ORPH
  aarch64    | mali-driver-fd0865346db356f... | NOK | https://autobuild.buildroot.org/results/98214caf29d613f74e04a11675c909f84d1fa0cf |     
  aarch64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/2fb1de53789e8e046568826f93fbc86625695987 |     
    i686     |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/f825438d694f3ba736f8df2f28d2b177a37c60df |     
  riscv32    |         mpg123-1.33.7          | NOK | https://autobuild.buildroot.org/results/157a296d86ca5ea249a9461fa67ef39b198da1fd |     
    i686     |          newt-0.52.25          | NOK | https://autobuild.buildroot.org/results/530a41edd038e7ad647b1369494fbdc72ea65b73 | ORPH
  mips64el   |         openssh-10.6p1         | NOK | https://autobuild.buildroot.org/results/68d260341341afb0dfb7244f641f5196df3649a8 | ORPH
    i686     |  openvmtools-13.1.0-25218885   | NOK | https://autobuild.buildroot.org/results/d37be203b0b4d46c052427ea2c469c624b26504e |     
  aarch64    |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/1caa57e22209c55307f679bb57842e4ce9622304 |     
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/68738dba10acfe97e3f4d136a7395b00910e2606 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/3d15e8162c2477923a62c54d4951048452b20969 |     
    arm      |           pppd-2.5.3           | NOK | https://autobuild.buildroot.org/results/7b4d9174450e55e4f44da2b2ea20e6f6503237ae |     
powerpc64le  |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/ac308dd4df97404746a9a7f30400ea1f9ef26598 | ORPH
powerpc64le  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/5068bc98f98894bf5e3340bba1203c801cf4b5c6 |     
powerpc64le  | python-types-python-dateuti... | NOK | https://autobuild.buildroot.org/results/fe2153cb1693e2f4b7c1507ae0d2bcee519d10b6 |     
  mips64el   | python-types-python-dateuti... | NOK | https://autobuild.buildroot.org/results/5776c66dfc7fe9359da9b8fe40b47885a671c173 |     
    arm      | python-types-python-dateuti... | NOK | https://autobuild.buildroot.org/results/4dc4f5f9d5f9f1d3444f5e411cf6686b67671755 |     
   x86_64    | python-types-python-dateuti... | NOK | https://autobuild.buildroot.org/results/015fccd5739eda302c14783443c29b5c2fc40088 |     
powerpc64le  |      python-zlmdb-23.1.1       | NOK | https://autobuild.buildroot.org/results/088036f0b469aedd5ccecadf6ad833ce58480349 |     
   x86_64    | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/aa71f30a2a692b30e0c51507e9b5035a6f63611e |     
powerpc64le  |          qemu-11.0.0           | NOK | https://autobuild.buildroot.org/results/fe4173334dd02396678036c1c25e5908665548ae |     
microblazeel | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/3f7905a58481033fe5f1414b6a4794de01ce560f |     
    arm      | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/a3a018ae46e34fd3550f72de62c532444db0c278 |     
    m68k     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/4ccf536955ddcd4e7fc7ae1845d6c08f00acf864 |     
powerpc64le  |            rtai-5.3            | NOK | https://autobuild.buildroot.org/results/8c33f55f5c099597a168febcc85b1d0bb62f5945 | ORPH
    arm      | rtl8188eu-cca7c28087db740d7... | NOK | https://autobuild.buildroot.org/results/82b9e233614950afb889cc55b3e76d1c084d873a |     
    i686     | rtl8723bu-ac3d2f564bdf6816f... | NOK | https://autobuild.buildroot.org/results/a454b667f7af437d41dbbfd599f1bbda32c8c67f |     
  riscv64    | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/2f7920e9c6894a969dca4ab4034f727ec0173a60 |     
    arm      |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/a05ace37e182a8fc1416c42dfa08937264c0ffa3 |     
    i686     |      sane-backends-1.4.0       | NOK | https://autobuild.buildroot.org/results/0c3d2059b00a53976af8ba61901e8b1e264761af |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/234cb95ca689fbc017b6daac761977d917a653b6 | ORPH
powerpc64le  |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/6d85648948bced93f967b0e92f1ebec967fc0a77 |     
powerpc64le  |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/1cf0c49fa0aad0d94cf847dc5ef0b6ad09befeed |     
    arm      |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/fc131f72d825e1699057044da4ae14d12178e53c |     
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/41e2ee06125be6b434ea62cc6f5eb3d74de5f5a5 |     
  aarch64    |          uhd-4.9.0.1           | NOK | https://autobuild.buildroot.org/results/e959c738b01b5b461649c8d0202708775bbccb0c |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/be3da75000a34790a7b05d57e39d76bd888ada49 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/e144037aa7dc17e6bc23038a997f0b3a3e9f9395 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/d32e4bb5a7d5e3dca68ad400ac04fe8f854620d7 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/d89ecb89d0cea3ccc0020eb63fa553e6a566d866 |     
    arm      | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/5b9ffeaac28864c48353371a5a421a8ca12d4930 | ORPH
   x86_64    |       util-linux-2.41.5        | NOK | https://autobuild.buildroot.org/results/d070fdd0e44b20a91caa869d56d2e92099426ca1 |     
  mips64el   |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/af759923d55141afd9d52bab464ba935e6de3c1c |     
  mips64el   |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/444718fc921e0e80012ce1dfb030287c6804a2cc |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/809b39e2db5b042113971b270f94099041f90457 |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/ede9acb7f43f2bda2ded2c0d34fe742b7ba9050a |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/fc5d2b0597dca45b79c0eafa6fc6e02d31bc82bb |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

              libmodbus-3.1.12 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/eff73b4ad66ea528c159eac0ac0ed8fdf1e0bac6 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                cryptopp-8.9.0 | 1 
            jpeg-turbo-3.1.4.1 | 1 
      passt-2025_06_11.0293c6f | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/eb7dd1270c9c04d068127bc0a63e37c664d8d7ec |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/f915233f54a607650b150b7fafc2a390d43ef35f |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/640ce92061a37d3099e1e62c8fed21b848424915 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 2 
                  ffmpeg-6.1.5 | 1 
            host-skopeo-1.18.0 | 1 
                  lldpd-1.0.22 | 1 
        ltp-testsuite-20250130 | 1 
package/linux-headers/linux... | 1 
                   perl-5.40.5 | 1 
       riemann-c-client-1.10.5 | 1 
                       unknown | 1 
                    wipe-2.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/a5bbfca49fd824f1c6ab213eaf4453c26f344699 |     
    arc      |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/52609bdc0a4bb5a860740a5ec655fd1ea0713ec4 |     
    i586     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/af43b2d1a259bbf2d11f3151f736a76fc4e5550a |     
   arceb     |       host-skopeo-1.18.0       | NOK | https://autobuild.buildroot.org/results/769fee3a5c0fad52333bc7bd8c7d9cff7ba4ca4f |     
    i686     |          lldpd-1.0.22          | NOK | https://autobuild.buildroot.org/results/cd09018bbb9de8d306ef9dd09614a89aca41c4ae | ORPH
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/3db8ff3c885bc8533ef86c70b86e5fd406ff063c |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/48ffe87419b4e6d9acf17bfcf7a5145f5961fade |     
   armeb     |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/487b64ae1c6647c687b003a86e71fc575db30df5 |     
   x86_64    |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/6702d99080b29d15e81df2ca4a7f492de9f3c875 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/c57162109ec0784b149c56f6e89b8ac13a49fc8c |     
  mips64el   |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/294d3860c485c6796c09495e391732e95b69182a | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
