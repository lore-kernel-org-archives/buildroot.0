From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 18 Jul 2013 13:07:27 -0300
Subject: [Buildroot] [PATCH] arch/arm: add support for thumb(1) mode
In-Reply-To: <87zjtkwao1.fsf@dell.be.48ers.dk>
References: <1374075555-9599-1-git-send-email-gustavo@zacarias.com.ar>
 <20130717175838.2fc2831e@skate> <51E6C06C.8070300@zacarias.com.ar>
 <20130717215826.60942218@skate> <51E719D4.4070304@zacarias.com.ar>
 <87zjtkwao1.fsf@dell.be.48ers.dk>
Message-ID: <51E812BF.9060808@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/18/2013 05:10 AM, Peter Korsgaard wrote:

> FYI, I just did a test build (arm926/thumb1/internal uclibc), and the
> build dies in NPTL when it runs out of registers. Without threads it
> builds and seems to work.

I regularly build -mthumb (via CFLAGS) projects without issues for an
arm920t, but that doesn't force those flags for uclibc, just catched the
breakage after you fixed my patch (mine was a no-op, d'oh!)
Seems uclibc is broken for thumb builds, even with
COMPILE_IN_THUMB_MODE=y in its config (which the only thing it does is
add -mthumb to the compile flags).
Patches follow to make uclibc build on ARM mode regardless to avoid the
breakage (eglibc seems broken too, though none of them for thumb2 since
the register set isn't restricted).
I've also disabled libmudflap for thumb1 since it doesn't build either -
i know Thomas has a patchset coming adding the option for libmudflap,
just that i don't want to leave it broken/undocumented in the mean time.
Regards.
