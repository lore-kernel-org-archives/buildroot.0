Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0BDC98326
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 03:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACDC540B03;
	Fri, 25 Sep 2026 03:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K54WXEBsj0YW; Fri, 25 Sep 2026 03:30:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7033040B04
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790307026;
	b=SjvHVDgs5o1tDSTRPfSKhVSdFuxV3TcaLOa6f/HjuShI3/tWjXuP3kDIZs2JM/o+f0DS
	 GdvEX7D3yEpu5u/KVKvm76/hDvWCf+L1BCRsGejZxJxvGd/sm5esoAOKbW3LfXiH3kCLB
	 qugpXFQzOtExTVQ4fiMt7G05nGb1VYQrPNE5OnvCw10DxK6uIIt5mDYAD3i+ylw1U/24K
	 +SvZ+PLt8iszloTv91ul2Q+IiWNRsdgfwMTGknyviv8f0RyvmuY+bfUBXENHqccoHC4Ps
	 3cocTqr/WMirZSHibmEB0Iw8gMUv7UXT8Ql9vUH5vduUz45yUbXr2m1PRcTQzxQea/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790307026;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LjxN+RnGZH2kT8BSm5QKo7w6QdaroALSFiGRSG78vec=;
	b=bVfDR/FNXv04REquGPOqDUabP3GNW9S8JSTKHoDlUkjxmisxKDSHJBK+OgYNlO04ZV/p
	 Yv6U8XQPeguChfpz0seOxa1lvZYHeGVxu0rO9Sa8uC9rdN+dwQj63hlAKHvKtfUq8J8Ur
	 Nj4VEQ0FzW0kOxaoJRq+i9TM/Lzc/rrh02Aoj0pT5SSF/ySFAaHqrBQJTnIW4PVPsYtDP
	 GYZjGwV+t9JDzMBtbIsxZsDkftNjWH71a4fRUs8F8wW3VY6ofznaowg7zGICraTKeD81w
	 UomX8blndrmabiOGhJf0LBRQCRxOfeP5yikHDaXp9Vch+Xa0YBt0lLUwYNdAiIf3X2A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790307026;
	bh=LjxN+RnGZH2kT8BSm5QKo7w6QdaroALSFiGRSG78vec=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=faUm8QWCTs1Mhsyfu9LkSs5i3j2r3Sbgj4MZZTSBIq9N7klWp6uCwNYlh0d2pukDm
	 H1vwmcPVxBV5+CKu9NviaY9NwSojp24j0PTt8/Ax8rZ0wDahpvxnUlVRtP0NNqie2g
	 qZUIv9VyT14XDkR8zZoodSE0vNnBu36pfHXahnh4F8B3N2PoF2+RnkbgY3LlH+MITM
	 /l+H51Pbj95B06bVI3Etx5X8Mv08G2BkbNEo/bAhN5TK8L97vScnVRwQFjKaBuLFLV
	 Gr+vc4zxAZi03v+Odwim7ZJLbiEZDrRVEUjuClltL9bsWNKhz9+7I3reumg+XUALzm
	 j3RL9tQgY5TZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7033040B04;
	Fri, 25 Sep 2026 03:30:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 47CACA33
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 03:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D7FB60B94
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 03:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wyfUgHyuNuzV for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 03:30:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9F81C60B8E
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790307023;
 b=JsTKue0xwZQBhQAjDIQNF2/FD9a+eogK/B4Qt0W3828Waif+1EcSGYJZkbW1ODFJuUTg
 kfm0sbLM38TaFldHqwvv0txURGgkCq5YUJRVMnEsZbDfjjtJo5vTHDZJDLHOT1j4nc08p
 q1eMzOR/mWrOOzzc/uR0QVkbmPk5uAHBGw90sl0FMOchuMc2MxFILQFL9IlysFUp6kwDN
 UHNV9Iz4dKfOLDlDLqwZ335/mlGT9OXjAkxXohSn2+79+52hxbeWLOJidzkqyiyMT8CCy
 hl8aBLXsSKdJ1CFye/tHAclQdvHRFrF8owtxvQ1ZHkOyO887/14ZkmIOXEbgi4RpMKQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790307023;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=d0S9JqN+U+gAZGi25w1EeEbyh8RNdxMjRXA6fh5jSfk=;
 b=it28c+RfHucGRLqfmhftnnMevZi66HBvuRU9lO7QKnTkCEqJ0OVah578eBEqnCb3Yjk8
 QRYALsZuPkStsPZ4S2WKNEh9D7xIjbIc0lgK21pBU1pELcNoRU41n//CfmqlCLHlkDtG+
 G4M2u8ZekOtoeMl6mDF0DyirCjdD5msh8bMs6Hum1wLFzJEP356Qm+22AKUtDe/z76DnT
 H80VJbip/hbcu+jTwEzJuKhFWNF0Mxj581RRj5fuCDP7xk8vJImwaJVrl86xfeKkP0oYC
 VIsvjHazVBYy+WK/T1VJvJ2LPuRsenWk0hbOtNJTl7RrWoZKS62GqohA/tPPDf9nYiQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ZUsYkUhA; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ZUsYkUhA
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F81C60B8E
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 03:30:21 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-485933b24c3so235273f8f.0
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 20:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790307019; x=1790911819; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=d0S9JqN+U+gAZGi25w1EeEbyh8RNdxMjRXA6fh5jSfk=;
 b=ZUsYkUhAMKWsl1h4V8/L/QUp4gsoBht9CY/+xYqRBEgZaYZjoNp+F5fUyBeC5BJ9eg
 J2LahS9QT+xmWhwk3t3GrNL2Mz2W+GIkwx/2txkW1VKs17H4isJRoybNm3YqvIhPNXZN
 sh/ft8fQ4EzPD9Ce6HJJ3dDsJK82icA5L0/FBQtOLF6cj0lRNmYCFmc2h/Apsa1RYdDF
 F6AA+Ov2tSjWdOfoQ/DnqZ+Jf/YioCWLqCQyxEMsz8zh9+FX4R5IuLOygvjdRfZVfm1p
 UeheQY8UJ2ui6MUSixmJZubBr+ATxNMCUR54pMze2vVil7HUsyjwQHlGqfUk3no85soS
 x+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790307019; x=1790911819;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=d0S9JqN+U+gAZGi25w1EeEbyh8RNdxMjRXA6fh5jSfk=;
 b=PMp3WCVlIiIe1dZO5uQNxmKSdCB75+BbSUTS8vU9T2aqGpFKqs4FIJ6FoOfhvcSs8V
 fG+2nj2HTLZWWUfCY7B/ZgF1TluTi0r/TYhTctBxjflFBtufMMufXUzUhR0Ln3KQA+bY
 +0Im8wzFlECHGWjvaRkfvcKi7qKS+XvjBnlLkahqfhUMZRmW99g7tQlLTMK/ZcDemtak
 l5BZWGZYztJV7WGusF9LhhvS+DVAXMKkSSV+Oahvhd87PBzBQpN7wSnWLjH5DwkTELb+
 OYz1HOFwPmhswhyXJVeY6iZJiwEhBXWW6MiLX3AIFCvSWAaHouYhP1GwWdWvX3NMxL+I
 5vWg==
X-Gm-Message-State: AFuF++l0sv4RIzyUJnkmjwtZf7D8l1B/kUsay5ChV2+1sgGoM7geiE74
 N7otenXIOaEsM3LVeXfMB+84k+9z/q1ocy1npMlF6EMhr7QEeJNzESWqrS6ux9Ac
X-Gm-Gg: AYBFou1tO+KWM6RiJZVHCSSkyDLCF1n9ezutWWaQXd78ZAo+Mc9LKRmG7nLLdl436L1
 25NwD5pTEbuU2hYkGbpbbAShuMAi551hQcVwagQ5Row/uLVXrMklLOuuLn+WiQtvgqZ8FH6QStG
 lOYZ3pxyARpimGQWLywwcewwEN+lPtddnuRv4OaZmnQsBr7677aviqt6FAlqGSgXMWixkW5LPZJ
 a6bJwXYFCQyxeJRRIOk6R5jBx4+e8WBqDc8g1DJS3Vvh0xqxTA6FVtDIoLWB6SI8LrAwxT8Wry+
 JgjoFHNNWgiyWbvwE7fZwIOqLaubAQAI1YFkb7WgohHTBdWFLWcqGtKdxiP2LFP8m+kT2uVTq6c
 ifzKM3wv+XD1zUpQavw9UuthksU0SDZvaticgYQku/YIjIg6XIx0+4ItZxzw78YEj2bgvGS23rR
 jq0ms8HqNM3gNAP6UPkvN2QNScj1cRVh9YM+GEo2sHUrgatUo4oZPo6zLY9/RSe2CFMfKtfC/OV
 A==
X-Received: by 2002:a05:6000:4103:b0:488:764c:79ff with SMTP id
 ffacd0b85a97d-488764c80ddmr4094390f8f.44.1790307019098; 
 Thu, 24 Sep 2026 20:30:19 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a84205esm3355939f8f.37.2026.09.24.20.30.18
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2026 20:30:18 -0700 (PDT)
Message-ID: <6ab5eaca.09148f95.17f923.4578@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 25 Sep 2026 03:30:18 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-24
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

Autobuild statistics for 2026-09-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  5  |  0  |  8  |
  2026.05.x  |  0  |  2  |  0  |  2  |
  2026.08.x  |  0  |  1  |  0  |  1  |
    master   | 22  | 32  |  0  | 54  |

Classification of failures by reason for master
-----------------------------------------------

                   ccrypt-1.11 | 2 
               tcf-agent-1.8.0 | 2 
                    attr-2.6.0 | 1 
              cryptsetup-2.8.8 | 1 
                   dante-1.4.4 | 1 
                    emlog-0.70 | 1 
                  ffmpeg-6.1.5 | 1 
      freeradius-server-3.2.10 | 1 
            gnuradio-3.10.12.0 | 1 
               gocryptfs-2.3.2 | 1 
                haveged-1.9.21 | 1 
host-am335x-pru-package-5f3... | 1 
host-google-breakpad-f49c2f... | 1 
 ibm-sw-tpm2-rev183-2026-08-26 | 1 
            igd2-for-linux-2.2 | 1 
      libabseil-cpp-20260817.0 | 1 
               libecoli-0.11.3 | 1 
               libepoxy-1.5.10 | 1 
                    lua-ev-1.5 | 1 
                    ne10-1.2.1 | 1 
           oath-toolkit-2.6.14 | 1 
                  pdmenu-1.3.6 | 1 
python-remi-2022.7.27-37-g1... | 1 
rtl8192eu-9664b2bfc4bcba55c... | 1 
                 s6-rc-0.5.5.0 | 1 
           sane-backends-1.4.0 | 1 
           uboot-tools-2026.07 | 1 
        udev-gentoo-scripts-33 | 1 
                       unknown | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/047a51da0fb9d4cab15086224ebe2071363a57c3 |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/6956f27c294cba10a5a762506a94926e2d6bf85e | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/26604538aefa46c0b1c0c82d92bc8498212adb3a | ORPH
    i686     |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/e30f236b62af3b80644db9804551b33c606c6231 |     
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/6d930895e80c5f4be713ca5dd8e25cf0075ce429 | ORPH
    i686     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/b5613d7d0da10fd74370cae06a07138295f669a6 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/06b2b3f114dcaf685becb5c3c8248567e325289a |     
    i686     |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/aa5bf5b7655acdf80da08152a9ff0728af320e7d |     
    i686     |       gnuradio-3.10.12.0       | NOK | https://autobuild.buildroot.org/results/e411019e7f7f2ee1e1ae48febcc3940c52c75c86 |     
    i686     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/e3ee38a2c30a569c4e335600d12d60943789fea3 |     
  riscv64    |         haveged-1.9.21         | NOK | https://autobuild.buildroot.org/results/814cb7b5537d8b7b2c23f3d90e37b2b41de7ee3f |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/7799a69db5bc3f9240ea5fdeac117fbdc6067d7f |     
  aarch64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/c9646259fd5362afc77cb7e51fbb278aaa908444 |     
  aarch64    | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/ec00db481373afeec7917941d368c01bd920efb0 |     
  mips64el   |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/9f058fcd679e49614f050e7582459929e893d94c |     
    i686     |    libabseil-cpp-20260817.0    | NOK | https://autobuild.buildroot.org/results/48198506ef76c6ebad0a802cb1fdd5270494eae1 |     
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/ff3b7e38d1af16f2d3ee34b13122920f5b256669 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/feb453839e65a849ebbcd7fc61f5aa68ecd3e79c |     
    i586     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/e36be4413026982a58e9f28e7bf995d7c4ecdc85 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/f49ec8417628e1a073732f87582a87aeb9e62016 |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/2171795fab76ff844241a90f88d0e74311bbe4e0 |     
    sh4      |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/60deeeb5c898187eb8a0234eed1d1c4985286ad8 |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/bc4e32119d9ba938ac305e6526cc9d7ab68f0cdb |     
    i686     | rtl8192eu-9664b2bfc4bcba55c... | NOK | https://autobuild.buildroot.org/results/840197c0eb91d4e864d6550555438035baf95292 |     
    i686     |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/cb9183c515d08978db9c8da8abe749e4dbd97321 |     
  mips64el   |      sane-backends-1.4.0       | NOK | https://autobuild.buildroot.org/results/24d2be060da7613304f672e09d5f8c5f0a50e312 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/840d92517530baf35f00826f5b439cfd5b831f4a |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/77d8fb2b42769627fc45acebc9c237abcaa7d675 |     
  riscv64    |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/38f108b7da962d0721a152e7d9686cd3e203797a | ORPH
    i686     |     udev-gentoo-scripts-33     | NOK | https://autobuild.buildroot.org/results/a93034bb4db97e96101564e9731441b9bbe3b167 | ORPH
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/82c6888ce4b524c8df7cb03969f7e6dbdc450f02 |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/d90571f54fac0c2ff26b8fecfe797579a7f273a1 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

            resiprocate-1.13.2 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       resiprocate-1.13.2       | NOK | https://autobuild.buildroot.org/results/aaa114f25d8fca8d2265a5bb11514377dd35e89c | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 2 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/29424b2d9d6c90002f3a30c7fcdd8dc62688c025 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/cc48386290f4ada40209f7af5b003b8aa6fb0b4c |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                host-mpc-1.3.1 | 2 
        ltp-testsuite-20250130 | 1 
                memtest86-7.20 | 1 
             parsec-tool-0.7.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         host-mpc-1.3.1         | NOK | https://autobuild.buildroot.org/results/62afaf048e4e0d3f3602c360d9ea9e9107f4dcd0 | ORPH
    i686     |         host-mpc-1.3.1         | NOK | https://autobuild.buildroot.org/results/9484d28566a9dd690a8e43ce1011fbfd4a91d6f0 | ORPH
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/b0facaafd4205cc9053c72de2f23cafe883fe248 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/926c830961f5f7b3e71d5bee238fd7af80a08785 |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/b0fffaba79410eed742434f84f8ae52d8cdbf046 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
