Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AB0606A31E
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 04:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PKdeE24X;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fcv13A28
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 102EE80D16;
	Tue, 24 Nov 2026 04:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dmDSoyb9U9XZ; Tue, 24 Nov 2026 04:28:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D351880C9C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795494531;
	b=Yd4CD2MMseOcQU0mX7ya0SauN21aXYFvU26tFrjii2rVx6jIlcrik9GUhsxM3h+r0pG0
	 +A20Ehrup9Wg62cu1CRSoS1PCiOKrmEFSEd4/dcgJy2t5ZKOXM2YmvY7fBAAU/Jik6u7r
	 WJcPkFAiiGRuJJ30OcTJUOl8X5OXif8DYosx8UDPVUzf05CkHZu16YZeBjzmsDumS6sbS
	 PYR8m9o/xadb30wth34+v+DVFCV4OmrlNAZ7b+rQa7rdnAIuL8d2wk68Tnlu/MFNMjFpm
	 hD2ZneLmDVW3zXp+OEvDRIpgkbm/Qz07q7DM8jmD/3iDRzNCZFn4C2el52uuiwmqKMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795494531;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UylaEpe8S1DxLEZY4Mx4QZUlP1z+LwmlzSRbGPDD3xE=;
	b=KOxQZQ8WA1AvLTHUbJCMzi1m+3wzguBDfNaUWV5rE30K0KYUpUS9Kd3tEFShNWO0Yb8W
	 pC+VgtftTUTVXGpETTrZg0KCOwsJX6x7ouA31tHCWFiRYpVttz/D78nspWhT/gEL5ujKq
	 CPxVAAT2i48uULbHErgbNZiLQw6l8vU8nFk1l9o7+BFNKCXWOsOPfWOMkRm+MEIh4gTnU
	 Pv0d2pbuL6UWBwSk343/N0pHZ4VcwLB+s2rnJVJzjuUO6ba9yLoFL5vhP88oaZS9ZpAtt
	 2DtobfFzSEn5hn77awjlUkupP4AnYAcG9jD2VX34wN/JeIWRr9V0uKkJgll6cOEHTog==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795494530;
	bh=UylaEpe8S1DxLEZY4Mx4QZUlP1z+LwmlzSRbGPDD3xE=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PKdeE24Xt7E45u+cAfBeD55rcNy4Gg4pJ3pftxJVvHKUUIoQimboWG5x3jcXz77FP
	 WHA+pb3I7qcFlcuxAUt6Xr2Pvp8JsdVFeGi6Lfgvs+0+eVgh5m/xr/q9xnJPaUZiiV
	 2P7IRlLxsGksDBR92N4JZNb40VlswUfmVlhWq1AVOiZkrpBEAOki3GcVjzsn/qwlWO
	 gNSarB/3c66LpoCx84EgPcK2CtpAPjEdCea9Fq2RuqryqMuT8vTUICXrKoa+J06UKF
	 fzjgh/lGQmMZXQGb/LYLnbHUzDX9kvTlEEKbftwF768Ya0c4Q3S9XP8XeYYjymjfi8
	 ojbdLNQtNXSng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D351880C9C;
	Tue, 24 Nov 2026 04:28:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DB5AFBB
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 04:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F4C4605EF
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 04:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QEh9RgAs_1Dk for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 04:28:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C19A9605CC
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=Fcv13A28
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C19A9605CC
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 04:28:47 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4acb44dcd7bso3366327f8f.0
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795494526; x=1796099326; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=E04BF8PSR62BWcJptFi2B0FJi4D3Ox11dcEk4C11Z8c=;
 b=Fcv13A28H7WbU0ahbc31Dl6Wnfo+HztQY9ROUdh3UoqNhf90mfNSK4dKOeMt97aM8b
 5ktzgSsiJnDRp6U1IyMK9x8ofLYKApWJZuRWlrcIxB1MPT/NHlNb+wBDYiD5xalJTVhb
 dMBDvGA1eKGkdSBtWnY6QLQKByRwaQV6jddEBvVBV3z4Tfr7Acpo0du6Iet7Ag019v2X
 Txx8W5Y5PDs17VvfBOyD9bQjC0ZZhX7Lc9BN7Q2IZqzvvK+gRa9kSPFj00rJLny7gaPA
 vlhaGyZyewd7jwlPNAyEnDypqa2l0RojFMx/0iA1TRsw8805gdSxgG0eL3R5aCz087/t
 g01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795494526; x=1796099326;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=E04BF8PSR62BWcJptFi2B0FJi4D3Ox11dcEk4C11Z8c=;
 b=d558HilAD/cxF3Zyg8HMKxDpt+zsg5ZaXnBgJEdWcPYF4vYvskiHk6LwVDIEx7ZqzL
 UlWEYkVCTNWpSIi+I/NIS/AxU8P78g270yUwExRjDSF2fM+Bo/68SVbo7RuQ0S2JEnsi
 VfOiMraHPC+1XuJIvt9lv9MZzG5KJlgms6unRuySUOsIW10EU9GFq09lhch3DdamEsSm
 45y9uS63NnreGi4ykDlcuTczBdJnJsFD/Na/t9300+RytX05GJdQ7irrpVDEBL9DmnDC
 4kTt7iFVGu4ephOsM5rTJB1VEpgOe/0lSlWesLg1mXL4VZ89HkW/IOLuYXKOHAvrcLqP
 L0QA==
X-Gm-Message-State: APuU4Z86cgGXjWrLGyo8itwk3lOZRoK49/B8ZeECfvkKCsgVvjc2dVfW
 Se3/mQQ9xZUG/rDm9azv+MtXw9Ooe1nKrUfyNtubcdFgGD4EDa/eEqBPGh9g13IJ
X-Gm-Gg: AZFdTZfkvmqRvC2BlAAAg9tbW6pj4LtqztEufDP4cVXBXBzaIgoFfn0U3aTHJd5cOGr
 pHIM2e+wNiX/dfIljNIb77FHMNudQg3P100JBiEAzsFYT0NrDFjywhW0M4MV2Fd2hGQCps6D5N7
 PpEP1ckkD5bsk2OpDIaF2Rck8YiCXsPFDHfc/c3vMPYMYupEEll1fvhpIPlQKk+ea5ockAkdhoI
 iwXV5X5m6cKdMhrSElVoORrHN6quyY1i4VeAm0+n/Pm3BApMMHQc6GNfUSHBRb85gtqUQeMETB9
 8XNPFviP/OYuFaBSsuVEYR8VV1B47QaNQ8rqGvMMhL764RQWA8xHBeUOzwMt3RCNW37CBo3DIF/
 Cc4TCfseyd8yVL+g+yGOnr8fr6gdfpPogzyfbnbQ3mdumlnFzKppnRiGD4NXVTh85dLkzcGZPOz
 McYZLRpX5T659hpzjqHkIqROeVNrC48ChQhJivkEJCqRq5EoJv4PfL97Bd1pBswC9YpEffdaTV5
 a9cJax8c1aJO7cg+0Kx25r/aJTekmcWgJAg77Z3uWW5Jgt5qzegO3w+317k9mTpsbSFnS15Ngv9
 Bv9+EEAU6czopVFjjZ+7cSGYFa0meYgp
X-Received: by 2002:a05:6000:18a6:b0:48d:fd4d:7fbf with SMTP id
 ffacd0b85a97d-4abab5ea3a8mr27381729f8f.4.1795494525605; 
 Mon, 23 Nov 2026 20:28:45 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab69bf680fsm29213744f8f.14.2026.11.23.20.28.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 20:28:45 -0800 (PST)
Message-ID: <6b05127d.b41c5b8f.10362b.72bb@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 24 Nov 2026 04:28:45 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-23
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
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

Autobuild statistics for 2026-11-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  9  |  0  | 15  |
  2026.08.x  |  4  |  5  |  0  |  9  |
    master   | 29  | 53  |  1  | 83  |
     next    |  0  |  4  |  0  |  4  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 8 
             host-libbpf-1.6.2 | 3 
                   perl-5.42.3 | 3 
                 glibmm-2.76.0 | 2 
 ibm-sw-tpm2-rev183-2026-08-26 | 2 
kvmtool-7ad32e5514aca2b6d19... | 2 
libfutils-c326ce0cc2a735438... | 2 
             open62541-v1.5.10 | 2 
                  chawan-0.5.1 | 1 
             dahdi-linux-3.3.0 | 1 
                  delve-1.22.1 | 1 
                 dovecot-2.4.5 | 1 
                  ffmpeg-9.0.2 | 1 
                flannel-0.26.0 | 1 
              fluent-bit-5.1.2 | 1 
             fswebcam-20200725 | 1 
             glibmm2_66-2.66.8 | 1 
                           gmp | 1 
            gstreamer1-1.24.13 | 1 
                 haproxy-3.4.8 | 1 
             host-libffi-3.8.0 | 1 
              host-rust-1.99.1 | 1 
               host-zstd-1.5.7 | 1 
                   iotools-1.8 | 1 
kismet-52bcb902e36b2df1562c... | 1 
              liberation-2.1.5 | 1 
                  linuxptp-4.4 | 1 
        ltp-testsuite-20260529 | 1 
               madplay-0.15.2b | 1 
                    mraa-2.2.0 | 1 
                    ne10-1.2.1 | 1 
                 openmpi-4.1.8 | 1 
               procps-ng-4.0.6 | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 
                     squid-7.7 | 1 
                tpm2-tss-4.1.3 | 1 
                 uclibc-1.0.59 | 1 
                  xxhash-0.8.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/d87d44f9f52aba69661e8f1c1e72a140eadb3a06 |     
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/fe4cd8da1705ba33469fb07012e1397fad593bbe | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/74ca7ee7fc05a621c006badc261094efb392d951 |     
  mips64el   |         dovecot-2.4.5          | NOK | https://autobuild.buildroot.org/results/8d475d4db2189e8a8047f04ec7183da38dcd381a |     
   sh4aeb    |          ffmpeg-9.0.2          | NOK | https://autobuild.buildroot.org/results/5ffad414b69b221e4a62e97d61b08b6cdecf27cc |     
   x86_64    |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/16e54ad05ab600158dcfd76a996682d9e1656742 |     
  mips64el   |        fluent-bit-5.1.2        | NOK | https://autobuild.buildroot.org/results/c4ecea10f730aa297a609f99ec63d27f12bbd963 |     
   x86_64    |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/58af4c566f8fbb8c1d9743d4df9caa6e60859c2b |     
  aarch64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/5c303c55a0497f500f82addbce4a88cb6f1cde79 |     
    i686     |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/a0e1f4aca1a64e282c49ef67eb8b44877c49d00f |     
  aarch64    |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/1b6519e14e24c80866fb1e8efd40146079c353b6 |     
  mips64el   |              gmp               | TIM | https://autobuild.buildroot.org/results/6a0781e5256a913d028648caea8040035b6e8e0c |     
powerpc64le  |       gstreamer1-1.24.13       | NOK | https://autobuild.buildroot.org/results/94d70f5d1fa28dbe6dac8be2648ccb479690dc06 | ORPH
  riscv64    |         haproxy-3.4.8          | NOK | https://autobuild.buildroot.org/results/7e883fc7bd9d52a31830a29eff6d8d9ac78cabb4 |     
powerpc64le  |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/b2d3f613f6de0ee57e5d8b43f007c693a058c3b2 |     
    i686     |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/8380609850d6b24ff2229d834e4bb7c00ae5305d |     
powerpc64le  |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/f056dbab1d5bf5889c23ce6704b4ee3fd92f3a9f |     
  mips64el   |       host-libffi-3.8.0        | NOK | https://autobuild.buildroot.org/results/637988fd850c667552e7eeaa94c984b21c9acd21 |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/14e8cef3609622a81ad28966c8b9a01383e3a2f3 |     
  mips64el   |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/989b0a68b2b0088ba9a5f3c13f1c611aab896eb9 |     
powerpc64le  | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/777bb0433d1a5529235162f301be2c32e377e957 |     
  aarch64    | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/ff4d551f62bdfcb5b828f8b1d910e8cc348da36d |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/bffd1acc4f0e91752ecc7a08559a041dc7e0b14b |     
    i686     | kismet-52bcb902e36b2df1562c... | NOK | https://autobuild.buildroot.org/results/af91ce26978acaeb2ec2ecaf0a4b5c562318269c | ORPH
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/f0aaf8e325c52c1d676fca5b4139a6bc1659af15 | ORPH
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/5c867e35c3511c4956e82488af6cbd8518070a03 | ORPH
  sparc64    |        liberation-2.1.5        | NOK | https://autobuild.buildroot.org/results/d43d72fea6999ae1aa1b60c94670ae783875cc28 | ORPH
    arm      | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/bbd87b6529e1038ccb13b269bea277993a344e8f |     
  mips64el   | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/8195c40c826e1b85ced2aec5d1e8705542a82c93 |     
    arm      |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/68b4bf913a4c7eb2a2ef02ef46ba6e9ee072dd5c |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/cf6866bcf1ab10c257ad66519cd08e50c2a3a6b8 |     
powerpc64le  |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/110626ce99b46ea2e7a70bf0d8714ab1d456c831 | ORPH
  aarch64    |           mraa-2.2.0           | NOK | https://autobuild.buildroot.org/results/11d6d93934c612a50e5deb5967ec8df3e9bd0b62 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/f15591bae4103cb9bf5d1e111f5ca9cb8093b26d |     
  aarch64    |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/b34f61adf5f9c0cf3d8068b9ec19d929015d8d11 | ORPH
powerpc64le  |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/c912f561df7f2e0e58adcc9efd35ba8c04f73ef9 | ORPH
 microblaze  |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/7ef87e57a460c1ea2ffb4fde6c142d25b6dce5a9 |     
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/f16549a82139e1f656a2a76a1e82e7dfa8329255 |     
  mips64el   |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/c06776c908f410c948d48292636935c5245408fa |     
  aarch64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/ff6ee335b7f2f2806eeb791afa1f576aa7f61736 |     
  aarch64    |        procps-ng-4.0.6         | NOK | https://autobuild.buildroot.org/results/d8e6939d9949b6ea5150ba89cf475fe84046a257 | ORPH
 microblaze  | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/8e1a7df530a2efd82962076229daad5a497bf536 |     
  aarch64    |           squid-7.7            | NOK | https://autobuild.buildroot.org/results/3649458454af0cc70fd90694af1d0ea7d3f5afcc | ORPH
    i686     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/0b836eb77b662a5969abb3bd640793e6803bdf78 | ORPH
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/18db7724d1b45979bbaed32ed5bd6f0fd2b5ac19 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d267105244079ff95e86bc8b6266e0a762242cee |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/10fd8f3825c928751ea38afab879ea6b5e9a582d |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/148afad87507bd70eec701f187d095340d48dd1a |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d428750f45b7347397495eeb86f0d3e58a6c1507 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d31bae28691cd8d1207233bfb5092d1517f07587 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/034d91bbb3af3192d27b97c200cccce75fda61d6 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e275469365d9e2c16a9b4dd208697e9b3c2b733c |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/bb3e3889c3464e89199d6c2e2f9b8f8db5c75cd8 |     
   x86_64    |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/fedf604dc5fb65500605d2295a99351e856eb886 | ORPH


Classification of failures by reason for next
---------------------------------------------

                    attr-2.6.0 | 1 
                   bird-2.15.1 | 1 
                libupnpp-1.0.3 | 1 
             libxmlsec1-1.3.13 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/2543a156ac3ca9db2996110a145e1b47382c0757 |     
  mips64el   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/3f5847e0b8334df7284ad5db3fd31b5768e1f80f |     
  aarch64    |         libupnpp-1.0.3         | NOK | https://autobuild.buildroot.org/results/0410d949b365bfc20fa435b7c60c26b16126dd9d | ORPH
powerpc64le  |       libxmlsec1-1.3.13        | NOK | https://autobuild.buildroot.org/results/aa132af7eeffbedea55d61a7b620e24075940316 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

          cloudflared-2026.6.1 | 1 
                   iotools-1.8 | 1 
                    lua-ev-1.5 | 1 
                   perl-5.42.3 | 1 
                       unknown | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/dc80cc08a3791f3067aa8074b78748b8123ad1a1 |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/b39f5e57988dbdfa335caeee61394f5d2f408355 |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/752137a4de4c795bc2a7deb44897e2e856910c03 |     
  mips64el   |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/052b68902a5468d99761caab352dbab8db22bd62 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/16a88436e567ce6412284aacf42b74ab031226bf |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             batman-adv-2024.4 | 1 
                  ffmpeg-6.1.5 | 1 
    host-mender-artifact-4.0.0 | 1 
        host-python-lxml-5.3.0 | 1 
httping-ffb9201042813c58d02... | 1 
           libzenoh-pico-1.2.1 | 1 
                  mender-3.5.3 | 1 
              ntfs-3g-2026.7.7 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/4179d3a587f626951ca438ea02bf69cecee50813 |     
   arceb     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/c30c313d9e3b20bcc9557447cfd1be68e1f47e22 |     
powerpc64le  |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/478592ed67ada142064c117ce2ba43cbc54838ca |     
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/9f6a24603585d7600400bd947c4a6638c2871d62 |     
  mips64el   | httping-ffb9201042813c58d02... | NOK | https://autobuild.buildroot.org/results/e54f96a19f4d7d40f29c4cef9e1e8aa8307c4464 |     
powerpc64le  |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/a8cbd87fe36bb30befbd5e0f62eafe8fd12a200f |     
  aarch64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/941aced769fffe6d4d889b48cd75e51c4061539b |     
   armeb     |        ntfs-3g-2026.7.7        | NOK | https://autobuild.buildroot.org/results/c308c5f202f11d7f750bfe81d145fa4dc137384d | ORPH
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/9fa70a4ece6a15e50f96335253f426348fed5963 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
