From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Aug 2013 17:59:49 +0200
Subject: [Buildroot] [PATCHv2] libgpgme: handle argp-standalone
In-Reply-To: <1375297186-25282-1-git-send-email-gustavo@zacarias.com.ar>
References: <1375297186-25282-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130801175949.0e201867@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 31 Jul 2013 15:59:46 -0300, Gustavo Zacarias wrote:
> libgpgme has an internal implementation of argp parsing for when the
> libc lacks such an implementation (i.e. uClibc).
> However if it detects argp.h the internal implementation is disabled and
> for a uClibc-based toolchain that breaks the build.
> This happens when argp-standalone is installed since libgpgme never
> tries to link to libargp.
> 
> Make it link against libargp, which also saves some target size. Fixes:
> http://autobuild.buildroot.net/results/33c/33c5776d2b3f7fa276a27f7602eb71c4d77c7b62/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libgpgme/libgpgme.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
