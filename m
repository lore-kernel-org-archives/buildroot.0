From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Nov 2015 00:06:05 +0100
Subject: [Buildroot] [PATCH] qt5base: support OVERRIDE_SRCDIR
In-Reply-To: <5654EC26.8070401@mind.be>
References: <1448400109-32767-1-git-send-email-peter@korsgaard.com>
 <20151124224053.GC3904@free.fr> <5654EC26.8070401@mind.be>
Message-ID: <20151124230605.GE3904@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-11-25 00:00 +0100, Arnout Vandecappelle spake thusly:
> On 24-11-15 23:40, Yann E. MORIN wrote:
> > On 2015-11-24 22:21 +0100, Peter Korsgaard spake thusly:
> >> With OVERRIDE_SRCDIR we don't apply any of the qt5base patches, but the
> >> custom specs files are needed to be able to build - So install these in the
> >> configure step instead of having them as a patch.
> > 
> > IMHO, it make more sense to install them at post-patch (or post-extract)
> > rather than at the beginning of the configure step.
> 
>  But that wouldn't solve the issue, that it is not applied for OVERRIDE_SRCDIR.
> With OVERRIDE_SRCDIR, no extract or patch step is done, instead the rsync step
> is done.

Argh, indeed...

>  We could add it in a POST_PATCH _and_ a POST_RSYNC hook, however.

Yes, that would be better, I think.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
