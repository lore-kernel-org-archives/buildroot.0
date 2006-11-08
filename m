From: Ashwin Bihari <abihari@gmail.com>
Date: Tue, 7 Nov 2006 21:46:00 -0500
Subject: [Buildroot] Buildroot on Ubuntu 6.10
In-Reply-To: <45512EAC.9030703@indianaheart.org>
References: <45512EAC.9030703@indianaheart.org>
Message-ID: <1f11a5490611071846o32995c08w37765ab6b1ff6b70@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/7/06, Scott Reese <sreese@indianaheart.org> wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Greetings:
>
> Just a warning to the buildroot users.  The newest Ubuntu (6.10 -
> released 10/26) has modified /bin/sh.  In previous versions /bin/sh was
> a link to bash.  In the newest version it is a link to dash, a smaller,
> limited function shell based on bash that Debian developed to use on
> their boot floppies.
>
> Dash is missing a lot of functionality that bash contains, and I've been
> having a lot of trouble building using it.  Ubuntu's claim is that dash
> is a POSIX shell and that if you needed the additional functionality of
> bash, you should have used #!/bin/bash instead of #!/bin/sh as the
> header in your script.
>
> In any event, just changing the /bin/sh link from dash to bash fixed all
> of my problems with no noticeable problems on the workstation.  If
> you're having problems building on a Ubuntu 6.10 system, that's a good
> place to start.
>
> - -Scott Reese
>

I think a lot of people who write scripts have gotten used to the fact that
/bin/sh -> /bin/bash and assume that that's how it's going to be in all
systems. It isn't a bad idea to explicitly add #!/bin/bash if you wish to
use BASH functionality.

-- 
~ Ashwin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20061107/d7240a32/attachment.html 
