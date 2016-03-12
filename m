From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Mar 2016 14:12:17 +0100
Subject: [Buildroot] [PATCH v7 04/18] core: staging symlink uses a
 relative path when possible
In-Reply-To: <CAHXCMMJdrtn5GGRFnESQbT4bUOcjVmHj8r0NAvSKkDPP4CJhCg@mail.gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
 <1457564339-27294-5-git-send-email-s.martin49@gmail.com>
 <20160310214723.0eb96ec9@free-electrons.com>
 <CAHXCMMJdrtn5GGRFnESQbT4bUOcjVmHj8r0NAvSKkDPP4CJhCg@mail.gmail.com>
Message-ID: <20160312141217.445d8d1f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Mar 2016 10:11:29 +0100, Samuel Martin wrote:

> > Why is this important for a relocatable SDK ? The SDK is $(HOST_DIR),
> > and the staging symlink is just a convenience symlink which sits
> > outside of $(HOST_DIR), and hence outside the SDK.
> Right, but what about consistency in BR? if we do all the job for
> having a full relocatable SDK, why should we keep this symlink an
> absolute one?

Because there is no point in adding more complexity in BR if it's
useless.

> Also, one of my tests in the relocatable SDK work is moving around the
> whole output directory; so I need this patch in this case. Maybe this
> is not a valid case?

I don't see the point of moving the entire output/ directory, because
there are lots and lots and lots of absolute paths all over the place
in the build directory of packages.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
