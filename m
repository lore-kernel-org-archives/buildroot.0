From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Oct 2013 10:01:41 +0200
Subject: [Buildroot] [PATCH] Allow PHP to compile ans link with
 berkeleydb 6
In-Reply-To: <5253B234.60001@mind.be>
References: <1381146130-8575-1-git-send-email-jezz@sysmic.org>
 <20131007135727.3cb4150d@skate> <5252A7DF.5020008@zacarias.com.ar>
 <20131007142614.45304395@skate> <5252A958.6010001@zacarias.com.ar>
 <20131007145734.781254cd@skate> <5253B234.60001@mind.be>
Message-ID: <20131008100141.252ec3ae@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 08 Oct 2013 09:20:20 +0200, Arnout Vandecappelle wrote:

>   I didn't follow the conversation on IRC, but IMHO this proposal has 
> important political implications.  With this change, we are taking a 
> stand: non-copyleft software should be the default. So in my opinion,
> we should instead make the default berkeleydb v6 and add a
> berkeleydb5 package for PHP.

This solution is also fine with me. In the mean time, I still believe
reverting the patch that bumps to v6 is for the moment the best action
to take, until someone steps up to make the change to berkeleydb v6.

However, AGPLv3+ (the new license of berkeleydb) is a fairly strong
license, so I'm quite sure a number of embedded system markers would be
interested in having the ability to build Python, or Perl, against a
non-strongly-copyleft licensed version of berkeleydb.

> netatalk: GPLv2+ -> compatible (note that _LICENSE is missing)
> perl: Aristic is not compatible, but GPLv1+ is (note that _LICENSE is
> wrong)

But aren't all Perl modules licensed under the Artistic license? Not
sure if it can cause some problems with berkeleydb being AGPLv3+,
though.

> python: PSF license v2 is compatible
> ruby: Ruby license is probably incompatible, but BSD-2c is (note that 
> _LICENSE is wrong). Unfortunately, there are also a few incompatible 
> files in the ruby distribution.
> 
>   Footnote: except for python, none of the licenses above are
> actually correctly defined in buildroot. This worries me...

Well, licensing information is tricky to get right. I believe the kind
of review you made is typically what makes the licensing information
progressively better.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
