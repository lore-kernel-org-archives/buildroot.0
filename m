From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Jan 2014 22:43:46 +0100
Subject: [Buildroot] Empty utility package scripts
In-Reply-To: <CAPfzE3bOwMBNDLJszXtEK8OfAsWdgLTvt-8ObvJvnBcnyHQhDw@mail.gmail.com>
References: <CAPfzE3bOwMBNDLJszXtEK8OfAsWdgLTvt-8ObvJvnBcnyHQhDw@mail.gmail.com>
Message-ID: <20140108214346.GB3430@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andre, All,

On 2014-01-09 09:36 +1300, Andre Renaud spake thusly:
> Hi,
> I'm trying to create a utility package script which doesn't do any
> downloading, just copies some local files around (startup scripts),
> and creates a user in /etc/passwd. However I can't find any examples
> of packages that don't do any downloading/configuring/building.

In your pkg.mk, just set:

    PKG_SOURCE = 

(replace 'pkg' and 'PKG' with actual name of your package, of course).

To create a user, see:
    http://buildroot.net/downloads/manual/manual.html#_infrastructure_for_packages_with_specific_build_systems
and:
    http://buildroot.net/downloads/manual/manual.html#makeuser-syntax

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
