From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 21:16:02 +0200
Subject: [Buildroot] [PATCH] busybox: add patch to fix 'head -n -1'
In-Reply-To: <20180905142854.24825-1-thomas.de_schampheleire@nokia.com>
References: <20180905142854.24825-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180905211602.1a355d8c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Sep 2018 16:28:54 +0200, Thomas De Schampheleire wrote:
> Busybox 1.29.0 introduces a regression causing head to fail with negative
> '-n' parameters, e.g. 'head -n -1'. Instead of showing all but the last one
> line, no lines are printed whatsoever.
> 
> The issue was reported with
> http://lists.busybox.net/pipermail/busybox/2018-August/086617.html . This
> commit backports the revert applied upstream.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  ...b-remove-unnecessary-variable-in-xmalloc_.patch | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/busybox/0003-Revert-libbb-remove-unnecessary-variable-in-xmalloc_.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
