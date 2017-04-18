From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Apr 2017 19:52:07 +0200
Subject: [Buildroot] [RFC 0/4] fix genimage wrapper argument parsing
In-Reply-To: <20170418155554.28732-1-etienne.phelip@savoirfairelinux.com>
References: <20170418155554.28732-1-etienne.phelip@savoirfairelinux.com>
Message-ID: <d6663308-710e-97d7-2db8-1ea462bb0c03@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Etienne,

On 18-04-17 17:55, Etienne Phelip wrote:
> The genimage wrapper can be used in the post-image script but 
> BR2_ROOTFS_POST_SCRIPT_ARGS passes BINARIES_DIR as the first argument.
> 
> In order to make genimage.sh play nicely with
> BR2_ROOTFS_POST_IMAGE_SCRIPT, this patch series shifts the first
> argument by one before looping over the other arguments.
> 
> When calling genimage.sh directly, one should always pass BINARIES_DIR
> as the first argument like:
> 
>     ${TOPDIR}/support/scripts/genimage.sh ${BINARIES_DIR} \
>         -c path/to/genimage.cfg

 I like Abhimanyu's solution [1] better, because it makes passing BINARIES_DIR
optional and you can use it either directly as a post-image script or call it
from your custom post-image script. I did make a few comments in [1], but you
may want to have a look at it too and see if there is anything else to improve.

 That invalidates patch 1-3. Patch 4 still applies though and is AFAICS
independent of the rest. And it applies with a bit of fuzz on top of Abhimanyu's
patch, so I'll ack that one. Patch 1-3 I'll mark as rejected in Patchwork - if
you disagree, we can always re-instate them or you can resend.

 Regards,
 Arnout

[1] http://patchwork.ozlabs.org/patch/751165/

> 
> Etienne Phelip (4):
>   genimage.sh: fix argument parsing
>   genimage.sh: fix getopts traces
>   genimage.sh: strip getopts EOL characters
>   genimage.sh: add usage to die function
> 
>  support/scripts/genimage.sh | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
