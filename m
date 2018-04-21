From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 22 Apr 2018 00:05:10 +0300
Subject: [Buildroot] [PATCH v2] lz4: improve static only build support
In-Reply-To: <20180420084143.3b20bd3a@windsurf.numericable.fr>
References: <e5fee55fc78a363b247f0eb8594aa9f40d3a1526.1524199966.git.baruch@tkos.co.il>
 <20180420084143.3b20bd3a@windsurf.numericable.fr>
Message-ID: <20180421210510.v4zwz6y57z7stryx@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Apr 20, 2018 at 08:41:43AM +0200, Thomas Petazzoni wrote:
> On Fri, 20 Apr 2018 07:52:46 +0300, Baruch Siach wrote:
> > +Just like BUILD_STATIC=no disables static libraries, BUILD_SHARED=no
> > +disabled shared libraries. This is useful to support toolchains that do
> > +not support shared libraries.
> 
> Why aren't we using BUILD_STATIC=no when BR2_SHARED_LIBS=y, to disable
> the build of the static library ?
> 
> Admittedly, it isn't a huge improvement, but for consistency it would
> be good to do that.

Many other packages build both shared and static libraries when 
BR2_SHARED_LIBS=y. This particular case is easy enough to fix, though.

Is there any advantage to not building the static library when 
BR2_SHARED_LIBS=y other than the small build time reduction?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
