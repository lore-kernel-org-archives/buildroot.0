From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 18:55:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: add --delete to
 rsync
In-Reply-To: <CAM+bi4sERYCa0rsUgskkEOtO_EKLHGsJvkYC+d54hgH-xbue9Q@mail.gmail.com>
References: <1412932487-25373-1-git-send-email-alvaro.gamez@hazent.com>
 <20141012182600.5382ad4a@free-electrons.com>
 <CAM+bi4sERYCa0rsUgskkEOtO_EKLHGsJvkYC+d54hgH-xbue9Q@mail.gmail.com>
Message-ID: <20141012185507.3bfb8f72@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alvaro Gamez,

On Sun, 12 Oct 2014 18:37:28 +0200, Alvaro Gamez wrote:

> Although it's true that something like gcc *.c isn't very elegant, I
> can't agree on being the build system broken.

Well, I guess it's a matter of definition of the word 'broken' :-)

> After all, if you start
> adding and removing files from the source code, the expectation should
> be that the next build is going to be different from the previous one.
> Nevertheless, if this hasn't come to attention before it's probably a
> non problem (I saw this happen on a custom package that isn't even a
> real package, just fiddling around and making tests), so I understand
> the reject.
> 
> The only solution I can think of that satisfies both conditions (fast
> builds and identical tree) is something like saving (where?) the
> output of `find $(X_OVERRIDE_SRCDIR)` before rsyncing for the first
> time, and after rsyncing for the second time remove files listed on
> the saved list from before previous to doing the next rsync.
> 
> Do you have any opinion on this idea? Admittedly, it seems ugly.

You can experiment with that if you wish, but it indeed doesn't seem
very pretty, so I'm not sure we will be willing to merge something like
this.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
