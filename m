From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Mar 2016 09:20:44 +0100
Subject: [Buildroot] [PATCH 2/2] chocolate-doom: add patch to fix static
 linking
In-Reply-To: <1456810926-9822-2-git-send-email-rprebello@gmail.com>
References: <1456810926-9822-1-git-send-email-rprebello@gmail.com>
 <1456810926-9822-2-git-send-email-rprebello@gmail.com>
Message-ID: <20160301092044.00a9a2bf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rodrigo Rebello,

On Tue,  1 Mar 2016 02:42:06 -0300, Rodrigo Rebello wrote:
> This commit adds a backported upstream patch which modifies the
> configure script so that it uses pkg-config to detect libraries and
> their static linking dependencies.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/d98/d981499ad82121d58fb7584b55d09c484cb6aa49/
>   http://autobuild.buildroot.net/results/e41/e419f29e14edd28cbf48278bef725b696ae8ef70/
>   http://autobuild.buildroot.net/results/d8f/d8fe9b5bdb262e939d4150804ea34777c91d3c04/
>   ...
> 
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>

Thanks! Looks good, but since the patch adds pkg-config usage in the
configure script, the package should add host-pkgconf in its
dependencies.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
