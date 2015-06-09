From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Tue, 09 Jun 2015 09:29:00 +0200
Subject: [Buildroot] Option for debug support in DirectFB package
In-Reply-To: <20150609001953.1c241187@free-electrons.com>
References: <55760F79.8080501@openmailbox.org>
 <20150609001953.1c241187@free-electrons.com>
Message-ID: <ea9e1bad9d8e6c95d8611537b5224ccc@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Thomas Petazzoni]
> I am not sure I've made up my mind yet specifically about your
> question, but two informations:
> 
>  * BR2_PACKAGE_DIRECTFB_DEBUG will most likely be removed, as part of
>    a patch series I have to bump the entire DirectFB stack. See:
> 
> http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=directfb-bump
> 
>  * --enable-debug / --disable-debug used to be passed to all autotools
>    packages, depending on the state of the BR2_ENABLE_DEBUG option.
>    This is no longer the case since commit
> 
> http://git.buildroot.net/buildroot/commit/?id=0552a367dbdc27a211daaac3359d81dd537e384f.


It sounds like a very good idea to avoid mixing two "features" in 
BR2_ENABLE_DEBUG.
We may need debugging symbols without wanting to add any overload in 
binaries.

But then, since it is already commited, is your removal of DirectFB 
specific debug option still relevant?
Or should we create another global option to enable debug (i.e. traces) 
in autotools packages (and similar things in other types of packages 
when possible)?
This is just a question, I have no personal need for this debug 
option...

[Arnout Vandecappelle]
> That indeed sounds like a good solution. As mentioned by Thomas, the
> BR2_PACKAGE_DIRECTFB_DEBUG option will go away, so I'd suggest an 
> option
> BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT that defaults to y.

It might sound strange to have an option for debug support (i.e. compile 
the functions to print debug info) and no option for debug (i.e. use 
these functions in DFB core).
Yet it seems to be the better idea, and the only way to force to compile 
with no debug feature at all and to install in -pure directory.
Waiting for Thomas feedback...

Thank you.


-- 
C?dric
