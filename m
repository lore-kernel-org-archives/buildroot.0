From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 10:15:29 +0200
Subject: [Buildroot] [PATCH v5] package/tiff: Rework tiff utilities
 handling
In-Reply-To: <1429823896-32708-1-git-send-email-arnout@mind.be>
References: <1429823896-32708-1-git-send-email-arnout@mind.be>
Message-ID: <20150425101529.69834195@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Thu, 23 Apr 2015 23:18:16 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> From: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> Remove all utility-specific options in favour of a generic
> option which select either all or no packages. If users
> want something more fine-grained than that, they can always
> remove the unnecessary tools in a post-build script.
> 
> Since tiff has no configure option or Makefile target to prevent
> the build/install of its utilities specific Makefile targets are
> called to build the libtiff and, optionally, the utilities.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> [Arnout: more compact implementation, slightly extend help text]
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v5: More compact implementation with SUBDIRS instead of overriding the
>     autotools _CMDS; extend Config.in text tiffutils -> tiff utilities;
>     extend Config.in help text with capitalization and _all_ utilities.
> v4: rebased
> v3: rebased
> v2: Replaced submenu with a new all-or-nothing option (Thomas)
> ---
>  Config.in.legacy       | 16 ++++++++++++++++
>  package/tiff/Config.in | 11 +++--------
>  package/tiff/tiff.mk   | 39 +++++----------------------------------
>  3 files changed, 24 insertions(+), 42 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
