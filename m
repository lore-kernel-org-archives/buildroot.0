From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 21:49:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/cog: fix segfaults on null
 xkb_data keymap/state
In-Reply-To: <20200327182639.76711-1-james.hilliard1@gmail.com>
References: <20200327182639.76711-1-james.hilliard1@gmail.com>
Message-ID: <20200329214939.767b7774@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 27 Mar 2020 12:26:39 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Fixes:
> Program terminated with signal SIGSEGV, Segmentation fault.
> #0  xkb_state_key_get_layout (state=state at entry=0x0, kc=kc at entry=50) at ../src/state.c:217
> 
> Program terminated with signal SIGSEGV, Segmentation fault.
> #0  XkbKey (kc=kc at entry=45, keymap=0x0) at ../src/keymap.h:430
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...ata.state-is-not-null-before-calling.patch | 30 +++++++++++++++++++
>  ...ata.keymap-is-not-null-before-callin.patch | 30 +++++++++++++++++++
>  2 files changed, 60 insertions(+)
>  create mode 100644 package/cog/0002-fdo-ensure-xkb_data.state-is-not-null-before-calling.patch
>  create mode 100644 package/cog/0003-fdo-ensure-xkb_data.keymap-is-not-null-before-callin.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
