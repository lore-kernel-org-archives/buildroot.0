From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Mar 2013 20:30:59 +0100
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <5134F134.10207@petroprogram.com> ("Stefan =?utf-8?Q?Fr=C3=B6?=
 =?utf-8?Q?berg=22's?= message of
 "Mon, 04 Mar 2013 21:08:36 +0200")
References: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
 <20130303195436.49654719@skate>
 <948441.33302.bm@smtp138.mail.ir2.yahoo.com>
 <CAKAx1cjwOtqE9ZK1RnB0=wWXhVw+8end_j8roL8RZ9aZwAj=EQ@mail.gmail.com>
 <5134E40D.6@petroprogram.com> <20130304183729.GA4651@tarshish>
 <5134F134.10207@petroprogram.com>
Message-ID: <87txor9d3g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan Fr?berg <stefan.froberg@petroprogram.com> writes:

Hi,

 Stefan> Currently udev:
 Stefan> - requires /usr to be mounted before it starts
 Stefan> - systemd init system to rule them all (altought Arnout said that  it is
 Stefan> still optional???)
 Stefan> - dbus (why the heck would I want/need dbus if im just making
 Stefan> rescue/repair initramfs to boot system straight to shell ?)
 Stefan> - other ?

 Stefan> So IMHO, buildroot should definetely have plan B that will have some
 Stefan> other alternative device handling than udev.
 Stefan> Be it eudev, mdev with steroids(Funtoo) or whatever....

Well, we do: static /dev, devtmpfs and mdev. For a rescue initramfs
devtmpfs is probably the best option.

-- 
Bye, Peter Korsgaard
