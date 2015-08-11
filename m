From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 11 Aug 2015 11:18:11 +0300
Subject: [Buildroot] [PATCH v2 1/1] package/jsoncpp: bump to version
	1.6.5
In-Reply-To: <1439279206-7180-1-git-send-email-joerg.krause@embedded.rocks>
References: <1439279206-7180-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150811081811.GA2276@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Tue, Aug 11, 2015 at 09:46:46AM +0200, J?rg Krause wrote:
> Remove patch 0001-Revert-Use-std-namespace-for-snprintf.patch:
> This patch was initially intented to remove upstream commit
> 1c58876185d2a4ed87dac4a54b82f607e74f55fd to disable std::snprintf() for all
> compilers. However, the patch actually reverts upstream commit
> 240ddb6a1b7aae7c6528e328995812ee695a73af which only uses std namespace if the
> compiler defines __cplusplus >= 201103L, thus is a recent C++11 compiler.
> 
> Furthermore, upstream commit fac87108a49fb1b2640eff5d8e4cc7a12723a510 adds
> the `-std=c++11` compiler flag to gcc, so jsoncpp now requires a C++11 compiler
> either way.
> 
> With jsoncpp requiring a recent C++11 compiler we need at least gcc 4.7.
> 
> Backport patch from upstream [1] to remove `-Werror` from the compiler flags to
> allow building with CS ARM toolchains.
> 
> [1]
> https://github.com/open-source-parsers/jsoncpp/commit/d7b84f69c5e92178e110552cce27f900744e1779
> 
> Cc: Baruch Siach <baruch@tkos.co.il>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
