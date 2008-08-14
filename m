From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 14 Aug 2008 07:45:16 +0200
Subject: [Buildroot] Package haserl does not install to root filesystem
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190966BDD6@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190960E889@mi8nycmail19.Mi8.com>
	<873al8rb7t.fsf@macbook.be.48ers.dk>
	<BD79186B4FD85F4B8E60E381CAEE190966BDD6@mi8nycmail19.Mi8.com>
Message-ID: <1218692716.11494.2.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2008-08-13 at 15:18 -0400, hartleys wrote:
> On Wednesday, August 13, 2008 12:01 PM, Peter Korsgaard wrote:
> >> I have the haserl package selected (due to webif) but it
> >> does not get installed when I do a make.
> >>
> >> After the initial make is complete and the root filesystem
> >> exists in my $(TARGET_DIR) I can do the following to get it
> >> to install:
> >>
> >> $ make haserl-dirclean
> >> $ make
> >>
> >> Any ideas how to fix it?
> >
> > Could you be a bit more specific? Does it error out or does
> > the haserl install step never run? It seems to work here.
> 
> For the initial make with the root filesystem not existing in
> $(TARGET_DIR) but haserl is in $(BUILD_DIR) the build completes with no
> errors but haserl is not installed. Actually, none of the
> Makefile.autotools.in steps run for haserl.
> 
> The "make haserl-dirclean; make" will then do all the steps in
> Makefile.autotools.in and install haserl.
> 
> I think the problem is because of $(BUILD_DIR)/%/.stamp_target_installed
> still existing.
>

I submitted a fix for this some time back, but it is still hanging in
limbo.

http://buildroot.uclibc.org/lists/buildroot/2008-July/009930.html

All packages using autotools will need to be updated to take advantage
of the change though. See the popt example in the email URL.
