From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 3 Jul 2018 06:34:13 +0300
Subject: [Buildroot] Building the Rockchip libv4l plugin
In-Reply-To: <10c8b33a-b72c-e13b-af1f-809ced49dcf8@green-communications.fr>
References: <20180702082211.bwi2ynnjnfzx3mhm@tarshish>
 <10c8b33a-b72c-e13b-af1f-809ced49dcf8@green-communications.fr>
Message-ID: <20180703033413.5f4w2pk2474yrujf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nicolas,

On Mon, Jul 02, 2018 at 10:43:25AM +0200, Nicolas Cavallari wrote:
> On 02/07/2018 10:22, Baruch Siach wrote:
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
> > 
> > Is there any other package doing something similar?
> 
> nginx comes to mind, the nginx-dav-ext/nginx-naxsi/nginx-upload packages are
> built by the nginx package.

Thanks. I took the idea of a package that only extract sources.

> However, the build system already supports this and the nginx module source 
> does not need to be moved, so it's not exactly the same thing.

Right. libv4l does not support building plugins from out of tree directories. 
Symlink doesn't work either, because build system is looking for libtool in 
the upper directory. So in the end I had to copy to code.

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
