From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 22:07:54 +0200
Subject: [Buildroot] [PATCH 3/3 v4] package/qt5/qt5webengine: fix build
 dependencies for autodetected packages
In-Reply-To: <CAOgXH4eLXGW+7-OrtX-8JnG+156Q-4ouT6BnHgD3rS0NycANmw@mail.gmail.com>
References: <cover.1600290685.git.yann.morin.1998@free.fr>
 <6efc39e9d97769fae93be2bcb91f56b050dda219.1600290685.git.yann.morin.1998@free.fr>
 <20200917205147.79d63fc9@windsurf.hq.k.grp>
 <CAOgXH4eLXGW+7-OrtX-8JnG+156Q-4ouT6BnHgD3rS0NycANmw@mail.gmail.com>
Message-ID: <20200917220754.1f970435@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 17 Sep 2020 15:22:55 -0400
Nathan Ford <nford@westpond.com> wrote:

> In src/buildtools/configure.json some of the library dependencies have
> had their auto detection disabled ( look for the key "autoDetect" in
> the features section ), at least as of 5.14.2 ( I have not migrated to
> newer for the projects I work on yet ).

Ah yes, there was also src/buildtools/configure.json, which I don't
know how it interacts with ./src/core/configure.json...

So, the ones that have "autoDetect": "false", it means that the build
system doesn't try to detect them, and it will only enable them if
explicitly enabled?

> I assumed that any lib that qt5webengine built itself was a hard
> dependency, so if it is present in the buildroot build, use it,
> otherwise let qt5webengine build its own. The alternative is to make
> all those libs build dependencies of qt5webengine.

As much as possible we want to:

 (1) Use system libraries installed of bundled ones

 (2) Be explicit when handling optional dependencies by telling the
     build system "please enable support for FOO", "please disable support
     for FOO".

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
