From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 14:08:30 +0200
Subject: [Buildroot] [PATCH 2/2] package/libplist: fix python support
In-Reply-To: <1412502007-9902-2-git-send-email-s.martin49@gmail.com>
References: <1412502007-9902-1-git-send-email-s.martin49@gmail.com>
 <1412502007-9902-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20141005140830.706f1b6d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  5 Oct 2014 11:40:07 +0200, Samuel Martin wrote:
> This patch:
> - fixes the python3 support detection in the libplist CMake code;
> - correctly sets the dependencies and configure options in libplist.mk.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/efb/efba806b9a40a5e9c6bca7e591747ca2102fa1d5/
> 
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  ...support-python2-and-python3-when-defining.patch | 27 ++++++++++++++++++++++
>  package/libplist/libplist.mk                       | 13 +++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 package/libplist/libplist-0003-cmake-swig-support-python2-and-python3-when-defining.patch

Patch applied, thanks. Of course, if libplist can be bumped, it would
be good.

Another note: in this case, the Python binding requires an additional
dependency (host-swig), so I'm wondering if we shouldn't have an
explicit option to enable/disable the libplist Python binding. Right
now, as soon as you have Python and libplist enabled, you're going to
build the Python binding, which requires building host-swig, even if
you don't care at all about libplist Python binding.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
