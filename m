From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Feb 2020 18:39:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/cog: add patch fixing cog
 segfault
In-Reply-To: <20200218084339.21371-1-james.hilliard1@gmail.com>
References: <20200218084339.21371-1-james.hilliard1@gmail.com>
Message-ID: <20200218183956.4186d05c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Feb 2020 01:43:39 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Fixes:
> Thread 1 "cog" received signal SIGSEGV, Segmentation fault.
> xkb_state_update_mask (state=0x0, base_mods=0, latched_mods=0, locked_mods=0, base_group=base_group at entry=0, latched_group=latched_group at entry=0, locked_group=0) at ../src/state.c:814
> 814	    prev_components = state->components;
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...ata.state-is-not-null-before-calling.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/cog/0001-fdo-ensure-xkb_data.state-is-not-null-before-calling.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
