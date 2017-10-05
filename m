From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Oct 2017 12:23:56 +0200
Subject: [Buildroot] [PATCH] pkg-download: make package name optional in
 github helper
In-Reply-To: <26d3dc60-5a3a-0fce-f3cf-b75ee2670644@mind.be>
References: <20171004085745.15457-1-ismael@iodev.co.uk>
 <26d3dc60-5a3a-0fce-f3cf-b75ee2670644@mind.be>
Message-ID: <20171005122356.2b31e9b5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 4 Oct 2017 18:35:07 +0200, Arnout Vandecappelle wrote:

>  As noticed by Peter, this was already wrong in the original patch: it only
> works if the github helper is used in a := assignment,

Doh? We're using the github helper almost exclusively in = assignments:

package/assimp/assimp.mk:ASSIMP_SITE = $(call github,assimp,assimp,$(ASSIMP_VERSION))
package/asterisk/asterisk.mk:ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
package/atest/atest.mk:ATEST_SITE = $(call github,amouiche,atest,$(ATEST_VERSION))
package/aufs/aufs.mk:AUFS_SITE = $(call github,sfjro,aufs4-standalone,$(AUFS_VERSION))
package/avrdude/avrdude.mk:AVRDUDE_SITE = $(call github,kcuzner,avrdude,$(AVRDUDE_VERSION))
package/axfsutils/axfsutils.mk:AXFSUTILS_SITE = $(call github,jaredeh,axfs,$(AXFSUTILS_VERSION))
package/azmq/azmq.mk:AZMQ_SITE = $(call github,zeromq,azmq,$(AZMQ_VERSION))

Am I missing something in your explanation ?

Or perhaps you meant "when the third argument is not passed, we need to
use a := assignment" ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
