Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8759606A31A
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 22:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=m4cDWMRA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=X+lf6pwb
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85B8A8083E;
	Sun, 22 Nov 2026 22:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aphkW07gqk-X; Sun, 22 Nov 2026 22:38:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 787E08083C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795387089;
	b=OmR4k+x9EYHeil0L2KdRtOzoIU64Or7U9hMh3TSpa5tqUeUiyPvszBU+Y6pd6yGnqzrK
	 9lKDPl564Ckas4PQ8zpVYmGwTBheL7vk+vJFzmvQZ+s01xtDvS+TjdoNWUgSagB2sD5rQ
	 tmychWxLCQsCIVfmIZaQQoxl+yKP8bMy0Yxfp7jVYWM4ZXDpZH15UQOkEWpWh/6qcYl1C
	 X+a8znvARQ2DunKQF9qV+pWPd7y7MYfApPi1+Uh+fQn0k856ZvwktKh2ztk6zriZBqjW7
	 IkDzztWOMaeliFtkTEkjyarn3rNR+2EiLrEMlaZ85Qlzi7mHvdIkcpzjAOUYZoR/pvQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795387089;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Kas-Delay:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/jzDTOfuH3JVIqhNhRaxDlpmGKJipLzB64hxc65xPKA=;
	b=XQeNZqqsXIihSrRuY8K3PU+gnRLFzXy5Wz+Efjv2oZB/by9sJSzPxxMeF/vXZ0Vax+dv
	 5lzFTSeZjX3JQDb9isXFtyOZKfDE6XM7qM1aJM5lXfAyx3zvSBeRGyBRLPqFGEV8LCNja
	 pBw4Hk2hr8yv8muld9ZP5MDLZd736d7BpseIZAK6REOTOOgzg5smKvm1xXPl8/nVCaUh1
	 CmFtXCybM7CG+NSHVLHmIeBF9vdRIA38TtNHoYcaMfgVcdyl2+FtLb/d9yso12kMqnZuB
	 kS4v+va/EvJ1lPti7HpcR/YBSfT7Ins70fYCGebnKjfh2ffxYW15FXn/qvdVVUohlgQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795387089;
	bh=/jzDTOfuH3JVIqhNhRaxDlpmGKJipLzB64hxc65xPKA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=m4cDWMRAA37eRxX5GCGmVAMOFd+goT/cBOVWWWsZ94TSp4qtPSyI9l0Wztdu0Xhvb
	 SjgE8wQ8N9ZWsgpKy/B28fPFnaMV+KilnNSBXyigEMSBLjC7DjenV30Tu8V25tzbVZ
	 hbpEg0dR0WMWk5LCN2b5Wyx+yhypq9ax42TRvKdubhc/3cZraDgeOCGZeFNVZtrNgU
	 t9FtOYfsZAdp2ZNXsYlXfQBMH3eIAv//FtSQ69+UdNst9RZOMxcXRMkUoXqpNqPQDM
	 rn1BDaNYAiFaDbIUY/0YPIudHuVOKBx9BcjyUmgM97ycAh0zJHjVTzMEYIIy5zwEzv
	 pP4znTXn3qg/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 787E08083C;
	Sun, 22 Nov 2026 22:38:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6263022B
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54604400C7
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tI754MaJTAJg for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 22:38:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3AC9A400B5
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=X+lf6pwb
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AC9A400B5
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 22:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795385414;
 bh=BcCP9Q75kPs217ofGZkdECT/PSiaBesAiy9O4RPX51c=;
 h=From:To:Cc:Subject:Date:From;
 b=X+lf6pwbXlyDTLA5EFKqx2zbdjx3erSxp1aoitI3r2ybS8q6k3Z+jXpJsDHUZ+Rzf
 JCQRD8lw72vLE7lJZYNjk5lHs6yYzXlPvuIq5XBcwJAymsLdTBID+6lKBb5ff4czAC
 ruyb5QyZagvfypkKt0Z/yITOK3fpj3ABcdEdoN+b7zB8k4FvtXpz2URO7O7KLtLLZd
 1ASXrnJk93h3qqVNNiJdA0mCUOLcde3zEX12KuDyAhhx63kZzkbbOQqKuyuhXYqJNt
 vF7cAEaEfkyyVpAlD9L8CVNFoL/bACJIIMc1Mvi1/KHMqURjO5M8KCTajcy8T2iqws
 aL0Ij8YHetalg==
X-KAS-Sym: v3:f51bdf72230551df:EH4wQjPla4QHGqFqRN4iUyyvNbNI1uLzAwAhvs7phaINU
 rex5rdM+zlO7tcEyEJVVuXFASyqa0yu9EV27HzaWW0gbLeHZeTleizWs0WVyvysSpCChJmV90YW
 spsK2ByWhUh6ptuQ0VP6hR6UB0AU17e9QMFD+oQf+HHL1eTxZwqzDEZx2D1tqC6Z4qwIkCED6lF
 O6GfkRoI//qwytN/DRQjT5bd/iBDLCeDnp8QfQa+YLpJ8ofHBJYF4kEbFo9JUKrnTjPKvDqpq/v
 GUPuEcPySW0OlB7UJ2Yq9S3cXREzMYsTtUUEeBq/sRXjt7Sh0jPTDam+N9EXEZ240+rFwWDA==:
 z+qXagYMnfgl0KM1+oaZ5v9CS14pJZx1NkLbhKt1Q7AWgeU8niozKs7Q9OOSETNRG1OY2C1Fzhp
 Bbf0J/0cK/cj/01L0RGuEtfyK+6I686tGd6w0g1rnocxLB442QS7ptYc+ZGOaJGfpaW2HId1pG9
 KwFP562InlEAk9/7G2YYXyf3RzU9OTDvsO1Fq1LMrBzwn8Mezmyt5/tmJf9qehk/eY7EqLR5Fis
 wE/KF3gsCpNnwG5ZdPEV4c1i5HzDHTaR+2dt1ldiQhVTamnb6nIZUVR4+s8yVwb+dsAYz23d8uY
 goJ7d7Nq9hy+wY28/S5zcro7XZo9D/2NLcqZnJWRcOSLn2F8MduRL5BnTHDOi7F/UbfRx7lpeq+
 tkh0KYrES6Sw/aiYXI8zt7Tg1UPy1IUVZSuRA5zlGImULwuuKtD43Ka6ZZqE14kkTN5y4n0x6/c
 AdscdZlXIrusL/V1t3pN+4LiHGfzqvx0beZqZ7nqAY7Eha3WUrwmJ85tE+lUDjoRlmv02Lhfix3
 2XLVm+mfLzt8KXXF6Gjs2/8gXXgDAXwNVCjZ+9IsYAWe04CgLj6NqUpr9Au2gSMYmn4Xjp0dQDQ
 JTSZEUcr7oO4hdfCb4b/ClDtUQfEwHhjnWWd0l/Mmke91z4=
Received: from fli4l.lan.fli4l (p5b3a0d5e.dip0.t-ipconnect.de [91.58.13.94])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1AABA4C4DD1;
 Sun, 22 Nov 2026 23:10:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41694)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xVFlG-0000000014Y-2pF7;
 Sun, 22 Nov 2026 22:10:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Nov 2026 23:09:53 +0100
Message-ID: <20261122221014.3945599-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Kas-Delay: 1795386615
X-Spamd-Bar: +++++++
Subject: [Buildroot] [PATCH 00/20] package/boost: bump version to 1.92.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

this series bumps boost to 1.92.0 and introduces runtime tests coded by
Michael Nosthoff.

The series is based on Thomas' latest boost-update branch:
https://gitlab.com/tpetazzoni/buildroot/-/commits/8e10a0c138863a5190ed78c29d3bf391da751037

Patch 0019 was added to fix runtime test errors detected by the Gitlab
pipelines and could be squashed into patch 0018 after review.

Regards, Bernd

Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/bb89fa3a8d5b2cc3282d5e9a56ddde3dc42a66c3

Bernd Kuhls (4):
  package/boost: date-time needs container & exception
  package/boost: boost-serialization: needs atomic, chrono, container &
    date_time
  support/testing: boost: add boost-test dependency to runtime tests
    when needed
  package/boost: bump version to 1.92.0

Michael Nosthoff (13):
  package/boost: program_options needs container
  package/boost: thread needs more dependencies
  package/boost: contract needs thread
  package/boost: fix coroutine dependencies
  package/boost: fiber needs exception
  package/boost: update graph dependencies
  package/boost: math needs container
  package/boost: log needs serialization
  package/boost: test needs exception
  package/boost: wave needs thread
  package/boost: update locale dependencies
  package/boost: system: update description
  support/testing: boost: new runtime tests

Thomas Petazzoni (3):
  package/boost: fixup Config.in comments
  package/boost: properly propagate architecture dependencies to
    Config.in comments
  package/boost: add missing Config.in comment for boost-context

 DEVELOPERS                                    |   2 +
 ...xit_code-guard-static_asserts-on-MIP.patch |  59 +++++
 .../0001-unordered-fix-copy-assign.patch      |  22 --
 ...-for-duplicate-definition-of-SIGLOST.patch |  30 +++
 ...002-remove-FORTIFY_SOURCE-workaround.patch |  74 ------
 package/boost/0003-Fix-build.patch            |  39 +++
 package/boost/0004-Fix-build.patch            |  40 +++
 package/boost/0005-Fix-build.patch            |  64 +++++
 package/boost/Config.in                       | 149 +++++++++--
 package/boost/boost.hash                      |   4 +-
 package/boost/boost.mk                        |  10 +-
 .../package/br2-external/boost/Config.in      |   1 +
 .../package/br2-external/boost/external.desc  |   1 +
 .../package/br2-external/boost/external.mk    |   1 +
 .../package/boost-runtime-test/CMakeLists.txt | 137 ++++++++++
 .../package/boost-runtime-test/Config.in      |   6 +
 .../boost-runtime-test/boost-runtime-test.mk  |  34 +++
 .../src/boost-coroutine-test.cpp              |  32 +++
 .../src/boost-fiber-test.cpp                  |  29 ++
 .../src/boost-iostreams-test.cpp              |  47 ++++
 .../src/boost-locale-test.cpp                 |  21 ++
 .../src/boost-python-test.cpp                 |  26 ++
 .../boost-runtime-test/src/boost-url-test.cpp |  26 ++
 .../src/boost-wave-test.cpp                   |  33 +++
 support/testing/tests/package/test_boost.py   | 250 ++++++++++++++++++
 25 files changed, 1014 insertions(+), 123 deletions(-)
 create mode 100644 package/boost/0001-fix-process-v2-exit_code-guard-static_asserts-on-MIP.patch
 delete mode 100644 package/boost/0001-unordered-fix-copy-assign.patch
 create mode 100644 package/boost/0002-Add-check-for-duplicate-definition-of-SIGLOST.patch
 delete mode 100644 package/boost/0002-remove-FORTIFY_SOURCE-workaround.patch
 create mode 100644 package/boost/0003-Fix-build.patch
 create mode 100644 package/boost/0004-Fix-build.patch
 create mode 100644 package/boost/0005-Fix-build.patch
 create mode 100644 support/testing/tests/package/br2-external/boost/Config.in
 create mode 100644 support/testing/tests/package/br2-external/boost/external.desc
 create mode 100644 support/testing/tests/package/br2-external/boost/external.mk
 create mode 100644 support/testing/tests/package/br2-external/boost/package/boost-runtime-test/CMakeLists.txt
 create mode 100644 support/testing/tests/package/br2-external/boost/package/boost-runtime-test/Config.in
 create mode 100644 support/testing/tests/package/br2-external/boost/package/boost-runtime-test/boost-runtime-test.mk
 create mode 100644 support/testing/tests/package/br2-external/boost/package/boost-runtime-test/src/boost-coroutine-test.cpp
 create mode 100644 support/testing/tests/package/br2-external/boost/package/boost-runtime-test/src/boost-fiber-test.cpp
 create mode 100644 support/testing/tests/package/br2-external/boost/package/boost-runtime-test/src/boost-iostreams-test.cpp
 create mode 100644 support/testing/tests/package/br2-external/boost/package/boost-runtime-test/src/boost-locale-test.cpp
 create mode 100644 support/testing/tests/package/br2-external/boost/package/boost-runtime-test/src/boost-python-test.cpp
 create mode 100644 support/testing/tests/package/br2-external/boost/package/boost-runtime-test/src/boost-url-test.cpp
 create mode 100644 support/testing/tests/package/br2-external/boost/package/boost-runtime-test/src/boost-wave-test.cpp
 create mode 100644 support/testing/tests/package/test_boost.py

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
