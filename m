From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 13:27:22 +0200
Subject: [Buildroot] [PATCH v3 1/3] doxygen: new package
In-Reply-To: <CAMpxmJX9uHBxcPe=Co+L7Gk2fpKvT=Q8gy0LexUJmNVXgatOkw@mail.gmail.com>
References: <1428659399-28620-1-git-send-email-bgolaszewski@baylibre.com>
 <1428659399-28620-2-git-send-email-bgolaszewski@baylibre.com>
 <20150412185549.32b96003@free-electrons.com>
 <CAMpxmJX9uHBxcPe=Co+L7Gk2fpKvT=Q8gy0LexUJmNVXgatOkw@mail.gmail.com>
Message-ID: <20150413132722.352a5a7f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bartosz Golaszewski,

On Mon, 13 Apr 2015 12:31:16 +0200, Bartosz Golaszewski wrote:

> > You don't catch such issues because you build on a development system
> > that has lots of development tools already installed, while the
> > autobuilders are testing using minimal chroots having only the strictly
> > required Buildroot dependencies installed.
> 
> I'll have to start testing buildroot patches in a minimal chrooted
> environment then. Thanks for the hint.

Well, it's not strictly mandatory. Usually, it doesn't make such a big
difference, and the minor missing dependencies are found using the
autobuilders. You just had some bad luck with this unexpected doxygen
dependency, with doxygen itself depending on flex and bison, plus
libsigrok depending on python to generated the C++ bindings. This is
rather unusual, so I can't blame you for not having tested things
inside a minimal chroot: our autobuilders are also here to allow us to
save a bit of time when developing the packages, knowing that the
autobuilders will validate a number of things once the packages get
committed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
