From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Mar 2013 20:31:34 +0100
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <20130303195436.49654719@skate> (Thomas Petazzoni's message of
 "Sun, 3 Mar 2013 19:54:36 +0100")
References: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
 <20130303195436.49654719@skate>
Message-ID: <87ppzf9d2h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> So in fact building udev only without systemd doesn't seem like
 Thomas> a good idea moving forward. Therefore, I see two options:

 Thomas>  (1) Follow the upstream decision, and simply make udev available only
 Thomas>      if the init system is systemd. Unlike some other distributions, we
 Thomas>      never had the the desire of fighting against upstream. If someone
 Thomas>      is dissatisfied with decisions made by upstream projects, then
 Thomas>      that someone should go upstream and fix the problem here.

 Thomas>      This is the solution I would personally prefer. If some were using
 Thomas>      udev for some reason and mdev doesn't work for them, then we can
 Thomas>      probably help make mdev better where needed.

 Thomas>  (2) Package eudev and use it for non-systemd systems, and use the
 Thomas>      built-in udev for systemd systems. There is of course the problem
 Thomas>      that udev is not stand-alone: it provides a library, and there are
 Thomas>      some uncertainties on whether the libudev library will remain
 Thomas>      source-compatible between eudev and system's udev.

 Thomas> Thoughts?

I think option (1) is the best as well.

-- 
Bye, Peter Korsgaard
