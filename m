From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 22:52:18 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/thrift: disable qt4
In-Reply-To: <20200307092230.1388597-1-fontaine.fabrice@gmail.com>
References: <20200307092230.1388597-1-fontaine.fabrice@gmail.com>
Message-ID: <20200307225218.4f5f4986@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  7 Mar 2020 10:22:30 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> host-thrift can fail if a broken Qt4 is found on host:
> 
> CMake Error in lib/cpp/CMakeLists.txt:
>   Imported target "Qt4::QtCore" includes non-existent path
> 
>     "/nvmedata/autobuild/instance-4/output-1/host/usr/mkspecs/default"
> 
>   in its INTERFACE_INCLUDE_DIRECTORIES.  Possible reasons include:
> 
>   * The path was deleted, renamed, or moved to another location.
> 
>   * An install or uninstall procedure did not complete successfully.
> 
>   * The installation package was faulty and references files it does not
>   provide.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/57cad5313896c868e99b0b9534678f1c83a386f2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Peter Seiderer):
>  - Move WITH_QT4=OFF to THRIFT_COMMON_OPTS which already contains
>    WITH_QT5=OFF

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
