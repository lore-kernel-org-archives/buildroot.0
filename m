From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 22:49:28 +0200
Subject: [Buildroot] [PATCH v8 05/10] core: sanitize RPATH in target
 tree before copying the overlay
In-Reply-To: <1500561321-6623-6-git-send-email-wg@grandegger.com>
References: <1500561321-6623-1-git-send-email-wg@grandegger.com>
 <1500561321-6623-6-git-send-email-wg@grandegger.com>
Message-ID: <20170720224928.70c0c834@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Jul 2017 16:35:16 +0200, Wolfgang Grandegger wrote:
> We sanitize the RPATH of ELF files in the target tree to deal
> with stupid packages that don't correctly use --prefix/DESTDIR
> and that end up putting the full absolute build-time directory
> in the RPATH.
> 
> We do it before copying the overlay and calling the post-build
> script. The user is completely responsible for what happens
> in the last two steps, and it should never be touched by us.
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---
>  Makefile | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
