Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC7F606A327
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 04:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Xy3lBBXS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lISlCGLD
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68D9C6061F;
	Sun, 15 Nov 2026 04:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aOn2rLFa82cz; Sun, 15 Nov 2026 04:28:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D316D606C4
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794716899;
	b=VMsgEGeWYGyNlP0NnwpgEu++nazXwkplClWzcNX7jHtYSEedVZCsD+lhTSA4GFA5VYhF
	 egKn/ZfoJd9e8u/yrWcXBNFvQVOzxsP5GMJWHeE+sr9PxImoOZtkoG9HyIUek1HbvZzJT
	 B/rW9iRG9sV6OVVlZO6azF4oUBh8YmA0VANlry3S1EMMC86vIc/BHAxW34nTfM8hjED30
	 rzvzXczCYC0uNxL7+zUxg+1pZcgT9eXNdVt7K88wPV3p4b+Mmu7fUsMGtQWH6FesmaXH/
	 F6OgVeFdHKo9CKqVXuPDd5SS50X/Ml5vggOrK5iIKNG1Za65lpErwsz8oXBVVyBN5Dw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794716899;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=73JgZgwWPnh/yGn2dbMvjx8kIATfbxwsHk3ztoobaIM=;
	b=h+Z4lQOZuKpSVTg/h2OU5LbvQXQlbqNhQcpFY8XFNiWMei57JZMfOJ0zjMXsefXhYW4f
	 /vW2OCwib2DJbW4LUzLQd2ObDxbnKKGuEVy4xsYxVHcGtsuF4lXsuX4U/8fxLYTOrA85R
	 LCzr3ePpkx2YSggvB6qVc2843SvGufpqByGG7uPFWFjpt59uqLmJS0w7Dnv7paSsVovVE
	 xOLgqCXD6paxhEIfncHOdfz35zVLmQOXeCqY9OIZe3YfZanA1ccZXG/jN7WgsTmsYMMMB
	 +JDLLQ+RTAo7m5Fd08YYEc8F1gYPgHdBH8U1PMxpvnAaYomzAu80KR45h+f/TQH6Tnw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794716898;
	bh=73JgZgwWPnh/yGn2dbMvjx8kIATfbxwsHk3ztoobaIM=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xy3lBBXSjPyA+RQMUTVSHFrTsFcZoRG2tAQKwmR4Z/7nzSBnP4EqE3PivS7T+BSBq
	 leOiM6z5vt7FpinnoIIEzNWPXPmQVu2bpqpr7+nuylKwSwnLJ+qKs9Z3Q5V7DIa/I/
	 JSAmA37TNR4zyins2QicVJXVJUm27n0lhnG1gMlDd2LuleuqND8pwsB2BOUkc2f6YE
	 fsZcJVdWVONZ3gLtorOvs8JwUedCbNXU467VV4E3qvHHU2PF+1GA/poItOLznB1gSq
	 eKJdgl/UepMMrEhl394a+JMWtz2dzR8/iqaX9ALp42kaDiEvF4esRyNtmoRKawNHgq
	 bcFz8GfbwwU8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D316D606C4;
	Sun, 15 Nov 2026 04:28:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69B35109
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 04:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DB5B400B5
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 04:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dSLr_SnpRStm for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 04:28:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A92A340068
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=lISlCGLD
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A92A340068
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 04:28:15 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a1fbd52ab6so19561815e9.0
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 20:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794716893; x=1795321693; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=GTtTc8tOQ2W8RMzsYWFm9AI3u3CSy/CzvNH0u3f65NI=;
 b=lISlCGLDbpfovGNhSZ5/hq8E0a11Lhj9QRoQ3WfU6QWvEeLzGvxvahdnfmkc71Pj9A
 1Eqe1IVuIs0FjcfZlRDG9RqO7J2s4MzRMihCDbfqab3xwRWXdqDFnGjkeIe77QOK5zOA
 fZHK8cXt4zNsR8w6+v/GkxtIlssEKK2LijlvzooFgnK49m3Gz7XHbUAIu4lkqvoJfTTO
 W2xy7WoKFsHkjuerpYX15TN0m+W4oSY+donUF6EibP4U3sGtcZdos22gXGex9/xBaUQ0
 5xQcksvATSfVjJBOmsOnw9k9TQE1xg448UE55g/ZPMpx3zDZDqiptLvLQNg0pclTU/lj
 j15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794716893; x=1795321693;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=GTtTc8tOQ2W8RMzsYWFm9AI3u3CSy/CzvNH0u3f65NI=;
 b=eZ5EDbRRnaUPjNDdVQWYSHdwFeXV6oOw++aUFmkOljXplwhYG8KoyohCnhUkMJq//j
 +eFbB3AAo4B6X4J94DdGfQEQPhi3kET1AsVaawwagFvn117q8GCu9BW+SlsrJchejClL
 R/q+d7q6B5ggfiIsk9MjlkX1jUQIUrmiKmIBoEJmaCCYCcBuHpVJT6uWKR83PIlokQnk
 An5ZeOvs6yPvwzO9H1a45hFo5hUwZKb1H/SBGihM1yvTXqDvel8ze3qyCdgQs2z7WL/H
 qMM4e3coEqPpz7JcESxzNKpwOFOHq4Gnl20MMaAho7UngtUVmchrg40rGoW7Tqzs8E5c
 tKeg==
X-Gm-Message-State: APuU4Z/TS5HqefJlNEvwJqsSYQOZl9Qh2MDokwNbk1oFd5b238Xgd6v1
 8jlDl79cHAgTCd4E9vllmkljuxCFNs2y6lTlCeLysLjv3tccaeFa3LqbS0Rt0Qu+
X-Gm-Gg: AYBFou0dcx9MzQxgjGTEY7qv0+QNCcdpOfDWavwac1EF89szkQeo+xJK9TkhHjR7TLs
 hOZr+iImTw60crrIVMqHbD6A8TEv2tVlfSacaAYgTkJOX2kAv0vfllxcSKoUdLzAkxJwMxFArp7
 JhdGUpLIsSaP3hfRmL2Ue+w7vZskhYohFwbZamaavSiaB0ZGAMFSobHZ+KKxy6g72UZ8/WIheyn
 Jabq1yD6FALQdGAuGOX6jQ8lCtap7FJCpGZTw7l+mDouOOSJy5OitttSKezjpkkWhQrvSh4HAI6
 I7G3+FSWSfyUSggnzu2oOPm/gmnVjc4fXnsQskfzCoIG88vMkDuC+g6UQKDNEG7T3apUJFshX2W
 xRAJVbJ13zC+AHaBP50ZKI6CbF7ydvOz4sYyFl3QT2ny7xaOPn1diwcclX+KARxGdArKnLCdkyA
 pPpQRQulHBVFvLiXMdxUK4Isves5fGhGIhCx0KL9iQSMF4mMyv2nB/A63Cwi320jxzsi92S9kkg
 mQnoazfFYdR+8rZEo40aX3Qg4pDg66NHqOZPJo86apXW7UMcC4Z0/cUgMXyHnnWJ1FLFN56VR3W
 YZDtNjhd+uQ1F80Zzke3Na3P0jM/rkLwcg==
X-Received: by 2002:a05:600c:8b47:b0:4b1:32c8:27db with SMTP id
 5b1f17b1804b1-4bb55a7b9damr151880625e9.22.1794716893391; 
 Sat, 14 Nov 2026 20:28:13 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e2842e6sm289864175e9.4.2026.11.14.20.28.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2026 20:28:12 -0800 (PST)
Message-ID: <6af934dc.e4d710af.2fe5db.1514@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 15 Nov 2026 04:28:12 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-14
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

Autobuild statistics for 2026-11-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  | 15  |  0  | 19  |
  2026.08.x  |  5  |  4  |  0  |  9  |
    master   | 19  | 52  |  0  | 71  |
     next    |  0  |  1  |  0  |  1  |

Classification of failures by reason for master
-----------------------------------------------

    host-mender-artifact-4.4.2 | 3 
                       unknown | 3 
               libglib2-2.90.1 | 2 
             open62541-v1.5.10 | 2 
                 rtl_433-25.12 | 2 
am33x-cm3-fb484c5e54f2e31cf... | 1 
                    attr-2.6.0 | 1 
                  chawan-0.5.1 | 1 
             dahdi-linux-3.3.0 | 1 
                 dovecot-2.4.5 | 1 
                  dpdk-25.11.4 | 1 
            dt-utils-2023.11.0 | 1 
                   duma-2.5.21 | 1 
        edk2-edk2-stable202608 | 1 
              fftw-quad-3.3.10 | 1 
             fswebcam-20200725 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 glibmm-2.76.0 | 1 
             glibmm2_66-2.66.8 | 1 
                 haproxy-3.4.4 | 1 
                 host-gdb-15.2 | 1 
      host-uboot-tools-2026.07 | 1 
          host-xfsprogs-6.19.0 | 1 
 ibm-sw-tpm2-rev183-2026-08-26 | 1 
            igd2-for-linux-2.2 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
                libgpiod-1.6.5 | 1 
                libressl-4.3.4 | 1 
                linux-5.10.274 | 1 
                   linux-tools | 1 
           lttng-libust-2.16.0 | 1 
                    lua-ev-1.5 | 1 
                     mtd-2.3.1 | 1 
                    musl-1.2.6 | 1 
           oath-toolkit-2.6.14 | 1 
                   perl-5.42.3 | 1 
                  prboom-2.5.0 | 1 
raw2rgbpnm-f28b903ca63b4c22... | 1 
rtl8812au-aircrack-ng-c3fb8... | 1 
              shellinabox-2.20 | 1 
              syslog-ng-4.12.0 | 1 
           uboot-tools-2026.07 | 1 
                 uclibc-1.0.59 | 1 
           virglrenderer-1.3.0 | 1 
                  xvisor-0.3.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/8332612cbe470f0f682cf279bc422a0dc81134af | ORPH
  riscv64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/ba720bace29c2d78aa4e025c9c999ede602b75eb |     
  mips64el   |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/ef675579429562f5de0ca8124ba976c337c3e6f6 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8e38079be2fa90b919728a141a4d9a79a21f4110 | ORPH
powerpc64le  |         dovecot-2.4.5          | NOK | https://autobuild.buildroot.org/results/fc0d7db878ebc295f65326fc0d6f83c093569dfa |     
  aarch64    |          dpdk-25.11.4          | NOK | https://autobuild.buildroot.org/results/7a9fe4422177c47cab308854d627cebbde3ab655 |     
  aarch64    |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/3681a5da1c31071035b5f2361c1c65ca8ebe3cfc |     
  aarch64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/bb90c8da75e277f1da968d6cf1fe26fdfb75a364 | ORPH
    i686     |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/6543b8cc94604b23eed0b297452c3e23025eb80b |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/6cb28d79cfd4c86402aa175239c1fde68554833b | ORPH
  mips64el   |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/41c67bb16fba9bd319afb1fee0e8d8207fc83b71 |     
   x86_64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/799bac60be660418511d85faebb2d30c95f7eb3e | ORPH
powerpc64le  |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/d88057d8652bdbe88638b47fb7ed859a7dfe96be |     
  aarch64    |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/2c74f822ba566eab58fc772a71200104f831c69b |     
    arm      |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/2635e7e8c08c490d81b84f6158084f796687f31a |     
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/ccff7e898e8da05162d830b53e8f527927a4bad1 | ORPH
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/2e652a11e033dbd5387ef9134aec044c79e0f878 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/39670b5609390db575756f93abfcbdb2c061ac34 |     
  riscv64    |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/e86807ef242fc6ce9df787fe77dd7d771b9cf131 |     
powerpc64le  |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/0423deb9bdbdef13691a000587050f982b4afded | ORPH
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/3dd13664031dacd0d1aa35289cbb7b93e3bbe40a | ORPH
powerpc64le  | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/da472e5339ce6f120b7cf992f12333c6d4bee69f |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/081c3cd30fc72095f7cf59fee894344c6d135ea0 |     
  aarch64    | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/1f809d7daffb938161e522669c68a7822622377a | ORPH
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/49a439812d0d47db9ee9ef1e7b6ec762026a430a |     
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/782f39ceb9d72d38c074f4d53585edb1dcfe79c7 |     
loongarch64  |         libgpiod-1.6.5         | NOK | https://autobuild.buildroot.org/results/e72378903f18777571816d54a470a551c13d0c13 | ORPH
    arm      |         libressl-4.3.4         | NOK | https://autobuild.buildroot.org/results/51df08cca800d8dc948740f547ac627a1d89abe8 | ORPH
powerpc64le  |         linux-5.10.274         | NOK | https://autobuild.buildroot.org/results/46b326f3eb082dbf4f3c33d85423ae4d74191c04 | ORPH
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/ce3c87acd98dd518a3b441b2349400c7e53f00da | ORPH
  mips64el   |      lttng-libust-2.16.0       | NOK | https://autobuild.buildroot.org/results/4fdb904851f932da05a3fc02eef27065c05ca154 |     
   x86_64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/d27192efc2dca79d952e8f57da677c15c37a3245 |     
   x86_64    |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/562988f4a4519b2f576d0a4d056c6346f12a2910 |     
powerpc64le  |           musl-1.2.6           | NOK | https://autobuild.buildroot.org/results/55e69ece20023d9045c4fdbdb5b57f9266f8a4e1 |     
  mips64el   |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/bd721f67250c4ac7ade2c91453d33016da3091a5 |     
   x86_64    |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/7936c012e5a404823b1443193b69a9bc7a2b972a | ORPH
   mipsel    |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/4156f995c511d143f4713569801135e81683acf9 | ORPH
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/632414eab095a8b85cce6f5941763282535a0537 |     
  mips64el   |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/9250add46b21fbbff73287b184a8a08c0bd2dfc7 | ORPH
    i686     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/03770e9c05bd4393d1f05f6908e5de6d9ebb2aba |     
  mips64el   | rtl8812au-aircrack-ng-c3fb8... | NOK | https://autobuild.buildroot.org/results/ec5d259154ee6c9418c6c87aa47015a02a48bf45 |     
   x86_64    |         rtl_433-25.12          | NOK | https://autobuild.buildroot.org/results/57a4cc6a175ce1ba9ccf57a1a6b538ec24ea486a |     
    i686     |         rtl_433-25.12          | NOK | https://autobuild.buildroot.org/results/39d0988587ca29a3d0a97afbc709af34926adbac |     
powerpc64le  |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/c2936a2cb6d89afa6bcf8a3dcc9741486ca7a41d |     
    arm      |        syslog-ng-4.12.0        | NOK | https://autobuild.buildroot.org/results/44adaabb351c251048ce4e702ccbe30f77d96c37 |     
powerpc64le  |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/bb01c975b3b0786633ce98cbdfe9d1751df2ffcf | ORPH
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/a75300d230819e2eb16839d16b1a5323b18af394 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/786adca974138a1c7cbffaeea4c37d51890b557a |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/2c3b4496db994f1fa81ba94dbee88a70e0cee2ad |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4507ee246449f9b26f80be1570123cc87609ed3e |     
powerpc64le  |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/d3f73db6b8825d1c6826a9dc03ecc607ecab017a |     
  aarch64    |          xvisor-0.3.2          | NOK | https://autobuild.buildroot.org/results/638df5ac53b2de4b6d390ab37f01b253860f9d64 |     


Classification of failures by reason for next
---------------------------------------------

                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a762a45e8b9995f9e6c03ab6c14f1ffaa8c76f0e |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

azmq-v1.0.3-54-g819b24035cf... | 1 
                drogon-v1.9.13 | 1 
               linux-pam-1.7.2 | 1 
               pcsc-lite-2.1.0 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/8eeb66e85bcf320868e1be2c5962ff238a13cb6a |     
    i686     |         drogon-v1.9.13         | NOK | https://autobuild.buildroot.org/results/65fead6df322db85fd313ecfd35e2d8da2225427 |     
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/d45b0ad8dd20de202c1adf181b4cc9cc7c197b38 | ORPH
powerpc64le  |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/28d05b9a40bbd36d21595850bf611ed2aa643c30 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                freerdp-2.11.8 | 2 
                   dante-1.4.4 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 gerbera-2.4.1 | 1 
    host-mender-artifact-4.0.0 | 1 
                libdnet-1.18.0 | 1 
              libmodbus-3.1.11 | 1 
               libnpupnp-4.2.2 | 1 
                  mender-3.5.3 | 1 
                     nvme-1.12 | 1 
               pcsc-lite-2.1.0 | 1 
                rocksdb-6.20.3 | 1 
                    wipe-2.3.1 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/01e0e8683517fd33ac8ae6fbb3fd86907f09be14 | ORPH
  aarch64    |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/8024fb66d41976d36117c1f937c5afb4faf920b6 | ORPH
  mips64el   |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/82474fafab14e59ccea396d51d58ee0d7e1c76a5 | ORPH
  aarch64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/8103419831392c69257613c3575898d2af76320e | ORPH
  riscv64    |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/f43c0e6ca16ee7e251ae1afb8670d0a2ca74dac2 |     
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/3acf8cc9b22bc39acac86142d2912c7162eb6107 |     
  mips64el   |         libdnet-1.18.0         | NOK | https://autobuild.buildroot.org/results/219fc9be43b38162df676c604d5a4d4310442882 | ORPH
    i686     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/7c47c08a62092cc83c1373d9a7e22444f2a6ea1f |     
    arm      |        libnpupnp-4.2.2         | NOK | https://autobuild.buildroot.org/results/76fff37caa1b74a7b55c8f0551bd95a37ed99216 |     
  aarch64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/2d8a76973d8a2817f5487cca54179445756efca2 |     
   arceb     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/6cdee4aff851dffe40d63c9cae73e1245a4ac24c | ORPH
   x86_64    |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/5954487b902a320c6e2c049a595103d03748bee0 | ORPH
powerpc64le  |         rocksdb-6.20.3         | NOK | https://autobuild.buildroot.org/results/37eb73f794dc34977fec597b4f1df7e525b6422e |     
powerpc64le  |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/2dd8e8dd201b4d05c77a17921e533ce0da8d34ad | ORPH
   sh4aeb    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/8e1848a0549ef9f3619beacbb02fcdb39b737fb7 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
