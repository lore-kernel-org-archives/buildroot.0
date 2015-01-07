From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 22:01:43 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/lockdev: handle
 static/shared only build
In-Reply-To: <1420585564-7921-1-git-send-email-romain.naour@openwide.fr>
References: <1420585564-7921-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150107220143.3565f3b1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed,  7 Jan 2015 00:06:03 +0100, Romain Naour wrote:
> Add a patch to install headers and static library separately.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v2: Headers must always be installed in staging,
>     remove static library installation from install_dev target (ThomasP)

Thanks, both patches applied. Can you submit upstream?

To be honest, I am wondering if it's really a good idea to patch all
package to make sure they only install shared libraries in a
BR2_SHARED_LIBS=y build. Ideally yes, but do we want to carry patches
in all packages that have a crazy build system, and are for many of
them essentially unmaintained? I don't know.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
