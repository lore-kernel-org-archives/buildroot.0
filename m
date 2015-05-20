From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 May 2015 23:27:20 +0200
Subject: [Buildroot] [PATCH v2] package/libsigrok: blacklist CS powerpc
 toolchains
In-Reply-To: <1432033797-9842-1-git-send-email-romain.naour@openwide.fr>
References: <1432033797-9842-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150520232720.5c7362dc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue, 19 May 2015 13:09:57 +0200, Romain Naour wrote:
> Even though BR2_PACKAGE_LIBSIGROKCXX is selected, the C++
> binding is disabled due to lack of C++11 support in the toolchain.
> 
> Configure output:
> Enabled language bindings:
>  - C++............................. no (C++11 compiler required)
> 
> So disable libsigrok C++ binding and pulseview for CS powerpc toolchains.
> 
> Fixes:
> http://autobuild.buildroot.net/results/737/737453011ac0d13ab197258171ffa0f81bc4c368/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v2: Propagate the dependency to the Config.in's comment for pulseview
>     and libsigrok packages. (Thomas Petazzoni)
> ---
>  package/libsigrok/Config.in | 3 +++
>  package/pulseview/Config.in | 3 +++
>  2 files changed, 6 insertions(+)

Applied, thanks. However, I've changed the conditions from !(foo ||
bar) to !foo && !bar, which to me sounded more logical in this
situation.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
