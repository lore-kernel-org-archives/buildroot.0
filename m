From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 15 Jan 2017 20:03:12 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2017-01-13
In-Reply-To: <20170115172207.GG3552@free.fr>
References: <20170114072939.0FF8220B7E@mail.free-electrons.com>
 <1484408045.30558.1.camel@embedded.rocks> <20170115172207.GG3552@free.fr>
Message-ID: <1484506992.2026.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, 2017-01-15 at 18:22 +0100, Yann E. MORIN wrote:
> J?rg, All,
> 
> On 2017-01-14 16:34 +0100, J?rg Krause spake thusly:
> > Hi,
> > 
> > On Sat, 2017-01-14 at 08:29 +0100, Thomas Petazzoni wrote:
> > > Hello,
> > > 
> > > This is the list of Buildroot build failures that occured on
> > > 2017-01-13, and for which you are a registered architecture
> > > developer
> > > or package developer. Please help us improving the quality of
> > > Buildroot by investigating those build failures and sending
> > > patches
> > > to
> > > fix them. Thanks!
> > > 
> > > Build failures related to your packages:
> > > 
> > > ?????????arm |???????????????????????mpd-0.20 | http://autobuild.
> > > buil
> > > droot.net/results/da259e57f96cf0dd6fbac9fe44826e93f986d9e9
> > > ???????sparc |???????????????????????mpd-0.20 | http://autobuild.
> > > buil
> > > droot.net/results/242b4cff0257f353ce6b2df744c51488dbc0d2c5
> > > ???????sparc |???????????????????????mpd-0.20 | http://autobuild.
> > > buil
> > > droot.net/results/8d50a025ffcc5b3408fa27f59f0cd896616dc2c6
> > > ????????i686 |???????????????????????mpd-0.20 | http://autobuild.
> > > buil
> > > droot.net/results/362233e40960f8f0410bf24404fa05ce38cbfb56
> > > ???????nios2 |???????????????????????mpd-0.20 | http://autobuild.
> > > buil
> > > droot.net/results/a5506440bd02726d6e3b0240ece876c73b92b546
> > > ???????sparc |???????????????????????mpd-0.20 | http://autobuild.
> > > buil
> > > droot.net/results/e964b1f0ac39ec9c14f5e3b368132d8dc671c249
> > > 
> > 
> > The error message is:
> > 
> > error: 'exception_ptr' in namespace 'std' does not name a type
> > 
> > The problem is related to this bug report [1]. Both std::future and
> > std::exception_prt are only enabled in libstdc++ if
> > 'ATOMIC_INT_LOCK_FREE > 1'. std::exception_prt is only supported
> > for
> > targets with always-lock-free atomics for int. This is a long-
> > standing
> > issue in the libstdc++ and was finally fixed in GCC trunk r244051
> > [2][3] and will be available in GCC 7.0.
> > 
> > Any suggestions how to handle this build error?
> > 
> > 1) Disable for the targets concerned and wait for GCC 7.0?
> > 2) Backport the patch?
> 
> The patch is not small... :-(
> 
> So I'd say we disable it on archs that do not have the lock-free int.

You're right. Furthermore, it does not apply cleanly on the 6er branch.
I will prepare a patch in the next days.

J?rg

> 
> > [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64735
> > [2] https://gcc.gnu.org/viewcvs/gcc/trunk/libstdc%2B%2B-v3/include/
> > std/
> > future?view=log&pathrev=244051
> > [3] https://github.com/gcc-mirror/gcc/commit/c45be7f1aef92f2ea7363c
> > bc46
> > 27f943b83ca902
> > 
> > Best regards,
> > J?rg Krause
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
