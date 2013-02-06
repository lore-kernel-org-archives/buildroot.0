From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Feb 2013 17:26:41 +0100
Subject: [Buildroot] makedevs and symbolic links
In-Reply-To: <CAJkQPOn=Pi+NhbRvVG_gk9ccQDaUoUuPH3aEsos032kAv6Y23A@mail.gmail.com>
References: <CAJkQPOn=Pi+NhbRvVG_gk9ccQDaUoUuPH3aEsos032kAv6Y23A@mail.gmail.com>
Message-ID: <20130206172641.4c042f87@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Aras Vaichas,

On Wed, 6 Feb 2013 16:17:26 +0000, Aras Vaichas wrote:
> I use Buildroot with my own custom root fs skeleton. My skeleton contains a
> few symbolic links that I'd like to move out either into
> the BR2_ROOTFS_POST_BUILD_SCRIPT or somewhere else.
> 
> makedevs seemed logical but it doesn't support symbolic link creation.
> 
> Is there a reason for this?
> 
> Would it be useful to add it?

From my point of view, makedevs is here to do the things you can't do
without being root: create device nodes and adjust ownership.

Symbolic links can be created as non-root in a post-build script for
example, so I'm not sure there's really a need to have support for
symbolic links in makedevs.

Or maybe I'm missing the point?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
