From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Sep 2020 22:47:01 +0200
Subject: [Buildroot] [PATCH 1/3] support/scripts/mkusers: allow option
 for system uid/gid
In-Reply-To: <20200113153516.486106-1-nolange79@gmail.com>
References: <20200113153516.486106-1-nolange79@gmail.com>
Message-ID: <20200915224701.5f096d97@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Norbert,

On Mon, 13 Jan 2020 16:35:13 +0100
Norbert Lange <nolange79@gmail.com> wrote:

> Extend the mkusers script to allow -2 for uid/gid.
> This value will take an identifier from the system range.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

Sorry for the long delay in getting back to you. We had an earlier
proposal from Stephan Henningsen doing pretty much the same:

  https://patchwork.ozlabs.org/project/buildroot/patch/20191023211313.6758-1-stephan+buildroot at asklandd.dk/

The argument of Stephan was pretty much beauty/consistency with what
"most systems do" without much other arguments.

However, based on your PATCH 2/3 and a reading of
https://systemd.io/UIDS-GIDS/ it seems like systemd somehow cares about
this system vs. normal user difference.

Could you give some details about the *why* you did this change?
Indeed, your commit log doesn't explain anything about the *why*.

Also, could you compare your changes to mkusers with the ones proposed
by Stephan? The ones proposed by Stephan looked quite a bit more
complicated.

Another (minor) question is: if we're going to go to this route of
separating system and normal users, wouldn't it make sense to have -1
identify system users, and -2 identify normal users? Indeed the vast
majority (all?) Buildroot packages probably want to create system
users, and they already use -1.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
