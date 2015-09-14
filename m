From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Sep 2015 23:39:41 +0200
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
	to be symlinks into /usr
In-Reply-To: <55F73B74.1020708@mind.be> (Arnout Vandecappelle's message of
 "Mon, 14 Sep 2015 23:26:12 +0200")
References: <1441324062-31743-1-git-send-email-yann.morin.1998@free.fr>
 <20150904101128.4206779d@free-electrons.com>
 <55E9540C.9060000@mind.be> <20150904163121.GD4540@free.fr>
 <8737yg3dt0.fsf@dell.be.48ers.dk> <55F73B74.1020708@mind.be>
Message-ID: <87vbbcznmq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

>> Is there any reason why we explicitly add the symlinks for /bin / /sbin
 >> and /lib and don't just do:
 >> 
 >> ln -sf . usr

 >  Well, in Fedora I think the idea was that / could be an initramfs and /usr
 > would be mounted read-only. But since we don't directly support that use case,
 > making /usr a symlink would indeed be an option.

 >  However, I'm not really in favour of it. I don't see that it brings
 > a lot of benefit, other than reducing the number of symlinks from 3
 > to 1. But it does create /share and /local which looks weird could
 > potentially conflict with existing user directories (e.g. a
 > mountpoint for windows shares...). Also it makes it more complicated
 > for the user to implement a fedora-like mounted /usr.

Ok - fine, having 1 or 3 symlinks isn't really a big deal. Just symlinking /usr
seemed the simplest possible solution.

-- 
Venlig hilsen,
Peter Korsgaard 
