From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Feb 2015 12:19:22 +0100
Subject: [Buildroot] [PATCH v3 1/3] pkg-generic.mk: reinstall targets
In-Reply-To: <20150201115913.4c61b7ad@free-electrons.com>
References: <1417188306-9035-1-git-send-email-rdkehn@yahoo.com>
 <1417188306-9035-2-git-send-email-rdkehn@yahoo.com>
 <20150201105500.GA4305@free.fr>
 <20150201115913.4c61b7ad@free-electrons.com>
Message-ID: <20150201111922.GB4305@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Doug, All,

On 2015-02-01 11:59 +0100, Thomas Petazzoni spake thusly:
> On Sun, 1 Feb 2015 11:55:01 +0100, Yann E. MORIN wrote:
> > I am not very happy with the fact that we add new actions here; the rest
> > of the code block is so far only concerned about ordering, not the
> > actual commands to execute.
> > 
> > The only other similar make target that removes stuff is the
> > $(1)-dirclean target, that uses a fake stamp-file (that it actually does
> > not touch) to actually does the cleanup.
> 
> I am not sure what you mean here. Look at the existing
> $(1)-clean-for-rebuild and $(1)-clean-for-reconfigure targets. They
> also do some commands to remove the stamp files. So what Doug has done
> here is to simply replicate the same logic, but removing less stamp
> files to only retrigger installation and not configuration and/or
> compilation.

Ah, indeed, I missed it as it was below the code touched for the
reinstall targets.

> So I believe the implementation proposed by Doug is well-aligned with
> what we already do. Unless I misunderstood your comment, obviously.

No, that's Ok, I did not look further than the part actually touched by
the patch.

So, obviously, I withdraw my comment.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
