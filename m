Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DC6C19F2B
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 17:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D38E482881;
	Wed, 27 Jul 2022 17:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D38E482881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aAKEPQ8tLW4K; Wed, 27 Jul 2022 17:36:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E82F182861;
	Wed, 27 Jul 2022 17:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E82F182861
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C88001BF9B4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 17:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BF0A60B30
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 17:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BF0A60B30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BEb1Sh7-_NaE for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 17:36:11 +0000 (UTC)
X-Greylist: delayed 00:29:30 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E98A60B1C
Received: from mailproxy09.manitu.net (mailproxy09.manitu.net [217.11.48.32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E98A60B1C
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 17:36:11 +0000 (UTC)
Received: from [IPv6:2001:a61:2571:e101:b8:cb51:44b6:c8c5] (unknown
 [IPv6:2001:a61:2571:e101:b8:cb51:44b6:c8c5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: wg@grandegger.com)
 by mailproxy09.manitu.net (Postfix) with ESMTPSA id 44E7E12000D9
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 19:36:09 +0200 (CEST)
To: buildroot <buildroot@buildroot.org>
From: Wolfgang Grandegger <wg@grandegger.com>
Openpgp: preference=signencrypt
Autocrypt: addr=wg@grandegger.com; prefer-encrypt=mutual; keydata=
 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
 8QEfHnPzgykCs2DOOQ==
Message-ID: <4f29ad7f-111b-5a02-7eeb-2be8d1505e7a@grandegger.com>
Date: Wed, 27 Jul 2022 19:36:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-GB
Subject: [Buildroot] package/nodejs: build for host fails with GTEST errors
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

since I updated Buildroot from 2022.02.1 to 2022.02.3, I get build
failures when building "host-nodejs" as shown below. This package was
not used with 2022.02.1 to build qt5webengine but is now required.
I have built under Debian 11 with GCC 10 and also Ubuntu 2022.04 LTS
with GCC 11. Any idea what's going wrong? I can provide my .config
and the full log message. I actually removed it to avoid message body
too big.

  /home/wolf/agco/qt-4.8/bd/agco_dcu_application/host/bin/ccache /usr/bin/g++ -o /home/wolf/agco/qt-4.8/bd/agco_dcu_application/build/host-nodejs-14.18.3/out/Release/obj.target/torque_base/deps/v8/src/torque/types.o ../deps/v8/src/torque/types.cc '-DV8_GYP_BUILD' '-DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=64' '-D__STDC_FORMAT_MACROS' '-DV8_TARGET_ARCH_X64' '-DV8_EMBEDDER_STRING="-node.85"' '-DENABLE_DISASSEMBLER' '-DV8_PROMISE_INTERNAL_FIELD_COUNT=1' '-DENABLE_MINOR_MC' '-DOBJECT_PRINT' '-DV8_INTL_SUPPORT' '-DV8_CONCURRENT_MARKING' '-DV8_ARRAY_BUFFER_EXTENSION' '-DV8_ENABLE_LAZY_SOURCE_POSITIONS' '-DV8_USE_SIPHASH' '-DDISABLE_UNTRUSTED_CODE_MITIGATIONS' '-DV8_WIN64_UNWINDING_INFO' '-DV8_ENABLE_REGEXP_INTERPRETER_THREADED_DISPATCH' '-DV8_SNAPSHOT_COMPRESSION' -I/home/wolf/agco/qt-4.8/bd/agco_dcu_application/host/include -I../deps/v8 -I../deps/v8/include  -pthread -Wno-unused-parameter -m64 -Wno-return-type -fno-strict-aliasing -m64 -O3 -fno-omit-frame-pointer -fdata-sections -ffunction-sectio
 ns -O3 -fno-rtti -std=gnu++1y -fexceptions -MMD -MF /home/wolf/agco/qt-4.8/bd/agco_dcu_application/build/host-nodejs-14.18.3/out/Release/.deps//home/wolf/agco/qt-4.8/bd/agco_dcu_application/build/host-nodejs-14.18.3/out/Release/obj.target/torque_base/deps/v8/src/torque/types.o.d.raw -I/home/wolf/agco/qt-4.8/bd/agco_dcu_application/host/include -O2 -I/home/wolf/agco/qt-4.8/bd/agco_dcu_application/host/include -c
In file included from ../deps/googletest/src/gtest-port.cc:87:
../deps/googletest/src/gtest-internal-inl.h: In constructor 'testing::internal::GTestFlagSaver::GTestFlagSaver()':
../deps/googletest/src/gtest-internal-inl.h:141:47: error: 'also_run_disabled_tests' was not declared in this scope; did you mean 'also_run_disabled_tests_'?
  141 |     also_run_disabled_tests_ = GTEST_FLAG_GET(also_run_disabled_tests);
      |                                               ^~~~~~~~~~~~~~~~~~~~~~~
      |                                               also_run_disabled_tests_
../deps/googletest/src/gtest-internal-inl.h:141:32: error: 'GTEST_FLAG_GET' was not declared in this scope; did you mean 'GTEST_FLAG'?
  141 |     also_run_disabled_tests_ = GTEST_FLAG_GET(also_run_disabled_tests);
      |                                ^~~~~~~~~~~~~~
      |                                GTEST_FLAG
../deps/googletest/src/gtest-internal-inl.h:142:40: error: 'break_on_failure' was not declared in this scope; did you mean 'break_on_failure_'?
  142 |     break_on_failure_ = GTEST_FLAG_GET(break_on_failure);
      |                                        ^~~~~~~~~~~~~~~~
      |                                        break_on_failure_
../deps/googletest/src/gtest-internal-inl.h:143:40: error: 'catch_exceptions' was not declared in this scope; did you mean 'catch_exceptions_'?
  143 |     catch_exceptions_ = GTEST_FLAG_GET(catch_exceptions);
      |                                        ^~~~~~~~~~~~~~~~
      |                                        catch_exceptions_

Thanks for help,

Wolfgang
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
