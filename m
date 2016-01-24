From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 24 Jan 2016 15:34:47 -0200
Subject: [Buildroot] [PATCH v4 1/1] package/dhcp: bump version to
	4.3.3-P1
References: <1453563586-15682-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <56a50b37b7661_7e95f439f49246c@ultri2.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Doug,

On Sat, Jan 23, 2016 at 01:39 PM, Doug Kehn <rdkehn@yahoo.com> wrote:
> bind source tar-ball is now embedded into the dhcp source. The embedded
> bind tar-ball is extracted after the dhcp source so cross compiling
> patches can be applied to the dhcp and bind before the package is built.
> 
> The embedded bind configure is called as part of dhcp make instead of
> dhcp configure; therefore, make is called from a POST_CONFIGURE_HOOK to
> explicitly configure bind.
> 
> bind is built from a PRE_BUILD_HOOK using $(MAKE1) because it would not
> build in parallel.
> 
> 0001-cross-compile.patch has been submitted upstream (ISC-Bugs #41502).
> 
> Buildroot thread
> 	http://lists.busybox.net/pipermail/buildroot/2016-January/149079.html
> has related information.
[snip]

It is worth pointing out that this new release of ISC DHCP increases
the package size by 3 times, probably because it's statically linked to
libs from bind (it's hardcoded on the original source)
BUT also:
- it is a full-featured server/client
- there are other options in buildroot for targets with low resources
- it is needed to work with ifupdown (see mentioned e-mail thread)
- the increase in size is present in the original package (I confirmed
  this by building natively from tar-ball)
- isc-dhcp-server 4.3.3 is available on debian testing and on Ubuntu
  xenial (to become 16.04)

The AR patch is larger than the one in
http://patchwork.ozlabs.org/patch/569579/
with all that auto-generated tests.
But once it is part of the patch submitted upstream and the build works
(see my tag on the next e-mail) I am ok with this.

Regards,
Ricardo
