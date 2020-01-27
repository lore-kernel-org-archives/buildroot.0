From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 27 Jan 2020 03:31:54 -0700
Subject: [Buildroot] [PATCH v2 1/1] package/nodejs: use system-icu for
 host-nodejs when available
In-Reply-To: <20200127105951.11716eea@windsurf>
References: <20200127005539.125369-1-james.hilliard1@gmail.com>
 <20200127105951.11716eea@windsurf>
Message-ID: <CADvTj4obi4rGU8vhk4qONmxbb3ADxK4gUnbAYvro1PcC61f=Zw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 27, 2020 at 2:59 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sun, 26 Jan 2020 17:55:39 -0700
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Removed LDFLAGS.host as it doesn't appear to be needed.
>
> LDFLAGS.host is definitely needed, see commit
> f4abcbe112a0a45b87545f32981be87212116e94. At least, you must verify
> that the issue fixed by this commit no longer exists if you drop
> LDFLAGS.host. You must check that the host tools built by nodejs have a
> correct RPATH. If they don't, then LDFLAGS.host is still needed.
Hmm, well it seemed to work fine with a full rebuild with and without host-icu
I looked at that commit which is apparently fixing this issue:
http://autobuild.buildroot.net/results/a1f5e336ddaf386ba08eb5a7a299a48e2bdfe2d9/build-end.log
however that log is from a much older version of nodejs(10.16.3) build so
I'm assuming some of the node build system changes eliminated the issue
since I wasn't able to reproduce the build failure with the current 12.14.1.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
