Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9D6C02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 11:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23F4060B9B;
	Wed, 15 Jan 2025 11:11:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NojfoJafk08D; Wed, 15 Jan 2025 11:11:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1574C61070
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1574C61070;
	Wed, 15 Jan 2025 11:11:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C457B89
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 11:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BFCB4156C
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 11:11:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hEms6MR6akkL for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 11:11:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A41F540881
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A41F540881
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A41F540881
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 11:11:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.124.111]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mw9QC-1tFFOr34aK-0158FT; Wed, 15
 Jan 2025 12:11:25 +0100
Message-ID: <089b9f07-82b1-41ec-8600-ebc7af8263e9@gmx.de>
Date: Wed, 15 Jan 2025 12:11:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20241204182913.4085670-1-fiona.klute@gmx.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20241204182913.4085670-1-fiona.klute@gmx.de>
X-Provags-ID: V03:K1:PkhLc46w8mTqO5ddDkQMgPF4H4aZ/fxLA1GctPYsdQQWi3KQc4p
 IcRa9p+ipWtEpUhnhWQQtCv2g7OrAfxCZ/oWLbxI3reXHVCxbFqUP1pxw8BruA5mGyQw0+X
 27For4FvFSHwevVg/TDPE346D8D9maAlYptC2ZWTseL5dCFJhzJa/Kctk10sih5AVrWiRgq
 HMlOAdBvadjmJhSze1kWg==
UI-OutboundReport: notjunk:1;M01:P0:yaq+9euk4yI=;X+lxytPSKHw2wROK7KPKXERL/+U
 nN2Nak3vpVs167P+3j8Y9HChF52QIxgjMugV+jKnbYntpqJ2GJYwLqi/WoayNEsLn5cv16e8Z
 uRV+l3aOwHLA+2VB2wd1Q5F04rr7XVpSgAE7PUEBEOQ17kIJGQzNcAwnvDofcZkfqg2uUYc7E
 lJumEuTqF4qxy0K4RmwXBb7tiU7AVOnhj9sc5eG5b8giUI1me+vOBR5ygVXcET+t4TKqTUMVt
 ESJI7EB5+vlH/DH3cpZ4HmppgZhB9q/xgX8tqpvVGR4rFk0EisF4EFptuD2ra9vftpGECCSuW
 DNQ0PVSNNWhhNKAk5jtD+h6yc4nZObucqyWIEpxksYId8wj4f5Dq9YE8lcSKsBxTtEasch18G
 BRUmPfNMdHyqabk2rF6YMvu6eVQc4CSI81I8etJV62+EfmLc4F17z+76Z0E+VW4/Ci9icGPhb
 H4F50c+QdDSGQJotTOdi7Kib/eHRg/FoH7pfOXr+FB09/W0gfSAGFDEJsEqI1LwF+TRWTU+Yu
 kiHQ6KEvktySyIsN+Qk449K+bGTE8ofdOPoNa8LSusYnQD06CwHfp35Q7/L8tDhM/TZ8FpY2T
 84js65EYh0vjt3+Mn4SCVC3hLMsEuNsnpg59HdGunwDkrA50iJ6s2HZsnoZZplrMFL3SZLXoJ
 YCfHylBaavq3Ps3eG/xb0c/uaGuE4mRLyUpRZtDtaGuzAbWrD1vRrhn3dTg6bgyv4q5UD0eCy
 A/dR85+v7GICKV1tenmuxF1w6och60ZPuoTFxifye7uz3s3typm0Sp4sXE4qfUWV/jVUJ0Hz0
 SVy7ZEQWmtRHiC3I9AC1zd/Dpqf7mpIyOQ1ZM261yM4/w3dRekq4Aik3na81Vb25s/SYFtpw7
 dq1NApUvvrbckJ64+pwZcRxFEaQXvJdf9EV5HEyGqhAJbUwldhXW8OF0gor1u8yvINBeS42Lu
 u625j71He0U5DNiqJrwp0ygZGgm7EZFDTQD64EjQUUJXfPl3hASnKZ9AVhVFdchTSh4CrDcyK
 /+qpGf0sYQcCIY7u94wtFzUpvpftZw4poe65DlV97IF1iRUSebRhh466sbWQv7rAz0YeioORq
 y9oEzVrQg1u6JpDNIES1Rze1PyQOzD
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736939486; x=1737544286; i=fiona.klute@gmx.de;
 bh=j6GANyxNdoG6rOZG605pmL8C2CqBxVfJ6D7tBuNC794=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=K0LrLcA1KSWKrm9oubPM9jK2mglaohTuA5HAKWia7mlx17q/FSPm9TGLOYN4CUuz
 2kO+7uBCSKvPzSuA7MdtVgoyRfEtIWMwO38REGxRTODXtTO9TJmHI6dgQPQeZNAF/
 c9JOWFeAH7O2N3kx6lu3KOllUfLvscmu6PmKzt8Y6NNRNG16qWm8l3u5Jo/puogmh
 /2ERyR2ZoveCH/DffEMRrizpyx0oTXncA+3E5rOPSRz13F47A1mqm3d4jcGdFC3Yp
 gHsAiAX2CRTiQ5B5Ca4enNfTmhv5ySzKELErWp5NMhKbPYBF6IxRSx+5hAuiFnxCN
 vzFPD5yPujtMIUbdXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=K0LrLcA1
Subject: Re: [Buildroot] [PATCH v5 0/6] nftables firewall support
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Julien Olivain <ju.o@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

is there anything I can do to get this series merged? Having a proper
firewall is important, and I'd rather get it into shape and merged than
keep carrying local patches. :-)

AFAIK the only open question is if the current approach of warning on
reload if the rules file doesn't contain a flush (to replace current
rules, instead of adding to them) is good, or if doing a flush
unconditionally, or nothing at all is better. I can quickly adjust that
if needed.

Patchwork link for the series:
https://patchwork.ozlabs.org/project/buildroot/list/?series=435291

Best regards,
Fiona

Am 04.12.24 um 19:29 schrieb Fiona Klute:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>
> This series builds on two patches I've sent previously before, with
> the main goal of supporting firewall configuration through an nftables
> rules file. Offering the choice of iptables-nft as the default
> iptables implementation (smilar to e.g. update-alternatives on Debian)
> makes it easier to integrate that with legacy applications that rely
> on the iptables command (e.g. Docker).
>
> Changes v4 -> v5:
> * nftables init script: run any target only if rules file exists
> * iptables init script: run any target only if rules file exists,
>    except for "save" (which may be used to create it)
> * rename series to clarify that nftables firewall support is
>    non-existent otherwise
> * v4 for reference:
>    https://patchwork.ozlabs.org/project/buildroot/list/?series=416810
>
> Changes v3 -> v4:
> * set ip6tables symlinks when selecting nftables compat
>
> Changes v2 -> v3:
> * move change from "iptables -F" to "iptables --flush" to the correct
>    patch (3/6)
>
> Changes v1 -> v2:
> * add patches 3-6
> * clarify comments & commit messages
> * nftables init script: Warning about missing flush in ruleset on reload
> * nftables init script: check for rules file only on start
> * nftables init script: return nft return code from start/stop functions
> * iptables init script: start only if rules file exists
> * add tests for init scripts
> * use long form options in init scripts
> * fix typecheck warnings
>
> Fiona Klute (WIWA) (6):
>    package/nftables: add init script
>    package/iptables: optionally default to nftables compat
>    package/iptables: check for rules in init script
>    support/testing: test for nftables init script
>    support/testing: include init script in iptables test
>    support/testing: fix MyPy warnings about BRConfigTest
>
>   .checkpackageignore                           |  1 -
>   DEVELOPERS                                    |  1 +
>   package/iptables/Config.in                    | 12 ++++
>   package/iptables/S35iptables                  | 16 +++--
>   package/iptables/iptables.mk                  | 13 +++-
>   package/nftables/S35nftables                  | 67 +++++++++++++++++++
>   package/nftables/nftables.mk                  |  5 ++
>   support/testing/infra/basetest.py             |  4 +-
>   .../testing/tests/package/test_iptables.py    | 18 +++++
>   .../testing/tests/package/test_nftables.py    | 37 +++++++++-
>   .../rootfs-overlay/etc/nftables.conf          |  8 +++
>   11 files changed, 172 insertions(+), 10 deletions(-)
>   create mode 100644 package/nftables/S35nftables
>   create mode 100644 support/testing/tests/package/test_nftables/rootfs-overlay/etc/nftables.conf
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
