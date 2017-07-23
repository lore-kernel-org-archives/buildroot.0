From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jul 2017 11:21:44 +0200
Subject: [Buildroot] [PATCH 02/20] core/pkg-generic: add variable to
 skip skeleton dependency
In-Reply-To: <871sp7pldt.fsf@dell.be.48ers.dk>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <85a6c3a598a517fd0fad2cba0b7c42d746c7830e.1500398733.git.yann.morin.1998@free.fr>
 <e507f13d-b54b-9205-d3e6-853b072744d5@mind.be>
 <871sp7pldt.fsf@dell.be.48ers.dk>
Message-ID: <20170723092144.GD2917@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2017-07-23 11:12 +0200, Peter Korsgaard spake thusly:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  >> Instead of checking for all the skeleton-providing packages in the core
>  >> infra, add a new package options so that packages can express they do
>  >> not need the dependency on the skeleton, like we have an option to avoid
>  >> the depednency on the toolchain. The only packages that will use that
>  >> option are probably the skeletons, so we need not document this
>  >> variable, like we did not document the option to exclude the dependency
>  >> on the toolchain.
>  >> 
>  >> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  >> Reviewed-by: Romain Naour <romain.naour@gmail.com>
> 
>  >  I absolutely hate adding additional variables that are used for only a few
>  > packages, but I have no better ideas, so
> 
> An alternative could be to enforce a naming convention for these
> packages, E.G. skeleton-*, and then use $(filter skeleton%,$(1)) in the
> check, but I'm not sure that really is much nicer.

We also talked about that possibility on IRC, and came to the conclusion
that it was not nice to hard-code magic values in the infra.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
