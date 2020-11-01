From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Nov 2020 10:01:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/frr: fix detection of
 host-python3
In-Reply-To: <20201031232427.1681349-1-fontaine.fabrice@gmail.com>
References: <20201031232427.1681349-1-fontaine.fabrice@gmail.com>
Message-ID: <20201101100154.4d22d02a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  1 Nov 2020 00:24:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add an upstream patch to fix detection of host-python3 and avoid the
> following failure because of missing --embed flag:
> 
> configure:22276: checking python interpreter python3
> configure:22278: "$PYTHON" -c 'import sys; open("conftest.pyver", "w").write(sys.executable or ""); sys.exit(not (sys.version_info.major == 2 and sys.version_info.minor >= 7))'
> configure:22281: $? = 1
> configure:22287: "$PYTHON" -c 'import sys; open("conftest.pyver", "w").write(sys.executable or ""); sys.exit(not ((sys.version_info.major == 3 and sys.version_info.minor >= 2) or sys.version_info.major > 3))'
> configure:22290: $? = 0
> configure:22310: result: /home/buildroot/autobuild/run/instance-1/output-1/host/bin/python3 (python3)
> py_abi= py_ldver=3.9 py_ver=3.9 py_bindir=/home/buildroot/autobuild/run/instance-1/output-1/host/bin/
> configure:22326: checking whether /home/buildroot/autobuild/run/instance-1/output-1/host/bin/python3.9-config is available
> configure:22329: result: yes
> configure:22339: checking whether /home/buildroot/autobuild/run/instance-1/output-1/host/bin/python3.9-config provides a working build environment
> configure:22376: /usr/bin/gcc -std=gnu11 -o conftest -O2 -I/home/buildroot/autobuild/run/instance-1/output-1/host/include -fno-omit-frame-pointer -funwind-tables -Wall -Wextra -Wmissing-prototypes -Wmissing-declarations -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Wundef -Wno-unused-result -Wno-unused-parameter -Wno-missing-field-initializers -pthread -I/home/buildroot/autobuild/run/instance-1/output-1/host/include/python3.9 -I/home/buildroot/autobuild/run/instance-1/output-1/host/include/python3.9 -I/home/buildroot/autobuild/run/instance-1/output-1/host/include -L/home/buildroot/autobuild/run/instance-1/output-1/host/lib -Wl,-rpath,/home/buildroot/autobuild/run/instance-1/output-1/host/lib conftest.c    -L/home/buildroot/autobuild/run/instance-1/output-1/host/lib  -lcrypt -lpthread -ldl  -lutil -lm -lm  >&5
> /tmp/ccrVSMCb.o: In function `main':
> conftest.c:(.text.startup+0x5): undefined reference to `Py_Initialize'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d33293bfb2f8d558efa2d83e5cb71226d3e65c7f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...all-future-minor-versions-of-python3.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/frr/0001-build-find-all-future-minor-versions-of-python3.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
