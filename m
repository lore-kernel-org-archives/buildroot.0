From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 3 Jul 2018 06:37:09 +0300
Subject: [Buildroot] Building the Rockchip libv4l plugin
In-Reply-To: <20180702211635.6d55d14a@gmx.net>
References: <20180702082211.bwi2ynnjnfzx3mhm@tarshish>
 <20180702211635.6d55d14a@gmx.net>
Message-ID: <20180703033709.vkytmzcwaybt4wu7@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi peter,

On Mon, Jul 02, 2018 at 09:16:35PM +0200, Peter Seiderer wrote:
> On Mon, 2 Jul 2018 11:22:11 +0300, Baruch Siach <baruch@tkos.co.il> wrote:
> > I'm trying to build the Rockchip libv4l2 plugin in Buildroot. The source 
> > is at
> > 
> >   https://chromium.googlesource.com/chromiumos/third_party/libv4lplugins/+/master/libv4l-rockchip_v2/
> > 
> > As upstream indicated[1], the code is meant to build as part of libv4l, not as 
> > a standalone library. ChromiumOS sees to copy the code into the libv4l source 
> > tree, and modify the relevant build configuration files[2].
> > 
> > What would be the best way to do that in Buildroot? A symlink to the plugin 
> > source tree? Copy of the code to libv4l?
> 
> ...or add a configure.ac/configure file to the source?

Unfortunately the plugin really needs internal libv4l headers, so this is not 
possible.

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
