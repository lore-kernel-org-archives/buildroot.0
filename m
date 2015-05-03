From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 3 May 2015 14:53:27 +0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150503105009.2b42c375@free-electrons.com>
References: <20150502063016.3950D100FB0@stock.ovh.net>
 <20150503105009.2b42c375@free-electrons.com>
Message-ID: <20150503115327.GS2265@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, May 03, 2015 at 10:50:09AM +0200, Thomas Petazzoni wrote:
> 
> >          arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/12fd2a248b121d9178406f3216e35c866d391667/
> >          arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/b69dcc39847e927349c598a840caecfd14c36b87/
> >       xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/971bd6e6b66f0c3c3fcd06a830d83b87a53f03b2/
> >          arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/029cd2c19681445d38d76b7fcd8f939652e8fcf1/
> 
> libm missing when linking. Could some CMake person have a look?

I don't think so. uClibc variants don't export the 'long double' versions of 
pow(), ceil(), etc., even with DO_C99_MATH=y. We'll probably need to add 
another check_symbol_exists() to CMakeLists.txt.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
