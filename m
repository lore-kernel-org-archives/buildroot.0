From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 00:52:13 +0200
Subject: [Buildroot] [PATCH 1/7] Add <PKG>_STRIP_COMPONENTS for packages
 with non-standard tarballs
In-Reply-To: <1436624110-20428-1-git-send-email-luca@lucaceresoli.net>
References: <1436624110-20428-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20150712005213.332ec052@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Sat, 11 Jul 2015 16:15:04 +0200, Luca Ceresoli wrote:
> Usually package tarballs contain only a directory named
> "<pkg-name>-<pkg-version>" which contains the actual source tree. To properly
> extract the source files in $(BUILD_DIR), Buildroot passes the
> --strip-components=1 option to tar.
> 
> Unfortunately a few packages ship in a non-standard way, with no root
> directory or with more than one. In Buildroot these packages must be handled by
> overriding the <PKG>_DOWNLOAD_CMDS.
> 
> As the number of such packages is growing, introduce a <PKG>_STRIP_COMPONENTS
> variable for packages to request a number of components to strip different
> from 1.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  package/pkg-generic.mk | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Patches 1 to 6 applied.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
