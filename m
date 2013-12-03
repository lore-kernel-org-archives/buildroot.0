From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Dec 2013 14:41:04 +0100
Subject: [Buildroot] [PATCH] smbnetfs: new package 0.5.3a
In-Reply-To: <20131203133043.GA6637@gmail.com>
References: <20131202230903.GA3906@gmail.com> <20131203094701.08480f23@skate>
 <20131203133043.GA6637@gmail.com>
Message-ID: <20131203144104.76555c52@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andrew Ruder,

On Tue, 3 Dec 2013 07:30:43 -0600, Andrew Ruder wrote:

> Summary: I apologize for the shoddiness of this and my other patch and
> I will take the info you've given me here and make much better
> v2's :).

Your v1 was really good! Only a few minor things need to be fixed, but
overall, it's far from being shoddy, on the contrary!

> > I'm not sure here if we want to depend on Samba, or select Samba.
> > Usually, we prefer "select" so that things are transparent for the
> > user. However, when the thing being selected is "big", and fairly
> > obvious for the user (like the Python interpreter being needed to
> > build a Python module), we use depends on. I'm not sure which
> > choice to make here.
> 
> Yes, I had made the decision that samba was "intrusive" enough to
> require explicit selection.  I figured since it required something
> outside of the Libraries section, I would make the user explicitely
> add it.

I'm fine with this choice. We'll see what the other Buildroot
developers think about this.

> > However, what is sure is that you forgot to inherit the toolchain
> > dependencies of libfuse: they should be added.
> 
> Ah, I am a little unfamiliar with the intricacies of Kconfig and
> didn't realize I needed to explicitely do that.  Will take care of it
> in v2.

See
http://buildroot.org/downloads/manual/manual.html#dependencies-target-toolchain-options
for some details about this. But it's true that this part of the
documentation doesn't really explain that the toolchain dependencies
need to be propagated to all the reverse dependencies of a given
package.

The reason is that when a Config.in option A "selects Config.in option
B, then the unmet dependencies of option B are ignored by the "select"
made by option A. So we have to replicate the dependencies.

> > All patches should have a description + Signed-off-by. Also, it
> > would be good if you could submit that patch upstream, so that it
> > gets integrated in a future release.
> 
> OK, fair enough - can do on both counts.
> 
> > No SMBNETFS_DEPENDENCIES to ensure libfuse, libiconv and samba are
> > built before smbnetfs?
> > 
> > Also, we now request all new packages to have SMBNETFS_LICENSE and
> > SMBNETFS_LICENSE_FILES.
> 
> v2 and v2.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
