From: Diego Iastrubni <diegoiast@gmail.com>
Date: Thu, 13 Sep 2012 11:43:56 +0300
Subject: [Buildroot] [RFC] Add board support for Raspberry Pi device.
In-Reply-To: <1347402977-17837-1-git-send-email-marek.belisko@open-nandra.com>
References: <1347402977-17837-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <CALR4fELY4B_fYsX8QJdV0P9iAbDkT5T3bKFyEsUX8_tBVyq46Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 12, 2012 at 1:36 AM, Marek Belisko
<marek.belisko@open-nandra.com> wrote:
>
> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
>
> Basic support:
> - boot binary blobs + VideoCore added in utils package (to avoid fetching 2 times
>   same repo which is quite big)
Is it possible to only "check out" those needed blobs with  a single
"wget" from some stable tag? Why do I need the whole project history
just to boot my RBPI?

> - add actual kernel build 3.2.27 with cutdown config
Is this a vanilla kernel? Can those boot the RBPI now? (sweet...)

>
> - using external toolchain
What happens when you choose a regular common ARM toolchain? From my
tests the RBPI does boot with those CodeSourcery (whatever they are
called now)  toolchains over NFS when I choose generic ARM.

When you re-send the patch, I will also look into the package list. I
looked at what you did in the repository, and IMHO you are building b
default WAY too much. The default should be busybox, and maybe SSH...
all other things are related to the application you want to build, not
the board. Meaning: let the user choose what to compile into his RBPI.
For example, in none of my tests I needed glib2, which you are
compiling.

GREAT WORK! KEEP IT COMING!
