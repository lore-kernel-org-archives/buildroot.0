From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Fri, 03 Jan 2014 09:51:55 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-01-02
In-Reply-To: <20140103074504.GN6589@tarshish>
References: <20140103073007.E79CA101DFF@stock.ovh.net>
 <20140103074504.GN6589@tarshish>
Message-ID: <2683108.9dlVqoAHeN@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Fri 03 Jan 2014 09:45:04 Baruch Siach wrote:
> Hi Thomas, all,
> 
> On Fri, Jan 03, 2014 at 08:30:07AM +0100, Thomas Petazzoni wrote:
> >     xtensa |                libcgicc-3.2.12 | NOK |
> >     http://autobuild.buildroot.net/results/7ccbf088cac523f5cccc36d4b5edc3
> >     a45c670044/
> The cause of this failure is that the static stdc++ library is not copied to
> the toolchain sysroot. Manually copying
> build/xtensa-buildroot-linux-uclibc/libstdc++-v3/src/.libs/libstdc++.a to
> staging/usr/lib fixes the problem. Can someone point me at the code that
> copies toolchain libraries to sysroot?
I believe this patch should do the job:
  http://patchwork.ozlabs.org/patch/282186/

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
