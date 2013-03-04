From: Kevin Chadwick <ma1l1ists@yahoo.co.uk>
Date: Mon, 4 Mar 2013 19:52:09 +0000
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <87ppzf9d2h.fsf@dell.be.48ers.dk>
References: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
 <20130303195436.49654719@skate> <87ppzf9d2h.fsf@dell.be.48ers.dk>
Message-ID: <946118.25355.bm@smtp119.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi,
> 
>  Thomas> So in fact building udev only without systemd doesn't seem like
>  Thomas> a good idea moving forward. Therefore, I see two options:  
> 
>  Thomas>  (1) Follow the upstream decision, and simply make udev available only
>  Thomas>      if the init system is systemd. Unlike some other distributions, we
>  Thomas>      never had the the desire of fighting against upstream. If someone
>  Thomas>      is dissatisfied with decisions made by upstream projects, then
>  Thomas>      that someone should go upstream and fix the problem here.  
> 
>  Thomas>      This is the solution I would personally prefer. If some were using
>  Thomas>      udev for some reason and mdev doesn't work for them, then we can
>  Thomas>      probably help make mdev better where needed.  
> 
>  Thomas>  (2) Package eudev and use it for non-systemd systems, and use the
>  Thomas>      built-in udev for systemd systems. There is of course the problem
>  Thomas>      that udev is not stand-alone: it provides a library, and there are
>  Thomas>      some uncertainties on whether the libudev library will remain
>  Thomas>      source-compatible between eudev and system's udev.  
> 
>  Thomas> Thoughts?  
> 
> I think option (1) is the best as well.

It's worth bearing in mind however that in the long run and if eudev is
still around then I would expect (2) to be by far the best option for
their reduced dependencies, older kernel support and just general
all round sane and considerate decision making.

It's been a few weeks since I checked, is eudev considered stable yet.
When it is I'd say (2) definately.

Why not both. I don't believe there is too much difference? and eudev
is tracking udev but less so the other way around I believe.

-- 
_______________________________________________________________________

'Write programs that do one thing and do it well. Write programs to work
together. Write programs to handle text streams, because that is a
universal interface'

(Doug McIlroy)
_______________________________________________________________________
