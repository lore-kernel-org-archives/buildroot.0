From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 27 Jan 2015 15:28:01 +0200
Subject: [Buildroot] [PATCH] alsa-utils: needs dynamic library support
In-Reply-To: <20150127135220.7832b906@free-electrons.com>
References: <27b7692b7892024566e160a09c2d49df8cb3481c.1422354073.git.baruch@tkos.co.il>
 <20150127135220.7832b906@free-electrons.com>
Message-ID: <20150127132801.GJ3148@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jan 27, 2015 at 01:52:20PM +0100, Thomas Petazzoni wrote:
> On Tue, 27 Jan 2015 12:21:13 +0200, Baruch Siach wrote:
> > Fixes:
> > http://autobuild.buildroot.net/results/314/314dac9f5e62ae9beb598eb1b4cb35c0a7bfe792/
> > http://autobuild.buildroot.net/results/964/964e44f0c1653370600c7e8c647abda3f6380e34/
> > http://autobuild.buildroot.net/results/d72/d72f31bab907c7485d03db4597d01fd759277db4/
> > ...
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  package/alsa-utils/Config.in | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> I am not sure. alsa-utils hardcodes:
> 
> ALSA_LIBS="$ALSA_LIBS -lasound -lm -ldl -lpthread"
> 
> but in practice, alsa-lib does not necessarily depends on -ldl.

Indeed. Now I see that commit ffd7a00aef723 (alsa-lib: add patch to remove 
hardcoded -ldl) intended to fix that exact same issue. Though it seems like we 
need to AUTORECONF alsa-utils for this fix to take effect, isn't it?. Thomas 
(DS)?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
