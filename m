From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 7 May 2014 19:47:08 +0300
Subject: [Buildroot] [PATCH] host-pkgconf: use --static option for
 static builds
In-Reply-To: <536A46A2.2010502@mind.be>
References: <1394021977-60055-1-git-send-email-Vincent.Riera@imgtec.com>
 <536A46A2.2010502@mind.be>
Message-ID: <20140507164708.GI3861@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, May 07, 2014 at 04:43:46PM +0200, Arnout Vandecappelle wrote:
> On 05/03/14 13:19, Vicente Olivert Riera wrote:
> > Detect when BR2_PREFER_STATIC_LIBS is selected and modify the host
> > pkg-config wrapper to append the --static option in that case.
> > 
> > Fixes:
> >    http://autobuild.buildroot.net/results/161/161446dde7e8e774773eb2b34fd555f5ac22dd02/
> > 
> > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  Tested with an allpackageyesconfig with 
> http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-x86-64-core2-full.config
> as the toolchain (and PREFER_STATIC added to the config, of course).
> 
>  I ran this config with and without this patch applied, by running make -k
> and then make -k again to collect the failures. 
> 
>  The following packages are fixed by this patch:
> at
> gdk-pixbuf
> xerces
> xfsprogs
> 
>  The following packages fail in both cases. I did a very basic
> analysis for about half of them, but then I gave up :-)

Thanks for testing.

[...]

> dhcpdump (fails to link agains -lusb, dependency of pcap, which doesn't use 
> pkg-config)

Fixed by http://patchwork.ozlabs.org/patch/341970/.

Haven't you encountered the flite failure 
http://autobuild.buildroot.net/results/3ff/3ff2217a4fccbddbdb2bc8ade68c88fc52848d36/? 
This one is fixed by http://patchwork.ozlabs.org/patch/344396/.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
