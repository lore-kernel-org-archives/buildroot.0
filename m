Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99709C9831E
	for <buildroot@archiver.kernel.org>; Sat, 26 Sep 2026 03:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFF7960DA8;
	Sat, 26 Sep 2026 03:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfuK8r2IdqfO; Sat, 26 Sep 2026 03:36:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B1D5D60B66
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790393778;
	b=ZsXH/WqADZWb6f5Bx3tG0qmicxMfgNC9FYdHLlm8zaUp6Ax+YQyqhnpECKUbo5MQm3M+
	 GBFYgDFgpNgMMjp8rp0w9o+GcphrCrJnVha3bTKkaxM43Dk71h1GW/IKKDB/iDWw4LmJo
	 lXfdFLnLOscvyVrM19lhaGVrMuihp0jaF3nZTQuchbnhck8P/kMMbzU2mVpyEicolIuRU
	 E+8NJqRfrHJ279RcuNVZ3mEiPLVl4u3ocfINAhkgNuZXitIYkcQu318Eznk2IKw3sO8+q
	 vB+MS6tKlXjj3lUWAV8DuoZtx6rRbgFo7XHE765XsOmZfdBxKvYispcklaHUVieHXZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790393778;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CLGCTV2v0wxHygW0DhhblyS6/xDMKHUytRstl4IP9iw=;
	b=eeQeAPp6w5WTZTfceo5JjrBpp6lQ6nuDsNhFKqblc8/9v22f/3tPjZ6JDUjCZp9wusfY
	 LMCoRyh4zpnd+Y+hwLUA/Ul7qCmFhT96iBv3EWcw51+QNJDWP22BwIrXNo1XCR0PjM7ct
	 1mmrqQJWm7Wmq2YhFjlZbdauYBEtx1QQmdazzAzCZALCY1pY8BSZftpmWagtdXnDLhEUr
	 njEgygDXzrWI+ZZ/dVOC7KjB3yTYV4eSbutCfdmaAndbUuh4MYFsRNHkUyamdLSmyOdM1
	 5Pdg6GVaV5jqLB8tcLFpHjxz87+5jp++1yD6uw7rvFdmPdkCoHkD+CX+tnEM4SmCvZw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790393778;
	bh=CLGCTV2v0wxHygW0DhhblyS6/xDMKHUytRstl4IP9iw=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ObPKpckFv0rbSMHIIljc8LNuLGYGr5DxamEaBXp4K8Gs8Sg47xFrxo1c37UrLn26k
	 USgTQj5NDOp7jvx+c3UUl9Hs9p6PIGf+qhJh8Iw6r5BNjwQtrFW/ltj1FF7pf2HTkG
	 QwBgxre8YVH8KC/OznEqBKntF5NcCU+lmKfGV7ZRLmo0/svDe7Sqrb/Sq+w57t7fPE
	 9xdDYXufHyZ53grFcJgviCCD4p/SM8bjqbLGI3G77+nt5Q9WfcSSC7Ib/ak75QkJuI
	 xr+ugxihBfRnb3QAEVcKxSa6wCmpUwKuH0xI0tf3EvzgKwJ+Rpkviy8MAhkzEBoxKG
	 7uWDPahBv1kKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1D5D60B66;
	Sat, 26 Sep 2026 03:36:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A8AA34B8
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 03:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D38B40082
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 03:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54dIiQ5II4xu for <buildroot@buildroot.org>;
 Sat, 26 Sep 2026 03:36:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 103D340062
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790393776;
 b=Dh72Ykbfbbu6anabopwf7csgmsbMau6OIeaNz7SVR+iOdQYPq4IG20rc7EJZT3j8PmEe
 Kd/h1Y3D71rJSwtsUpSyuqMsP9qKNYzvhzLCxnHVBU0SP0Nv9pbCDpgrGE4n0sefUAgvd
 r9NaAuhvnXgx6j5Ur15vLCLC3mpMHfKRz/ZdFQrYNZVzjzRRlckOKDncEYtZvfR+w2M2g
 1oNZtwgYCig4OWo9GxHg2SFWljQO3oTGcT+TC6PdzhgiVKAuZs1gby6et74Okui1h8OA5
 erpjNHKbTnIdDRgyFr1buMOEILMjVCw/eytwYd0Fdckt52pTQDJ9C/Ou86cKhVibHww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790393776;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=SCPDig1SPSq8+++Og/ezF9UB4Y3ET+cpKI/anhymVrc=;
 b=JFAIMS4oL4vfjWYn4nPdYH70gVJmI18AmN5srQ6TrNgXM9NpZfL2ctF8s8aPLdAqkUWd
 fpFUSPF8IH8Ply8Eh2ZmzmiUPfgCe1eRCUIoXcRtn42qMmlPEym5QsRdQSBdjD8pVmp6d
 LCtA3veDkdnWko5PkfCqN5/wTAI2eLhLR4GypbMhdJDcOjep4iDOJY2MwCymx0SX2S3Nr
 DS1he+G/ZB2+UvfPoGExt5NkhDLTcFdxPgauosoFQrrMfQISIscSijWwX6dQfjcK12cB7
 vjQpdIjctXPdCS5b5CY/OdX+G26ohikSVNuNjGDWAYlmTo437v4zP1TKlbVpU8a4hRA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Y1l+qT1u; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Y1l+qT1u
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 103D340062
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 03:36:15 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e8185e037so8093865e9.3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 20:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790393773; x=1790998573; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=SCPDig1SPSq8+++Og/ezF9UB4Y3ET+cpKI/anhymVrc=;
 b=Y1l+qT1u9nyMuSJf7FgJEuUy2CfHTed0Hq1DkvlfJVMcOILtdlAObNtx1qsl308Ym8
 fS4jo7Kf8ZQuuu1MOdbaIyb3iGzxD3KeuGk37UXS35Rlny+YCCOboZ1StEpYnFtVjavG
 bOyFHEpvTS3TusyAEMnsGsJJoc4eVltiJT30x4/HMeKYK8KKhGvPNUJNunW0te0UI8zh
 xT73mWlf6rfTrftECZ7g5HZMHg+rjib3UONXwrfvZPXE4Cqx6Zi1J1EG9TZ3riWKpYFY
 QkLFCEVZkLFlJlXzmIGUBWzp6i+hbM63M92K41ub6NdtK2HZwRVAu2F6n7cKwO2CfSAw
 LL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790393773; x=1790998573;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=SCPDig1SPSq8+++Og/ezF9UB4Y3ET+cpKI/anhymVrc=;
 b=aA9q/P6W+ppfsELxgD6iUCVK+ALZwNert7Mu9CyrUwQ7isPx9s9KA/yu/trJX1OtXO
 eYR6TOTsQ1H4SDVJ0f5JmkxC3Dankr4IeU/egmIVwH7fQ5lGl6ZlZ3za8gFdeaTO44fb
 0RJQIP0nEu871UzMKVFhOfSa2sDWqCVjghLXm+nsY3OqOd4RjzhvuclDqj+sTDRCDAFe
 sRcOdpuY4LHs++qortDBH9iCdi0ZjSQFHXczj00e/z7nGS5H1WFhqLrdUFBx6F5yWaHE
 3/WTb1/HBCUgGDzggtHrEGkAhXDZwC6YfHh9LnFbaNIRE9wpQES2coH1N4i2W32DpcIT
 i9LA==
X-Gm-Message-State: AFuF++l5dbd8eaMCvjrhozopfUFKyys0GqWF/GHosySLSr2cNHXex0Yr
 P5SAlPB/wBX5TPMnIZH+M3908pAeNZc/zN0r6MDRb2USQiHudEZjRJWadUQR5M5/
X-Gm-Gg: AYBFou0Zn9yMapsCjvPRIEDSWNprQPWI0helnyahPrFxOxy7zcqckK+2hfjxY5eDSfW
 1KXmLS3IFbHJcABj1g4BUWHd+3+5AtCTO7CLN0Dzp+buyYZXws2tv0UeZZoJfhe4hK3ENvNMWeM
 SrqzrSJwvD13emXqK+Kd1hjNtNgb1ZZe/ZxdI/Oe3NPlPg1vZgafC7Hlcg2/xzM2lKCugmyJRjy
 kmQjXYZNbRfZAq6aIykjgFglnz31VrardrC6XI2BZGWwRmMLUmi1Sh+UjEe+5l2yGFewvoO/OD9
 /xwUNSLY2x/xh4EeaU/hqshEx27pJ3+hFQBQYjcKC4yjFh0DkVJwGBhmj/0N0VCcTctB0/9hRUk
 OuOqcEETMwRxcBQK6R3QdhOZPfARlfyc+ohTZx0Ellc6g5ZCvLcC6TJvELQV8crLq56nxpwPYsA
 wYuJTuj4KE7dW0lu42a3rXlicE5sc1ZdN0WXRPf6Zv9WuOgfqrmNc878iCDkundE6VSi7jok9dO
 Cs=
X-Received: by 2002:a05:600c:609a:b0:49c:dca2:ac47 with SMTP id
 5b1f17b1804b1-49ff06b2db4mr76164095e9.2.1790393773414; 
 Fri, 25 Sep 2026 20:36:13 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5ce4941sm190233065e9.6.2026.09.25.20.36.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 20:36:12 -0700 (PDT)
Message-ID: <6ab73dac.1fb8f4c1.1a9819.d3b1@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 26 Sep 2026 03:36:12 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-25
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

Autobuild statistics for 2026-09-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  6  |  0  |  8  |
  2026.05.x  |  0  |  2  |  0  |  2  |
  2026.08.x  |  3  |  1  |  0  |  4  |
    master   | 26  | 33  |  0  | 59  |

Classification of failures by reason for master
-----------------------------------------------

                   bird-2.15.1 | 2 
             bubblewrap-0.12.0 | 2 
                host-wine-11.0 | 2 
                 libclc-23.1.1 | 2 
               libepoxy-1.5.10 | 2 
               tcf-agent-1.8.0 | 2 
           uboot-tools-2026.07 | 2 
am33x-cm3-fb484c5e54f2e31cf... | 1 
                   ccrypt-1.11 | 1 
          cloudflared-2026.6.1 | 1 
              cryptsetup-2.8.8 | 1 
        edk2-edk2-stable202602 | 1 
                  ffmpeg-6.1.5 | 1 
                 libclc-23.1.2 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
          libmicrohttpd-1.0.10 | 1 
                 openmpi-4.1.8 | 1 
                openocd-0.12.0 | 1 
                   perl-5.42.3 | 1 
                  prboom-2.5.0 | 1 
                    proj-9.8.0 | 1 
                 rtl_433-25.02 | 1 
                s6-dns-2.4.0.0 | 1 
                       unknown | 1 
x264-baee400fa9ced6f5481a72... | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/9ba5aa40e64f4999c02c3154b9d8bfa574216030 | ORPH
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/042cd51ee4dc8cfc51d31ebb61001c1a349f1cee |     
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/edcb3e615cba0b6418429b4c37d217c2a983fc57 |     
 aarch64_be  |       bubblewrap-0.12.0        | NOK | https://autobuild.buildroot.org/results/d1d11877d57cbf62140827abeb3cd870d8fe2ff3 |     
    i686     |       bubblewrap-0.12.0        | NOK | https://autobuild.buildroot.org/results/893be7b36ddc01b55bb651079905a838b0ed2bb6 |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/bb674b38053ec564ff3703881ab6ce7e98532ed9 | ORPH
    i686     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/2f6aa8028893c2eaf3f89a44c103dc73eca8c699 |     
    i686     |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/cb2be16847b7bf3636e755438ced18e1ea127cca |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/0c17fbdd66dbbc09ef66c727c1a704b6856cb4cb |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/d3f74120efa0bf7b6c861d298a32c5527f0219b9 |     
    i686     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/e86b405fed3bbd21b996def89afa5c93a49d828c |     
    i686     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/d76ee95afde44fffd3d892296bc6788b6074f080 |     
   x86_64    |         libclc-23.1.1          | NOK | https://autobuild.buildroot.org/results/276995eb4de88be67c5d47893754337fd53aafa5 |     
    i686     |         libclc-23.1.1          | NOK | https://autobuild.buildroot.org/results/f09c43300ae7ab11223c7b0e0e9f1c1ace4908ff |     
   x86_64    |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/9d7c680255d9cb49438f9b7c0910bb352c588801 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/834c5047c9734569d8bd30e54db5a8701e4a232a |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/703f5efe31eaab4bc5c3fa308b883a62ab1a596c |     
   x86_64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/c490fc7ed1fc8bd72d056d88603fc2c7c33d1a54 | ORPH
  mips64el   |      libmicrohttpd-1.0.10      | NOK | https://autobuild.buildroot.org/results/10f33829552059264104623353a9ec1584b08e4f |     
    i686     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/8db77e7dc6cd4b293be5b12243dfad4593f149f4 |     
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/95077d5cb538deba85d927e561121871d7725901 | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/e76ebd2616fa764ff039a7eedd5c8a647f80f6d5 |     
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/002d0df6b387d4d26a2dfeb387cc79c6236c2218 | ORPH
    i686     |           proj-9.8.0           | NOK | https://autobuild.buildroot.org/results/add8ed0badcd61f33850b9327b1b9c472b2c5905 |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/94d681b71d704b5e644b1640085789e288289cb8 |     
    i686     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/12efaed39087337949010c2565df45d356d46f15 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/c929bde55b50bfa1ebac9e2bbc917d2c4e36ac02 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/84970982639cc13aec3a2c84b26940bb856ae5d0 |     
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/592fef0545d43cd8f2d9a63e69a3ee8ead9a83f2 | ORPH
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/e8964140a434285753ecaa3e757868baeadbb7af | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/0a0d267de308ecb4427948545e44e098fea486e1 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/2b1e27351d380a36a1904e6c01eb8d928685fcf5 |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/71085b2dc117683068658b5a282f4640a29c2301 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

python-remi-2022.7.27-37-g1... | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/77fda21caaadcfb7aea6ba2b39302e0049987cc5 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            host-go-src-1.26.6 | 1 
               pulseaudio-17.0 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/0a1f52e28d45725fe2a1a0cfd261afffca155b06 |     
    sh4      |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/84290151e23dfe2c4866d226c73e8e570bde8385 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  delve-1.22.1 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 gerbera-2.4.1 | 1 
                 logsurfer-1.8 | 1 
                  mender-3.5.3 | 1 
                   swipl-9.2.9 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/24b4746377275938d2ca55b56149b1f8c9b31794 |     
    i586     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/684195d023f485deacd94fb39a72732d133ec644 | ORPH
powerpc64le  |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/c34b60bfe441e1453be6894442e5510335afda94 |     
    i586     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/186872fa9ecb6ddb4cc51157a7c79a9c61365056 |     
  riscv64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/bc371de530678cac7695393702ae7c375b9297c4 |     
  aarch64    |          swipl-9.2.9           | NOK | https://autobuild.buildroot.org/results/7369bf74c3464570848efa06db817e471ea20c1f |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
