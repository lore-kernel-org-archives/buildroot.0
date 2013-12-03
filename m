From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
Date: Tue, 3 Dec 2013 07:30:43 -0600
Subject: [Buildroot] [PATCH] smbnetfs: new package 0.5.3a
In-Reply-To: <20131203094701.08480f23@skate>
References: <20131202230903.GA3906@gmail.com> <20131203094701.08480f23@skate>
Message-ID: <20131203133043.GA6637@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Summary: I apologize for the shoddiness of this and my other patch and
I will take the info you've given me here and make much better v2's :).

On Tue, Dec 03, 2013 at 09:47:01AM +0100, Thomas Petazzoni wrote:
> We now normally wants patches to carry a sequence number, even if there
> is only one patch. So something like:
> 
> 	smbnetfs-01-compile-with-uclibc.patch

Ok, can do for v2.

> Indentation of the help text is wrong. It should be one tab + two
> spaces.

I'll fix that for v2.

> I'm not sure here if we want to depend on Samba, or select Samba.
> Usually, we prefer "select" so that things are transparent for the
> user. However, when the thing being selected is "big", and fairly
> obvious for the user (like the Python interpreter being needed to build
> a Python module), we use depends on. I'm not sure which choice to make
> here.

Yes, I had made the decision that samba was "intrusive" enough to
require explicit selection.  I figured since it required something
outside of the Libraries section, I would make the user explicitely add
it.

> However, what is sure is that you forgot to inherit the toolchain
> dependencies of libfuse: they should be added.

Ah, I am a little unfamiliar with the intricacies of Kconfig and didn't
realize I needed to explicitely do that.  Will take care of it in v2.

> All patches should have a description + Signed-off-by. Also, it would
> be good if you could submit that patch upstream, so that it gets
> integrated in a future release.

OK, fair enough - can do on both counts.

> No SMBNETFS_DEPENDENCIES to ensure libfuse, libiconv and samba are
> built before smbnetfs?
> 
> Also, we now request all new packages to have SMBNETFS_LICENSE and
> SMBNETFS_LICENSE_FILES.

v2 and v2.
