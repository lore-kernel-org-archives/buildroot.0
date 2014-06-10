From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Tue, 10 Jun 2014 15:21:47 -0500
Subject: [Buildroot] Upgrading my defconfig
In-Reply-To: <20140610214757.75cd4ec7@free-electrons.com>
References: <CAE9DZUS6HUUFpt-Rm-WONCcx5_4y+F+8TtcPFYzuNCfiraq83Q@mail.gmail.com>
 <20140610214757.75cd4ec7@free-electrons.com>
Message-ID: <CAE9DZURTf+ojW1aiqcq9F4Nmf9ozkfVMDqdYV8bmU6y1yw81ng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 10, 2014 at 2:47 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Dallas Clement,
>
> On Tue, 10 Jun 2014 11:11:24 -0500, Dallas Clement wrote:
> > Hi All,  Would someone kindly guide me through the steps of upgrading my
> > defconfig?  It's a few years out of date.  I've upgraded the rest of
> > buildroot itself, and when I try to save my defconfig the makefile
> > complains bitterly:
> >
> > $ make savedefconfig
> > Makefile.legacy:12: *** "You have legacy configuration in your .config!
> > Please check your configuration.".  Stop.
>
> I know you replied to your own e-mail, but for the record: this means
> your configuration has old Buildroot options that have been removed
> since then. You should therefore run "make menuconfig", and look into
> the "Legacy options" submenu to see which old options you're using.
> Buildroot wants you to disable them manually so that you're aware of
> their disappearance, and you have some help on how to migrate to the
> new name of the option if applicable.
>
> We should probably change the error message here to something more
> explanatory.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>

> We should probably change the error message here to something more
> explanatory.

Actually, the "make menuconfig" "Legacy options" were quite helpful in
identifying the legacy options.
My vexing problem was that I had old Config.in and .mk files from other
packages that were referring to
BR2_MYSQL_CLIENT.  And thus it was not enough to just clean up my defconfig
file alone.  I had to
replace those references with BR2_MYSQL and things work swimmingly now.

Thanks for the help.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140610/46e6b55f/attachment.html>
