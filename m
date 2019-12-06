From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 10:57:12 +0100
Subject: [Buildroot] [PATCH] package/pkg-meson: ensure the global
 cross-compilation.conf file is correct
In-Reply-To: <CAAXf6LU=3iCa5Sg4c6jgvT5dS5U6z-_h=oKK1CpQ7mbj37-o0Q@mail.gmail.com>
References: <20191204150225.33749-1-thomas.petazzoni@bootlin.com>
 <3e183413-d866-dc02-c846-3948dc5cb34c@mind.be>
 <CAAXf6LU=3iCa5Sg4c6jgvT5dS5U6z-_h=oKK1CpQ7mbj37-o0Q@mail.gmail.com>
Message-ID: <20191206105712.56765a03@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 6 Dec 2019 10:54:13 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> Needless to say, I am opposed to moving the meson file back from the
> target-finalize step :-)
> I think most of the reasoning was already mentioned in that commit,
> but it seems I did not explain that we actually have HOST_DIR mounted
> read-only on subsequent 'make' commands after the initial make,
> exactly to verify that no-one is changing directories they shouldn't
> be changing. After all, a 'make' after the initial make will only
> normally do the target-finalize step.

No, it will do staging-finalize as well. I don't think we provide the
guarantee that HOST_DIR is unchanged/read-only between each "make"
invocation, and I'm not sure why we would want to provide this
guarantee.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
