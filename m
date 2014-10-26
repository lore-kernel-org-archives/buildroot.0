From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Oct 2014 10:13:05 -0700
Subject: [Buildroot] [PATCH 3/3] manual: Add notes about GitHub and
	hashes
In-Reply-To: <20141026180855.6aa51f07@free-electrons.com>
References: <1414341315-31896-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1414341315-31896-3-git-send-email-maxime.hadjinlian@gmail.com>
 <20141026180855.6aa51f07@free-electrons.com>
Message-ID: <20141026171305.GB3592@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-26 18:08 +0100, Thomas Petazzoni spake thusly:
> On Sun, 26 Oct 2014 17:35:15 +0100, Maxime Hadjinlian wrote:
> 
> > +If +libfoo+ is from GitHub, we can only accept +.hash+ file if the
> > +package has a release section and the maintainer has uploaded a release
> > +tarball. Otherwise, the automated generated tarball may change through
> > +time, rendering a +.hash+ file invalid.
> 
> I don't really understand this. If the tarball is automatically
> generated, then it should always be the same for a given version/tag of
> a certain repository, no?

The content of the extracted archive is always the same, except for
timestamps, so, the archive is not reproducible itself.

> It would be scary if it was not possible to validate the integrity of
> all the packages we download from github.

But then that's the case for generated tarballs from github: we have
absolutely no way to check them, unless we want to have hashes for the
extracted files themselves (which I doubt we want, as it would be a
nightmare to handle).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
