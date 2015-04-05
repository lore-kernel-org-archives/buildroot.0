From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 17:28:57 +0200
Subject: [Buildroot] [PATCH] lirc-tools: fix build with host python3
In-Reply-To: <a17acfb3c3818b1ccc0c2a98ff8993574d83f001.1428247566.git.baruch@tkos.co.il>
References: <a17acfb3c3818b1ccc0c2a98ff8993574d83f001.1428247566.git.baruch@tkos.co.il>
Message-ID: <20150405172857.7b773e82@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun,  5 Apr 2015 18:26:06 +0300, Baruch Siach wrote:
> Add an upstream patch making make_rel_symlink.py python3 compatible and making
> python3 mandatory. Update lirc-tools dependencies accordingly.
> 
> Fixes:
> http://autobuild.buildroot.net/results/6c6/6c6e014a751650c16d25dfd3d673bd3199c72b2e/
> http://autobuild.buildroot.net/results/857/85724dfd014cec5a80dd18a635826daa2edc1417/
> http://autobuild.buildroot.net/results/a74/a74563f700a47065ffd1ba42c83c2d7722bacd89/
> 
> and many others.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Is host-python3 actually mandatory? When BR2_PACKAGE_PYTHON3 is not
enabled, it can perfectly fine use the host python?

So what about:

 * Using #!/usr/bin/env python in the script, and make the script both
   python 2 and python 3 compliant.

 * Use $(if $(BR2_PACKAGE_PYTHON3),host-python3) in the dependencies ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
