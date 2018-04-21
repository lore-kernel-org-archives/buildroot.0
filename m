From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 21 Apr 2018 23:50:46 +0300
Subject: [Buildroot] [PATCH v2] lz4: improve static only build support
In-Reply-To: <20180421144510.47a1ccf4@windsurf>
References: <e5fee55fc78a363b247f0eb8594aa9f40d3a1526.1524199966.git.baruch@tkos.co.il>
 <20180421144510.47a1ccf4@windsurf>
Message-ID: <20180421205046.4ehdpnv2obhiigv5@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Apr 21, 2018 at 02:45:10PM +0200, Thomas Petazzoni wrote:
> On Fri, 20 Apr 2018 07:52:46 +0300, Baruch Siach wrote:
> > The current method of supporting static only build, removal of all lines
> > that match the SHARED regex from lib/Makefile, is crude and fragile.
> > Instead, patch lib/Makefile to allow disable of shared libraries.
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> Not sure if it is due to this patch or the one bumping to 1.8.1.2, but
> lz4 now fails to build in some configurations:
> 
>   http://autobuild.buildroot.net/results/a8d/a8d956ff420f6a265c5c00b33646dbbc24ce2d48/build-end.log

Sees to be a parallel build issue caused by the version bump patch. I'll post 
a patch.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
