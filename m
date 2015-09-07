From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Mon, 07 Sep 2015 16:52:29 +0200
Subject: [Buildroot] [PATCH] Handle verbosity in infrastructures
In-Reply-To: <55ED9DF4.8030803@mind.be>
References: <1441487237-10040-1-git-send-email-cedric.marie@openmailbox.org>
 <55ECB52C.3070806@mind.be>
 <e7d3e11a111e0f1a4da139146991a588@openmailbox.org>
 <55ED7E62.6080806@mind.be>
 <fb34984c55052f386dd7e0b9534c6a39@openmailbox.org>
 <55ED9DF4.8030803@mind.be>
Message-ID: <b701abff08bfc208af6f14fb7c0d63d9@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 2015-09-07 16:23, Arnout Vandecappelle a ?crit?:
>> export BR2_VERBOSE=
> 
>  Yeah, this I remember. It's the export that I have a problem with. 
> Nothing
> (currently) uses this variable so there is no need to export it. I also 
> don't
> see which scripts would ever use it, since most scripts already are 
> verbose by
> default.

You're right. I should study the use of export more carefully!... I 
thought exporting was necessary for the variable to be visible in 
pkg-cmake.mk and pkg-autotools.mk.
But there is no recursive make, we're in the same make process, so there 
is no need to export it.


>  Well, no, because it shouldn't be exported so it's purely internal to 
> the
> makefiles so VERBOSE is enough.

Yes, I should use VERBOSE.


>  Actually, the VERBOSE already existed and is in fact used in one case:
> package/qt/qt.mk

OK, so I'll check that the compilation of Qt is kept unchanged with my 
modification.
With my initial patch, it was broken! :(


>  Or maybe 4:
> 
> 1. Remove KBUILD_VERBOSE and quiet (this one will be uncontroversial I 
> think)
> 2. Define VERBOSE based on V= passed on command line
> 3. Use VERBOSE in autotools and cmake
> 4. Update documentation.

OK.

Regards,

-- 
C?dric
