From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 23:42:12 +0200
Subject: [Buildroot] [PATCH] core: enhance printvars
In-Reply-To: <1485641971-25278-1-git-send-email-yann.morin.1998@free.fr>
References: <1485641971-25278-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170326234212.141c1e1b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Jan 2017 23:19:31 +0100, Yann E. MORIN wrote:
> Currently, the output of printvars copntains the name of the variable,
> its expanded value and its un-expanded value.
> 
> However, most of the time, we need the actual, expanded value, so it can
> be re-used from a (non-Buildroot) infrastructure script, like a
> post-build script, or a build-farm driver (e.g. a Jenkins job...)
> 
> Add two options that a user may set to change the output of printvars:
>   - RAW_VARS, if set, will drop the unexpanded value
>   - QUOTED_VARS, if set, will quote the expanded value
> 
> So that it can be used as such:
> 
>     $ make -s printvars VARS=BUSYBOX_VERSION RAW_VARS=1 QUOTED_VARS=1
>     BUSYBOX_VERSION='1.26.2'
> 
> And it is even possible to directly evaluate it in a shell script:
> 
>     eval $(make -s printvars VARS=BUSYBOX_VERSION RAW_VARS=1 QUOTED_VARS=1)
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Seeing the feedback from Thomas DS and Arnout, I've marked the patch as
"Changes Requested". Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
