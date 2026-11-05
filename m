Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7061606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 04:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ri/TVK2Y;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IJ1I9ZwX
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 826DD80FB2;
	Thu,  5 Nov 2026 04:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fTCUTWUXtG5w; Thu,  5 Nov 2026 04:31:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org ECF6280FB3
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793853103;
	b=UMuYRffuTPNtJ5InMKp8kYt/0R60E7bmWnYam5P/76mW/lCPdRl+k5mM/oJPW/+NYxBL
	 3TqGTZt7SbRj/N8sNlwEURx5iiDxQzOp8omREfYdUDMR1FOKYnJUxoIYzH5DNty6wOy/I
	 PJC2e2Hch+Ct20CVbZFPL1EQsewXHK8fsyiNi4is8sZ7vBc7sVLbaVy5AigqtrGKgF8lW
	 G/DM9+2MBrtFFLalwn4+Yet4vqRG0w+kxRSQa3xlOdePoqEvpVlAHD5aVRWI3zlkQiWYQ
	 RwN2B1Q/lZbRG3cp24Rr+JixQ7FU/VWEB/804yDSknpZwtCknL87x1G2zB7SGVKHmmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793853103;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4fDoNamT7cos/AI1qGrQg/1Rlb1RX97VepWM4rrQeLY=;
	b=rDqXZ9y39m0oN0za7tpKV0qTNBn+WKJctvF8TfhwoJkJUS1aouCbFRjEhHx4tUGJ8D0H
	 dLDQ0llIHtsJ6BYJ7mXsHoXNHNVBDT/L5bVTfjkviUw0iKbnL4zsVnnQcbD3G/tiNiq1g
	 fqEbLQqzL3rL99gQVajwNDK0YCvvUvMvtzuWVkLM/c9Bq/7l9OjqKwazpX3Y/1rATLuC0
	 +BziymBJRot8C3iW1zUIg/hKFnUZy/6Hf2EohSOaRuaYlQGhz/8cut5Vu3O4Qa7MbdvPY
	 BsIPDmHKxiFXmWezJGOEa4cwY5G+enwSsLkZCqj4MqSiJtL56ieYs6NIxvrKOmX0PmA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793853103;
	bh=4fDoNamT7cos/AI1qGrQg/1Rlb1RX97VepWM4rrQeLY=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ri/TVK2YHJBRQKhwwBiqHvGZbCB1WTGZ+XuKfZKitVKfkDxXzqi57bq4qHl7tkaoR
	 YvOoPI+MJUib3AxsHWg7EzGrEPs1jwGwd+4yLG/odY/Smre7HSBts9Jka10l5KYGTs
	 7TiYzama/EL7P9uTV4KFPlxRD79A9eQ2UkXiwyvkP7OCQXSevI7wz0gWRNnOhK+eda
	 7jD4XY1bI2hEaXJHTpQtaW73N6hsekCT7mk/WYMy/+xHxulrRdoMFc2hYIamHveeBJ
	 05mTN+G3DDE0o9Y2t4ya8O/ALPcetHK+6YxRf/53KTiPomaIWCExXa2JP88VoBnlfP
	 FSJAPRU2VKrxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECF6280FB3;
	Thu,  5 Nov 2026 04:31:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 67DA637B
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 04:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59AF740738
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 04:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JhTWZ4sqXuki for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 04:31:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 731FF40735
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=IJ1I9ZwX
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 731FF40735
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 04:31:39 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so8937055e9.3
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 20:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793853098; x=1794457898; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=TBmQghrJNTHYOIlXUFSPHTJ0d7qP1YlfeS2KqsfWdNk=;
 b=IJ1I9ZwXQf8B34Ms2M/TnZDnp2BHtD78ZAehx+NJhU8qkIcABc08mLwpQJdhU3MUCW
 y9LeJlFtn3rDO3NfTyX/4DPEzlviXveU/+tm8fARF/qn5yXsNE+EXAvGUbJj0jtwwQD8
 +g39qTRbF+apI+3/Ka3G9YC1Plm0nL0XYzoh6/i85sJZjOV292H4ZbAcnlBYOEXOLiy9
 EUnJYG2Z+dAs8hiK5TBo8d7To8BiOvld6AujsHzRnRbUbsT/vRW7681sijP0cIKOMqjl
 9wzcCmjPNFLjQ0rPgty0M8NZ9HH/UmTl6Ey2wmx4b8GbMkQp4wKCtgoq2N9kSiVkWcXA
 Obbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793853098; x=1794457898;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=TBmQghrJNTHYOIlXUFSPHTJ0d7qP1YlfeS2KqsfWdNk=;
 b=fQXXXElrNuZZOiKs4r9b/0awSVnyKMay+LLl1JA57fax4+4MBr+tHGx9gGR+kPZf6R
 Ohx91PuVSCtsff+oEFn0GlhISctdYE02ZY2Xk2KsLu2Ke2wbaEw5pbjvIV5BQdS50qMy
 n3ACYwV1/y2cJgxxGAniGX+WtnfPDnVGAt+mWMKK1vR3KoA0Pc2a35M0MkJmLePUxI7p
 9vrXa4514c6diHfJz3sTV0EdjEKAWvrq41znjimIZHAOu1tnwSbgamMqF68fQ3bDwZZM
 l7smYs8rNZbOgV4hrFQCADnJh56UkNUbZ2xRZfSM1F062E1etdYcOnNydpf1ggarRtts
 OAjw==
X-Gm-Message-State: APuU4Z8X8+9w0FCCezZFWeVZ1X+Szdag3jNfHNlIwvxQZ9ww4Xk9yhx5
 DHUmvRqaY/DJ+sS69j7Hjw6/V9sSeSqWLKG0CNG3AyExG1dEvfI0V2Z5KSBSByjb
X-Gm-Gg: AYBFou1Sf5T+PQ5MhTl/fnnv1L3sqmyvUPjDz2Zqv0iidjs57Sd6OrMuC9evkdAMOue
 gXIIRlKxT5WNtTx+mT7B1xBhZtEzpkTlYDYlKbEuxaZOoPR7Y3bRY4gdMsL8C/oNrntAb7KQ9le
 ZM6KGWNVLEbQwZGoKBCbVmZfuu9+JFWy/P5FFhMbtKJpgS3W8b8iQ7mZbj35ldOUWPgnC+q6IVJ
 Yz30EbAbcOWJB13V44310/aPW9v5q4wRd0eZM8tuS3hY4hBEdPFfY5m2/UyW2WpAOQF/RqoQW0q
 2Gk6grvdyzkWDcDOjuLIPvnSUDOpCMdnLFh6oKmqeIv5z7Vzm/lTwf9IyvBadx2EsjMuHnC/K1t
 bpM7J/Zy7+o+itJCppNLgbbLIMb779ISh5JejBLQ2jOx/3sSFezM+u5WFbKYa6sywXMwq0UxQii
 hHUT6SwQGcjcG/qNzMYResMUyRYtvtkBAJbjOKd0sWR9F0cjJJJcbGqAnfbtUpBGM32hN/aOxQH
 UN1twwkgMydpikJqe5K9+HZrMMTXjacnFjx9rcxYhQXI2b/UShd1ch6vQj+N3CuTnpGq95SIs9P
 ucRBrZzBo/XS0++bhEIfGRWgEfre2iiugmNd
X-Received: by 2002:a05:600c:4e02:b0:4a1:e6a9:4086 with SMTP id
 5b1f17b1804b1-4ac1228b10amr410295015e9.0.1793853097822; 
 Wed, 04 Nov 2026 20:31:37 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b4533873f0sm103603905e9.4.2026.11.04.20.31.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 20:31:37 -0800 (PST)
Message-ID: <6aec06a9.63afbf66.2d4e7a.67e8@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 05 Nov 2026 04:31:37 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-04
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

Autobuild statistics for 2026-11-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  | 16  |  0  | 23  |
  2026.05.x  |  2  |  1  |  0  |  3  |
  2026.08.x  |  2  |  1  |  0  |  3  |
    master   | 33  | 77  |  0  | 110 |

Classification of failures by reason for master
-----------------------------------------------

                 glibmm-2.76.0 | 4 
                    attr-2.6.0 | 3 
rtmpdump-6f6bb1353fc84f4cc3... | 3 
             fswebcam-20200725 | 2 
                 host-gdb-15.2 | 2 
                  libbpf-1.6.2 | 2 
               linux-pam-1.7.2 | 2 
                    opus-1.6.1 | 2 
                  xxhash-0.8.4 | 2 
                   bird-2.15.1 | 1 
                  boost-1.83.0 | 1 
                        chawan | 1 
                  chawan-0.5.1 | 1 
                cifs-utils-7.8 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
            dt-utils-2023.11.0 | 1 
                   duma-2.5.21 | 1 
        edk2-edk2-stable202608 | 1 
             glibmm2_66-2.66.8 | 1 
               gst1-imx-0.13.1 | 1 
                 haproxy-3.4.4 | 1 
            host-go-src-1.27.3 | 1 
    host-mender-artifact-4.4.2 | 1 
            host-mfgtools-0.02 | 1 
host-mxsldr-2793a657ab7a224... | 1 
      host-uboot-tools-2026.07 | 1 
          host-xfsprogs-6.19.0 | 1 
                  hwloc-2.12.2 | 1 
 ibm-sw-tpm2-rev183-2026-08-26 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
               libecoli-0.11.3 | 1 
               libglib2-2.90.1 | 1 
                libmad-0.15.1b | 1 
             librdkafka-2.16.0 | 1 
                 libv4l-1.32.0 | 1 
                 linux-6.1.191 | 1 
                   linux-tools | 1 
                  lldpd-1.0.22 | 1 
mali-driver-fd0865346db356f... | 1 
                  multicat-2.3 | 1 
                    musl-1.2.6 | 1 
                netbird-0.81.5 | 1 
  nxp-mwifiex-lf-6.18.20-2.0.0 | 1 
                openssh-10.6p1 | 1 
            optee-client-4.9.0 | 1 
            python-iwlib-1.7.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
               python3-3.14.10 | 1 
            quickjs-2026-06-04 | 1 
raw2rgbpnm-f28b903ca63b4c22... | 1 
                rdma-core-62.0 | 1 
rtl8821au-bb26b6b06c47b79c1... | 1 
                 rtl_433-25.12 | 1 
           sane-backends-1.4.0 | 1 
              shellinabox-2.20 | 1 
sunxi-cedarx-b8f52d913f7372... | 1 
               tcf-agent-1.8.0 | 1 
                 uclibc-1.0.59 | 1 
                     unzip-6.0 | 1 
             util-linux-2.41.5 | 1 
               valgrind-3.27.1 | 1 
            vorbis-tools-1.4.3 | 1 
                  xvisor-0.3.2 | 1 
                 zellij-0.45.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/bfaf13daa26b5a6816f9b7424db0d9507f160579 |     
    arm      |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/15dc209d86980aa1e82943d48bfa875e757ce482 |     
    arm      |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/2c3a879ee960d985ce3071cb888f3801683bbfc9 |     
   x86_64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/7f00cf3f0dc5af211dad222d7f36c4781dd4c384 |     
  aarch64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/d1d3497dcd2a6ca9bff59bc2fa8b9fb14cc4217c |     
    arm      |             chawan             | NOK | https://autobuild.buildroot.org/results/c40a13fc4e958439032293d91ac987dd52f19ad6 |     
    arm      |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/e93b86ccc5d872747974bfedd7a72eef3aba0b79 |     
  mips64el   |         cifs-utils-7.8         | NOK | https://autobuild.buildroot.org/results/17461efaf2e99fae17a9f0f4705717e48106f152 |     
  aarch64    | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/63cd5f65c196ccae30416bc8724e9d3bbdbd0390 |     
   x86_64    |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/a63407e1bb46b5e65b7caaecc7a43728491c3258 |     
  mips64el   |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/1f21e5c5b314ff58b4fe43ab75b472e6e3044163 | ORPH
    i686     |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/6b81d15babb3ecd62f7703494ede24745c8a96cc |     
powerpc64le  |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/1f95659bae89b43dd9bf31554e8e0cac3220b0a3 |     
    i686     |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/c9f2b35bd59d75693a6b98ef39f040fb9a2c9414 |     
  aarch64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/26129b653d208b26a7e02da069c382f7bd80bfe2 |     
  aarch64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/3245bdcb3fc02e4f9037e5189fd305b40cadbe86 |     
  mips64el   |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/7b245c9b4ba3e3f44a248e9dffe2145dd34ae62d |     
  aarch64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/1769a4e61d89a11c57c274e441ad3148fdd923ba |     
    arm      |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/217502e55c04a888f9d4500a1e9b7ad545ae92e4 |     
    arm      |        gst1-imx-0.13.1         | NOK | https://autobuild.buildroot.org/results/54605f7e446372f97adc651c99defae6b3b584a1 |     
  mips64el   |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/59038409b9b111e157b759bf3af0f90fa6821655 |     
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/45c5add3b6af4219d93517d3f165b130e49ab58b | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/8ef90314de961162c22dd9977344a6f004167168 | ORPH
    i686     |       host-go-src-1.27.3       | NOK | https://autobuild.buildroot.org/results/c816a052c0e56a9d2d075c72717eaff1d8d422a7 |     
  riscv64    |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/cfe14e350b595ac3dcb51a8778dccdc0558ee5d0 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/066c540700c96ef7640f73d82cb75eba5e38d660 |     
    arm      | host-mxsldr-2793a657ab7a224... | NOK | https://autobuild.buildroot.org/results/f15790f613d6e20ec9e822645aab89194fa1eaab |     
  riscv64    |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/81326375b92b75936e02b5dadea5729811ecda98 | ORPH
   x86_64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/507e5a206baf7cc5280cfd3dd9f764168be26fc5 | ORPH
   x86_64    |          hwloc-2.12.2          | NOK | https://autobuild.buildroot.org/results/95ccbd2d3dc07f467224bac5e2099d78fdee18cf |     
powerpc64le  | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/d61571f36bab0242d050684f9bc68ade956b4850 |     
  aarch64    | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/070d581e5901bdcb7d1158b99b9d6323855f5efb | ORPH
 aarch64_be  |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/ca016f0df95aa5732172bd00dab942d87a59aed0 |     
  aarch64    |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/8de59d8e4eb4772a67248f4dade8676486beed8e |     
  aarch64    |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/d3ef6a737794b3ba3829047aaf4dace2c596c6b8 |     
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/75a5959be383e8b0ba976da49d8dc3ee81ba266f |     
   armeb     |         libmad-0.15.1b         | NOK | https://autobuild.buildroot.org/results/4122898c3a975c40a7408ff807e99ab90af74b1f | ORPH
  aarch64    |       librdkafka-2.16.0        | NOK | https://autobuild.buildroot.org/results/bd7a9e0924a779b469867184e98b816e4fe1ddfd |     
  aarch64    |         libv4l-1.32.0          | NOK | https://autobuild.buildroot.org/results/53bd3b8cec3171bd7dae58127972193ebcfdaed5 |     
  mips64el   |         linux-6.1.191          | NOK | https://autobuild.buildroot.org/results/209adbc1bfaab39889872034548e4c78984e0839 | ORPH
powerpc64le  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/7abeaa1247f79bba120b286f61b19fdd65080552 | ORPH
powerpc64le  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/f2773392b1907a722607df07cad51aa6a0570479 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/1970e9a928c9305a657320d8eab6cc17e6bad6b1 | ORPH
  mips64el   |          lldpd-1.0.22          | NOK | https://autobuild.buildroot.org/results/81984fce3e8fb4f066c6cf68dd8c83951818d917 | ORPH
  aarch64    | mali-driver-fd0865346db356f... | NOK | https://autobuild.buildroot.org/results/825ff214ca7752fa66e5c50fb8a2d1f2e910706b |     
   x86_64    |          multicat-2.3          | NOK | https://autobuild.buildroot.org/results/5a2284d85138c85c74d45b33564cf108ad16dbae | ORPH
powerpc64le  |           musl-1.2.6           | NOK | https://autobuild.buildroot.org/results/0cc1b30957078c5d1de78131495968d9aaf6b07e |     
    i686     |         netbird-0.81.5         | NOK | https://autobuild.buildroot.org/results/24eebf79256c15c8e26f78e372e5c0afa4c73c1d |     
    arm      |  nxp-mwifiex-lf-6.18.20-2.0.0  | NOK | https://autobuild.buildroot.org/results/5393f586efae269e0393e97341faacc4909f767c |     
    arm      |         openssh-10.6p1         | NOK | https://autobuild.buildroot.org/results/6b064db6d713a6fef7f202c37daf041055e647ef | ORPH
  aarch64    |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/cd04164b1325945b1926517992d3d0aa8e1573db |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/4ebd831607b11b6bd48542626b0b7e44dbef3305 |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/446dd3822e0ed1fab926cc17aedcd8a35eae3c8a |     
    arm      |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/c5553cd71935d29fd8ca52e1392b1ec9a540ed56 |     
  mips64el   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/fac4211cd0389eccbc1ab3a537ef9828fe0990b9 |     
    i686     |        python3-3.14.10         | NOK | https://autobuild.buildroot.org/results/d8e44cbc0a17d33a5d308bf5183c4fe0553a97f0 |     
   x86_64    |       quickjs-2026-06-04       | NOK | https://autobuild.buildroot.org/results/d2f8088587a040ccfba1a202515c76bd60b5a338 |     
   sparc     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/662506485f2d862c027453f94e78fcb3576a0f11 |     
    arm      |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/702aa72a041ec411c92668de3c3ff40218efb808 |     
  aarch64    | rtl8821au-bb26b6b06c47b79c1... | NOK | https://autobuild.buildroot.org/results/bb893e7cab68477a5e3000d3fefabd4ee7094f24 |     
  mips64el   |         rtl_433-25.12          | NOK | https://autobuild.buildroot.org/results/987d60a9d40b13857bf9f79a67b8fde14de14c64 |     
    arm      | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/da16631d3dbc52d694d0076341402c2c60f911fd |     
powerpc64le  | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/af5dc0c5d0a63553387a15cb66e12120fed7b2fd |     
  aarch64    | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/9b85059f36d98c0f63cf6cde60c42035511b0c23 |     
   x86_64    |      sane-backends-1.4.0       | NOK | https://autobuild.buildroot.org/results/6f3671ae20437508ac42797a134ac7b79b7a8b82 |     
powerpc64le  |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/428439117f42db1ed0ce75ff504bf5639531fa7a |     
    arm      | sunxi-cedarx-b8f52d913f7372... | NOK | https://autobuild.buildroot.org/results/0b46fc4be81bd7c945a1ac3fe006b0462a684bed | ORPH
    arm      |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/9aba37c8514bef531811a735118f032a9b78ca66 |     
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/cdc22588832deb78b8a274b38f24f373be26bd2b |     
  mips64el   |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/488a9120a32db9e8902036d5094b3a91d07c3332 |     
powerpc64le  |       util-linux-2.41.5        | NOK | https://autobuild.buildroot.org/results/fc05a3742f16972537ffe9d0d26f247fdc06a6a2 |     
  mips64el   |        valgrind-3.27.1         | NOK | https://autobuild.buildroot.org/results/4b813812f211e86cfec269e69d754baff880fdfd | ORPH
    i686     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/9c101a00d224c661627b57056662cd26a84f77d3 | ORPH
  aarch64    |          xvisor-0.3.2          | NOK | https://autobuild.buildroot.org/results/69d99e4869124e862d42ad6ff0ceeba02b89ec21 |     
powerpc64le  |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/d3f159644e7579a4a49bbffb1a8957449019a9ff | ORPH
powerpc64le  |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/b9c1f68fed293e46c804287c839c52ad8c9c5616 | ORPH
   x86_64    |         zellij-0.45.1          | NOK | https://autobuild.buildroot.org/results/4ce2f5b1a80d0c62f42c6775a517f98b659137ac |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

gcnano-binaries-7c181cacf89... | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | gcnano-binaries-7c181cacf89... | NOK | https://autobuild.buildroot.org/results/35be70d2c44c9a4065bb1f0a2ba45c1f10de58dd |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

               libxmlrpc-r3335 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        libxmlrpc-r3335         | NOK | https://autobuild.buildroot.org/results/61f52b1a25d157e446932f3d770aa3c0ceadaa66 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libselinux-3.7 | 5 
           host-libselinux-3.7 | 2 
                   perl-5.40.5 | 2 
                       unknown | 2 
        host-python-lxml-5.3.0 | 1 
        ltp-testsuite-20250130 | 1 
           oath-toolkit-2.6.12 | 1 
toolchain-external-bootlin-... | 1 
           uboot-tools-2021.07 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/9d2fc9ff421dcfe166b9c924b2858ce43a5adee4 |     
   arceb     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/884e4327a034793a5db728139bab3a1f3950d126 |     
   mips64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/56690d7adeee45ec86802d36932c3e83cfabdcd9 |     
    sh4      |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/affded04e7eac81a4f83f64620ab65752470d50d |     
powerpc64le  |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/89b7629b131853ba74154c1b97216b9b49dff4e3 |     
    sh4      |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/c35be91cc0d5859d5c60a71be86b80c1f743447d |     
   x86_64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/05b73cc015926b2b5414dec4f2a9784595539225 |     
   mipsel    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/8773c78dc7c7bcac91b78188ca4efc2ac99e9a68 |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/d167d3fe917eb7db588983e4c81ea846833ca830 |     
    arm      |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/c86aa3c86268408d5c2f8c6245a65099f4acd705 |     
   arceb     |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/3f4bdcb8b93fffec6871c3b26ddb3a852708649a |     
   x86_64    |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/cf7b799fa0ec8e7fe9ab84fe44519c6912437453 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/73169bb9fb645a1f0a6750c266672f4024388cbb |     
   x86_64    |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/3d724597c3874125fdf5f23448fa7e4784fdaaa9 | ORPH
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/b823086e69373025409da904aec56c7c76ab4c33 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a981fd18f5caf109a0dd88be40355306a5b57c98 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
