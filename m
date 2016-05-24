From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 May 2016 21:38:10 +0200
Subject: [Buildroot] systemd and journald
In-Reply-To: <20160523100709.3e2f0feb@itchy>
References: <20160522124140.GA3630@free.fr>
 <20160523100709.3e2f0feb@itchy>
Message-ID: <20160524193810.GC3621@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

?ric, All,

On 2016-05-23 10:07 +0200, Eric Le Bihan spake thusly:
> Le Sun, 22 May 2016 14:41:40 +0200,
> "Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :
> 
> > So, because our /var/log is a symlink to /tmp , the journal is
> > correctly created
> > in /tmp/journal/c30ad28b21d444ba9fff7fb25b5454b1/system.journal but
> > since another filesystem is mounted over it later, it is no longer
> > accessible, so journalctl does not find it.
> > 
> > I'm not sure where to go forward rom there, but it looks like our
> > skeleton is wrong when the init system is systemd.
> 
> I haven't played with a systemd-based setup for a while, but I used to
> fix this with a post-build script [1]. 

Hmm.. that's what maxime told me on IRC, too...

> There was also a discussion some times ago about the need for a
> skeleton package per init system [2].

Right, and it's been there a long time ago...

> [1] https://github.com/elebihan/buildroot-ext-elb/blob/master/overlays/base-systemd/post-build.sh
> [2] http://buildroot-busybox.2317881.n4.nabble.com/How-to-provide-one-default-skeleton-per-init-system-td72124.html

Thanks for the poitners, I'll try to see what I can come up with.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
