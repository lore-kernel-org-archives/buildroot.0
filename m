From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Mar 2017 09:20:35 +0100
Subject: [Buildroot] [PATCH v3 1/1] python-pylibftdi: new package
In-Reply-To: <1488385119-14452-1-git-send-email-christian.kellermann@solectrix.de>
References: <20170301153428.00513b95@free-electrons.com>
 <1488385119-14452-1-git-send-email-christian.kellermann@solectrix.de>
Message-ID: <20170306092035.4486af38@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Mar 2017 17:18:39 +0100, Christian Kellermann wrote:
> Adds the python binding for libftdi to buildroot.
> 
> Signed-off-by: Christian Kellermann <christian.kellermann@solectrix.de>
> ---
> Changes:

This package causes a build issue:

Traceback (most recent call last):
  File "/home/test/autobuild/run/instance-0/output/host/usr/lib/python3.5/py_compile.py", line 125, in compile
    _optimize=optimize)
  File "<frozen importlib._bootstrap_external>", line 700, in source_to_code
  File "<frozen importlib._bootstrap>", line 222, in _call_with_frames_removed
  File "/home/test/autobuild/run/instance-0/output/target/usr/lib/python3.5/site-packages/pylibftdi/driver.py", line 124
    return cdll.LoadLibrary(name + '.so')
                                        ^
TabError: inconsistent use of tabs and spaces in indentation

See
http://autobuild.buildroot.net/results/67c/67cddfdb801e83acfd9f197f5661fd43fa38a092/build-end.log
for the full log.

Could you have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
