From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Mon, 04 Mar 2013 20:12:29 +0200
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <CAKAx1cjwOtqE9ZK1RnB0=wWXhVw+8end_j8roL8RZ9aZwAj=EQ@mail.gmail.com>
References: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
 <20130303195436.49654719@skate> <948441.33302.bm@smtp138.mail.ir2.yahoo.com>
 <CAKAx1cjwOtqE9ZK1RnB0=wWXhVw+8end_j8roL8RZ9aZwAj=EQ@mail.gmail.com>
Message-ID: <5134E40D.6@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

4.3.2013 12:53, Lionel Orry kirjoitti:
> Another note, Funtoo Linux (a gentoo derivative) team is experimenting
> with usage of mdev as a complete udev replacement for the whole
> distro. It seems to work and tries to prove the scalability of mdev
> which sounds promising. Here are some files resulting from these
> attempts:
>
> - mdev from busybox configured for funtoo (1 tiny patch and simple
> configuration in the ebuild):
> https://github.com/slashbeast/foo-overlay/tree/master/sys-fs/mdev-bb
> - repository for notes and mdev config/init scripts (may be worth a
> look at mdev.conf and mdev.init):
> https://github.com/slashbeast/mdev-like-a-boss
>
> What I wanna say, is that it *may* sound reasonable to strongly
> suggest people to stick with mdev as much as they can.
>
> Cheers
> Lionel

Yes, I for one can confirm that if you don't need anything else than to
populate /dev with nodes and maybe few
symlinks then mdev is perfectly fine.

I have run buildroot xorg with mdev without any problems.

*But* ... (and this is a big but) I have not tested how it reacts to
kernel events after boot when you *plug/unplug* devices and if mdev
is capable of *running programs/scripts when some event happens*.

If Funtoo can make it work and make it also work seamlessly with all the
other crazy stuff (network-manager, and some other
gnome stuff) then I will kick out udev from my system in a nanosecond :-)

Regards
Stefan
