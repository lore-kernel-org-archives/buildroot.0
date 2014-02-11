From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 11 Feb 2014 08:21:40 +0200
Subject: [Buildroot] [RFC PATCH] toolchain-external: instrument wrapper
 to warn about unsafe paths
In-Reply-To: <1392074881-12508-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392074881-12508-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140211062140.GE5170@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Feb 11, 2014 at 12:28:01AM +0100, Thomas Petazzoni wrote:
> The CodeSourcery toolchains have a very interesting feature: they warn
> the user when an unsafe header or library path is used, i.e a path
> that will lead host headers or libraries to leak into the build.
> 
> This commit adds a similar functionality into our external toolchain
> wrapper, so that it can be used with all external toolchains, and can
> also be tuned as needed. By default, the external toolchain wrapper
> now gives warnings such as:
> 
>   WARNING: unsafe header/library path used in cross-compilation: '-I /usr/foo'
>   WARNING: unsafe header/library path used in cross-compilation: '-L /usr/bleh'

I'd mention that this makes Buildroot builds under /usr even more problematic. 
I thought this limitation appears in the documentation, but I can't find it 
there now.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
