From: Neale Pickett <neale@lanl.gov>
Date: Mon, 13 Aug 2012 13:56:40 -0600
Subject: [Buildroot] git clone with http not giving me commits after Jul
 6
In-Reply-To: <502958DC.3050705@googlemail.com>
References: <20120813121005.3aeda200@cfl-science.lanl.gov>
 <502958DC.3050705@googlemail.com>
Message-ID: <20120813135640.7735d625@cfl-science.lanl.gov>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm unable to use the git protocol because it is firewalled out where I
work.

The problem may be that update-server-info has quit running.  This
would explain the behavior I'm observing (git protocol is current, http
protocol is not).  It may also be my company's HTTP proxy, although I'm
doubtful that it has still cached a manifest file from over a month ago.

My remote branches (on origin) are "master" and "next".  Neither has
the 2012.08_rc1 tag, which according to the cgit interface, are on the
"master" branch.

    cfl-science:/home/neale/src/buildroot$ git tag -l | grep -c 2012.08
    0



On Mon, 13 Aug 2012 21:43:24 +0200
Carsten Schoenert <c.schoenert@gmail.com> wrote:

> Hello Neale,
> 
> I use another URL an get all the tags and branches like seen on
> http://git.buildroot.net/buildroot/ .
> 
> > carsten at wheezy:~/gitprojects/buildroot [master]$ grep
> > "url"  .git/config url = git://git.busybox.net/buildroot
> 
> Do you have checked the output of 'git branch -a' and 'git tag -l'?
> 
> Regards
> Carsten
> 
> and now to the ML :)
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Neale Pickett <neale@lanl.gov>
Advanced Computing Solutions, Los Alamos National Laboratory
