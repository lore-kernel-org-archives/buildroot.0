From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Jun 2014 22:23:46 +0200
Subject: [Buildroot] [PATCH] Remove user "default"
In-Reply-To: <lmqfvg$e0l$1@ger.gmane.org> (Nicholas Kulikov's message of "Thu, 
 5 Jun 2014 23:21:20 +0400")
References: <1401957050-24705-1-git-send-email-sho@relinux.de>
 <lmqfvg$e0l$1@ger.gmane.org>
Message-ID: <87lhtbm7fx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicholas" == Nicholas Kulikov <nkulikov@gmail.com> writes:

 > I don't know why but avahi-autopipd uses this by default.
 > `ps` output from system built by using Buildroot:
 > # ps -o pid,ppid,user,comm,args
 > PID   PPID  USER     COMMAND
 >    1     0 root     init
 > ...
 >  807     1 default  avahi-autoipd    avahi-autoipd: [eth1] bound 169.254.8.72
 >  808   807 root     avahi-autoipd    avahi-autoipd: [eth1] callout dispatcher
 > ...

Ahh, that's because of:

git grep default package/avahi/avahi.mk
package/avahi/avahi.mk:         --with-avahi-user=default \
package/avahi/avahi.mk:         --with-avahi-group=default \
package/avahi/avahi.mk:         --with-autoipd-user=default \
package/avahi/avahi.mk:         --with-autoipd-group=default

We should adjust avahi.mk to create an avahi user. I'll take a look.

-- 
Bye, Peter Korsgaard
