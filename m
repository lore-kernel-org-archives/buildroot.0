From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Jan 2014 00:39:52 +0100
Subject: [Buildroot] [PATCH 0/6] [RFC] some download-related changes
In-Reply-To: <52D5AE9F.6070105@mind.be>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
 <52D5AE9F.6070105@mind.be>
Message-ID: <20140114233952.GM3328@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-01-14 22:39 +0100, Arnout Vandecappelle spake thusly:
> On 13/01/14 00:44, Yann E. MORIN wrote:
> >The first part, patch 1 to 3, are a fix the git download helper, which
> >is currently broken in case a PKG_VERSION is a sha1 that does not exist
> >in the repository.
> >
> >Since the make macro was a bit complex to read and maintain, Peter
> >suggested it be moved to a shell script. If this change is OK, I'll
> >move the other download helpers to their own shell script.
> 
>  I would actually move all of $(DOWNLOAD) into a single helper script. I
> expect that that will give you a lot of refactoring opportunities.

I also wondered if I'd do that.

But for a first iteration of the series, I decided to just dip a toe in
the water to check if it was not too hot! ;-)

And then, I think I prefer multiple scripts, one for each VCS. It's not
like doing a 'gzip -c' is too complex, after all, since that's the only
thing they'll gona share.

But let's see what others think of it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
