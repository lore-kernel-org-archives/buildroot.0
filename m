From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jun 2017 21:04:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/mcelog: fix legal-info
In-Reply-To: <CA+NV+V=d7D+-zZKO4NYVpGrsY2Uz0pqhrLqYPwGA2rXJZSq11g@mail.gmail.com>
References: <20170612041512.9374-1-bernd.kuhls@t-online.de>
 <CA+NV+V=d7D+-zZKO4NYVpGrsY2Uz0pqhrLqYPwGA2rXJZSq11g@mail.gmail.com>
Message-ID: <20170612210449.1f5e4bf9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Jun 2017 22:38:17 +0530, Rahul Bedarkar wrote:

> > README was renamed to README.md
> > https://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git/commit/README.md?id=2fda0091a0628480a08cbf6ebe309fcb83aeae34  
> 
> make <pkg>-legal-info should have caught that after version bump as a
> part of testing. But it looks like we don't do that usually. In past,
> we have seen such failures after version bump.
> 
> To avoid such failures, we can add hash of license file in <pkg>.hash
> and checking that after source is downloaded. If license file changes,
> it will be noticed while build test after version bump.
> 
> Potentially, it will also help in keeping license string of packages
> up-to-date if it gets changed. What do you think ?

Yocto/OE also has a hash for license files, specifically to check if
the license file is changed.

However, I'm not sure if the .hash file is the appropriate location. In
the .hash file, we have the hash of the downloaded files (in the ones
in DL_DIR). Hashes for files inside the tarball is a quite different
thing.

Also, I'm a bit worried about the additional complexity and maintenance
burden.

But it's a discussion definitely worth having.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
