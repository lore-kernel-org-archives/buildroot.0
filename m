From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 3 Jan 2014 10:58:00 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-01-02
In-Reply-To: <2683108.9dlVqoAHeN@sagittae>
References: <20140103073007.E79CA101DFF@stock.ovh.net>
 <20140103074504.GN6589@tarshish> <2683108.9dlVqoAHeN@sagittae>
Message-ID: <20140103085800.GO6589@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me,

On Fri, Jan 03, 2014 at 09:51:55AM +0100, J?r?me Pouiller wrote:
> On Fri 03 Jan 2014 09:45:04 Baruch Siach wrote:
> > On Fri, Jan 03, 2014 at 08:30:07AM +0100, Thomas Petazzoni wrote:
> > >     xtensa |                libcgicc-3.2.12 | NOK |
> > >     http://autobuild.buildroot.net/results/7ccbf088cac523f5cccc36d4b5edc3a45c670044/
> > The cause of this failure is that the static stdc++ library is not copied to
> > the toolchain sysroot. Manually copying
> > build/xtensa-buildroot-linux-uclibc/libstdc++-v3/src/.libs/libstdc++.a to
> > staging/usr/lib fixes the problem. Can someone point me at the code that
> > copies toolchain libraries to sysroot?
> I believe this patch should do the job:
>   http://patchwork.ozlabs.org/patch/282186/

Thanks. But in my case libstdc++.a does get built. It just not copied to 
staging. Do you thing your patch is still relevant?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
