From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 23:57:36 +0200
Subject: [Buildroot] [PATCH 1/1] flex: delete broken flex++ symlink from
 target
In-Reply-To: <1406597734-1902-1-git-send-email-danomimanchego123@gmail.com>
References: <1406597734-1902-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20140729235736.1c91a388@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Mon, 28 Jul 2014 21:35:34 -0400, Danomi Manchego wrote:
> When flex is built for the target without installing the
> flex binary, a flex++ symlink installed by flex's Makefile
> points to the missing flex executable.  This mod adds
> a post target install hook to remove the broken symlink.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/flex/flex.mk |    6 ++++++
>  1 file changed, 6 insertions(+)

Thanks, applied. However, I'd really like if someone could take the
time to do a proper patch upstream to add a new ./configure option to
enable/disable the program compilation/installation. It would allow us
to simplify the package a bit.

Danomi, would you be willing to work on this? The upstream seems to be
active, and there is a git repository at
http://sourceforge.net/p/flex/flex/ci/master/tree/, so no need to work
with horrible outdated version control systems.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
