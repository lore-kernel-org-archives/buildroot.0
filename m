From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 May 2020 21:27:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpam-tacplus: fix build when
 time_t is 64 bits
In-Reply-To: <20200517170507.2796394-1-fontaine.fabrice@gmail.com>
References: <20200517170507.2796394-1-fontaine.fabrice@gmail.com>
Message-ID: <20200517212712.6e3b0f13@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 May 2020 19:05:07 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +Fixes:
> + - http://autobuild.buildroot.org/results/874433d8cb30d21332f23024081a8b6d7b3254ae
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/kravietz/pam_tacplus/commit/f3913777ea8373c58981061a01a7eda187ffc9d9]
> +---
> + tacc.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/tacc.c b/tacc.c
> +index ef9d081..9260373 100644
> +--- a/tacc.c
> ++++ b/tacc.c
> +@@ -343,7 +343,7 @@ int main(int argc, char **argv) {
> +         /* start accounting */
> +         struct tac_attrib *attr = NULL;
> + 
> +-        sprintf(buf, "%lu", time(0));
> ++        sprintf(buf, "%llu", time(0));

But isn't this going to introduce another warning when time_t is 32-bit ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
