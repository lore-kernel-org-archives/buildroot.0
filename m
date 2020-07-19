From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Jul 2020 10:01:49 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/meson: fix LDFLAGS rpath
 match pattern
In-Reply-To: <20200719012140.3135984-1-james.hilliard1@gmail.com>
References: <20200719012140.3135984-1-james.hilliard1@gmail.com>
Message-ID: <20200719100149.00045442@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 18 Jul 2020 19:21:40 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> The upstream change in d7235c5905fa98207d90f3ad34bf590493498d5b is not
> sufficient to prevent rpaths from being stripped in some cases due to
> a bug in how it matches rpaths in LDFLAGS.
> 
> Add a patch fixing the LDFLAGS rpath match pattern.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f2f/f2f912416ab11d454479ef3d22ed6b757207f84f/
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - Fix root cause of rpath bug in meson instead of using workaround patch.
> ---
>  ...003-backends-fix-rpath-match-pattern.patch | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 package/meson/0003-backends-fix-rpath-match-pattern.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
