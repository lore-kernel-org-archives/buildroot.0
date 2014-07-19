From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Jul 2014 00:35:16 +0200
Subject: [Buildroot] [PATCH 4/4] perl-gdgraph: new package
In-Reply-To: <CAB0FRssX48i-XJ6GuZFObfWZQwTGXEOyQhWFgtsswn9RoEuVqA@mail.gmail.com>
References: <1405691019-10397-1-git-send-email-francois.perrad@gadz.org>
 <1405691019-10397-4-git-send-email-francois.perrad@gadz.org>
 <20140719191051.358726f9@free-electrons.com>
 <CAB0FRssX48i-XJ6GuZFObfWZQwTGXEOyQhWFgtsswn9RoEuVqA@mail.gmail.com>
Message-ID: <20140719223515.GL3593@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2014-07-19 22:28 +0200, Fran?ois Perrad spake thusly:
> 2014-07-19 19:10 GMT+02:00 Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>:
> > This package does not build:
> >   http://autobuild.buildroot.org/results/3e1/3e1698b0523dfa46f5b3ee03a22af820f7342c39/build-end.log
> No, the error is :
> 
>    only nested arrays of non-refs are supported at
> /usr/share/perl/5.10/ExtUtils/MakeMaker.pm line 664
> 
> And I could reproduce it on my box, with a host perl 5.10.1

Does that mean we should have our own host-perl, then?

It would guarantee that we have a known situation, where we control the
version of perl and we can reproduce builds across machines with
different versions of perl and a known list of installed modules and
their versions.

It would also allow tweaking the search paths to no longer include the
host system includes and libraries search paths (although it won't
protect us from badly written packages, such as perl-net-ssleay.)

But we can ensure that dependencies on other perl modules won't
accidentally find host system perl's modules.

This might be a big endeavour, but even if we only build our own
host-perl, that's still a big improvement, and needs only little changes
to our current perl infra, i.e. just calling our own perl.

We can later enhance the situation by gradually tweaking our host-perl.

What do you guys think of this?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
