From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 17 Feb 2016 20:52:13 -0200
Subject: [Buildroot] [PATCH v9 1/1] package/dhcp: bump version to
	4.3.3-P1
References: <1455677124-21497-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <56c4f99da9297_ccd13d9cfc6991c@ultri2.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Doug,

On Wed, Feb 17, 2016 at 12:45 AM, Doug Kehn <rdkehn@yahoo.com> wrote:
> bind source tar-ball is now embedded into the dhcp source. The embedded
> bind tar-ball is extracted after the dhcp source so cross compiling
> patches can be applied to the dhcp and bind before the package is built.
> 
> The embedded bind configure is called as part of dhcp make instead of
> dhcp configure; therefore, needed configure parameters are set in the
> make env.
> 
> 0001-dhcp-cross-compile.patch and 0002-bind-cross-compile.patch have
> been submitted upstream as part of a cross compiling enhancement
> suggestion to dhcp-suggest at isc.org. Reference ISC-Bugs #41502.
> 0003-bind-hos-cc.patch is already scheduled for the next dhcp release.
> 
> Buildroot thread
> 	http://lists.busybox.net/pipermail/buildroot/2016-January/149079.html
> has related information.
> 
> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Using origin/next + [PATCH v9], I did a build test for arm with all
package flags enabled (client, server, relay). Tested using arm
toolchains external-glibc, external-musl and buildroot-uClibc.
Basic run test (calling 'dhclient -v' gets an IPv4 address) using a
qemu_arm_versatile target.

Regards,
Ricardo
