From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Oct 2013 08:02:30 -0300
Subject: [Buildroot] [PATCH 5/5] thrift: new package
In-Reply-To: <526E1146.2070902@mind.be>
References: <1382703323-31038-1-git-send-email-gustavo@zacarias.com.ar>
 <1382703323-31038-5-git-send-email-gustavo@zacarias.com.ar>
 <OFFFC3A740.7C7B430A-ON86257C10.000F397E-86257C10.001197E6@rockwellcollins.com>
 <526B8FEC.2000607@zacarias.com.ar> <526E1146.2070902@mind.be>
Message-ID: <526E4446.1090806@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/28/2013 04:24 AM, Arnout Vandecappelle wrote:

>  But not as much as requiring 80 hashes in the header :-)

Pfffft, that's not mine :)

>  It's not because it wasn't done right in the past that it shouldn't be
> done right now :-)

Some licenses were defined a few days ago that weren't the last lines
before defines and nobody said anything, you should have shown up then :P

>  I agree with Ryan that it would be a good idea to standardize on some
> order of the variable definitions. But since there is not standard at
> the moment, we have to wait for an edict from Peter before we can
> enforce it.

Propose it then and get it rolling, for the time being there's no rule
about it.

>  That it's implicit from openssl is not really relevant - if the
> dependency is ever removed from openssl (OK, this will not happen, but
> just imagine) then we'd like to keep the correct dependency here.

Ok.
All the packages that use openssl should be checked though, almost none
of them do zlib either (doesn't mean they use it directly, but a good
check wouldn't hurt).

>  It would be nicer though if that could be done with an upstreamable
> patch, but I think you said before that it wasn't going to happen.
> 
>  I do think that your sed magic should be done in POST_PATCH_HOOKS on
> the Makefile.am, though. Patching up the generated Makefiles just feels
> icky to me.

I don't think i've said that, but i might be wrong.
At the moment i prefer SED rather than a patch because there are many
instances around, i'll try reaching upstream to see how receptive they
are to a patch that just defines THRIFT ?= .. for a clean cross build.
It was a leftover from a quick hack to get it to build properly that
i've overlooked when cleaning up.
Fixed, i'll send a revised patchset soon.
Regards.
