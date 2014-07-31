From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 20:17:41 +0200
Subject: [Buildroot] [PATCH v2] Add option to copy config file to rootfs
In-Reply-To: <14321197-e8a0-43d3-9bcf-2f3d53e60753@email.android.com>
References: <1406820398-2105-1-git-send-email-nroach44@gmail.com>
 <20140731171632.GC3960@free.fr>
 <14321197-e8a0-43d3-9bcf-2f3d53e60753@email.android.com>
Message-ID: <20140731201741.7873aee9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 31 Jul 2014 19:55:21 +0200, Thomas De Schampheleire wrote:

> >I think the case where one would want this file in the generated
> >filesystem is a corner case, and that it would be better served with
> >a post-build script.
> 
> I think this is a feature that deserves to be in Buildroot 
> directly.  Just like rootfs-overlay used to be
>  something that people had to do manually from their
> post build script, but later became a supported
>  feature because many people found it useful, or the
>  feature to set the root password, this is something that is
> generally useful by many users, even those that don't fully know how
> to use the post build script to it's full ability, or did not yet
> realize the usefulness of the saving of the configuration.

I don't really have a strong opinion on whether we should have this
feature or not, but what bothers me is adding yet another global config
option just for a small thing like that.

If we were to include the .config file in the rootfs, could we do it
unconditionally? Or would the .config file size be problematic?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
