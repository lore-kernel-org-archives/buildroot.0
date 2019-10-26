From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 15:01:05 +0200
Subject: [Buildroot] [PATCH v2, 1/1] package/brltty: fix build with expat
In-Reply-To: <20191016231448.238c3348@windsurf.home>
References: <20191013124550.18413-1-fontaine.fabrice@gmail.com>
 <20191016231448.238c3348@windsurf.home>
Message-ID: <20191026150105.092a7032@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Wed, 16 Oct 2019 23:14:48 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> The issue is that for some reason the magic "eval" stuff doesn't do its
> job. Indeed, if I change the ${sourceRoot}/configure invocation to:
> 
>    CC=${CC_FOR_BUILD} \
>    CFLAGS=${CFLAGS_FOR_BUILD} \
>    CXX=${CXX_FOR_BUILD} \
>    CXXFLAGS=${CXXFLAGS_FOR_BUILD} \
>    LDFLAGS=${LDFLAGS_FOR_BUILD} \
>    LDLIBS=${LDLIBS_FOR_BUILD} \
>    "${sourceRoot}/configure" \
>       --disable-api \
>       --disable-gpm \

Since there was no news from you on this issue, I went ahead and
created a patch for brltty that does this, which I submitted upstream.
I then re-used that in your Buildroot patch, and applied;

  https://git.buildroot.org/buildroot/commit/?id=899ab0d63ca88979d97309027a3916f5a6fac1a0

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
