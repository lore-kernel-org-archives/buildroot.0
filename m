From: Lionel Orry <lionel.orry@gmail.com>
Date: Mon, 4 Mar 2013 11:53:55 +0100
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <948441.33302.bm@smtp138.mail.ir2.yahoo.com>
References: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
 <20130303195436.49654719@skate>
 <948441.33302.bm@smtp138.mail.ir2.yahoo.com>
Message-ID: <CAKAx1cjwOtqE9ZK1RnB0=wWXhVw+8end_j8roL8RZ9aZwAj=EQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Another note, Funtoo Linux (a gentoo derivative) team is experimenting
with usage of mdev as a complete udev replacement for the whole
distro. It seems to work and tries to prove the scalability of mdev
which sounds promising. Here are some files resulting from these
attempts:

- mdev from busybox configured for funtoo (1 tiny patch and simple
configuration in the ebuild):
https://github.com/slashbeast/foo-overlay/tree/master/sys-fs/mdev-bb
- repository for notes and mdev config/init scripts (may be worth a
look at mdev.conf and mdev.init):
https://github.com/slashbeast/mdev-like-a-boss

What I wanna say, is that it *may* sound reasonable to strongly
suggest people to stick with mdev as much as they can.

Cheers
Lionel

On Mon, Mar 4, 2013 at 11:16 AM, Kevin Chadwick <ma1l1ists@yahoo.co.uk> wrote:
>> So in fact building udev only without systemd doesn't seem like a good
>> idea moving forward. Therefore, I see two options:
>>
>>  (1) Follow the upstream decision, and simply make udev available only
>>      if the init system is systemd. Unlike some other distributions, we
>>      never had the the desire of fighting against upstream. If someone
>>      is dissatisfied with decisions made by upstream projects, then
>>      that someone should go upstream and fix the problem here.
>>
>>      This is the solution I would personally prefer. If some were using
>>      udev for some reason and mdev doesn't work for them, then we can
>>      probably help make mdev better where needed.
>>
>>  (2) Package eudev and use it for non-systemd systems, and use the
>>      built-in udev for systemd systems. There is of course the problem
>>      that udev is not stand-alone: it provides a library, and there are
>>      some uncertainties on whether the libudev library will remain
>>      source-compatible between eudev and system's udev.
>
> Not saying this is the way to go at all as I haven't got stuck into mdev
> yet but thought I may as well air another option which Gentoo was
> following due to broken boot for seperate /usr without initramfs, which
> is to stay at the udev version 17? (I think before the 192?
> amalgamation or inheritance by an ignoramus) until the time that eudev
> is said to be ready for production.
>
> The eudev list may be a good place to enquire about any potential
> kernel incompatibilities of staying at an older udev version and
> when eudev may be ready without getting loads of agro, lies or mis
> understanding thrown at you.
>
> --
> _______________________________________________________________________
>
> 'Write programs that do one thing and do it well. Write programs to work
> together. Write programs to handle text streams, because that is a
> universal interface'
>
> (Doug McIlroy)
> _______________________________________________________________________
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
