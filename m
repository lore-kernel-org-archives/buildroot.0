Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A21FC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 08:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00CFD6FBCA;
	Thu,  6 Jan 2022 08:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id heQ12Z77V5HM; Thu,  6 Jan 2022 08:43:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16FCE6FBA2;
	Thu,  6 Jan 2022 08:43:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 335AD1BF422
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 08:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DCF240242
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 08:43:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4pDnZjVqcMU5 for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 08:43:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A58D040139
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 08:43:09 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id r9so1573381wrg.0
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 00:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/xIfGuI4YKiuF8GgFsp7o16HTkgw2OhaJXaDPUW4EBQ=;
 b=Mp1VswL3PmyLVsYhC2ngFwRCoOle4VT7rd++dEtMiRt520B9kN9hrsXitQa1vDOQ1O
 lM6urYp/yk3LfgjGnWCUfEePfPqxYnDkpIMK9QECNOPZXjeNjgqkf+71MfLaGVwwxkJx
 uZCpKpTTDMg2FGbwrkoACui/jJA2OCWKmRd77vd7eSSLaFP61Iwt7Qu/UzDsWEe3lmtX
 dTqz4X8ldNtDPhg9nD8qDFXlaSCrQRfHSNOU3gPQIcjkWhiq+UWvI0vU4pDLRBBO4oFB
 QOYG3YysNM97sWEc+yQIfMg7khjRBLpZj80Hkx4jm/+0LNXnAhmmGHmv32oCweraihOS
 JI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/xIfGuI4YKiuF8GgFsp7o16HTkgw2OhaJXaDPUW4EBQ=;
 b=sB1z0+DL7ceOP8DC4E2Nx7yVtWooV9Zkf66zgkISw5h75c+WNio/52zpAwt2XCUz9N
 X70NlYgx2eL9yq0/Sfom3NJLsQMRKrMUBffiYkC3YIUrevN0pakqmfVeq2bq5kLZwp6T
 DgCsIJOy4eVzrWldUT687tkiGMr6n1h005lPxe/8EhFo6B7pjsJ/dmiLATHDZsFjGeeJ
 lnkLi+jePwLgfyhX4PT5BzS6mgYgDMxMZZx9YlOkdE3Ks2Qcor/Tq3YTMGXmPLIZt5qT
 sQSfm5D1S0UCZ2iIbvIzVr0LUleNZC1GqlyKEZlIzfUa2D/odWx7UIgdjkHsbOOkTNwT
 otew==
X-Gm-Message-State: AOAM5315sJj2L/DaQ7IzwuFK1HKcuXEq+VbV5/805kJwpoQiw4h60LCj
 ynOiUHoz9YJo2Mbi9xIQ+LVUUFY+EVQn7951
X-Google-Smtp-Source: ABdhPJy/Aq/xZc/y87NiC65yG+lQWKD6rXI8L5Q8fQuQ+rAGNIW91hPvTxjBAIYtPx0ScL9kpQhsGQ==
X-Received: by 2002:adf:e706:: with SMTP id c6mr886280wrm.116.1641458587435;
 Thu, 06 Jan 2022 00:43:07 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id b14sm1490998wri.112.2022.01.06.00.43.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 00:43:06 -0800 (PST)
Message-ID: <0e32f7af-81fa-190f-1232-18940703f879@mind.be>
Date: Thu, 6 Jan 2022 09:43:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: buildroot@buildroot.org
References: <20200415164846.122126-1-thomas.preston@codethink.co.uk>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200415164846.122126-1-thomas.preston@codethink.co.uk>
Subject: Re: [Buildroot] [PATCH v2 0/5] download: Add SFTP support and tests
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
Cc: michael.drake@codethink.co.uk, yann.morin.1998@free.fr
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi all,

  I finally applied this series. Since Thomas is no longer with CodeThink this 
is more for the others in Cc.

On 15/04/2020 18:48, Thomas Preston wrote:
> Hi,
> Back in October 2019 I submitted a patch adding an SFTP download method
> to Buildroot, however since there were no packages using SFTP the patch
> was rejected.
> 
> Yann E. MORIN suggested that it was a valid change however it required
> tests to avoid bitrot - since there was no way to verify the SFTP
> download method did not break over time without any packages using it.
> 
> In this series I have re-added the SFTP download method and also some
> test infrastructure which starts a local SSH server and uses SFTP to
> download some test packages in a br2-external project. I've also added
> tests for SCP! :D
> 
> For this, I had to update the Dockerfile from Debian Stretch to Buster
> which I explain a bit further in the patch. I'm not sure how to test if
> this breaks anything else. Will all the tests run in a clean container +
> Buildroot project clone?
> 
> You can run the tests like so:
> 
> 	support/testing/run-tests -o output -d dl \
> 		tests.download.test_ssh.TestSFTP \
> 		tests.download.test_ssh.TestSCP
> 
> Thanks!
> Thomas
> 
> Thomas Preston (5):
>    support/docker: Update to debian:buster-20200327

  I skipped this one because in the meanwhile we already updated to a more 
recent Debian.

>    support/docker: Add openssh-server
>    testing/infra: Add docstrings to base test classes
>    download: Add SFTP support (not FTPS)

     [Arnout:
      - update documentation with sftp everywhere scp is mentioned;
      - rename "verbose" variable to "quiet";
      - print the sftp command, similar to wget and scp helpers.
     ]

>    support/testing: Add download tests for SCP/SFTP

     [Arnout:
      - remove spurious end-of-line backslash;
      - remove unnecessary executable bit;
      - skip test instead of failing if sshd, ssh-keygen, scp or sftp are not
        found;
      - decode the output of subprocess;
      - use subprocess.check_output instead of subprocess.get_output;
      - use subprocess.check_call instead of manually checking return code;
      - don't set always-overridden SSHD_PORT_NUMBER in .mk file;
      - explicitly set sshd options on commandline instead of relying on host
        /etc/sshd/sshd_config;
      - let sshd listen only on localhost;
      - user internal sftp server;
      - disable BACKUP_SITE, no network is supposed to be accessed;
      - remove the -bad and -nohash versions;
      - rename {sftp,scp}-good to plain {sftp,scp};
      - move the sftp and scp packages into a single "ssh" external.
     ]

> 
>   .gitlab-ci.yml                                |   2 +
>   Config.in                                     |   4 +
>   package/pkg-download.mk                       |   1 +
>   support/docker/Dockerfile                     |   3 +-
>   support/docker/apt-sources.list               |   8 +-
>   support/download/dl-wrapper                   |   2 +-
>   support/download/sftp                         |  37 +++++
>   support/testing/infra/basetest.py             |   2 +
>   .../tests/download/br2-external/scp/Config.in |   0
>   .../download/br2-external/scp/external.desc   |   1 +
>   .../download/br2-external/scp/external.mk     |   4 +
>   .../scp/package/scp-bad/scp-bad.hash          |   1 +
>   .../scp/package/scp-bad/scp-bad.mk            |  17 +++
>   .../scp/package/scp-good/scp-good.hash        |   1 +
>   .../scp/package/scp-good/scp-good.mk          |  17 +++
>   .../scp/package/scp-nohash/scp-nohash.mk      |  17 +++
>   .../download/br2-external/sftp/Config.in      |   0
>   .../download/br2-external/sftp/external.desc  |   1 +
>   .../download/br2-external/sftp/external.mk    |   4 +
>   .../sftp/package/sftp-bad/sftp-bad.hash       |   1 +
>   .../sftp/package/sftp-bad/sftp-bad.mk         |  17 +++
>   .../sftp/package/sftp-good/sftp-good.hash     |   1 +
>   .../sftp/package/sftp-good/sftp-good.mk       |  17 +++
>   .../sftp/package/sftp-nohash/sftp-nohash.mk   |  17 +++
>   support/testing/tests/download/sshd.py        | 129 ++++++++++++++++++
>   .../tests/download/sshd/ssh-test-1.0.tar.xz   | Bin 0 -> 232 bytes
>   support/testing/tests/download/test_ssh.py    |  66 +++++++++
>   27 files changed, 364 insertions(+), 6 deletions(-)
>   create mode 100755 support/download/sftp
>   create mode 100644 support/testing/tests/download/br2-external/scp/Config.in
>   create mode 100644 support/testing/tests/download/br2-external/scp/external.desc
>   create mode 100644 support/testing/tests/download/br2-external/scp/external.mk
>   create mode 100644 support/testing/tests/download/br2-external/scp/package/scp-bad/scp-bad.hash
>   create mode 100644 support/testing/tests/download/br2-external/scp/package/scp-bad/scp-bad.mk
>   create mode 100644 support/testing/tests/download/br2-external/scp/package/scp-good/scp-good.hash
>   create mode 100644 support/testing/tests/download/br2-external/scp/package/scp-good/scp-good.mk
>   create mode 100644 support/testing/tests/download/br2-external/scp/package/scp-nohash/scp-nohash.mk
>   create mode 100644 support/testing/tests/download/br2-external/sftp/Config.in
>   create mode 100644 support/testing/tests/download/br2-external/sftp/external.desc
>   create mode 100644 support/testing/tests/download/br2-external/sftp/external.mk
>   create mode 100644 support/testing/tests/download/br2-external/sftp/package/sftp-bad/sftp-bad.hash
>   create mode 100644 support/testing/tests/download/br2-external/sftp/package/sftp-bad/sftp-bad.mk
>   create mode 100644 support/testing/tests/download/br2-external/sftp/package/sftp-good/sftp-good.hash
>   create mode 100644 support/testing/tests/download/br2-external/sftp/package/sftp-good/sftp-good.mk
>   create mode 100644 support/testing/tests/download/br2-external/sftp/package/sftp-nohash/sftp-nohash.mk
>   create mode 100644 support/testing/tests/download/sshd.py
>   create mode 100644 support/testing/tests/download/sshd/ssh-test-1.0.tar.xz
>   create mode 100755 support/testing/tests/download/test_ssh.py
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
