From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 10 Feb 2020 14:28:14 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/erlang: bump to version 22.2
In-Reply-To: <20200205154226.0dca67b1@windsurf>
References: <20200129172618.16966-1-frank.vanbever@essensium.com>
 <20200204100733.22106-1-frank.vanbever@essensium.com>
 <20200205154226.0dca67b1@windsurf>
Message-ID: <CAJtjsKY+bh8y6GxHGMr3ZNOApke_jxHXa_cYkHP9xGEWsYZh4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Frank, All,

Sorry for the late reply.

On Wed, Feb 5, 2020 at 3:42 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> I've applied your patch, but with some changes. See below.
>
> On Tue,  4 Feb 2020 11:07:31 +0100
> Frank Vanbever <frank.vanbever@essensium.com> wrote:
>
> > +define ERLANG_RUN_SAVE_BOOTSTRAP
> > +     cd $(@D) && PATH=$(BR_PATH) ./otp_build save_bootstrap
> > +endef
> > +ERLANG_POST_CONFIGURE_HOOKS += ERLANG_RUN_SAVE_BOOTSTRAP
>
> As we discussed, this does not seem to be needed, at least from my
> testing, so I dropped this.

I've just tested it, doing a fresh compilation from buildroot/master
and I got the following error:
make[4]: Entering directory
'/home/johan/Documents/buildroot/output/build/erlang-22.2/lib/ssl/src'
make[4]: *** No rule to make target
'../../../bootstrap/lib/kernel/include/logger.hrl', needed by
'../ebin/dtls_connection.beam'.  Stop.

Since Frank said this file is created by the save_bootstrap command, I
guess it is finally required.
-- 
Johan
