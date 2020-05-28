From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 May 2020 22:17:03 +0200
Subject: [Buildroot] [PATCH v3] package/qt5/qt5declarative: fix parallel
 install
In-Reply-To: <20200526210443.29088-1-ps.report@gmx.net>
References: <20200526210443.29088-1-ps.report@gmx.net>
Message-ID: <20200528221703.009f2612@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 May 2020 23:04:43 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> From: Romain Naour <romain.naour@gmail.com>
> 
> Installing qt5declarative examples on fast/fast/multicore machines sometimes
> failes with a variation of the following error messages:
> 
>  - Cannot touch [...]/chapter5-listproperties/app.qml: No such file or directory
>  - Error copying [...]/chapter2-methods/app.qml: Destination file exists
> 
> Fix it by using OTHER_FILES instead of a seperate qml files install target
> to fix the race between install_target, install_qml and install_sources.
> 
> Fixes:
> 
>  - https://gitlab.com/buildroot.org/buildroot/-/jobs/565470221
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> [Reworked patch and commit log]
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v2 -> v3:
>  - reworked patch (OTHER_FILES instead of additional dep) and commit log
> ---
>  .../0002-examples-fix-parallel-install.patch  | 185 ++++++++++++++++++
>  1 file changed, 185 insertions(+)
>  create mode 100644 package/qt5/qt5declarative/0002-examples-fix-parallel-install.patch

Applied to master, thanks. Did you submit this upstream ? :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
