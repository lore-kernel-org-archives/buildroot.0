From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 17:49:41 +0200
Subject: [Buildroot] [V4 1/2] dropbear: bump to version 2018.76
In-Reply-To: <20180328083827.31540-1-francois.perrad@gadz.org>
References: <20180328083827.31540-1-francois.perrad@gadz.org>
Message-ID: <20180428174941.711ad03b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Mar 2018 10:38:26 +0200, Francois Perrad wrote:
> with this new version:
>   - "configure --enable-static" should now be used instead of
>     "make STATIC=1"
>   - any customised options should be put in localoptions.h
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/dropbear/dropbear.hash |  2 +-
>  package/dropbear/dropbear.mk   | 31 ++++++++++++++-----------------
>  2 files changed, 15 insertions(+), 18 deletions(-)

I've applied to master, after doing some minor changes:

 - DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_SVR_PASSWORD_AUTH was moved
   closer to where DROPBEAR_SVR_PASSWORD_AUTH is defined

 - A comment was added on top of DROPBEAR_SVR_PASSWORD_AUTH to explain
   why we're doing this.

In addition, after applying/pushing your commit, I had a build failure
with non-SSP toolchains, so I made a separate commit to fix this:
https://git.buildroot.org/buildroot/commit/?id=b0aafef6198ee292c4f426295e92cc9b601c2338

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
