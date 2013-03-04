From: Attila Kinali <attila@kinali.ch>
Date: Mon, 4 Mar 2013 20:47:31 +0100
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <20130303195436.49654719@skate>
References: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
 <20130303195436.49654719@skate>
Message-ID: <20130304204731.3134cc5b569baf8ffeb5d3b0@kinali.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 3 Mar 2013 19:54:36 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> So in fact building udev only without systemd doesn't seem like a good
> idea moving forward. Therefore, I see two options:
> 
>  (1) Follow the upstream decision, and simply make udev available only
>      if the init system is systemd. Unlike some other distributions, we
>      never had the the desire of fighting against upstream. If someone
>      is dissatisfied with decisions made by upstream projects, then
>      that someone should go upstream and fix the problem here.
> 
>  (2) Package eudev and use it for non-systemd systems, and use the
>      built-in udev for systemd systems. There is of course the problem
>      that udev is not stand-alone: it provides a library, and there are
>      some uncertainties on whether the libudev library will remain
>      source-compatible between eudev and system's udev.

How about
  (3) Wait a couple of months to see where this whole udev mess goes to.

eudev is still pretty young and got started on the wrong foot (see the
the very poor presentation at FOSDEM). How Lennart and Kai are treating
non-systemd users is pretty much nazi like, IMHO and shows a great lack
of understanding how diverse the linux ecosystem is. Not only do we have
a lot of people who want a slim system that is easy to debug, there are
also enough people who need to squeeze out every kB they can get. And
these are left out by the current systemd development, because it doesn't
fit into the vision of Lennart and Kai. 

As you know, this lead to a great unhappiness among many people who care
about a clean OS environment. And many people were talking about taking
udev out of systemds death grip before eudev happend. And i imagine that
a few other people will try too in the next months.

So, to come back to the original issue, i would say just freeze the current
version and wait a couple of months until it either becomes clear what will
happen or incompatibilites force you to upgrade.


			Attila Kinali


-- 
The people on 4chan are like brilliant psychologists
who also happen to be insane and gross.
		-- unknown
