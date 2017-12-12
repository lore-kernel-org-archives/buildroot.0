From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Dec 2017 20:58:57 +0200
Subject: [Buildroot] [PATCH 1/1] janus-gateway: add RTSP streaming
 support.
In-Reply-To: <CAFSsvmogEO-eW655ScQ+j6u6w0JYzZWGaw_-Rn_mK3MZe0BV0g@mail.gmail.com>
References: <20171205131005.31537-1-aduskett@gmail.com>
 <20171205184050.7oifghyqfbrhehdr@tarshish.tkos.co.il>
 <CAFSsvmogEO-eW655ScQ+j6u6w0JYzZWGaw_-Rn_mK3MZe0BV0g@mail.gmail.com>
Message-ID: <20171212185857.3hpch6fx5sefhh54@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Tue, Dec 12, 2017 at 06:30:42AM -0500, Adam Duskett wrote:
> On Tue, Dec 5, 2017 at 1:40 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Tue, Dec 05, 2017 at 08:10:05AM -0500, Adam Duskett wrote:

[...]

> >> +ifeq ($(BR2_PACKAGE_JANUS_STREAMING_RTSP),y)
> >> +JANUS_GATEWAY_DEPENDENCIES += libcurl
> >> +endif
> >
> > Is there a way to disable RTSP? If not, RTSP will be enabled whenever libcurl
> > happens to build before janus-gateway, right? So maybe having libcurl as a
> > usual optional dependency would be better.
>
> There isn't a way to disable RTSP, however, I am not sure the best way
> to go about this.
> I like being able to just select an option and have it select the dependency.
> 
> What would you suggest? Just "if libcurl is selected depend on it" ?

I think so. A comment in the Config.in help text might be useful in that case.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
