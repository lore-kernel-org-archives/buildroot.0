From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Sep 2020 21:30:51 +0200
Subject: [Buildroot] [PATCH 1/2] support/scripts: prioritize conditions
 for pipeline creation
In-Reply-To: <080dfb07851ab4a84287dede9e03c99b217e73fc.1600722514.git.yann.morin.1998@free.fr>
References: <cover.1600722514.git.yann.morin.1998@free.fr>
 <080dfb07851ab4a84287dede9e03c99b217e73fc.1600722514.git.yann.morin.1998@free.fr>
Message-ID: <20200922213051.3668d826@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Sep 2020 23:08:41 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> When multiple conditions match simultaneously, even though that should
> not happen in practice, we want the more "important" one to win over
> the less "important" ones. For example, a tag is more important than a
> branch name or a trigger.
> 
> Currently, the latest condition to match takes precendence over any
> previous one, while we want the exact opposite.
> 
> Fix that with proper fallbacks in else-blocks.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  support/scripts/generate-gitlab-ci-yml | 58 +++++++++++++-------------
>  1 file changed, 29 insertions(+), 29 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
