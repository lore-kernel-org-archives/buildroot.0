From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Feb 2017 15:14:31 +0100
Subject: [Buildroot] [PATCH v3] classpath: bump to version 0.99
In-Reply-To: <20170212020444.32045-1-m.hoffmann@cartelsol.com>
References: <20170212015451.16715-1-m.hoffmann@cartelsol.com>
 <20170212020444.32045-1-m.hoffmann@cartelsol.com>
Message-ID: <20170212151431.1fe6cce3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Feb 2017 03:04:44 +0100, Marcus Hoffmann wrote:
> Drop both patches since they are included upstream.
> We don't need to autoreconf now.
> 
> Note: classpath 0.99 has a bug in it's autoconf scripts, such that
> configure always fails when specifying --disable-tools[1].
> We enable these for now.
> 
> Also explicitly disable GJDoc generation, as this defaults to on now.
> --disable-plugin is not needed any more, since this is now the default.
> 
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70660
> 
> Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
> ---
> Changes v2 -> v3:
>   - Fixed announcement url in .hash file (This time for real...)
>   - Clarify dropping the --disable-plugin option.

Applied to next, thanks. I have two comments though:

 1. If you're using/interested in classpath, would you mind adding your
    name in the DEVELOPERS file for this package? Same if you're
    using/interested in jamvm. Those two packages are currently not
    associated to any developer, it would be nice to have a developer
    interested in those two packages.

 2. classpath has a "depends on BR2_PACKAGE_JAMVM" and jamvm has a
    "select BR2_PACKAGE_CLASSPATH" which feels a bit like a circular
    dependency. It would be nice to fix that up as well.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
