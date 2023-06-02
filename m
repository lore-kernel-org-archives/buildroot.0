Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43448C7EE24
	for <buildroot@archiver.kernel.org>; Fri,  2 Jun 2023 06:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA42E426DE;
	Fri,  2 Jun 2023 06:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA42E426DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ou6ca2HSMMaL; Fri,  2 Jun 2023 06:06:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DA05426DB;
	Fri,  2 Jun 2023 06:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DA05426DB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D21B11BF5A8
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 06:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A65CC84209
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 06:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A65CC84209
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DCI_SccMt6Xm for <buildroot@lists.busybox.net>;
 Fri,  2 Jun 2023 06:06:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D3B184206
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D3B184206
 for <buildroot@buildroot.org>; Fri,  2 Jun 2023 06:06:23 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f3b5881734so2261105e87.0
 for <buildroot@buildroot.org>; Thu, 01 Jun 2023 23:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685685981; x=1688277981;
 h=subject:from:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r+W+2cyJESDu2AZwJ02X3eTNZFfCNRJXtEawhX7rHow=;
 b=APpwsUpEiVqo+A64L2vYaB3UBe3yOJMJpeTadfQCfhjw+RLkjeiiXlOpF8VQNPs3cF
 lzXw0kfr5JDf+OY80fU3T/6WErZWlSVNNcAX/MWbLv71KZzGGCK7EdkfeY8dpDh2alHU
 W3vrQ0xsfLxHS1z3FHlx7S5GfM1ju657+KgmevuoiV4B7kpgnHDNc9q/Q/iwgXP61wmE
 DEMEHu2oGE9kazBF3V5JuK+A8/t0QvBUNoS3oex47cgKrQepSPhf3t79ChMdNSBT8OjD
 dWLMzmJ15Y0jrAsGoAgJajaRUHFVNs4cpTuX/pW7k0O7I80jtWZjrQ166kJY4m5/GLNA
 zqrw==
X-Gm-Message-State: AC+VfDxP6YWqE2T6Xq6TDKuZyGg5loqcBlA/+0mIe+Obu1d8HQ08T0hw
 XDVreHjocLeAy7PgeBlI++711xig6Nrgyg==
X-Google-Smtp-Source: ACHHUZ6pUAN1Ehdtl2jRqKgH8GqXe2zEwTV2ePnbx49N1+pJI+vJJTfoDQ2QtOw+QKM4IMc3Z3+LJw==
X-Received: by 2002:a05:6512:376f:b0:4f1:3eea:eaf9 with SMTP id
 z15-20020a056512376f00b004f13eeaeaf9mr1100746lft.24.1685685980754; 
 Thu, 01 Jun 2023 23:06:20 -0700 (PDT)
Received: from [10.0.2.15] (89-64-5-54.dynamic.chello.pl. [89.64.5.54])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a056512048700b004f508e8a9acsm50640lfq.301.2023.06.01.23.06.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 23:06:20 -0700 (PDT)
Message-ID: <81e83506-622a-7036-283c-eb0b19fcc369@gmail.com>
Date: Fri, 2 Jun 2023 08:06:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: buildroot@buildroot.org
From: =?UTF-8?Q?Adrian_Pra=c5=82at?= <apralat.mikroel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685685981; x=1688277981;
 h=subject:from:to:content-language:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=r+W+2cyJESDu2AZwJ02X3eTNZFfCNRJXtEawhX7rHow=;
 b=fjejSyQaRrjxufoPYdwiMfVw7fEE+l5oQc4rmiTZQedusQTyp6zHiGGagNvtYrSlmM
 IRR93465IzwAKyw9LanVBGlVv27To/FeBcce5OvZuHUpzHd6tq1PCxw742X7TwJXAN5V
 DCFo32/worVCUCEY46hk3iObl1xKqXZnsKPX/ZK2AA9DOPN3x/vjvTT812NISDnYOwZ9
 PEV0GGBi1Ab1LB3oJ3TCksmCUYmkqFy7mR1dziSdmrMZMkpWd7+fp+IWFAqAaY0XAtPU
 JXTnJdb9JHbfCVx7ikiTRZOdUxchy2bY5HX0FAPq9UWVjgA/9LAHsyNv73jQt+Ubpj1v
 mnwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fjejSyQa
Subject: [Buildroot] Issue with compiling buildroot toolchain on Fedora
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0875425038905140289=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============0875425038905140289==
Content-Type: multipart/alternative;
 boundary="------------q00cO8pO8P5TggQtGZ8NAUjO"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------q00cO8pO8P5TggQtGZ8NAUjO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

today we hit an issue with compiling the toolchain for our device, the 
issue is with the package M4.

During the compilation on other machines running Debian (kernel 
5.10.0-23-amd64) everything builds normally. On my system however 
(Fedora 38, kernel 6.3.4-201.fc38.x86_64) the build fails with the message:

configure: error: cannot compute suffix of object files: cannot compile
See `config.log' for more details
make: *** [package/pkg-generic.mk:222: 
/home/mikroel/project/buildroot/output/build/host-m4-1.4.18/.stamp_configured] 
Error 1

The only difference should be the kernel, since we build our images in 
ubuntu 22.04 docker containers. The issue is present on branch 2018.08.4 
and also other branches, such as current 2023.05-rc2

Any ideas on what can we can check or do to narrow down the issue and 
correct the problem in buildroot itself?

-- 
Pozdrawiam / Regards, *Adrian Prałat*

--------------q00cO8pO8P5TggQtGZ8NAUjO
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi all,</p>
    <p>today we hit an issue with compiling the toolchain for our
      device, the issue is with the package M4.</p>
    <p>During the compilation on other machines running Debian (kernel
      5.10.0-23-amd64) everything builds normally. On my system however
      (Fedora 38, kernel 6.3.4-201.fc38.x86_64) the build fails with the
      message:</p>
    <p>configure: error: cannot compute suffix of object files: cannot
      compile<br>
      See `config.log' for more details<br>
      make: *** [package/pkg-generic.mk:222:
/home/mikroel/project/buildroot/output/build/host-m4-1.4.18/.stamp_configured]
      Error 1<br>
    </p>
    <p>The only difference should be the kernel, since we build our
      images in ubuntu 22.04 docker containers. The issue is present on
      branch 2018.08.4 and also other branches, such as current
      2023.05-rc2<br>
    </p>
    <p>Any ideas on what can we can check or do to narrow down the issue
      and correct the problem in buildroot itself?<br>
    </p>
    -- <br>
    <div class="default-style"> </div>
    Pozdrawiam / Regards, <strong>Adrian Prałat</strong>
    <p></p>
  </body>
</html>

--------------q00cO8pO8P5TggQtGZ8NAUjO--

--===============0875425038905140289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0875425038905140289==--
