From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 1 May 2020 22:44:49 +0200
Subject: [Buildroot] [PATCH 1/1] libuv, uvw: bump to versions 1.37.0,
 2.5.0_libuv-v1.37
In-Reply-To: <CALFsTFXDXoJ5OAzMUOrOdvtPZ5K8O909aRWxg64sEA58QzytAA@mail.gmail.com>
References: <20200425142239.444381-1-asafka7@gmail.com>
 <20200429215631.786c9de5@windsurf.home>
 <CALFsTFXDXoJ5OAzMUOrOdvtPZ5K8O909aRWxg64sEA58QzytAA@mail.gmail.com>
Message-ID: <20200501224449.2cb2dd03@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Asaf, Thomas,

On Fri, 1 May 2020 09:42:31 +0300, Asaf Kahlon <asafka7@gmail.com> wrote:

> Hello Thomas,
>
> On Wed, Apr 29, 2020 at 10:56 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello,
> >
> > On Sat, 25 Apr 2020 17:22:39 +0300
> > Asaf Kahlon <asafka7@gmail.com> wrote:
> >
> > > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> > > ---
> > >  package/libuv/libuv.hash | 2 +-
> > >  package/libuv/libuv.mk   | 2 +-
> > >  package/uvw/uvw.hash     | 2 +-
> > >  package/uvw/uvw.mk       | 2 +-
> > >  4 files changed, 4 insertions(+), 4 deletions(-)
> >
> > This update of libuv is causing a build regression in nodejs:
> >
> >   https://bugs.busybox.net/show_bug.cgi?id=12826
> >
> > See also:
> >
> >   http://autobuild.buildroot.net/?reason=nodejs%
> >
> > Could you have a look ?
> >
>
> Something with the nodejs autobuild failure looks strange to me.
> I'm not sure the recent bump of libuv/uvw is the reason for that
> failure, as I see
> it's broken for the same reason for a very long time.
> For example, this failure from the beginning of the month is the same:
> http://autobuild.buildroot.net/results/af8/af82fd236b536bf1415e5992ca749cd640abd7e9/build-end.log
> In addition, there's no build failure of nodejs since April 20.
> Moreover, I've managed to build nodejs with the same configuration
> stated in the issue.

All the build failures are on branch 2010.11.x...., with libuv-1.33.1
(predating uv_sleep() support)....

	$ find . -name uv.h | xargs md5sum
9b7749f33952c1fd11e57aeb719712a8  ./node-v12.16.1/deps/uv/include/uv.h
9b7749f33952c1fd11e57aeb719712a8  ./build/host-nodejs-12.16.1/deps/uv/include/uv.h
ff13d2ec9cf4d064bc8254771b7fdae1  ./build/libuv-1.33.1/include/uv.h
9b7749f33952c1fd11e57aeb719712a8  ./build/nodejs-12.16.1/deps/uv/include/uv.h
9b7749f33952c1fd11e57aeb719712a8  ./host/include/node/uv.h
ff13d2ec9cf4d064bc8254771b7fdae1  ./host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/uv.h
ff13d2ec9cf4d064bc8254771b7fdae1  ./target/usr/include/uv.h

Seems in sysroot (and target) the libuv-1.33.1 header file is installed, but in
host/include/node the one from host-nodejs-12.16.1...

Could not reproduce the failure from bug 12826 on 2020.02.1/2020.02.x nor master...

Regards,
Peter


>
> > By the way, could you create an account on our bug tracker so that we
> > can assign issues to you when relevant ?
>
> Yes, I've opened an account.
>
> >
> > Thanks a lot!
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
> Regards,
> Asaf.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
