From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Jan 2016 22:29:44 +0100
Subject: [Buildroot] [PATCH 2/3] defconfigs: use the new
	headers-version-same-as-kernel-version option
In-Reply-To: <20160120213824.686c94fb@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 20 Jan 2016 21:38:24 +0100")
References: <cover.1453314776.git.yann.morin.1998@free.fr>
 <811e1f5fe52c239010c412ce9f22b307d115cfcf.1453314776.git.yann.morin.1998@free.fr>
 <20160120213824.686c94fb@free-electrons.com>
Message-ID: <87powwrlbr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Yann E. MORIN,
 > On Wed, 20 Jan 2016 19:34:29 +0100, Yann E. MORIN wrote:
 >> Now that we can say that the linux headers version should match that of
 >> the kernel to be built, we inverse the logic in our defconfigs, as it is
 >> more sensible that way.
 >> 
 >> And also because we'll get rid of the former, converse kernel-same-as-headers
 >> option.
 >> 
 >> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > In this commit, you are changing the defconfigs that use
 > BR2_LINUX_KERNEL_SAME_AS_HEADERS. But I am wondering if we shouldn't
 > simply change *all* defconfigs to use this new feature. Essentially all
 > defconfigs have to worry about selecting a kernel headers version that
 > matches the kernel version they use. We could switch them all to use
 > your new mechanism, no?

 > Of course, this can be done as a separate effort, this is not a call
 > to change this particular patch, but rather a discussion on what to do
 > next.

Agreed. As long as we use the internal toolchain for our defconfigs and
build a kernel (and we so far always do), it makes sense to use this
option.

-- 
Bye, Peter Korsgaard
