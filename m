From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 22:40:22 +0200
Subject: [Buildroot] [PATCH] toolchain/wrapper: extend the list of
 unsafe paths
In-Reply-To: <20200621203158.14520-1-yann.morin.1998@free.fr>
References: <20200621203158.14520-1-yann.morin.1998@free.fr>
Message-ID: <20200622224022.4db35402@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 21 Jun 2020 22:31:58 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On some legacy systems, the X11 headers and libs are in /usr/X11R66/include
> and /usr/X11R66/lib, and of course, some packages are trying to be smart
> and use those paths (even when they do not exist).
> 
> Add those to the list of unsafe paths to check in the toolchain wrapper.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  toolchain/toolchain-wrapper.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks. Do you remember why we don't simply
blacklist /usr entirely ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
