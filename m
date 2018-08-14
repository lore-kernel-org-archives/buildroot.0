From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Aug 2018 16:39:55 +0200
Subject: [Buildroot] [PATCH 1/3] fake-hwclock: new package
In-Reply-To: <20180814160032.5d2bfce8@windsurf>
References: <20180810144635.16182-1-chrismcc@gmail.com>
 <20180814160032.5d2bfce8@windsurf>
Message-ID: <20180814143955.GI7915@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Christopher, All,

On 2018-08-14 16:00 +0200, Thomas Petazzoni spake thusly:
> On Fri, 10 Aug 2018 07:46:34 -0700, Christopher McCrory wrote:
> > +if BR2_PACKAGE_FAKE_HWCLOCK
> > +config BR2_PACKAGE_FAKE_HWCLOCK_CRONJOB
> > +        bool "install fake-hwclock cronjob"
> > +        help
> > +          Hourly cronjob to save current timestamp
> 
> What should be our policy for cronjobs ? I'm not sure we currently have
> packages that install cronjobs. What should we do? Install
> unconditionally? Have a sub-option?
> 
> I would personally lean towards installing unconditionally, but I'd
> like to have others opinions before applying.

Don't add an option; always install it.

Unless there is a *very* good reason not to (e.g. security
considerations), in which case a rationale must be provided.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
