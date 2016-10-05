From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 22:55:38 +0200
Subject: [Buildroot] [PATCH v2] fakeroot: fix spurious message
 "undefined symbol"
In-Reply-To: <20161005150123.6334-1-maxime.hadjinlian@gmail.com>
References: <20161005150123.6334-1-maxime.hadjinlian@gmail.com>
Message-ID: <20161005225538.35a39fa4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Oct 2016 17:01:23 +0200, Maxime Hadjinlian wrote:
> Since the glibc 2.24-3, and this commit:
> https://sourceware.org/git/?p=glibc.git;a=commit;h=80f87443eed17838fe453f1f5406ccf5d3698c25
> fakeroot will print spurious message about symbols not being found.
> 
> [...]
> dlsym(acl_get_fd): /usr/lib/libfakeroot/libfakeroot.so: undefined symbol: acl_get_fd
> dlsym(acl_get_file): /usr/lib/libfakeroot/libfakeroot.so: undefined symbol: acl_get_file
> dlsym(acl_set_fd): /usr/lib/libfakeroot/libfakeroot.so: undefined symbol: acl_set_fd
> dlsym(acl_set_file): /usr/lib/libfakeroot/libfakeroot.so: undefined symbol: acl_set_file
> dlsym(acl_get_fd): /usr/lib/libfakeroot/libfakeroot.so: undefined symbol: acl_get_fd
> dlsym(acl_get_file): /usr/lib/libfakeroot/libfakeroot.so: undefined symbol: acl_get_file
> [...]
> 
> It doesn't seem to impair the behavior of fakeroot, it's simply annoying
> for the user.
> 
> Debian (which is the creator of fakeroot) has a patch which is a
> workaround: simply don't display the message.
> 
> Note if you wish to bump fakeroot:
> A new version is available but the release tarball doesn't include the
> 'configure' and 'Makefile' pre-generated.
> This means that if we were to bump, the package would need to run its
> own 'bootstrap' script which will add dependencies to
> host-{automake,autoconf,...} which would be annoying (since almost every
> build runs fakeroot).
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> v1 -> v2:
>     - Rename patch to include ordering
>     - Add SoB on the patch
> ---
>  package/fakeroot/0001-hide-dlsym-error.patch | 34 ++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/fakeroot/0001-hide-dlsym-error.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
