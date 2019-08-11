From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 23:18:45 +0200
Subject: [Buildroot] [PATCH 00/23] package/harfbuzz: needs gcc >= 4.8
In-Reply-To: <20190803191501.5412-1-bernd.kuhls@t-online.de>
References: <20190803191501.5412-1-bernd.kuhls@t-online.de>
Message-ID: <20190811231845.12735fec@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sat,  3 Aug 2019 21:14:38 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> bumping harfbuzz to 2.5.2
> https://git.buildroot.net/buildroot/commit/package/harfbuzz?id=c04e5cb16e3de688dfee585f47f22db4232acb3e
> 
> added a dependency on gcc >= 4.8:
> 
> https://github.com/harfbuzz/harfbuzz/blob/master/NEWS#L34
> https://github.com/harfbuzz/harfbuzz/blob/master/NEWS#L14
> 
> This series adds this dependency to harfbuzz, host-harfbuzz and
> (hopefully) to all reverse dependencies.

Thanks a lot, I've applied the series to master.

However, it is worth mentioning that we have another, unrelated, issue
with the harfbuzz bump: it fails to build on m68k (with a gcc 7.x
toolchain):

  http://autobuild.buildroot.net/?reason=harfbuzz%

THe problem can easily be reproduced, but I'm not sure why it is
specific to m68k. Any clue ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
