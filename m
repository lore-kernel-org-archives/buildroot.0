From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 5 Apr 2016 23:25:24 +0300
Subject: [Buildroot] [PATCH] mosh: fix build with the Codescape IMG
	toolchain
In-Reply-To: <95907701a43145654f7962319823a0f7fe73551b.1459879412.git.baruch@tkos.co.il>
References: <95907701a43145654f7962319823a0f7fe73551b.1459879412.git.baruch@tkos.co.il>
Message-ID: <20160405202524.GX3088@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot list,

On Tue, Apr 05, 2016 at 09:03:32PM +0300, Baruch Siach wrote:
> The Codescape IMG toolchain does not provide the ssp library even though it's
> a glibc toolchain, and thus selects BR2_TOOLCHAIN_HAS_SSP. Add a patch that
> changes the compile test for -fstack-protector-all to a build test that
> correctly fails when ssp is missing.
> 
> This makes the seeding of ssp related configure variables unnecessary.

If forgot to add autobuild references.

Fixes:
http://autobuild.buildroot.net/results/f57/f571cf13462833984504b6dabad98a6b0fb3facb/
http://autobuild.buildroot.net/results/a20/a206849cae4ecb8b2b9afb077852576ccad3536e/
http://autobuild.buildroot.net/results/86b/86b99fe4df64b47c9b76e75896a7470d84d504d7/

> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
