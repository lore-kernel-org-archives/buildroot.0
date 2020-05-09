From: vadim4j at gmail.com <vadim4j@gmail.com>
Date: Sat, 9 May 2020 22:12:26 +0300
Subject: [Buildroot] [PATCH] package/ndisc6: fix for codesourcery
 compilation
In-Reply-To: <20200509182452.GA347408@archlinux>
References: <20200509170503.346103-1-vadim4j@gmail.com>
 <20200509183943.126d56e0@windsurf.home>
 <20200509182452.GA347408@archlinux>
Message-ID: <20200509191226.GB347408@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 09, 2020 at 09:24:52PM +0300, vadim4j at gmail.com wrote:
> On Sat, May 09, 2020 at 06:39:43PM +0200, Thomas Petazzoni wrote:
> > On Sat,  9 May 2020 20:05:03 +0300
> > Vadym Kochan <vadim4j@gmail.com> wrote:
> > 
> > > trace-{udp,tcp}.c uses BSD-style headers, it builds ok on some
> > > latest libc compilation because they use:
> > > 
> > >     __extension__ union
> > > 
> > > but for example on codesourcery toolchain 4.x version it requires that
> > > __FAVOR_BSD is defined. So fix it by defining this define only for
> > > tcp/udp headers.
> > > 
> > > Fixes: http://autobuild.buildroot.net/results/d05d5471d10a2b6634711ccad75d7f86d222cc31
> > > 
> > > Signed-off-by: Vadym Kochan <vadim4j@gmail.com>
> > 
> > Fixing issues for "codesourcery compilation" is wrong. What is being
> > fixed is either a glibc-version related issue, or a gcc-version related
> > issue. But we don't fix things for one specific toolchain.
> > 
> > Could you investigate a bit more, and reword the patch and commit log
> > accordingly ?
> > 
> 
> You are right, actually it was easier refer to codesourcery toolchain,
> but yes the issue is related to glibc implementation in this case.
> Will try to re-do the description.

I sent v2, and updated status in patchwork.

Regards,
Vadym Kochan
