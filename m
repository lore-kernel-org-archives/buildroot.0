From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Dec 2019 14:51:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/tio: fix termio redefinition
In-Reply-To: <20191227204520.1500501-1-fontaine.fabrice@gmail.com>
References: <20191227204520.1500501-1-fontaine.fabrice@gmail.com>
Message-ID: <20191229145146.17dfff70@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri, 27 Dec 2019 21:45:20 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> + #include <sys/ioctl.h>
> +-#include <asm/ioctls.h>
> +-#include <asm/termbits.h>
> ++#include <asm-generic/ioctls.h>
> ++#include <asm-generic/termbits.h>

Thanks for proposing a patch. While I haven't had the chance to look
for a better solution, I wanted to state that directly including an
<asm-generic/foo.h> header from user-space is generally consider a very
bad thing. Not all architectures use the asm-generic headers for all
headers, and the fact that some use asm-generic headers is an internal
implementation detail.

So, this patch feels like a (potentially incorrect) workaround more
than a proper fix.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
