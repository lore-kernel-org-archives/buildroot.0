From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Mar 2014 19:27:51 +0100
Subject: [Buildroot] [PATCH] support: properly check for bash as a
 dependency
In-Reply-To: <20140318165518.GA3342@free.fr>
References: <1395052954-1567-1-git-send-email-yann.morin.1998@free.fr>
 <20140318060130.282f5a46@skate> <20140318165518.GA3342@free.fr>
Message-ID: <20140318192751.0b0caaab@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 18 Mar 2014 17:55:18 +0100, Yann E. MORIN wrote:

> > I'm definitely against that. My system has /bin/sh pointing to dash,
> > and Buildroot works fine. One of the thing that annoyed me in
> > OpenEmbedded was its requirements to have /bin/sh be bash.
> > 
> > We clearly don't want that.
> 
> I'm just fine with that. :-)
> 
> But the current check is broken anyway, as all it checks is that the
> login shell of the user is bash.
> 
>   - if we want to work whith dash as the system shell, then the current
>     check is unneeded;
> 
>   - if we want to work with dash as the system shell, we don't care what
>     login shell the user is using, as we must also work when this is dash;
> 
>   - SHELL is not mandated by POSIX, so it may be empty on a
>     POSIX-compliant shell anyway.
> 
> So, we should just remove this check altogether.

Yes, I agree.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
