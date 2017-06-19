From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 19 Jun 2017 22:14:25 +0300
Subject: [Buildroot] [PATCH 10/14] e2fsprogs: don't link with librt
In-Reply-To: <20170618115529.GQ2918@scaer>
References: <cover.1497583686.git.baruch@tkos.co.il>
 <87422f222dc219a098bf8189c9214eac0f59074b.1497583686.git.baruch@tkos.co.il>
 <20170618093309.GK2918@scaer>
 <20170618101301.hxhzvmcd4vntmdmf@tarshish>
 <20170618115529.GQ2918@scaer>
Message-ID: <20170619191425.a6zjkcvn2qcuppnk@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Jun 18, 2017 at 01:55:29PM +0200, Yann E. MORIN wrote:
> On 2017-06-18 13:13 +0300, Baruch Siach spake thusly:
> > On Sun, Jun 18, 2017 at 11:33:09AM +0200, Yann E. MORIN wrote:
> > > On 2017-06-16 06:32 +0300, Baruch Siach spake thusly:
> > > > Buildroot no longer supports toolchains with glibc older than 2.17, so there
> > > > is no need to link with librt for clock_* system calls.
> > > > 
> > > > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > > 
> > > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > Thanks.
> > 
> > On a second thought, e2fsprogs is also a host package. We don't want to 
> > abandon pre glibc 2.17 hosts just yet, do we?
> 
> Indeed no.
> 
> But the patch was made to fix a build failure for fuse2fs, which we
> explicitly disable for the host variant.
> 
> So, we really can drop this patch.

Right. However the softether librt patch is applicable[1] to the host version. 
I have marked that one (no. 14 in this series) as Rejected.

Thanks,
baruch

[1] http://autobuild.buildroot.net/results/48f/48f778a891e0bf6a60ed2e4bec057c338ec25ec9/

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
