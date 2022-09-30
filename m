Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D947C433FE
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 22:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DEE2610F9;
	Fri, 30 Sep 2022 22:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DEE2610F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zCec-giV8eNP; Fri, 30 Sep 2022 22:05:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F999610F6;
	Fri, 30 Sep 2022 22:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F999610F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CAD1E1BF4E7
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 22:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A619B610F6
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 22:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A619B610F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N6rZ7ARkECaU for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 22:05:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5A5A60B78
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5A5A60B78
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 22:05:04 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id s9so3666474qkg.4
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 15:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date;
 bh=L8cpMAY46mJ7PI+YSrrdvFfKCV9XwMdlnMYl8EpgGTQ=;
 b=o/BAqjpEMbtiP5VwWUGTr2iv2gUlGxBc+Kq0Gr2FmgSDI8TARioKN1kuLyWE+rvk3j
 pyWnlZ2m9ve8h/Wv4T+iIKCNebSJJu/4kJpDhAMGWYUS9qJLUQjf4YcWbhwVlZ7vG/uz
 wixfN284qLQWS5a+mdUdMtPEFKppyd4S8gTynKTu7qeG8VbvySVd+5UwGLTCQTo2qFg4
 5tQsEvqF9j60xiHsbn0TRyqopT+EvHRICWZ2Kg95bIzeFX2FMOU3xp8N4v2s9Ts6jmsW
 oWtH+SAJ+aMO9CpbjOGQR6p4rrQ/nVbxBOOr6KvRAeOoj91Iu0QAwOWLeyeqtjAhq1E4
 jTTw==
X-Gm-Message-State: ACrzQf2P4bSMgYYtzzm6kxYQp2WPTPrempfe8cFyvctzqRzd9sLnSAja
 5rH755zEwvawg/BO1w1YqF3ORTsxMfg=
X-Google-Smtp-Source: AMsMyM4md/nSBnioPAhyDPxhdqttO9wl0MA78pmvnFww0ZjWEwUTJFreELdp84m+G8sT09u8AWKsKA==
X-Received: by 2002:a05:620a:24d2:b0:6ce:cc17:c0dd with SMTP id
 m18-20020a05620a24d200b006cecc17c0ddmr7633692qkn.325.1664575503474; 
 Fri, 30 Sep 2022 15:05:03 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 l29-20020a37f91d000000b006cf19068261sm3649373qkj.116.2022.09.30.15.05.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 15:05:02 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------WZk4iTZZbn8YStll4TqA5U1g"
Message-ID: <a017257c-3c25-6e17-6783-5b77a5750b66@gmail.com>
Date: Fri, 30 Sep 2022 15:05:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220927221133.594071-1-f.fainelli@gmail.com>
 <20220928233856.77bb191c@windsurf>
 <dda7b7d2-4846-6623-5ca7-39799015a138@gmail.com>
 <20220929084006.64c0a629@windsurf>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220929084006.64c0a629@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
 bh=L8cpMAY46mJ7PI+YSrrdvFfKCV9XwMdlnMYl8EpgGTQ=;
 b=C1owlZccJ/dn1VgsLIFpKD/kNEhJtUKzoq6kbCK5hNU042L5l29RFOwqjhPRVN6ggv
 WcmC4TtmH58H1OtOvoronr2kdwLRhspdelkJC0T/zjculVt4cc6A4b40IDpwfKLtFXmd
 DMCK37QgrrxTflDaGi8a7qXVAnVMKeMe8zh+h48o/ykvWHrOHG7u43hn0cJ7r4rgu3f+
 oQ+lM98FcvRWUZVqCWcBr43CFidQFMGitZwlTqB3WjXQxwYqT695jyt/FJdksVxbxLbs
 aci0ynG/OAaS8/4FEhbmHqqEiSTQqwh9jgmoiCq1vo4yBLlHcfLgd+RYXBPUKjR3zxkz
 F+Cg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=C1owlZcc
Subject: Re: [Buildroot] [PATCH] package/linux-tools: Exclude checking PE
 binaries from perf test
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
Cc: buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--------------WZk4iTZZbn8YStll4TqA5U1g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/28/22 23:40, Thomas Petazzoni wrote:
> On Wed, 28 Sep 2022 15:28:58 -0700
> Florian Fainelli <f.fainelli@gmail.com> wrote:
> 
>> ./host/bin/aarch64-linux-readelf -h
>> build/linux-custom/tools/perf/tests/pe-file.exe | sed -r -e '/^
>> Machine: +(.+)/!d; s//\1/;' | head -1
>> IMAGE_FILE_MACHINE_AMD64 (0x8664)
> 
> Could you provide the full output? In other words, I'm interested to
> see if it's really readelf showing the same "Machine:" field as for
> regular ELF files, or if it's something somewhat different that we
> could distinguish.

Sure, please find attached.

> 
>> I should mention that the readelf binary in this case is the LLVM Object
>> Reader and it does support PE/COFF which is probably why it even
>> remotely attempts to parse the file.
> 
> How come your readelf is from LLVM? Are you using an external toolchain
> that isn't based on the standard GNU Binutils?

Correct, I am using a custom built LLVM toolchain that uses the Clang 
integrated assembler and none of the binutils binaries, or any GNU 
component for that matter.
-- 
Florian
--------------WZk4iTZZbn8YStll4TqA5U1g
Content-Type: text/plain; charset=UTF-8; name="pe-file.exe.readelf.output"
Content-Disposition: attachment; filename="pe-file.exe.readelf.output"
Content-Transfer-Encoding: base64

SW1hZ2VGaWxlSGVhZGVyIHsKICBNYWNoaW5lOiBJTUFHRV9GSUxFX01BQ0hJTkVfQU1ENjQg
KDB4ODY2NCkKICBTZWN0aW9uQ291bnQ6IDExCiAgVGltZURhdGVTdGFtcDogMTk3MC0wMS0w
MSAwMDowMDowMCAoMHgwKQogIFBvaW50ZXJUb1N5bWJvbFRhYmxlOiAweEMwMDAKICBTeW1i
b2xDb3VudDogMTExNQogIFN0cmluZ1RhYmxlU2l6ZTogNjM3MwogIE9wdGlvbmFsSGVhZGVy
U2l6ZTogMjQwCiAgQ2hhcmFjdGVyaXN0aWNzIFsgKDB4MjcpCiAgICBJTUFHRV9GSUxFX0VY
RUNVVEFCTEVfSU1BR0UgKDB4MikKICAgIElNQUdFX0ZJTEVfTEFSR0VfQUREUkVTU19BV0FS
RSAoMHgyMCkKICAgIElNQUdFX0ZJTEVfTElORV9OVU1TX1NUUklQUEVEICgweDQpCiAgICBJ
TUFHRV9GSUxFX1JFTE9DU19TVFJJUFBFRCAoMHgxKQogIF0KfQpJbWFnZU9wdGlvbmFsSGVh
ZGVyIHsKICBNYWdpYzogMHgyMEIKICBNYWpvckxpbmtlclZlcnNpb246IDIKICBNaW5vckxp
bmtlclZlcnNpb246IDM0CiAgU2l6ZU9mQ29kZTogODE5MgogIFNpemVPZkluaXRpYWxpemVk
RGF0YTogNDA5NjAKICBTaXplT2ZVbmluaXRpYWxpemVkRGF0YTogNDA5NgogIEFkZHJlc3NP
ZkVudHJ5UG9pbnQ6IDB4MTRGMAogIEJhc2VPZkNvZGU6IDB4MTAwMAogIEltYWdlQmFzZTog
MHg0MDAwMDAKICBTZWN0aW9uQWxpZ25tZW50OiA0MDk2CiAgRmlsZUFsaWdubWVudDogNDA5
NgogIE1ham9yT3BlcmF0aW5nU3lzdGVtVmVyc2lvbjogNAogIE1pbm9yT3BlcmF0aW5nU3lz
dGVtVmVyc2lvbjogMAogIE1ham9ySW1hZ2VWZXJzaW9uOiAwCiAgTWlub3JJbWFnZVZlcnNp
b246IDAKICBNYWpvclN1YnN5c3RlbVZlcnNpb246IDUKICBNaW5vclN1YnN5c3RlbVZlcnNp
b246IDIKICBTaXplT2ZJbWFnZTogNTMyNDgKICBTaXplT2ZIZWFkZXJzOiA0MDk2CiAgU3Vi
c3lzdGVtOiBJTUFHRV9TVUJTWVNURU1fV0lORE9XU19DVUkgKDB4MykKICBDaGFyYWN0ZXJp
c3RpY3MgWyAoMHgwKQogIF0KICBTaXplT2ZTdGFja1Jlc2VydmU6IDIwOTcxNTIKICBTaXpl
T2ZTdGFja0NvbW1pdDogNDA5NgogIFNpemVPZkhlYXBSZXNlcnZlOiAxMDQ4NTc2CiAgU2l6
ZU9mSGVhcENvbW1pdDogNDA5NgogIE51bWJlck9mUnZhQW5kU2l6ZTogMTYKICBEYXRhRGly
ZWN0b3J5IHsKICAgIEV4cG9ydFRhYmxlUlZBOiAweDAKICAgIEV4cG9ydFRhYmxlU2l6ZTog
MHgwCiAgICBJbXBvcnRUYWJsZVJWQTogMHg5MDAwCiAgICBJbXBvcnRUYWJsZVNpemU6IDB4
NzUwCiAgICBSZXNvdXJjZVRhYmxlUlZBOiAweDAKICAgIFJlc291cmNlVGFibGVTaXplOiAw
eDAKICAgIEV4Y2VwdGlvblRhYmxlUlZBOiAweDYwMDAKICAgIEV4Y2VwdGlvblRhYmxlU2l6
ZTogMHgyNTgKICAgIENlcnRpZmljYXRlVGFibGVSVkE6IDB4MAogICAgQ2VydGlmaWNhdGVU
YWJsZVNpemU6IDB4MAogICAgQmFzZVJlbG9jYXRpb25UYWJsZVJWQTogMHgwCiAgICBCYXNl
UmVsb2NhdGlvblRhYmxlU2l6ZTogMHgwCiAgICBEZWJ1Z1JWQTogMHg1MDAwCiAgICBEZWJ1
Z1NpemU6IDB4MUMKICAgIEFyY2hpdGVjdHVyZVJWQTogMHgwCiAgICBBcmNoaXRlY3R1cmVT
aXplOiAweDAKICAgIEdsb2JhbFB0clJWQTogMHgwCiAgICBHbG9iYWxQdHJTaXplOiAweDAK
ICAgIFRMU1RhYmxlUlZBOiAweDQwNDAKICAgIFRMU1RhYmxlU2l6ZTogMHgyOAogICAgTG9h
ZENvbmZpZ1RhYmxlUlZBOiAweDAKICAgIExvYWRDb25maWdUYWJsZVNpemU6IDB4MAogICAg
Qm91bmRJbXBvcnRSVkE6IDB4MAogICAgQm91bmRJbXBvcnRTaXplOiAweDAKICAgIElBVFJW
QTogMHg5MUNDCiAgICBJQVRTaXplOiAweDE5MAogICAgRGVsYXlJbXBvcnREZXNjcmlwdG9y
UlZBOiAweDAKICAgIERlbGF5SW1wb3J0RGVzY3JpcHRvclNpemU6IDB4MAogICAgQ0xSUnVu
dGltZUhlYWRlclJWQTogMHgwCiAgICBDTFJSdW50aW1lSGVhZGVyU2l6ZTogMHgwCiAgICBS
ZXNlcnZlZFJWQTogMHgwCiAgICBSZXNlcnZlZFNpemU6IDB4MAogIH0KfQpET1NIZWFkZXIg
ewogIE1hZ2ljOiBNWgogIFVzZWRCeXRlc0luVGhlTGFzdFBhZ2U6IDE0NAogIEZpbGVTaXpl
SW5QYWdlczogMwogIE51bWJlck9mUmVsb2NhdGlvbkl0ZW1zOiAwCiAgSGVhZGVyU2l6ZUlu
UGFyYWdyYXBoczogNAogIE1pbmltdW1FeHRyYVBhcmFncmFwaHM6IDAKICBNYXhpbXVtRXh0
cmFQYXJhZ3JhcGhzOiA2NTUzNQogIEluaXRpYWxSZWxhdGl2ZVNTOiAwCiAgSW5pdGlhbFNQ
OiAxODQKICBDaGVja3N1bTogMAogIEluaXRpYWxJUDogMAogIEluaXRpYWxSZWxhdGl2ZUNT
OiAwCiAgQWRkcmVzc09mUmVsb2NhdGlvblRhYmxlOiA2NAogIE92ZXJsYXlOdW1iZXI6IDAK
ICBPRU1pZDogMAogIE9FTWluZm86IDAKICBBZGRyZXNzT2ZOZXdFeGVIZWFkZXI6IDEyOAp9
Cg==

--------------WZk4iTZZbn8YStll4TqA5U1g
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--------------WZk4iTZZbn8YStll4TqA5U1g--
