From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 12 Apr 2018 20:47:42 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-04-11
In-Reply-To: <CAPP7BN3Ji2+tfo7SzWr0W2T7vY=nbJ0s7NLZuYAZyEKNVmGggg@mail.gmail.com>
References: <20180412060058.042A020894@mail.bootlin.com>
 <CAPP7BN3Ji2+tfo7SzWr0W2T7vY=nbJ0s7NLZuYAZyEKNVmGggg@mail.gmail.com>
Message-ID: <20180412174742.zh2jq7i2grckm3uh@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Erik,

On Thu, Apr 12, 2018 at 07:18:33PM +0200, Erik Larsson wrote:
> > host-imx-mkimage-rel_imx_4.... | 1
> 
> This error is due to a missing host dependency to zlib. So a simple
> HOST_IMX_MKIMAGE_DEPENDENCIES = host-zlib  solves it.
> But before I send in the patch I have a question. I can't figure out
> if I need to add anything about libz in Config.in.host for package
> imx-mkimage. If I add "selects BR_PACKAGE_ZLIB" it will select zlib
> and build it for target as well, which is not really needed. How do I
> handle this in a correct way?

Listing host dependencies listing in _DEPENDENCIES is enough. No need to 
change anything in Config.in{,.host}.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
