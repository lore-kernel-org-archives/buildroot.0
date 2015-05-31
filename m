From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 May 2015 10:25:09 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/php: Disable jit in bundled
 pcre library
In-Reply-To: <1433026532-28850-1-git-send-email-bernd.kuhls@t-online.de>
References: <1433026532-28850-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150531102509.47f0d7f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 31 May 2015 00:55:32 +0200, Bernd Kuhls wrote:
> Quote from ext/pcre/pcrelib/doc/pcre.txt
> "This support is available only for certain hardware architectures. If
>  this  option is set for an unsupported architecture, a compile time
>  error occurs."
> 
> Disable jit support on unsupported archs by updating ext/pcre/pcrelib/config.h
> 
> Fixes
> http://autobuild.buildroot.net/results/966/966d6c47d1ed13a90c2846d96fb3d193df4b2aaa/ (bfin)
> http://autobuild.buildroot.net/results/3f5/3f53751b192078714860e64d3f6d8d7398433d5a/ (xtensa)
> http://autobuild.buildroot.net/results/de1/de12474d2b5cce251b1ab10f7d7e28c90545a1f0/ (arcle)
> http://autobuild.buildroot.net/results/358/358b54245bb48f653ce209be070bd5fe6b17afc4/ (microblazeel)
> http://autobuild.buildroot.net/results/a7c/a7c161ca0b424ae35634c9f2d8a8111cedec8181/ (nios2)
> http://autobuild.buildroot.net/results/dad/dad1128f58fc601bf96da5fa0635b9b9c6c8f0b8/ (sh)
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Changed logic to keep jit enabled on supported archs (Thomas)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
