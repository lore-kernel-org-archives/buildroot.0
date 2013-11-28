From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 28 Nov 2013 10:37:27 +0100 (CET)
Subject: [Buildroot] [PATCHv3 2/5] core: allow external
 Config.in/makefile	code to be integrated
In-Reply-To: <20131128094342.3f6c84e4@skate>
Message-ID: <1745239489.15294056.1385631446992.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



----- Mail original -----
> Dear Jeremy Rosen,
> 
> Please do not top post. This is considered bad practice on mailing
> lists.
> 
sorry, trying to adapt to the different habits of the different ML

usually it's ok to toppost when you don't comment the actual content...

i'll try to get it right next time.

> > on this particular one, if I remember correctly the kconfig
> > infrastructure
> > will not work correctly if one of the include is missing... so
> > shouldn't
> > your infrastructure check if $(BR2_EXTERNAL)/package/Config.in
> > exists, and create one if it doesn't ?
> 
> The idea is that:
> 
>  * If the user is specifying a BR2_EXTERNAL location, then this
>    location *must* contain a package/Config.in file. Even if it's
>    empty.
> 
>  * If the user is not specifying a BR2_EXTERNAL location, then we are
>    using support/dummy-external/ as a fake BR2_EXTERNAL, to ensure
>    that
>    package/Config.in exists.
> 
> There is no way to express in kconfig "include this file if it
> exists,

my idea was more along the line of "if we are setting BR2_EXTERNAL
and the file doesn't exist, then create an empty "Config.in" file
so the next call to make doesn't fail" 

this would be to avoid leaving the build system in a broken 
configuration after a call that sets up the build system for the
user.

I can see pro and cons on this idea, there is a risk in touching
a file the user is supposed to edit and the breakage itself could
be considered a good way to make sure the user go look into the 
file

but on the other hand, for simple use cases where the user doesn't
want to add new packages, but simply overlay a couple of config
files, creating a valid infrastructure from the start might be 
a good idea...

Cheers
Boucman
