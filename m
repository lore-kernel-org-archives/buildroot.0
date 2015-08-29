From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 11:29:55 +0200
Subject: [Buildroot] [PATCH 1/1] Fix umask settings for non-bash shells
 for root user
In-Reply-To: <20150829092037.GA4857@free.fr>
References: <1434378026-15007-1-git-send-email-vorel@jablocom.com>
 <20150829105707.3d5e0fec@free-electrons.com>
 <20150829092037.GA4857@free.fr>
Message-ID: <20150829112955.3a6b8d77@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 29 Aug 2015 11:20:37 +0200, Yann E. MORIN wrote:

> > Yann, Arnout, Peter, your thoughts?
> 
> My opinion? Here's what I'd do ;-)
> 
>     git rm system/skeleton/root/.bash_*

That's also what I want to do.

> And maybe provide a simple .profile *iff* needed.

Can you check if a .profile is really needed? If so, can you submit a
patch series cleaning up .bash_* ?

> As for bash, our bash.mk may install those .bash_* files in /root/ .

Right.

> Furthermore, I'd also like /etc/profile be cleaned-up of all the mess,
> moving each (interesting) parts to separate files in /etc/profile.d/ .

Why not, but let's say it's a separate matter.

> And while at it:
> 
>     git rm system/skeleton/root/.empty

Why? Git doesn't track empty directories, so we have those .empty files
all over the place. I don't see what would recreate the root/ directory
for the root user if we don't keep it in the skeleton. Am I missing
something?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
