From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 16:03:23 +0100
Subject: [Buildroot] [PATCH v9 1/1] package/dhcp: bump version to
 4.3.3-P1
In-Reply-To: <1455677124-21497-1-git-send-email-rdkehn@yahoo.com>
References: <1455677124-21497-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <20160221160323.0a2eed40@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Doug Kehn,

On Tue, 16 Feb 2016 20:45:24 -0600, Doug Kehn wrote:
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
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Changes v8 -> v9
>   - change HOST_CXXFLAGS to HOST_CPPFLAGS (suggested by Ricardo)
> Changes v7 -> v8
>   - add additional HOST defines (suggested by Arnout)
> Changes v6 -> v7
>   - fix typo in hash (suggested by Ricardo)
> Changes v5 -> v6
>   - patch configure.ac instead of configure/Makefile.in (suggested by Arnout)
>   - rework dhcp.mk for patch changes.
> Changes v4 -> v5
>   - update hash reference (suggested by Arnout)
>   - expand comments (suggested by Arnout)
> Changes v3 -> v4
>   - consolidate into single patch (suggested by Arnout)
>   - separate into POST_CONFIGURE_HOOK & PRE_BUILD_HOOK (suggested by Arnout)
> Changes v2 -> v3
>   - removed RFC tag
>   - updated version from 4.3.3 to 4.3.3-P1 (suggested by Ricardo)
>   - external toolchain support (suggested by Ricardo)
> Changes v1 -> v2
>   - removed DHCP_PRE_BUILD_HOOKS in favor of patch (suggested by Arnout)
> ---
>  package/dhcp/0001-dhcp-cross-compile.patch | 34 +++++++++++++++++++++++++
>  package/dhcp/0002-bind-cross-compile.patch | 24 ++++++++++++++++++
>  package/dhcp/0003-bind-host-cc.patch       | 40 ++++++++++++++++++++++++++++++
>  package/dhcp/dhcp.hash                     |  4 +--
>  package/dhcp/dhcp.mk                       | 28 +++++++++++++++++++--
>  5 files changed, 126 insertions(+), 4 deletions(-)
>  create mode 100644 package/dhcp/0001-dhcp-cross-compile.patch
>  create mode 100644 package/dhcp/0002-bind-cross-compile.patch
>  create mode 100644 package/dhcp/0003-bind-host-cc.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
