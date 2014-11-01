From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 22:22:05 +0100
Subject: [Buildroot] [PATCH 1/1] Fix redundant usage of -mcpu and
 -march/-mtune
In-Reply-To: <1399989494-21343-2-git-send-email-kaszak@gmail.com>
References: <1399989494-21343-1-git-send-email-kaszak@gmail.com>
 <1399989494-21343-2-git-send-email-kaszak@gmail.com>
Message-ID: <20141101222205.372415a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

On Tue, 13 May 2014 15:58:14 +0200, Karoly Kasza wrote:
> Disable adding -mtune or -march to the external toolchain parameters
> if -mcpu is present.
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

We discussed this patch at the last Buildroot meeting, and our feeling
is that it's not the correct approach. I've since then sent a patch
series that fix the same problem. Our approach is:

 * On ARM, to no longer specify -march, but only -mcpu, since the
   latter is used by gcc to deduce the former.

 * In general, get rid of -mtune, since it doesn't make much sense in
   the context of Buildroot where we target one specific system, and
   therefore using -mcpu is sufficient.

So, we've marked your patch as Rejected in our patch tracking system.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
