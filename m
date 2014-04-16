From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 19:31:21 +0200
Subject: [Buildroot] [PATCH v2 1/1] host-libxml2: Prefer python2 when
 python3 is also installed
In-Reply-To: <1397314396-2489-1-git-send-email-bernd.kuhls@t-online.de>
References: <1397314396-2489-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140416193121.5bbbf8eb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 12 Apr 2014 16:53:16 +0200, Bernd Kuhls wrote:
> Fixes mesa3d build errors:
> http://autobuild.buildroot.net/results/d10/d105a0b3ca11fad34f9a2dae0dae9bd041d918a6/
> http://autobuild.buildroot.net/results/d71/d7121443715024d15a66ff1abf1261803c10cd35/
> http://autobuild.buildroot.net/results/ce6/ce64164d76972f82acab277afc9c95a876c6433e/
> 
> checking for python2... python2
> checking python2 module: libxml2... no
> configure: error: failed to find required module libxml2
> make: *** [/home/test/test/1/output/build/mesa3d-10.0.4/.stamp_configured] Error 1
> 
> mesa3d needs python2 bindings installed by libxml2. To enforce their build
> option BR2_PACKAGE_HOST_LIBXML2_PYTHON is used exclusively by mesa3d so this
> patch does not affect other packages.
> 
> Without this patch host-libxml2 installs the python bindings in
> $(HOST_DIR)/usr/lib/$(PYTHON3_VERSION_MAJOR) using this defconfig:
> 
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_PYTHON3=y
> 
> because $(HOST_DIR)/usr/bin/python points to $(HOST_DIR)/usr/bin/python3:
> 
> Quote from host-libxml2 configure log:
> Found python in /home/fli4l/br2/buildroot/output/host/usr/bin/python
> Found Python version 3.4
> 
> HOST_$(PACKAGE)_NEEDS_HOST_PYTHON does not work here because libxml2 does
> not use the python-package infrastructure.
> 
> libxml2-python2.patch extends the python detection code in host-libxml2 to
> first look for python2, to keep the patch small I did not update the indentions:
> 
> Found python2 in /home/fli4l/br2/buildroot/output/host/usr/bin/python2
> Found Python version 2.7
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Add more autobuilder URLs, add s-o-b to patch file

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
