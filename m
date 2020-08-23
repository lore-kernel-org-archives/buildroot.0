From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Aug 2020 13:23:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/mjpg-streamer: disable opencv
 python and cpp example
In-Reply-To: <20200822121840.757051-1-fontaine.fabrice@gmail.com>
References: <20200822121840.757051-1-fontaine.fabrice@gmail.com>
Message-ID: <20200823132343.37e7c861@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 22 Aug 2020 14:18:40 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> python-numpy is an optional dependency since
> https://github.com/jacksonliam/mjpg-streamer/commit/545c1a1d3abf72bb7a97c870c78e85dd0845f63a
> 
> This dependency will raise the following build failure if python-numpy
> is found on the host:
> 
> aarch64_be-linux-gnu-g++: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/lib/python3/dist-packages/numpy/core/include'
> 
> because mjpg-streamer uses the python executable to retrieve the include
> directory:
> 
> -- Found PythonLibs: /home/peko/autobuild/instance-0/output-1/host/aarch64_be-buildroot-linux-gnu/sysroot/usr/lib/libpython3.8.so (found version "3.8.5")
> -- Found PythonInterp: /usr/bin/python3.5 (found version "3.5.3")
> -- Found NUMPY: /usr/lib/python3/dist-packages/numpy/core/include
> 
> So disable python filter as well as cpp example while at it
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e6795fa8ed5d8514b3e10ea1135afb31eab22b7e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mjpg-streamer/mjpg-streamer.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
