From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:39:50 +0200
Subject: [Buildroot] [PATCH 7/8] core/show-info: report the ordered list
 of build steps
In-Reply-To: <93a3545d1fe7b47cdfb32edc7db3fd54600fecd9.1586592741.git.yann.morin.1998@free.fr>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
 <93a3545d1fe7b47cdfb32edc7db3fd54600fecd9.1586592741.git.yann.morin.1998@free.fr>
Message-ID: <20200411103950.4a21b23e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Apr 2020 10:12:32 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> People (and scritps) who want to report on the build progress, now know
> where and what to look for (build directory and stampfiles), but they
> also need to know the ordering of those stampfiles.
> 
> The stampfiles item is a dictionary; dictionaries are guaranteed to not
> be ordered, so even if we output the stampfiles in order, we can expect
> users of that dictionary to get them back in order.
> 
> Expose the build steps in a list, which is guaranteed to be ordered.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Vadim Kochan <vadim4j@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: eeppeliteloop at gmail.com
> ---
>  package/pkg-utils.mk | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Meh, just like PATCH 6/8, I'm not sure. This is going to be a lot of
additional information in the JSON, almost duplicated for every
package, and there is really nothing bad in the "progress showing" tool
to have knowledge about these steps. It's not like they are changing
all the time.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
