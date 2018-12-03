From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 09:09:56 +0100
Subject: [Buildroot] [PATCH 1/1] lxc: security bump to version 3.0.3
In-Reply-To: <20181202090838.15776-1-fontaine.fabrice@gmail.com>
References: <20181202090838.15776-1-fontaine.fabrice@gmail.com>
Message-ID: <20181203090956.1972a2f9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Dec 2018 10:08:38 +0100, Fabrice Fontaine wrote:
> This bump also includes the fix for CVE-2018-6556 released in 3.0.2 via
> commit "CVE 2018-6556: verify netns fd in lxc-user-nic": lxc-user-nic
> when asked to delete a network interface will unconditionally open a
> user provided path:
> https://github.com/lxc/lxc/commit/c1cf54ebf251fdbad1e971679614e81649f1c032
> 
> This code path may be used by an unprivileged user to check for the
> existence of a path which they wouldn't otherwise be able to reach. It
> may also be used to trigger side effects by causing a (read-only) open
> of special kernel files (ptmx, proc, sys).
> 
> Also add a dependency on gcc >= 4.7
> (https://github.com/lxc/lxc/issues/2592)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lxc/Config.in | 4 +++-
>  package/lxc/lxc.hash  | 2 +-
>  package/lxc/lxc.mk    | 2 +-
>  3 files changed, 5 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
