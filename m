From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Feb 2020 14:30:08 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/erlang: bump to version 22.2
In-Reply-To: <CAJtjsKY+bh8y6GxHGMr3ZNOApke_jxHXa_cYkHP9xGEWsYZh4A@mail.gmail.com>
References: <20200129172618.16966-1-frank.vanbever@essensium.com>
 <20200204100733.22106-1-frank.vanbever@essensium.com>
 <20200205154226.0dca67b1@windsurf>
 <CAJtjsKY+bh8y6GxHGMr3ZNOApke_jxHXa_cYkHP9xGEWsYZh4A@mail.gmail.com>
Message-ID: <20200210143008.1895547d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 Feb 2020 14:28:14 +0100
Johan Oudinet <johan.oudinet@gmail.com> wrote:

> > As we discussed, this does not seem to be needed, at least from my
> > testing, so I dropped this.  
> 
> I've just tested it, doing a fresh compilation from buildroot/master
> and I got the following error:
> make[4]: Entering directory
> '/home/johan/Documents/buildroot/output/build/erlang-22.2/lib/ssl/src'
> make[4]: *** No rule to make target
> '../../../bootstrap/lib/kernel/include/logger.hrl', needed by
> '../ebin/dtls_connection.beam'.  Stop.
> 
> Since Frank said this file is created by the save_bootstrap command, I
> guess it is finally required.

Frank indeed reported reaching the same error as the one you're seeing
here. However, last week, I also did a fresh build, and did not get
this issue. Weird.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
