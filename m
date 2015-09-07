From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Sep 2015 23:14:38 +0200
Subject: [Buildroot] [PATCH] Makefile: Remove KBUILD_VERBOSE and quiet
In-Reply-To: <1441658846-5786-1-git-send-email-cedric.marie@openmailbox.org>
References: <1441658846-5786-1-git-send-email-cedric.marie@openmailbox.org>
Message-ID: <55EDFE3E.8030205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07-09-15 22:47, C?dric Marie wrote:
> KBUILD_VERBOSE and quiet variables are set and exported, but they are
> not used. We can safely remove them.
> 
> These variables are inherited from the Makefile of the Linux kernel,
> and are not used in Buildroot.
> 
> In support/scripts/mkmakefile, quiet value is checked, but the test is
> always true (quiet is never set to silent_), so the test can be removed
> as well.
> 
> Signed-off-by: C?dric Marie <cedric.marie@openmailbox.org>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 [A few build tests with and without V= ]

 Don't forget to version your patches and keep a patch changelog...

 I would already have introduced the VERBOSE construct in this patch, but I
guess this one is less controversial, so OK.


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
