From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 May 2013 10:58:31 +0200
Subject: [Buildroot] [PATCH] toolchain/crosstool-NG: do not depend on
 the top-level Buildroot's .config
In-Reply-To: <8003334.zUx8i8rUNE@sagittae>
References: <1363644183-29242-1-git-send-email-yann.morin.1998@free.fr>
 <8003334.zUx8i8rUNE@sagittae>
Message-ID: <20130509105831.1340edef@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Thu, 09 May 2013 00:32:43 +0200, J?r?me Pouiller wrote:

> > So, just drop the not-so-clever heuristic, and just build the toolchain
> > once, leaving to the user the responsibility to explictly ask Buildroot
> > to rebuild the toolchain.
> Hmmm... I didn't followed all debate, and I am sorry if this suggestion has 
> already been submitted but, why not depend on 
> build/buildroot-config/br2/toolchain/ctng* ?

There's a choice:

 1) Either we do detect changes in the configuration and automatically
    rebuild what needs to be rebuild. But if we decide to do that, we
    must do it *perfectly*. If we tell users "you can make changes in
    your configuration, run 'make' and it will automatically rebuild
    what's necessary", it should work perfectly, and not have some
    bizarre cases where it doesn't rebuild what's needed.

 2) Or we don't even try to detect changes, even in simple cases. This
    keeps Buildroot simple and we have a simple thing to explain to our
    users: "Buildroot doesn't try to detect which configuration changes
    you made, it's up to you to rebuild what's necessary, or restart a
    full build".

Until now, all the Buildroot developers agreed that (2) was the way to
go. (1) is complicated to achieve correctly, and would add a
significant complexity to Buildroot, which is something we absolutely
want to avoid.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
