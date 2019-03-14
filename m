From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 22:14:02 +0100
Subject: [Buildroot] [PATCH 1/2] package/linux-headers: fix support for
 -rc kernels
In-Reply-To: <20190306212815.19759-1-arnout@mind.be>
References: <20190306212815.19759-1-arnout@mind.be>
Message-ID: <20190314221402.5a28354a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  6 Mar 2019 22:28:14 +0100
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> -rc kernels after v3.x are no longer available in the testing
> subdirectory. Instead they should be fetched from cgit.
> 
> Commit ff4cccbdcf5417a5a8c251ff302791a306023cc1 did this for linux
> itself, now we also do it for linux-headers.
> 
> When fetched from cgit, .tar.xz can't be used. Adding this to the
> existing condition is not so simple, so refactor how _SOURCE is set:
> simply set it explicitly in each branch of the condition. While more
> verbose (it is repeated 4 times), it's easier to understand and to
> maintain.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/linux-headers/linux-headers.mk | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
