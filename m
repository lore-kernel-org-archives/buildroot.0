From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 7 Oct 2008 14:10:38 +1100
Subject: [Buildroot] Buildroot with a custom kernel
In-Reply-To: <1B0F60C9E236904CB364F9EF52E0AFD9026139CB@sma10.technidata-ag.com>
References: <ea7358da0809230856u39726ed6k90c06c8cdbb8a2b@mail.gmail.com>
	<2590773a0809231029o75f55b61u58eb59f18d4421fd@mail.gmail.com>
	<1B0F60C9E236904CB364F9EF52E0AFD9026139CB@sma10.technidata-ag.com>
Message-ID: <20081007031038.GA5127@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 23, 2008 at 07:57:05PM +0200, Bussmann, Paul wrote:
> > 2) tarball up your custom kernel and place it in the dl dir.  Make
> > sure you name is according to what you have in your buildroot config
> > for the kernel version.  BR will then assume you've already dl'ed the
> > kernel and use your version.
> 
> I already tried this with 2.6.17 on ARM. Resulting in everything _looked_ fine at first but my board instantly rebooted when I tried to use TCP stuff. It is indeed related to BR's toolchain, because if I use the manufacture's (Ka-Ro) toolchain to compile the kernel, it works.
> So I asked on this mailing list about getting a 2.6.17-supporting Buildroot environment (2008-08-25) with the following answer (2008-08-26):
> 
> > 2.6.17 was released around Jun 18  2006. I'd ask those people for a
> > vaguely recent kernel. 
> 
> So I'd be very interested if you have similar success.
> 
> See http://www.nabble.com/Linux-Kernel-2.6.17-support-in-Buildroot-tt19139626.html#a19139626

I had 2.6.15 running with a buildroot-compiled gcc 4.1.2 without issue.

I have my own customised kernel with the whole source checked in (not a
tarball). I can probably share the makefiles later this week, or add
some support to buildroot for it. It's a bit messy as the kernel's
support for out-of-tree builds is a bit weird.

I'm now using a much more recent kernel, but we have various changes and I'd 
rather not just maintain them as a set of patches (too tedious).

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
