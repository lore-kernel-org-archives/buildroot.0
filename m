From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2009 10:00:08 +0200
Subject: [Buildroot] [RFC] *clean targets
In-Reply-To: <20091009095152.555ceed2@surf>
References: <20091007162422.GI10261@mx.loc>
	<20091009095152.555ceed2@surf>
Message-ID: <20091009100008.7d0f2c65@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Fri, 9 Oct 2009 09:51:52 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> Good to get a discussion on clean targets. They are currently a mess.
> Thanks for raising the topic and starting a discussion on this topic.

Ignore some of my comments, I didn't see the attached patch (it seems
it was not inline), making it harder to comment on.

 * On the clean target

   I see that all the stamps are removed. So this will trigger
   basically a reconfigure + rebuild of all packages. Is this what we
   want ?

   Same question as before: is removing the target/ directory without
   removing the staging/ directory really safe ?

   Removing $(IMAGE) will not do anything, since $(IMAGE) is the prefix
   for the filesystem images. I.e, the tar image is $(IMAGE).tar.
   Shouldn't we just remove $(BINARIES_DIR) ?

 * Your description mention realclean, but the patch implements dirclean

 * Detail: in dirclean (realclean ?), shouldn't we erase $(BASE_DIR)
   simply, instead of erasing all individual directories it contains ?

 * On distclean: removing the BUILD_DIR and TOOLCHAIN_DIR is already
   done by dirclean, on which distclean depends. If clean removes
   BINARIES_DIR as suggested above, we can also drop this clean here.

 * Documentation (both 'make help' and the HTML documentation)

Again, thanks a lot for working on this issue.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
