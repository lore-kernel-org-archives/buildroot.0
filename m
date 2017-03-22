From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 22:18:23 +0100
Subject: [Buildroot] [PATCH] poppler: bump version to 0.53.0 causing
 build issues
In-Reply-To: <20170321154109.1311-1-Vincent.Riera@imgtec.com>
References: <20170321154109.1311-1-Vincent.Riera@imgtec.com>
Message-ID: <20170322221823.2accea08@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 15:41:09 +0000, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/poppler/poppler.hash | 2 +-
>  package/poppler/poppler.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Breaks the build on nios2:

/home/dawncrow/buildroot-test/scripts/instance-0/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/include/nspr/prcpucfg.h:1117:2: error: #error "Unknown CPU architecture"
 #error "Unknown CPU architecture"

Weird because our libnspr precisely has a patch to support the nios2
architecture.

There are also other errors in the build log.

See:

  http://autobuild.buildroot.net/?reason=poppler-0.53.0

The previous version was building fine:

  http://autobuild.buildroot.net/?reason=poppler-0.52.0

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
