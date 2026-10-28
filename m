Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17019606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 04:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RaliFK4Y;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vk23KVzq
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB0D24057E;
	Wed, 28 Oct 2026 04:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wLQ52fiSx8SH; Wed, 28 Oct 2026 04:28:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7C42C40576
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793161687;
	b=fCqmJE1fkEfAuPxqDPj7P+HuN278ZZXe3r3DWmgMOxVK4fhDPJZUeTm7gMcKu1tnXiIn
	 9FRGN+gIH2gHQyRY/6/8J+k2d0w7skXiliQLyHl9I/ni346Lt8L1QRhbesejnTxiPyVne
	 J4axEk1GVSCuQovvgGOpZBaGhOOHR/hY9VukgSCE3MbQtx+g8nKsYEjp0aCGtgCJpLCpa
	 lkX0hP9RqCK2mF3lKk/Oi/UEH3TeTrCfPCOnUn8hXRNsHymSBGFCpPvzhDxVZNo9MQKlN
	 jeUnOEss/hG81F+9vqsDTfKJshcvNCypeezvbLHXJGjDGCb+eUSsJBtrRN06+rSFC1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793161687;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Owb0TfvO/Ow+3GnZHw/YflIa+oa6LLYbitQBm7tXMH4=;
	b=sQChgzFLCgWBEnXXY20yNiv/g7I876A4gHVPNOxvzxufDOe/k4eyeYdOESPqAA4gQz0X
	 914DS6cg5NHdSKIie0FrnjQKgapSEvvN3YAYZR+ipFpi+VCorJHiS51qa0omZKUbVopRh
	 PiPW0Rg1g5T0Cm3rzODSxjFzkYY4Rv2Dd/PrhSOQ3uTZudP97lchMh+2hWYayzxGNXKyq
	 Xad5sv8Nf6pkyrb8pPN3wX9ZXzRZyo5er+LaZQN5gBinWeBJcWHTbL79RySJJlzzkN/gB
	 CNnHOZttW6CzwlrirPTQsbxnj9EpGWPvFdzJ+BQC+cV1xl7ss5QowZHWkSKvdOsGn/g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793161687;
	bh=Owb0TfvO/Ow+3GnZHw/YflIa+oa6LLYbitQBm7tXMH4=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RaliFK4YtdchhL3RVRXAkEcC6skxkS0NJ3QeB9SK6w+A2f3tskacEvxKYnrHL3gUe
	 ajj7K0mM5rvBConZJoOmmfHr3li9Pzwp4eP+dSJF4PgUQPynF9eRocdsvaazFfEtim
	 mjHlvsWljztVmYFU5adNK2i2IINWa89FlNhOf7HvKERMyBIscdS2dP2x5GcXsx82mo
	 tfjDk77CIHHRSlPVzV/oz0TEOYZJ9QH9A/MxmAaEDdDs2AZ0qWYsJWvO8bQB0d8mui
	 xoeUGtuEJ0NED/PRUXKchm0KecQ0KKmytfB+B0Lo6TOkDYaFzA/ZkRyLIZg8IXfj7d
	 SDkwj43O5JL6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C42C40576;
	Wed, 28 Oct 2026 04:28:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD2AE4BC
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 04:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2E4840111
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 04:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AeREeIOxkmd5 for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 04:28:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 479014006F
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793161684;
 b=tNvQPhw/cMpOa05lpcPy4VIniFZdcmlo/4Wl8d35sE95Q45ymJDAJlB40J17DOOpX/eJ
 927009SErn3YkT5ILp2iyI+jhWdhCCK8h4LsxhO4fCcYnQ9G5HVXtKYX8U2NaC0NM2ETr
 /H2OlmLw2rh2u+YykFaCH/ftNO4RBRHeGePd98D/1GOrFTyrkuBQwGMmR7kZm+6DhM1HX
 m7IVwx/xUnwnUWdlambaJpLVjmakrn7GmAclWWdX33A3CjILZNMx6LqxZ0P+4VWO9d+Mo
 cwdwaB3grejH5ZXRS4gAM9bIDeTOJ1s72r14IGPLOqcNAeGdKnEZm8J0w1E8W1lZ6wg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793161684;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=vp/A0LBPgTgWPcd4p6BE9Yc4oRV3dBhm8Na8xexKDpg=;
 b=hKXPBoQOBIEVOrAqRq2AATn2/b2Zru+G2myNHPsyulA7PH+kLKcCvuyjgvNHRVPPisGe
 jnH41VWN2j97ClkeHHNY6LNwZ5uQgfG/xlRWEPg3cscJrhMn3EJQ79MRPZZsYl6UdTVeb
 n3f+2Yn2ddeLAPDfs6NfJrjwdDDwE8OB7kRTFTZSRpXQSIvqDtXKEhc+HYGWE61P2bAz7
 VfTWqmwT0gJLEinu6bdYIDM5Rt95VtxFpmbmHrtf6JxeyxJE4abPIDew25hdFQAvFvVtz
 /uPVw49OpODRCfKVPYH7xnI8S1RawW25jDoTJrj2EROpCQLoNTlLKhaxl4hKqU1EP9w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=vk23KVzq; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=vk23KVzq
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 479014006F
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 04:28:03 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a2d6d01ecbso3196885e9.0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 21:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793161682; x=1793766482; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=vp/A0LBPgTgWPcd4p6BE9Yc4oRV3dBhm8Na8xexKDpg=;
 b=vk23KVzqLJy+1VHtTsrsn8JiBYg7bbQU3iVUMULsETNaVH6Auqxsi0dAT927M4jCKn
 1YWmxU0iQg15iPD00ed0l4wZM9Rgc9o9IePDFxrV2JlBYsJARCDYjHng1PEctx1IQ5K6
 pdgt05sd3r0oXR0E2pGAhqyIeCYeukVjnisNNzjOCHtu4GJsH7+S84n7O/OZktW0VDST
 tFo11dg/IkGU7K1lIoInldnindcVQ9chVeYi+NWTaSzvJBVRVQjvccLTw5LCYiFA4F1N
 miOc6SNcbohD/xLz3JO+TpHxQ4m7J8j+Hsxl70cGRQS9PP4Azqtzsnk8CTUfxRSPwUXs
 hfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793161682; x=1793766482;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=vp/A0LBPgTgWPcd4p6BE9Yc4oRV3dBhm8Na8xexKDpg=;
 b=uMpxOpgG18xLcaRY56bGhiOrDYjbLrdgKWyVEXtFXs/+chX2avM5hNIpfB2h0aNsRA
 nvP26OSF5r52Dh42u0L87o4yg3ruMkG7/WEp6VVUFeLn+H+YFz/YqIfxzXxaSg8vJsp6
 kxilASJNQXg5y6yaxL85W0EhaIoGHMOI2ZjrqYKJMlZ5s/sq12SpZ00tjMxrhzEHZFGi
 7QFFxE1bjDGMO+5OCjgOe31gD731HEBXHhKjcBg1K1ZKM2cHtWmJFia49Vbl/wsbi6js
 ZCY9MUdIxhiOPf69U+fCceMWebs9ncSSCsMdhatcrNA28qIoGEebhScRhDa0mlLQ6DBs
 aSIQ==
X-Gm-Message-State: AFq9FYJPlTy5juBqQY+U/81sO30wjpd610fq72oQuQfvHrw1FfUpqyZu
 TNjudFbnk1dRf+qyxhyHbrqxMiLN1sAAdkKulxxmyQJ++nXDlUOoTiDjqWB2grKo
X-Gm-Gg: AYBFou3w2WdJF+hXEJe6Tjg4bIxbGN1/zeROwjnYNeYCvWLyjyMKOkk5ood6SBgYOu4
 x2rgK7Tqqf3KfhdktTB8IRfm1mZtKoD75g+23J9imZbPP4VAvaumksZ2wXMEp1m8d3035U49Z5L
 1rxYJcxrPF1iyCX+IvQ9VQEyA9iwzURs5ehGIfPY6LqOpjJxkibZkfgRYc3YOzegAVwG7epI/kw
 VOpfr5WN+r38M/iLeSfn5aojqFzQmxNMPuuw1pHGVKoZpN6tLa49vCFHCa0iAZROlbWLJCXFne/
 3dHBsRlRwoa5neaynt00vGTTU2AFmm0nnx7gBhg/HswsvlcoOkBVRdyl48mDF4sWFUZoAt2fBob
 cZfpd7rmfiOPRGRnZuDoP3bMfUqqFUGXPmKgVLr7ETBIfqVD/5veTgJQqTervj2fXDLEOHsoEdw
 sHrasDVpBKcrE+0flBHzxSZSsv06VdmS73+K7TWjXLvYbHn5TN8WlSF/l20ORLvZxr77+zaYTT7
 nu8OPwyxkcCUtWyXMVDDE4paPWEkTGdN5bFQgEO6BMeEhd1FgitD9TbFn14wACODCnsz/vLQCns
 ZUUDzovSFo9j0iaM83dnqFMnDcme3xB33C8M
X-Received: by 2002:adf:e19d:0:b0:488:7d08:edbc with SMTP id
 ffacd0b85a97d-48e5d45a35amr2954572f8f.24.1793161681671; 
 Tue, 27 Oct 2026 21:28:01 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb902sm27306002f8f.24.2026.10.27.21.28.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 21:28:01 -0700 (PDT)
Message-ID: <6ae179d1.dc9361f2.3c6039.dee8@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 28 Oct 2026 04:28:01 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-27
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
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

Autobuild statistics for 2026-10-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  8  |  0  | 14  |
  2026.05.x  |  0  |  2  |  0  |  2  |
  2026.08.x  |  0  |  7  |  0  |  7  |
    master   | 27  | 47  |  0  | 74  |

Classification of failures by reason for master
-----------------------------------------------

                   bird-2.15.1 | 3 
            gdk-pixbuf-2.42.12 | 2 
                 mdevd-0.1.6.5 | 2 
raw2rgbpnm-f28b903ca63b4c22... | 2 
                       unknown | 2 
                  xxhash-0.8.4 | 2 
                 aichat-0.30.0 | 1 
am33x-cm3-fb484c5e54f2e31cf... | 1 
                    attr-2.6.0 | 1 
                bpftool-v7.5.0 | 1 
                  chawan-0.5.1 | 1 
                cryptopp-8.9.0 | 1 
                 haproxy-3.4.4 | 1 
               harfbuzz-15.0.0 | 1 
         host-gcc-final-15.3.0 | 1 
            host-mfgtools-0.02 | 1 
              host-rust-1.99.1 | 1 
 ibm-sw-tpm2-rev183-2026-08-26 | 1 
             igt-gpu-tools-2.6 | 1 
libfutils-c326ce0cc2a735438... | 1 
               libglib2-2.88.4 | 1 
                 libical-4.0.7 | 1 
                libmad-0.15.1b | 1 
                 linux-6.1.190 | 1 
                linux-6.12.114 | 1 
                  mender-3.5.3 | 1 
                  newt-0.52.25 | 1 
                   openrc-0.56 | 1 
                oprofile-1.4.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
            quickjs-2026-06-04 | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 
         s6-linux-init-1.1.2.1 | 1 
                    sbctl-0.18 | 1 
                      tar-1.35 | 1 
               tcf-agent-1.8.0 | 1 
                 uclibc-1.0.59 | 1 
        ux500-firmware-1.1.3-6 | 1 
               valgrind-3.27.1 | 1 
                    which-2.23 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/c8ad6f07536a20ffe2303b61b716a5433efccb3d |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/bbcf92d9c56b75fb98d9ff97c847e88d55f7525d | ORPH
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/4c8bee9b95fc5cae96dd9e43273434bf6c32e03d |     
powerpc64le  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/21314b13e98764f1dcb9d5c717b075384d1553da |     
 powerpc64   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/0c5c4636f3b5c8bfd66c559dc94b82f912e342fc |     
  mips64el   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/f8224a9fb6fa55cb2c2a6656978dd8600bfa85ae |     
  aarch64    |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/e964fa1e09d24357dea48dc0ba96f84969001713 |     
  mips64el   |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/c5651d9dd6ce81b8f304b23fbf53fce189c305a5 |     
    i686     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/e6f75e2333556d667bd20283dc6ddee52ae314b0 |     
  mips64el   |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/99e14e18bb4fea0e68bb911a055b5df06bf3499e | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/1fb94b9fa4d031d9122846a1455f6d0f5ae2481b | ORPH
    i686     |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/f6b767b22cc51a0025bad3c7d1fbd3f1fd3fe6d5 |     
    arm      |        harfbuzz-15.0.0         | NOK | https://autobuild.buildroot.org/results/f88449ca8a3846ed2bdbcabc00a701ba73ebd5ac |     
powerpc64le  |     host-gcc-final-15.3.0      | NOK | https://autobuild.buildroot.org/results/8117bb5664ca9b3f8701e5cf483067be56b6e8b2 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/edc2a6b0358bef40dc7e602c25efecdbe33d00b4 |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/0bbb947c72d4ac26d35aaafcbb71aa86f94508cf |     
powerpc64le  | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/939f51d56d4cfab6bc2689f9ff9a80449ee25cfb |     
    arm      |       igt-gpu-tools-2.6        | NOK | https://autobuild.buildroot.org/results/75b79ab5cb73393d14df64ca011db90733758f73 |     
powerpc64le  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/50fda25dbcc45c5ecf20a413cea2876e05343409 |     
    m68k     |        libglib2-2.88.4         | NOK | https://autobuild.buildroot.org/results/88b702af54e69158862a4626b57f9827be439697 |     
   x86_64    |         libical-4.0.7          | NOK | https://autobuild.buildroot.org/results/36a8ce7ee6581bd24ec013d8564bc3214400faaa |     
    arm      |         libmad-0.15.1b         | NOK | https://autobuild.buildroot.org/results/3cc9b986db240c4ba2e1a4c0e771a9ec3aad85b1 | ORPH
   x86_64    |         linux-6.1.190          | NOK | https://autobuild.buildroot.org/results/3d03d525aa4909c121349fdc43852653fcbc8ec9 | ORPH
    arm      |         linux-6.12.114         | NOK | https://autobuild.buildroot.org/results/557640c147b24637ee7cf6bc3633106dedfa7351 | ORPH
    arm      |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/bcbcd25c59707ea95e07a89bdaafc5ae43af0197 |     
  riscv64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/73eaad9dd30780329865db1cca1143c505271542 |     
  aarch64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/430f32dab963694768c3ac01eddd566f7afaf2a7 |     
powerpc64le  |          newt-0.52.25          | NOK | https://autobuild.buildroot.org/results/68745d1e021db090643c569da37a88fea3b7e42d | ORPH
   x86_64    |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/97731d39e5ef224070e73419384a3d0dac3c211c |     
powerpc64le  |         oprofile-1.4.0         | NOK | https://autobuild.buildroot.org/results/3736d74136dfb33801a6a38144147869d06d6568 |     
    m68k     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/3c11e311f190bb6faca5606a40cf56846c84ab9f |     
    arm      |       quickjs-2026-06-04       | NOK | https://autobuild.buildroot.org/results/e4314466396112974f1c9098657671e1314e2afc |     
  mips64el   | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/4038cab2cb14ecc6e86f3b2ef0bd0b09418528aa |     
    i686     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/7e9e732da36f8c3cf16d6c05ea6bfdadc47d0311 |     
  mips64el   | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/2793f60d4c05ff26a1de461fc3e53321739e4177 |     
  mips64el   |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/6ce763f6857ee46d799795b7c97f9a4346d5f802 |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/f14a1921678c173aba93be1a3ca50968e6718b7a | ORPH
   x86_64    |            tar-1.35            | NOK | https://autobuild.buildroot.org/results/07c782c3f8c73385272e6da42f5965576fc8c688 | ORPH
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/8d5f5f8def4f916428b755bb3e478db2e644a5f8 |     
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/b2e5e48a360c25cea0a5cab85e8c5305d5085304 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/0edf84869ff4c1253b82c45eba8442edcad98bac |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/db677f4b430b7fdda11a56e0c5e7608114e5c5bb |     
   x86_64    |     ux500-firmware-1.1.3-6     | NOK | https://autobuild.buildroot.org/results/f0825e04fda3112219e3f69ab7e8021217a04410 | ORPH
  mips64el   |        valgrind-3.27.1         | NOK | https://autobuild.buildroot.org/results/c562eef960c049f1523ed1c6a30c0d5eacf905ea | ORPH
powerpc64le  |           which-2.23           | NOK | https://autobuild.buildroot.org/results/d22790d7ebcd680817f9fce5e2d3df8ae5424341 | ORPH
  aarch64    |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/f06bf4c07c325215c45457f87ef65110a91fd771 | ORPH
powerpc64le  |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/190ef8a2aafbd5288bcab16651ee53db84803afc | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                       unknown | 3 
              libmodbus-3.1.12 | 2 
                    attr-2.6.0 | 1 
                tpm2-tss-4.1.3 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/93b71a739e13da03ed12a182f03f7ac64bf47379 |     
    arm      |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/b4001184be2f176bbcf0ffab1f6ef28dfcd5c4fa |     
  aarch64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/a6aa152491213f296bb109c91207cd39c89ce82a |     
   sparc     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/b1688f502c5ca89ab66907b8cb5be3b65cb7c641 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/fe000a2461826bf91abcf4148b28fc85d6c59c69 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/b11e70a97cceafb4b86aa2592476ae1eb044c8d1 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/62435c92781df238203705c29f7d3b4420e241e7 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                   ccrypt-1.11 | 1 
                   duma-2.5.21 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/c8cf118fc865a308294e2710fbb7a1d8aa9ce3df | ORPH
    i686     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/3849e947d4e59158d1c91ee7e2394883ae8c7b70 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

package/linux-headers/linux... | 2 
                  bcusdk-0.0.5 | 1 
             libtorrent-0.13.8 | 1 
                  libva-2.22.0 | 1 
                linux-6.12.112 | 1 
                 logsurfer-1.8 | 1 
                 pixman-0.44.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/f023ad0695265d916e85aa4d0a28afa061ec8fde |     
    i686     |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/aec3006a1643b87a908079fe5492837b778c9864 | ORPH
  aarch64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/751676863b1dfa0ad2705f33fe74b30151c9cc6c |     
  sparc64    |         linux-6.12.112         | NOK | https://autobuild.buildroot.org/results/d51890fa384898a240583bb218f4973ac5a68f92 | ORPH
    i686     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/c9473fade36c4d8fe9a47e84491952411076a81e |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/b342b5c401400dcdacc45169f260be1cda3a2d87 |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/5a96425a34f964c4ed3f67b8987aeb4b4121af76 |     
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/0dcac8e0c06a0ac2f5613f65611622528e677e67 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
