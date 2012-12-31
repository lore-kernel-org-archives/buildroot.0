From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Dec 2012 18:12:24 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2012-12-30
In-Reply-To: <201212311257.38291.yann.morin.1998@free.fr>
References: <20121231073503.B128B52C08C@lolut.humanoidz.org>
 <201212311257.38291.yann.morin.1998@free.fr>
Message-ID: <20121231181224.4326dab6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 31 Dec 2012 12:57:38 +0100, Yann E. MORIN wrote:

> I think we should do 2: packages in buildroot should at least all (except
> maybe some platform-specific packages that may require an external
> toolchain, eg. bfin and ?blaze) build with the internal toolchain
> mechanism.
> 
> What do you think?

Another option: identify *why* wordexp is needed. I just had a quick
look: only src/epggrab.c includes <wordexp.h>. It doesn't use wordexp()
and wordfree() and apparently none of the definitions I have in my
glibc wordexp.h.

Can you try to build with the #include <wordexp.h> removed?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
