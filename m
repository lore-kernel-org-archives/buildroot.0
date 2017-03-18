From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 14:12:14 +0100
Subject: [Buildroot] [PATCH v2 1/3] acl: make sure build picks up
 TARGET_CFLAGS
In-Reply-To: <20170317160616.20570-1-arnout@mind.be>
References: <20170317160616.20570-1-arnout@mind.be>
Message-ID: <20170318141214.28255e8a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Mar 2017 17:06:14 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The acl build system doesn't use automake, therefore it is broken. It
> doesn't use the CFLAGS passed by configure. Work around this by passing
> CFLAGS in the environment. The makefiles append to CFLAGS, so this
> works.
> 
> This issue hasn't led to build failures, but it is visible e.g. when
> stack protector is enabled: the stack protector options are not applied
> to acl. Also debug and optimisation options aren't applied.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> v2: new patch
> ---
>  package/acl/acl.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
