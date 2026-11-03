Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019F3606A324
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 04:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bcr0lglX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJ4Y4YVo
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE14F40586;
	Tue,  3 Nov 2026 04:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yOjQ15tWnRKe; Tue,  3 Nov 2026 04:30:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6699340589
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793680212;
	b=RRb5chElIVwTMnzXdAJ3keR9ErKfquScJNY9fD/4QGxtIPwEl6xZjfhmjlr4r97wYwks
	 YYBmuO/fNb3zegKma4UpB2OfUoSfTGVgVBgtx2bet6Qyf27b59BAYlSJKi96anbOVrIKb
	 OBuNRY691Qrib5AnHlgpDSfkRdOqMLXegHa6LGBwt85NXCLGmYdilpxdGrQKj9uovRVvq
	 3R+6SuGv3+DJNkH7UEMrPyKV4O5Ej5Dj1TiAu9R43OzBIXnQ0s2+U2anpjEc9mnklUA9c
	 t5iBl0op3pJLL627CeE0NnLr8wfFcaHXwcaxGc8Rmibz0qI343C92hokv8WRedB6CWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793680212;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FLb5+AMG/9ci7WGjnm3KrCbsEUzpQ0gnYN2/LyaBKPc=;
	b=o3Tx/kki8wzHf9rrmrD5/JyvmSbZGKJRYE+U95CCYvmxpukZZXSJcH/oS9kM6fzz27gs
	 /G4rc6fSU/Pe1/YGVI1cApfXfAWcaNcgc1eTiV3Ao9TFKpCeybwnr/SsW5mUupoxyRQBN
	 RTb4YCmCwf9WA/jMfC0dUwLe5V6K2HcUGdg2kxKOcTseD3Zof05KM61TVQyFU6Ow3VsvP
	 suV1MRYZ92SD6oQIWGmg5MVU1Q18SIKBZLntDiW1NY5MNSbJejRSZrGV498IttzQ+SuiM
	 aRoX05bobYdTthq4wapSqBnDmnO6XGLbB8VW5tX01iioNzBB3UJxerHrYq4Y5I1x+qg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793680212;
	bh=FLb5+AMG/9ci7WGjnm3KrCbsEUzpQ0gnYN2/LyaBKPc=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bcr0lglXgp43aUPxajURjVX2BtUv5T16FBUyWtfIUbKQin+Oq2JKnnrPKQbm0f048
	 vrZ/xCNoICZRvkc/aQwIjfbkke1ASQvcet3tu+vgfC9td/1P5VRljmfzQZXPey+duq
	 m6DPMXA31J5dOhRP1I5vr0snVmlErnONm2Y3lUYi8zKCo9i1Izjbb/G3yPca08BsPc
	 xVxU52tnM1ZbZej1UgyId4mndmR+Vu3HqyyRxoI+T7XugLk6Gg5dihEPly/RsQfMP7
	 thcvBfuq0D9In3C837ZJ++4vFne7u9H26GYqeTr7G/jUDMNTcLRFknZTvU8mzdvy6l
	 6gY7Sape6j1gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6699340589;
	Tue,  3 Nov 2026 04:30:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 41F1DB00
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 04:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 335B26067D
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 04:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sbdpe4do_FFg for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 04:30:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 693B360642
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793680208;
 b=TDBFoidAz3MRI+ZUiCAfnz6JBg8cMtFo6K3xhnQUH6BUqY8kbztF1bFN8ESePNJ55FhW
 OvNf+Ehfsb1ppXcQjQs8VnEvog2CTBHtfGBU6YX9zQc9qfXaqlntL9myuw+zaf2+Qnwsu
 2hjpYPcmyW4q5iz0vkI09kyhHAN76gbCO1m3blwYJLOcCjmDwoo76fiFAJzpop4QzJBrj
 Ctzg5hzcHkd+5RvV//nNCeC+6EkBGdXHvKYA6PfXI1sSyLBZwVS+EFEhnImV5D3zAP567
 /5ROqunuCAhvEMh/kFv/TO7RlYsUemO238jeVJ7E6Exrgfgos4HY6/K8ODsFdjrF2nQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793680208;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=QHGTGXUlza0aq9NyTyrmjSAh5RbNo+nHiwWpoxLbzb0=;
 b=jQsMkGtW8fp5bBw0od8ctkjy9q+Fsl/LuTS/rh3XCNTCB84xs5koHYtd4vmgPAuAFjDm
 wAx83DlHzif6qDhm+SmGj5uCPlpglejiXiyt25Z2mZokjeai1pudQIsBS3+xVANycGOz9
 oKJxPMMA6vx5OGA0duOe3QC5MfH+se1eY53+0c3r15kbfevoBusB7vqqMoNI8pK4zns/s
 Bd7ZFOWPjdGJ1LgNRpjHnaH1mr6QI3SviTUIEzU5reSlgM2S6Lmtn3aE6YKlpsYQRNn04
 Ig98LlsB10mscQWwfsSAsLmG94lbvmyOxsP3YWbTGDexbWfHqaxIYvOXS2sY1qCo00g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=DJ4Y4YVo; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=DJ4Y4YVo
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 693B360642
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 04:30:07 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so3046225e9.1
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 20:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793680206; x=1794285006; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=QHGTGXUlza0aq9NyTyrmjSAh5RbNo+nHiwWpoxLbzb0=;
 b=DJ4Y4YVoNlRVl4HFDNMCDLGIUvz93NSaDuAm9MlaEiEu40uSXMk/Gcdc02RPrJ9ZG4
 uG6guuMactBM93BRADVjfJsWoRZsAFOQZOtml2h0Yk5q1nfXOWKRy7K52tEugYxeW4wk
 6A1Wk/+TYejASrS1StlRwKXPzjfs7Lr8hsfxjV1pYdNUwiizgTHIVyTdTSxU2FnJSBCJ
 rJVFoOy2suANZ+w7pyrmZ1uFNJtu7l0HnhnX6sf8uy+n7uxc+1+z84rDNQQLLl5i/nI/
 80Au2pA6Tf6rHek0MBDMhMhvQiZLdVyjNcSGqnvNtf31hqmbOryA8w01UkW9mehtP34F
 1/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793680206; x=1794285006;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=QHGTGXUlza0aq9NyTyrmjSAh5RbNo+nHiwWpoxLbzb0=;
 b=ZNtZb/akN7ypZvBei5aDV5j4R3AKDj8oDl9pQ3H0J8kw2+lI7HDl5yxRalLXXR2Iuf
 sdQwjI88RAcCAY7ePWxlhnM3+BX9Q8k4W73ERdAUO7DuBiiD3EpQuLjTeF1ChOgAwRVk
 sjBm/vvUxycTXnZxJnUHT0/gxnaQwpWeDy7yzx6VPB0vKRKjVfB4oMZtOmHANVEEb7wf
 Fz/nHHjd5JSsHr019JlptA/jvut18tPZSZEB79fdZat8g+XU5Fow4wr47uugYp8OOz8H
 I8OGpV3ebwDE8Mpd6tNKUR4jcqvJjdpmmuFVUIxTZ9ULfVoK9DxMrxJJTlaf2cSjCahB
 EzRw==
X-Gm-Message-State: AFq9FYKEu0rK6h/XRe9l7bUSxnS+vAVR5yits445LIjpD8n7OhzJOJA1
 jMpJIWuOCExmPokyLxQS4LHuJjM/q7wJjnsR/6hpd+ZVfE2lGpsXeSbyrWatpZ/s
X-Gm-Gg: AYBFou03hYdoXtc2Bw7+ey7SQ3g4n3QP1ZhmCzpb+RqjOo+NLx5wTcq2SpopOav3bTq
 Fqd9yveH32RSLAxzJIx9dsc54D9KVxkvFVxHMaWvzEZatMw9EswOYeA/ag5qt68Agkl3wqQ9Ow7
 5w7t0QwBcYlZm5KkW7BmnEKVwwJHwFeK2lCQSRWywdUdumFmDPGqdJK83FjtZyyIEVIcOjbVfgT
 FAbj4ulTuKzIe+R8a0iqwFy4vUioCbossSJh70twil35pyNmd5o0Zc/aJj2S6JHvEKifeedkKay
 bIo7dquTu9XBwzVwl3zpZGZC0AnE8Zo1yNgoIcOIrgiFtVJJVsileOKCy2hfCZEneOWo378ZxaN
 fM27bWG9Svc/2w0q5/OC+fxA5ky9rYb70bA6cQgUB+fjkfzVAdR+3UWOsq2i/gLxnHolJ9pN4SW
 s3AtikeuJkK9KvLjZ6j7Vc3hoiwZVHTabGTyow540afBwOL0ECS84HlQCT8oTeCuNAN2yAHUh7F
 e1L3LO8OxYK/+p2xkpvh3wl4ExD0zv98vqfTKOFMsiZCM4tNu0HfZ8qibY8WE1gDqSjzfm+36Sq
 ZZ/FVHYzpNnqbQ6bFmLe+YKzhpZ2syvaEhy3
X-Received: by 2002:a05:600c:4ece:b0:49e:65f2:db64 with SMTP id
 5b1f17b1804b1-4ac169d7e39mr268827885e9.5.1793680205618; 
 Mon, 02 Nov 2026 20:30:05 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ad414e298bsm146579915e9.2.2026.11.02.20.30.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 20:30:05 -0800 (PST)
Message-ID: <6ae9634d.950cae81.3a8700.f4d3@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 03 Nov 2026 04:30:05 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-02
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

Autobuild statistics for 2026-11-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  9  | 10  |  0  | 19  |
  2026.05.x  |  4  |  4  |  0  |  8  |
  2026.08.x  |  2  |  2  |  0  |  4  |
    master   | 33  | 65  |  0  | 98  |

Classification of failures by reason for master
-----------------------------------------------

                 glibmm-2.76.0 | 6 
                       unknown | 5 
             glibmm2_66-2.66.8 | 4 
               tcf-agent-1.8.0 | 4 
            host-mfgtools-0.02 | 3 
              host-rust-1.99.1 | 3 
          host-xfsprogs-6.19.0 | 3 
                    attr-2.6.0 | 2 
             dahdi-linux-3.3.0 | 2 
        edk2-edk2-stable202608 | 2 
            gdk-pixbuf-2.42.12 | 2 
                   perl-5.42.3 | 2 
                  bcusdk-0.0.5 | 1 
               binutils-2.46.1 | 1 
                   bird-2.15.1 | 1 
                  chawan-0.5.1 | 1 
              containerd-2.3.7 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                      fio-3.42 | 1 
hare-dbus-e9a89f8bc5ce783fa... | 1 
host-am335x-pru-package-5f3... | 1 
       host-gcc-initial-15.3.0 | 1 
        host-util-linux-2.41.5 | 1 
                 libjcat-0.2.3 | 1 
                libressl-4.3.4 | 1 
               linux-pam-1.7.2 | 1 
                    lua-ev-1.5 | 1 
                    ne10-1.2.1 | 1 
             open62541-v1.5.10 | 1 
                  prboom-2.5.0 | 1 
       python-netifaces-0.11.0 | 1 
raw2rgbpnm-f28b903ca63b4c22... | 1 
rtl8821au-bb26b6b06c47b79c1... | 1 
                   s6-2.13.1.0 | 1 
                tpm2-tss-4.1.3 | 1 
           uboot-tools-2026.07 | 1 
          usb_modeswitch-2.6.2 | 1 
             util-linux-2.41.5 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/9a3dcc3b601f8dbfacaeae85a6c718aefde7faff |     
powerpc64le  |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/218366155cd47b1c3f6b5c745732cce644c93908 |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/ed30f576917337492a3989493b04245923acd581 |     
   x86_64    |        binutils-2.46.1         | NOK | https://autobuild.buildroot.org/results/2fe30afd2c6c2fd115f957936b049a0ac2bf5fa8 |     
   x86_64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/871f5f49c114f567b716a5fc8910755e5093418a |     
   x86_64    |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/f3fa926ffc8855dba3166245eebb6d45b51d1812 |     
    i686     |        containerd-2.3.7        | NOK | https://autobuild.buildroot.org/results/6c46c82218aed5f6f14b34896d2080322ebc1dc8 |     
  aarch64    | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/867ba715a7720feddfdff5d3f68d1d33bd76a3f1 |     
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a0cf738863385876f56ac67d4e6e87a8f5ac200f | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/62246d88fe1cdbd01c94aeb021502159d2f54a3a | ORPH
   x86_64    |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/7c5c503a5b8362c8c2de84d275c427e2e35b3057 |     
   x86_64    |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/6ef9d7a6a2b9919b1e766b864500645ea8ac7fdd |     
  aarch64    |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/dcab5079f960434a8f54ff991aa879a6dd0e4b3c |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/677bdfe1ede285db1a7813d3be8a509c28ecb577 | ORPH
  mips64el   |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f7f670196b9e9a16f7a91adcdb1f45ec15013bb4 | ORPH
  aarch64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/3507331d1a8ceb0408b37002034c0acd2ea9564a |     
  aarch64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/2309e0a4f796ac0855ae6d318513d8296ca97a19 |     
 microblaze  |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/66fd9970583ad15bd80960bcf7bef560e7d88f89 |     
    sh4      |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/83be47f8cfcfd3da57f3ece21113274424da6c50 |     
  mips64el   |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/bbf76bdff0b375759f32eceda9580646305e717e |     
powerpc64le  |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/2342d4904c15b2562d30be3830e68896f5013a2c |     
  mips64el   |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/36bba987f31c4d5f02637750a8fda9cff4783b98 |     
  aarch64    |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/f13c878e2e846242db6530f72489e0f7828cde0d |     
  aarch64    |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/ec8890c674a4d8dfd41f1ff58f490155e1e2be8c |     
    i686     |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/1c69062c0f3967d9e724d0cd6ae7070897accac0 |     
   x86_64    | hare-dbus-e9a89f8bc5ce783fa... | NOK | https://autobuild.buildroot.org/results/ff8a266af50fbc0835547887d652099d36b8c4f7 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/305ed1d3bb9f0501d736f171c5f639518b7cbb64 |     
    arm      |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/7f0ab53bf4185a52f06aec7a2d3f01fc643828ab |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/5a753047847b0d8909db04ad4067dd0ce3591251 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/1713c4d315bad8914372a821084025b0eb8d6c03 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/94cccc52a50cd85a74d8dcd54bc8a72cd5168f10 |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/07f77dfc0d46db43501bfc51bc0e664e39c1b9f3 |     
  aarch64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/04e89bc9f1923063fd47e3268bfba6076a23e819 |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/5608015a9c2f1e92746a8d36c051f5ab6495a571 |     
   x86_64    |     host-util-linux-2.41.5     | NOK | https://autobuild.buildroot.org/results/a46155040be4fbbfd097a0191241ab6fe96a28da |     
powerpc64le  |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/cd173c6d6237ac8faebeb8b5bc9c144d01b28014 | ORPH
    arm      |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/f8f4c34d9f9748df4138cd7c305c3251fc49782c | ORPH
   x86_64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/79df478ef6fa976d3f179cb6b6bb8ce2dbb75ee8 | ORPH
  aarch64    |         libjcat-0.2.3          | NOK | https://autobuild.buildroot.org/results/288d9cb41413a71f41a51f9ca02481a318e48dd1 |     
    arm      |         libressl-4.3.4         | NOK | https://autobuild.buildroot.org/results/cc74e0d1d220d883365605527efb5c67e4e6f5e8 | ORPH
powerpc64le  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/b3268acd7826183f5b34191cda58caf30e282e39 | ORPH
   x86_64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/4a2e9a68444b9057d69a7c432124814e7021ab95 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/bdf73b02ee1d2e7ad50eea1f4fef090af085bb42 |     
   x86_64    |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/f0043de3bba1b4acfbd4289c4f48927e40a32e4e | ORPH
  mips64el   |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/af37815a9a15436fa035b2a0849124de664c720f |     
  mips64el   |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/d77ff148bd3f52abed17b6fa5b41b64a977ee25f |     
   x86_64    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/6c4d74661b413cefe8319470dcad949d4c3efb91 | ORPH
   x86_64    |    python-netifaces-0.11.0     | NOK | https://autobuild.buildroot.org/results/dc4a82870828e575eb3bce1b6ea1b281e6e68e8e |     
    i686     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/a358ce7ff6d61219e3ffdf29eae0c440f47d4dd5 |     
  mips64el   | rtl8821au-bb26b6b06c47b79c1... | NOK | https://autobuild.buildroot.org/results/912f54d0bf2d01300fcca3731312f1e45ca52cb4 |     
loongarch64  |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/526f12bb0520e9fbffdf676dcf332e859dc76700 |     
  aarch64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/7d93ea73a109971508e5b2806b5df9f99a2f2327 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/8a84d1cbd566cb6900df130fb0051273374f855e |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/6c6bda7df81d8ddabccfe2605d9af1bcd2eb4a3e |     
  aarch64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/2403066302e335bc2b3dd3f2d31ccdcb63fca300 |     
  aarch64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/1408ad5881aeff754b0493f1a0d0970d1afdaaf6 | ORPH
powerpc64le  |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/5fc4926a2526c739a8a3ac9e35e9dcfcf119d368 | ORPH
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/810e61021cb329702f43bb150c71ea995992340b |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8efebaacf141dc23d3c9f85ff4e86d72254e08f3 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/4a54588af9838532c28201b1212f1b0e04dbfa2e |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d24813ba8fe3751c32229241e60318b251ffaac2 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b6e4e91413b3985991dde237a7adba4be17cb548 |     
powerpc64le  |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/0a6cfd9a6ea80197b9787a9d9beb41a787c86fc4 | ORPH
  aarch64    |       util-linux-2.41.5        | NOK | https://autobuild.buildroot.org/results/8a9ec5959758e56b9aa7ae5a5fc4671b7bca4197 |     
  aarch64    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/5ff9d6c19d418fd285c28d206abf0adb9599a23a |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

               linux-pam-1.7.2 | 1 
               trousers-0.3.15 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/0f8679c2ba94869cad930b83b6a1766ce51d919f | ORPH
    i686     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/292cb85f0e76317cf7292a14618cb1eda2d6c11e |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            igd2-for-linux-2.2 | 1 
                   perl-5.42.3 | 1 
                    sbctl-0.18 | 1 
                tpm2-tss-4.1.3 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/69d88dd4a709b10143364442b13b7b6a504da5ba |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/f7fad6be45168ed15a844f079b5bbedfa72fc98b |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/e12971fee30561707570060670cf8f8f9c3a863b | ORPH
   x86_64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/c690434f6a94b8848d2eef3e609c5890f26616ae | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  brotli-1.1.1 | 2 
           host-libselinux-3.7 | 2 
package/linux-headers/linux... | 2 
             bubblewrap-0.13.0 | 1 
        host-python-lxml-5.3.0 | 1 
                libsoup3-3.6.6 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          brotli-1.1.1          | NOK | https://autobuild.buildroot.org/results/86b89c32c0c976c9f2d84bd1a0b7a1b0866540dc |     
  aarch64    |          brotli-1.1.1          | NOK | https://autobuild.buildroot.org/results/956838288128ffd5e6a412c5952bca3b78acb031 |     
   arceb     |       bubblewrap-0.13.0        | NOK | https://autobuild.buildroot.org/results/f3737a54f0acd3d624227c7bbda5674af49c51e4 |     
  mips64el   |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/30c53d315cb971c673c5abf6dcb9e092ecca2078 |     
   xtensa    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/5aafd54a78a783dde3248d498f0469bfd4aa6c05 |     
    arm      |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/ca1d2ac4b795d14a97746208dd9261389ed87673 |     
  aarch64    |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/85770b0dde70186643cbe320afa56e99f34f8ca7 |     
powerpc64le  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/eb3a1039505684dc7d72411739577bf0fedeb8f8 |     
  aarch64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/499970fdecad4ed3a44c11ae17a235109d692751 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/a7b2c792936dea9b6037d0a9531343b8d669100f |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
