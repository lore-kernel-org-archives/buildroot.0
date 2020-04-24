From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Apr 2020 14:59:46 +0200
Subject: [Buildroot] [PATCH 3/8] package/python3-regex: add special
 package variant for the host build
In-Reply-To: <20200323104909.16765-3-yegorslists@googlemail.com>
References: <20200323104909.16765-1-yegorslists@googlemail.com>
 <20200323104909.16765-3-yegorslists@googlemail.com>
Message-ID: <20200424145946.66d14428@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Mar 2020 11:49:04 +0100
yegorslists at googlemail.com wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Needed to build mongodb.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/python3-regex/python3-regex.hash |  1 +
>  package/python3-regex/python3-regex.mk   | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 120000 package/python3-regex/python3-regex.hash
>  create mode 100644 package/python3-regex/python3-regex.mk

Like Romain, I don't really like that we're adding more and more
duplicated packages for host-python3, but we don't really have a good
solution today. And since the mid-term plan is to get rid of Python
2.x, I don't think it's very useful to implement an alternate solution
now.

> +# Please keep in sync with
> +# package/python-regex/python-regex.mk

I've put this comment on one line, and also added the comment in
package/python-regex/python-regex.mk.

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
