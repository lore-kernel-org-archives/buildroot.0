From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 20 Oct 2014 10:43:16 -0300
Subject: [Buildroot] [PATCH 1/2] system/skeleton: make nsswitch install
 conditional
In-Reply-To: <20141020153719.034df3be@free-electrons.com>
References: <1413808086-12177-1-git-send-email-gustavo@zacarias.com.ar>	<20141020150209.5f8b45a5@free-electrons.com>	<54450BF5.4000202@zacarias.com.ar>	<20141020152759.4f438890@free-electrons.com>	<54450F51.5050801@zacarias.com.ar>
 <20141020153719.034df3be@free-electrons.com>
Message-ID: <54451174.5060309@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/20/2014 10:37 AM, Thomas Petazzoni wrote:

>> gustavoz at asgard ~/git/buildroot/package $ find . -name \*.mk -exec grep
>> --with-filename TARGET_FINALIZE {} \;
>> ./perl/perl.mk:TARGET_FINALIZE_HOOKS += PERL_FINALIZE_TARGET
> 
> Only removes stuff.

But it will alter your package size measurments outside of package
scope, you need to account for those.

> The skeleton can be made a package of its own.
> 
> See, I'm not too far away :-)

Yes, it's called baselayout in gentoo, base-files in some other distros
and so on, you probably already know them.
But nobody made it yet.
Regards.
