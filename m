From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Feb 2013 15:49:48 +0100
Subject: [Buildroot] [PATCH v2 2/5] docs/manual: mention the new
 post-image mechanism
In-Reply-To: <CAHXCMM+DVbQp1370_mqt9QbU=TVGEneuwbN7XdTE-XTkLm8BLQ@mail.gmail.com>
References: <1360187346-30258-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1360187346-30258-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHXCMM+DVbQp1370_mqt9QbU=TVGEneuwbN7XdTE-XTkLm8BLQ@mail.gmail.com>
Message-ID: <20130207154948.59736956@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu, 7 Feb 2013 15:26:24 +0100, Samuel Martin wrote:

> > diff --git a/docs/manual/customize-rootfs.txt
> > b/docs/manual/customize-rootfs.txt index fa04d85..f1d336a 100644
> > --- a/docs/manual/customize-rootfs.txt
> > +++ b/docs/manual/customize-rootfs.txt
> > @@ -55,3 +55,18 @@ there are a few ways to customize the resulting
> > target filesystem. target root filesystem in
> > +package/customize/source+, and then enable this special package in
> > the configuration system. _This method is marked as deprecated_.
> > +
> > +Note also that if you want to perform some specific actions *after*
> > +all filesystem images have been created (for example to
> > automatically +extract your root filesystem tarball in a location
> > exported by your +NFS server, or to create a special firmware image
> > that bundles your +root filesystem and kernel image, or any other
> > custom action), you can +specify a space-separated list of scripts
> > in the ++BR2_ROOTFS_POST_IMAGE_SCRIPT+ configuration option. Each
> > of those +scripts will be called, with the path to the +images+
> > output directory +as first and unique argument, and will be
> > executed with the main +Buildroot source directory as the current
> > directory. Also, just like +for the _post-build scripts_ mentionned
> > above, you also have access to +the following environment variables
> > from your _post-image scripts_: ++BUILDROOT_CONFIG+, +HOST_DIR+,
> > +STAGING_DIR+, +TARGET_DIR+, ++BINARIES_DIR+ and +BASE_DIR+.
> 
> Nothing about how these post-image scripts are run (no fakeroot, and
> so on).

I am not sure what you would like to see added exactly. Since they are
executed outside of fakeroot, then they are just executed after the
filesystem images are created, and that's it, no?

Of course, if those scripts were executed inside fakeroot, it should be
mentioned clearly. But since it's not the case, is it important to
mention that they are executed outside of fakeroot? We could give a lot
of things that those scripts do /not/ do, no? My feeling is that it
would add confusion, but I don't have a strong feeling about this.

Or maybe you were thinking about something else than just "These
scripts are executed outside of the fakeroot environment" ?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
