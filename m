From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 19:38:38 +0100
Subject: [Buildroot] [PATCH v2] kmod: needs largefile
In-Reply-To: <1425452782-10909-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425452782-10909-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150304193838.5598dc99@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Wed,  4 Mar 2015 08:06:22 +0100, Fabio Porcedda wrote:
> Since version 20 it requires largefile support.
> 
> http://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=481ad14550087c77c9df6d117c7a975a38a4ad33
>  - Disable --disable-largefile. We already had possible bugs in the
>    index implementation if this were passed. It's now fixed, but it's
>    never tested. Disable it.
> 
> Fix build failure:
> configure: error: --disable-largefile is not supported by kmod
> package/pkg-generic.mk:172: recipe for target 'output/build/kmod-20/.stamp_configured' failed
> 
> Fixes:
> http://autobuild.buildroot.net/results/f662d9230e4bc2da7dc56a2ffd493cc37254d377//
> http://autobuild.buildroot.net/results/233ec8ee346e15d41658cffc6bbb4a6c9dd46746//
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: Baruch Siach <baruch@tkos.co.il>

Applied, after doing some minor changes:

    [Thomas:
     - use two separate 'depends on' conditions for BR2_STATIC_LIBS and
       BR2_LARGEFILE, like we do in most packages.
     - take this opportunity to also indicate the dependency on dynamic
       library in the comment, which was missing until now.]

Thanks!    

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
