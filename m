Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516B7606A31F
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 04:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MrZeC+o0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wYmBlxVM
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2456960ABD;
	Sat, 31 Oct 2026 04:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkpkpCIZd2qd; Sat, 31 Oct 2026 04:30:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E064260A88
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793421010;
	b=UqbTtvspXUjFw2cVWIP6RaMv5UITq3A2ZdDKhrR2f1TGjwJtOyvRnuyENFRo4QO86ctx
	 khdd7CK5RkUfULDiaO62pnulWkeYk5f0El4t9Dn5AhZZA+e+HzeT3L3fFKt8Z4zOgsjfX
	 9HUpinhjjPKK708wM6r7t1kMGeVjvjgPWCYD/cEOxEdwrlE2dm3iM6833kGs0/BuxWGl1
	 P+MBH+620bfK4ooKivAhwiZDkIkTKu5NNBkHf1Vfiudywkd/VFTRVVW9OB2xB1hMnQPdP
	 kb66ySoKyQeScSjtWE5Kug956vlpyQwpnOYM0l/2h85bFyN0XG7MSVvKjG79ZNeYivA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793421010;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XR6WfmawT2kBTrSbbklB4Jsv0+8q8NuEE18+1HMtZDc=;
	b=TgvNYWIzNxeUsJs2x7N/6/s6fBr3fQqzxy2NVNiPLqAUxRvLuCypaayGm8WA0Gw0P4UP
	 M3EUYplVkbDxhKXCpTOCttkBqiaFdQ5Qcf3rqr8qR2fljjbj1y8c6mx6WAzThC535OO4U
	 ndvC4ZgntZEgVoN4JTFDHk4sOX5tKqd2IwD2f61Sf2S3PU14RSXsB7XLUUH0kGNRhPi9T
	 7htbIEH5kQLnjDLiUD9p0h/qqmdPrzTG4/JmVA+YQKQ4YPDRBMzvEizr4r8qp3fky/tzc
	 CJIzsqo5OKnY61QTnwY38DE0JvZY+eIFElyhvG94Qbsdbt1k60SNRr0/R1FRb/FcPXA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wYmBlxVM;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793421010;
	bh=XR6WfmawT2kBTrSbbklB4Jsv0+8q8NuEE18+1HMtZDc=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MrZeC+o0L/sx7uIrb5rQKyjw2dWB7Ur0jdVlvAMgjDoxLXPGwCziIoJoUEtw5UwbZ
	 j+dZITw0+s6jupk/yZ11CTAJcxjBqoTBIsuteVycIX08Kb0H++RmVPv9BPvwPU+0bo
	 lZnDV0dED4e22y22Jcmg/1ZIHc5J/qV7GE+pEuJETCQlRDErpc78yIr37Wi1nYRfph
	 Yxg8jdQ4Eq8+aZSGxi2nKQO4BiI5uTZ4DXy3SxJBOgGb7kioCdsRBU7AmgkB7tlpQK
	 I8r8rBQ4NuTJZX5JtaC26MWT9Za/CCiunbC5ueMvFZSS+53g+HXBW4m0JNpAvaSV06
	 ucWr32k5eK8Mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E064260A88;
	Sat, 31 Oct 2026 04:30:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 688322AC
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 04:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A54D60A88
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 04:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 75aMpZeNGKg4 for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 04:30:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C96EB60634
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793421006;
 b=OoWAe0N1+AHnLUtf2fMQiFaZ5y319iYdgyJTYIqRiOabhYP4Lcvy8FczRQ6ax2MupksI
 DB9f4VtooL3dCkn1NGcRpGHW1ptoiNrCVRMfnwK5SfaAMgVqt/vNPauhKBQW9eGkcAAeL
 p0Df+m65Hv03ZJRhTLQehB38MowXJ3OXrbkKHVfnBzcnotsv4GE6Z6nfyYFY/EcGJZvE4
 2Wcugsg5Ca0LKE5j5ejhDnRHToAmTkVdtCCXTZZ7YEquQ+xw1Sh5EQObdcsMCphc/qRmO
 NbfXfM0Xyrmbv0sLXHxVifDze/B3vaodMOSBbdKsjJ1BjOcCQIS7KKIhuhn5LGxeh4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793421006;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=KeZNetNzSDXqJPlriYm791Whr1p1ER4HYC7AP5W+Pr8=;
 b=GHXKzXUYbYHsYe9fXdkN9rj/p1WQ/0Pv4o5Kn2WXiWDkkkMDO2wl+ehxJYLSli1F+8yj
 fJT2B6Q1EXwrDWvZ5AIWzcDqvkBVDHoX8LvZCVyviOOK4Oso5dEBEUXSo7ijpbA1cbcfi
 8lHJyUjfNK9w9PdqUn5Yra+5jxaquNA4Zb/BlDR00hOStcSuvQudhlkSp21e3ytdYEU2D
 oEjvRosxb4gHhlVk2N0xs7Dm1+t8IY6K/mbkhRpxBgn4B1p+0zJQNOY9cqJPhjrrYXV+L
 8dvzLgpZpv/iK5K68Eyos0RQHNCpUtatsjFT/d6AVkYTVHZFg0504BNhyrmVklYCumg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=wYmBlxVM; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=wYmBlxVM
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C96EB60634
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 04:30:04 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a20a37703bso10206585e9.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 21:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793421002; x=1794025802; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=KeZNetNzSDXqJPlriYm791Whr1p1ER4HYC7AP5W+Pr8=;
 b=wYmBlxVMmC6zA+4sO6P2NIhqHdP9TxtSAziNBbmeDcgrlN3lWQ6G2VIihgOa+RtK9t
 NrMX6/VLNsSKWX+t89rzIDxDbcfqFJIFN0nMf0EOK//977Gb4L4u8TFd36ZkKy4uQFVW
 yCeW4GjibVEClbgptXhG/FBxk8rItFbarJpAYX195dxnEjJNBeApu1TT6w7f4DcNw6Lc
 e19TEZ8K95nIqDxWaWpNU9bxT7V47M+Vi9BRJW50Mzd/N/WNPhArjYs4g6SQNsU83HtK
 4NHs2nhZxM6ymBQN06vLA1x89IOzURWfa0PtovY3Twu9hB6Eyt/4yWKlYRVfYQq/zXYw
 j6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793421002; x=1794025802;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=KeZNetNzSDXqJPlriYm791Whr1p1ER4HYC7AP5W+Pr8=;
 b=hJDKgjuX+ZzqkV61fj60mqtr33P6JV6DQD9Dkb/wtqr0Lqjq/RC/TjywRaJqkZH+qs
 ad8MlwjKAOQvP4azjZCSiLDR0FyByj7LU79Jq+SpSIEPWn8OXMBdoLgcNMzr8H5LC0lh
 mIJNBgKrlbPZqkFUWl8jRYZQ1xs1zWiVOomek3DqGA8rffz0cy3dpGGmOdi7iuAIONai
 eJtghIlFAsj4CTp+g4u0uzNUn44H7QGpabuN0uMwVrQKB6NLDwvYj3mesAGjyKAgLNIN
 Ig4BZxD7JsCcV6c0F4G4Z1kv7XYExKI7gUreTKNgWB3QDVmYASqt8R0E4PYHrDYfm3X1
 xLPw==
X-Gm-Message-State: AFq9FYLBMX0Iv/lvjyY4hKfc8ZcHymz1we1Z63YYh/NCEdLho1umWr8J
 ZEgIxUQpfywK031HxuchS2/5706MZ/O8gzsav6D4Ofs2TDealfCXXGpmnvTa4C1d
X-Gm-Gg: AYBFou1lqsMhaF15/XUg+rwG+rQgiW9tyDd5GvGqRGTUNJFxuYJ5G8VT0MXfSAsUFrY
 d7fq78OYfr51UkGsIZer7FnUsW2W3JhivJ/vkGTqVyCqG+OsdqzyoW8cNLwrdXIxKvg/bR7Enbw
 YcgLhN/iuyxnhv4fejEZ5ubGMS632OBJ53AiZu7xEdEOKsW7rFaeO1pFpyb5ey407rlz68ZOMYw
 3eIbtgygYNsus99yDP3prmliY36oA8ZBehMO44HxAje7RKczjyWYQFmcRkglqvHuwJOSMEf6j5c
 InfKpizFv/l+GUwSCR7eFNlFLK0bhlKM9dp7wv3tLWR9h8TtPZKQUC0zjjFdOR64CP9/VV/FGtl
 xVjLrXPy6uO/mvd7/FKDl3q0Q4kDi1kYH/20EEyO7+WhfUU7yoK01z0WOGmkn/xU+oLy2XMcsyk
 G0bYkbm3mh/0eVYioOcMJ8BAic0tBGMFOWs3cbfTrW9khCMvQejYmhWH+FSn99F6j2Ko2MGKyEc
 le3/qPzmC++yFMdF5zjxqBicmiYCg9hOnxE07jhbYMO0xiHZqUBIx5hrISUTdUcMhqHMpNORlW4
 p0PUvFZ7RzS4BSel63RDZR6SOqSx+gJktxvG
X-Received: by 2002:a05:600c:c171:b0:49c:fa20:cbfd with SMTP id
 5b1f17b1804b1-4ad739eb30fmr20281215e9.20.1793421002362; 
 Fri, 30 Oct 2026 21:30:02 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa80f04723sm204203225e9.5.2026.10.30.21.30.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 21:30:02 -0700 (PDT)
Message-ID: <6ae56eca.df6a01f8.3156e0.78df@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 31 Oct 2026 04:30:01 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-30
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

Autobuild statistics for 2026-10-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  9  |  0  | 13  |
  2026.05.x  |  0  |  2  |  0  |  2  |
  2026.08.x  |  1  |  5  |  0  |  6  |
    master   | 29  | 51  |  0  | 80  |

Classification of failures by reason for master
-----------------------------------------------

    host-mender-artifact-4.4.2 | 3 
              host-rust-1.99.1 | 3 
                       unknown | 3 
                  libbpf-1.6.2 | 2 
              llama-cpp-b10702 | 2 
                   lmdb-0.9.35 | 2 
                   bird-2.15.1 | 1 
             dahdi-linux-3.3.0 | 1 
dtv-scan-tables-15661aabc34... | 1 
edid-decode-6f117a8f8c0e76e... | 1 
                      fio-3.42 | 1 
                      gdb-16.3 | 1 
            gdk-pixbuf-2.42.12 | 1 
hare-dbus-e9a89f8bc5ce783fa... | 1 
               harfbuzz-15.0.0 | 1 
host-am335x-pru-package-5f3... | 1 
host-google-breakpad-f49c2f... | 1 
            host-mfgtools-0.02 | 1 
          host-xfsprogs-6.19.0 | 1 
            igd2-for-linux-2.2 | 1 
                libmad-0.15.1b | 1 
               libunwind-1.8.3 | 1 
                  mender-3.5.3 | 1 
                  newt-0.52.25 | 1 
               nushell-0.108.0 | 1 
                    olsr-0.9.8 | 1 
   openvmtools-13.1.0-25218885 | 1 
                    opus-1.6.1 | 1 
                   perl-5.42.3 | 1 
                    php-8.5.12 | 1 
                  prboom-2.5.0 | 1 
         python-cramjam-2.14.0 | 1 
           python-typer-0.27.3 | 1 
               rasdaemon-0.8.4 | 1 
raw2rgbpnm-f28b903ca63b4c22... | 1 
                 rtptools-1.22 | 1 
                s6-dns-2.4.0.0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
              skalibs-2.14.3.0 | 1 
          usb_modeswitch-2.6.2 | 1 
            vorbis-tools-1.4.3 | 1 
                 wolfssl-5.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/5234594542f3d5b10fa90ff576b83ebf28701b21 |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d04fee58176954be9a8bbf9765626988cf27a7b3 | ORPH
  aarch64    | dtv-scan-tables-15661aabc34... | NOK | https://autobuild.buildroot.org/results/b3b49f0f86edc5a6f86b86305a172ac2ddb57714 |     
loongarch64  | edid-decode-6f117a8f8c0e76e... | NOK | https://autobuild.buildroot.org/results/a97465db4ff4ef17e21e5cd08969e384a1c6722f | ORPH
   x86_64    |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/dc996f2988bc81bcd9554c7c6e6bb6637437edd8 |     
  aarch64    |            gdb-16.3            | NOK | https://autobuild.buildroot.org/results/50ae6cb8f03e92d3fd8e4bc5ecafd54b2428b677 | ORPH
  mips64el   |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/708073d9ac8bef513aacd24485e3079a161df324 | ORPH
   x86_64    | hare-dbus-e9a89f8bc5ce783fa... | NOK | https://autobuild.buildroot.org/results/92ffbb9c564ffa4b177188b5b7f099c6a5773e0b |     
  aarch64    |        harfbuzz-15.0.0         | NOK | https://autobuild.buildroot.org/results/b1165c5ed278077b299a6c837cf670b6efc31600 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/c537d453092e04e415750b5814220747935845b9 |     
  aarch64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/cdf9d9a26ffadf8a87cc2c5f1176fa58344087bc |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/5119eff29c67db54f02774192d92c196b0af87b9 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/8c800126acf091f19db5d4626a43e33289d520bb |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/4f38f75f893bdf1801f60dc0a86ab23b60e518e9 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/47d17b466befe876ffa3a4a9ae02c1509c5c1bc3 |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/9d2df65087504c49ad19da5c684dad2c3eead6ca |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/6662ab224fce944dde4a39202200b5e075f07c25 |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/8b707176247dc97f9810d204723e998fe7255ec0 |     
   x86_64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/b8c5c7b028545874ce81ea884b6bdaa6c35c8a4a | ORPH
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/4f12cc5c757b4eb6a2ffbec9136c6a51acd2c2a3 |     
  aarch64    |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/8d6e662cde9d0efc6559c285f9d82f667d8e1192 |     
  aarch64    |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/a21441f722fdf6cafbdafbe242d76b3f1270d1ed |     
    arm      |         libmad-0.15.1b         | NOK | https://autobuild.buildroot.org/results/c08949613d28945254ea448f1ab1647c324a68f9 | ORPH
    arm      |        libunwind-1.8.3         | NOK | https://autobuild.buildroot.org/results/2d5de71842f86b18e14094f3aeb95c3e849c3a21 | ORPH
   x86_64    |        llama-cpp-b10702        | NOK | https://autobuild.buildroot.org/results/7ffb2cfabbbac85706cb7f601efd2ea472d5f36f |     
    i686     |        llama-cpp-b10702        | NOK | https://autobuild.buildroot.org/results/41f100d13a546070eb29cee19ad5b88f70cbe199 |     
  mips64el   |          lmdb-0.9.35           | NOK | https://autobuild.buildroot.org/results/9d1ae988d4f838f3212c21ace74eedc1ceee3918 | ORPH
 aarch64_be  |          lmdb-0.9.35           | NOK | https://autobuild.buildroot.org/results/e4e2b9c85432a4f124fce33cba8a96de386a8707 | ORPH
  aarch64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/dbff00300ef8fba48fd4af37a05da04e3621a35a |     
    i686     |          newt-0.52.25          | NOK | https://autobuild.buildroot.org/results/49319ba6569ae24ce67553cfce9321aa22f3b3b7 | ORPH
  sparc64    |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/9eb1de91b46dca6b1540fd1f5897d77897840eae | ORPH
powerpc64le  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/408854366d46fb6a98c8553bd1b3eeb59b7e244d | ORPH
    i686     |  openvmtools-13.1.0-25218885   | NOK | https://autobuild.buildroot.org/results/af4b709a85d8362ae4c7c795f4266831e39fe2d9 |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/2800740abd95eced88d13d8a567647bf9286d109 |     
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/e2276f38e53febe14543c34d99ca3ddbec545305 |     
 microblaze  |           php-8.5.12           | NOK | https://autobuild.buildroot.org/results/c33f7470efaab81d483323e293aad46794aacaab |     
 powerpc64   |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/172a8c5ed7a46eb989e04c84a1c7e7678bcd6a96 | ORPH
  mips64el   |     python-cramjam-2.14.0      | NOK | https://autobuild.buildroot.org/results/1167070d4ede2d347f343438ab609c0fb3fda519 |     
   x86_64    |      python-typer-0.27.3       | NOK | https://autobuild.buildroot.org/results/dd6e6154758096ff67cbf381df45cd479ac9c6f0 |     
  mips64el   |        rasdaemon-0.8.4         | NOK | https://autobuild.buildroot.org/results/4860d70eb97da1624263d10c4dff180311d72135 |     
    i686     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/8c3b584206fba2fdf0fd50edf20333b83e7fa094 |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/ed2293df4c17d7554d29e3183bc85b8f6053ddf5 | ORPH
  mips64el   |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/ce497e9f2d8003699d7a1ccc77902af8e9a7c85e |     
powerpc64le  |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/163c8d50e15b5254f44dd266254c7f82819fd9d6 |     
    arm      |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/6644e3303a26ac5283446dc87e90ddc35ed9f03c |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/714e551604544f5f85ab1648d1aa8cb8a4fd7f6f |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/59768c9b74e62c3f6a35ab081c52ceb94c02fa32 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/6121d33184bf969182f9760e2937ec50b4634bbc |     
   sh4eb     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/e755296946095c42cd5e5f7e6d4dd0073d5a169e | ORPH
   x86_64    |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/a11504b7038d0f9e5c1ea5cd2b6c71f320d74680 | ORPH
  mips64el   |         wolfssl-5.9.4          | NOK | https://autobuild.buildroot.org/results/ef07fd1024d24db0e6d3c0de2a93e4823bde05af |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

              libmodbus-3.1.12 | 2 
                libkcapi-1.5.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         libkcapi-1.5.0         | NOK | https://autobuild.buildroot.org/results/811d1605032f43897639accc8a4fa68d478c4ca7 |     
   x86_64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/dd969df0768f64027c287fcb67e70129c6aa4460 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/ca13133bb0ec3726ecbf247f8bbe6aae01d944df |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/44935367fdae9e2c4903bc65bf13da32b98f055f |     
    i686     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/dc21771927f431d1418521cb98f111e3dc9380ec |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

python-remi-2022.7.27-37-g1... | 1 
                    szip-2.1.1 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/e39e4504ff6150612f1bcfbf90b856889a11eee4 |     
   x86_64    |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/e41697baa1c59089d73d76e001246e43602ef8a6 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                 gerbera-2.4.1 | 1 
    host-mender-artifact-4.0.0 | 1 
              host-rust-1.82.0 | 1 
                 libssh-0.11.5 | 1 
                   lmdb-0.9.33 | 1 
                 logsurfer-1.8 | 1 
                   perl-5.40.5 | 1 
rtl8189es-6b4cfb5c37f10c099... | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/f1c48fe2f7c71cd7e9a67397162202d028bc7804 |     
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/b00e0f04dfddfdbbdcd59a4fadcf031e20401298 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/7ed3e09f28fa5ae794c753035c81d867e4189be0 |     
powerpc64le  |         libssh-0.11.5          | NOK | https://autobuild.buildroot.org/results/abd2de32e2edd82bdaacb25002e393e00bbf8c83 | ORPH
powerpc64le  |          lmdb-0.9.33           | NOK | https://autobuild.buildroot.org/results/1cd0ccc2a8c75cee2fb750ae522d5545538a23c4 | ORPH
   x86_64    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/2a02c627d21aa6a92db2729ea040bdab829a5fd2 |     
    i686     |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/bb0d0d9548f240ecb5bae2bf74d4488d1be7a746 |     
  mips64el   | rtl8189es-6b4cfb5c37f10c099... | NOK | https://autobuild.buildroot.org/results/63c3a272019d0a84b89933ae174c85a2db46c454 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/12bf907dc9dfb2e7275293c72b08a43ac159ac9d |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
