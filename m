Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1151C5B549
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 04:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32F4860D72;
	Mon,  2 Jun 2025 04:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfzDI45bUmGz; Mon,  2 Jun 2025 04:00:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5941060D4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5941060D4E;
	Mon,  2 Jun 2025 04:00:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EE6D8222
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 04:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB52941EAB
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 04:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3BS5IdZhdob for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 04:00:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=dalang@gmx.at; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A4A8B41EA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4A8B41EA4
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4A8B41EA4
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 04:00:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.165.82]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MQe5k-1uYgJi3wIg-00NDVq; Mon, 02 Jun 2025 06:00:41 +0200
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Mon,  2 Jun 2025 05:59:35 +0200
Message-ID: <20250602035936.904546-2-dalang@gmx.at>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:1GevSSpEzoqGnPMHEc6dycycLPLz5lMraObCSzqtuVacKcOGYPP
 lDbfXv56S1r7amj/e1fbf6x7ynxGiRtWoTn5l0B2II5Y41D0N0r/5X+jKR2OiqXr05iDTyD
 xlt1RGVUYdAZsyTKvmBuueJfybTyjNPTKBo9bkGCaft6LGKQe+DE953g9v8oSCQY3/m86xf
 jhXlo6SKIi2W6T0m4bDCQ==
UI-OutboundReport: notjunk:1;M01:P0:+/Us8guTuKE=;+9UUib9J5DXE67Jsr3SBtOLDDEq
 xaDpS+oB2pedQJ2hat7/yLmUJ/HII/VX8YsAEUWuk9Rcw5EaarOPPz5tMaxkVgjA6UW+aq5mU
 fCHVWmUUV3kX3tDeJIqHJaOhi+UM6ezMJ3d36741BJT9o98MTNRPPmS/r67MwIIGTcH1hdIj2
 JwDvvBbq7mz5b6frn680ACeEP+XHOqfTrmdg/LfaEfcr7I5PNS3kMT+uqknGfuSvMF1/h1Pgz
 dk1asObdWdI8lUVD2vyqkX+JJRxrFtx8+bJGMim9n5B58hP/gbIhjD+78h1Omp4O66bphh1lX
 aFuC74DoMeZWdnwfYwqEoHw5ZN92XdqEGN54j8eBtTEOGbBqbWCmgWIDqOdjhtTEg+oAQzRY4
 wg7vUyGSROt3DAMocTfILfBvlVsOHgZFKFu6PHxLcnPVf6YD0/pCSJh4AXf5ChkkBob1HpLV2
 h5lIOzSBqYLxBgfB7JK4wkAxqrjtBMinOfZUm2dK3dcD34TWD3HN96uAANmkFbNLT4ihBp2tZ
 E7+Aulrs2BaXzkRx8LpqXKoME3cnWactXxLQZtgdAhU2TmtA1tho2qSCsM2/QJ5SEZ5tumUqn
 6VfrSayAz5Sreo02Sl9rn0QWCSLk52xUqLcQ9h9cB03NT/7XB6CvAZ6LBUHQ03w9tFy2owzrW
 3eTMYn/6oPZr5yd362aBfsGzEr+8Vvuu0O5WAyrWoFHrxgBkb1OzfCWlMujETjBUj6uSIaUZW
 CA8rQnn/RtpCHtAHFNGyxZDeScaybu2IFP5DN2d+h8h3zNOAeuLTn3GxuBM4TR4oJ2YxQTceg
 E1RzcclKydjHN2MQ2LArZ+ptJEKhgUXsjhriEEewYe8iCTx4Kjl67pxYN2a6/6Ya05293GfhC
 cqaejp5Pp0qRiS5c0TUWH7Dvxe0n1FyBkHAIJQzJbGDOWR+ic/CAboCVWcGq2nKmm0RRHJk6e
 4NOH8zxkhRvT5zFhBHaZw55WOmA2lrJ3DcyMCYO613npfb8Q9KKbQRX2+FY6PAh+ZGeX8t1Go
 F6rOf+zjRR1FD34q6/2cQmOg7fL4ek6P+2TQRF1pBWai7goYnbPKfNfI25lxRUvC1GlRdjX1T
 z9yPZty5ZpyKfucBvuQiLozmDK5C1BIcOddu3oXIFhwNVC16SCcrk8+9xop3RLBqdHYh5Kuos
 K+UeG3c+2vMSgef1hfcA4WaTXeKsrDvJ+5fClkvgkJT/ezjdQkHmWGdyKGl2nzB0YJT3d8QhZ
 UzrNV/UXs1+hUas6X41pnk6vUIn35m7IY3ObuQNxNhdw4/tK26mz/jRB6yc3fpAmnqMlWLjBt
 0BA5u+nTXGC7vrEKyNjnZ/e932Re+tABJMYQaNRNunMU3JiCdE0MQHUrYBU8ltjBAVmxeZvJ5
 ypgBUsiwjU7JhKfTK53zPp5fxu16DfBw05Fu8Vcc0uPFhGIFSZYhFElyi8CRN1QmEdosVtHDP
 9rpaK2DZYI1oa3yQxUv0Iny270sxQBA2+Nf9BXPOlbyDFzQq1cCFNzEMzbnyGA2LGSHBBrJUo
 USAJnF8si3M98khaC71cD9K0LCLcboWFQ72sf42qFs32hvox9/xux+hV8XgcwXzNJ7Zoe+yLs
 UYaZ5DHBWxLuToenemYLH4MDE9Vpbg1VPEVudoeaG/2YP18atD7WVl7VvUKMC+5rhKgHJ5G/0
 5LdqSnw5J1CC5g3krc+BaD/Xs0sfWNnTRnjO9xOuVqJMEeTOp10kT2j1iNZ3+2UzO1vonr4v5
 Ozy1kTdBAVu9kopvghMDx8UzdwEh1CdnapsrqUB9ZwIUcz9yH34/p9Gy2MwdvKe9jEMgV237E
 PHXrqPFMt65l+VclKnWmiNBtBpbqHUrNK+l5DxkR2w8gMp6US9wA3r7MQU0PysVOiesl8gHBA
 58iWqkdpZDWFIqPZr2TcqYim52IELYIz2CDUkxVgal9Y8PPu2Pa5iycaHyHFC1eeYAWlqAg1z
 6OeF6QJTs44OxJItiMvx442tk24VHrfDAzrXenh6Bpj0LKvq/scl2Hvtxb75nSSQNh8fvGrm0
 mdMA6/gIbEqm/3pq0468skNqFEtKPkqDnjGdZs6IdWlK8OxKj+FSZxZlPi5fzFU/NUFli0vJ4
 OK7Z+507E9CXdoGDmu5pXKAcT2FdwYx2iMNYzL5H5+OOwSBuQetyx9rI9DmmQ1pE/Wflp3pPD
 l2rpHxClrgARePMyelVZbbUXdRXQI3uYsFSOjxWzzCRes3U4hSn9z70j0UQtuwgYX72sKmBcL
 6l1tXbHO/H8kH+ot3Eku3dd1bGv2kstSJsauloX7NR2w5YbENlLLgBjcCvy2OSadKuhdVn5w+
 JF8SQ1c9TZizfQC+ShQkEYKBs+JP1AQ3AzVzYCOgeuu/SDVroIM7fJjavXu3CI8uuT739ENNO
 tzcPsH9Fo6YyPepv+vwcwxGdvGE9QZxaIhIQ06sMCHVE/lwNPQKa6aplhPiYtt35DN1zRXvYi
 qLsyAdH9imcwTQva9oyl6zysTX300FAJ8WJQvFL8uZhsei8c1fHuT7xHDf6T6/SMaCsj59Nc6
 P80DAO8cB0zaxpaU6wawyexLADvV4UO8RcuJjPsuqixlUOlUA3bBJ3MdfEbEA/LTzl0bI0CuD
 AdHi0hZED0kFCHEQ6fDU96CEYv5ZAbK9JmhJF+1FNKS3yFAfhaACOWjrY9a2Us9FLgRtr1yLH
 kchFa1iKyXJhgRXLPBi8lqKtHx6ch+EhowqsyoKdf3fmtIHYHJnZXLJZoV0v6zwteCaHDjgJs
 r/Q/Nxs3p4YcT6uTazqR6AGgHUxFSLQ4kb+G8gfzxhr4o2SRPIHc3+/9kHvba4/51ofF3F2gG
 Hq4a0y5IlZjFAn9shjvsUKNc87fOD0xT94n/Nq5q2gx+dKOuswrt0TaJ9CuF1+tGjq0pR+S4e
 WH4OGcSZxWozd5SS/0/eCYfczPCyGc3qRu3TdcN+QdDlQeP3dVW9fyTGwX0FKOA/1GiqSVMaw
 5gTchYpapaJo+qK1apBeY7QmgavBKAAOnwYuhpwZZ7rQ+akDC4r1SuIQ0vBBTbokrkcENkLlr
 t7vrQFpMFPFalFmqU0QmSG6u8wTzF66ZXaDaLF2xfHDMFko/eWTt7DS0flYuSskxcj1ni8Mif
 CFv6Dbi6qyHnXu7/h31yrem2KmgUBF++0LVZVBYv7swEIeUArZSwS0I99CgHFvC8PQKZw6zOd
 oOB5Q3BvWG7R7K+OmhcaoZci30H0lxgD7mSeDLxoWdeWitQxSkbnhxVlSJGDLR495jwYyOxY2
 1zbGQYWfIms2QnAW
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.at; 
 s=s31663417; t=1748836841; x=1749441641; i=dalang@gmx.at;
 bh=6TM8jCvWInszRUPA1M6GRsX+q5CpS2RNUDCCXdjR1PY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=a/p/qcnolzopA9Byqh4HV+SFvvx1oIaSNuU7KZR8P8Nnul6Kd7pyfcmYLEqVfESJ
 Tcn6CMRxZJHrLsCGaRyDcoWmWwCfL1BjbsBOCyrL+yOHiylmUbOe7Z3MZWGWeb3Jf
 GhhAqJt6hNV7WJ0YnnIikyLYcURvXwQkYo4pK6acwyo6Vu7a/U04MiA4FcvgLZNMZ
 LgHkn1307rn0TY790xVzMI62hcdNPAVYxTWW749KFW/vxH8emRahtR+CPVi5Z6svq
 aIJlh5PnWbmxTxHuLJl4NBz+MSU8wYaG+W3J+0KYLGJZjGOhjexWZ19lgZDMHz1m7
 bdgNtOPPoQjX3njyhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.at
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.at header.i=dalang@gmx.at header.a=rsa-sha256
 header.s=s31663417 header.b=a/p/qcno
Subject: [Buildroot] [PATCH next] package/llvm-project/clang: remove merge
 artifacts
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
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
    e29dae10 ("package/llvm-project: bump to version 20.1.5")

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/llvm-project/clang/clang.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/llvm-project/clang/clang.mk b/package/llvm-project/clang/clang.mk
index 25d5688a80..a5c8b990aa 100644
--- a/package/llvm-project/clang/clang.mk
+++ b/package/llvm-project/clang/clang.mk
@@ -67,8 +67,8 @@ CLANG_CONF_OPTS += -DLLVM_DIR=$(STAGING_DIR)/usr/lib/cmake/llvm \
 HOST_CLANG_CONF_OPTS += -DLLVM_COMMON_CMAKE_UTILS=$(HOST_DIR)/lib/cmake/llvm
 CLANG_CONF_OPTS += -DLLVM_COMMON_CMAKE_UTILS=$(HOST_DIR)/lib/cmake/llvm
 
-+HOST_CLANG_CONF_OPTS += -DLLVM_MAIN_SRC_DIR=$(BUILD_DIR)/llvm-$(LLVM_PROJECT_VERSION)
-+CLANG_CONF_OPTS += -DLLVM_MAIN_SRC_DIR=$(BUILD_DIR)/llvm-$(LLVM_PROJECT_VERSION)
+HOST_CLANG_CONF_OPTS += -DLLVM_MAIN_SRC_DIR=$(BUILD_DIR)/llvm-$(LLVM_PROJECT_VERSION)
+CLANG_CONF_OPTS += -DLLVM_MAIN_SRC_DIR=$(BUILD_DIR)/llvm-$(LLVM_PROJECT_VERSION)
 
 # Clang can't be used as compiler on the target since there are no
 # development files (headers) and other build tools. So remove clang
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
