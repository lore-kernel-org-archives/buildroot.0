From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Apr 2016 23:49:44 +0200
Subject: [Buildroot] [PATCH v3 1/3] go-bootstrap: new host package
In-Reply-To: <20160422214156.GA2816@xdna.net>
References: <cover.1459798147.git.geoff@infradead.org>
 <86c84005b36e17359c5d2a72c0544a738df8f456.1459798147.git.geoff@infradead.org>
 <20160420230245.2e5629d4@free-electrons.com>
 <20160422010950.GA28839@xdna.net>
 <20160422115129.4c4b523b@free-electrons.com>
 <20160422214156.GA2816@xdna.net>
Message-ID: <20160422234944.13b0a8a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Apr 2016 07:41:56 +1000, Cam Hutchison wrote:

> I agree that it is not ideal to reach into the builddir of another
> package. Ludovic Guegan implemented an alternative where the host-golang
> package encapsulated the bootstrap compiler rather than using a separate
> package. This makes some sense since the bootstrap compiler is purely
> internal to the build of the go compiler.

That's obviously an alternate way: have the host-go compiler download
the bootstrap compiler as <pkg>_EXTRA_DOWNLOADS, and take care to
extract it / install it temporarily. Not sure it is really better, and
I agree with you that the current status make a better use of the
Buildroot package infrastructure.

> > However, back to your original problem, I don't really see why the fact
> > that host-go-bootstrap is installed in $(HOST_DIR) prevents you from
> > installing the toolchain system-wide for use by other builds. Yes, it
> > increases the size of the host directory, but other than that I don't
> > see the technical limitation.
> 
> With two go compiler installed in the host dir, it becomes possible for
> someone to use the wrong one. Since the sources are also installed in
> the host dir, two sets of sources - one older than the other - will be
> installed. That's annoying when you want to index it (ctags, etc) for
> easy navigation. Having both full compilers (one completely unncessary)
> just feels like laying a land mine.
> 
> When it is just the outputdir, I don't mind so much but when installed
> system-wide, I'm usually quite careful about what gets installed.
> 
> I could also just delete it in a post-install script. But not doing
> something is better than doing it and undoing it.

Your arguments make sense. Let's see what others think about it.

> Perhaps this is just all personal preference, in which case I'll
> maintain a local patch. I'm happy that go has made it into buildroot.

I'm happy to have finally found the time to review and merge those
patches. If you're interested in go, can you have a look at the build
failures that I pointed to Geoff? See:

  http://lists.busybox.net/pipermail/buildroot/2016-April/159336.html

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
