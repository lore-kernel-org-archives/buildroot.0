From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 3 Jul 2015 22:24:12 +0200
Subject: [Buildroot] [PATCH v7 1/1] Added linux drivers backports project
In-Reply-To: <1435791533-25991-1-git-send-email-petr.vorel@gmail.com>
References: <1435791533-25991-1-git-send-email-petr.vorel@gmail.com>
Message-ID: <5596EF6C.1020905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/15 00:58, Petr Vorel wrote:
> https://backports.wiki.kernel.org
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> TODO: still don't know how to handle dependency on linux .config.

 It took me some time, but I finally understand what the issue is here...

 It's a bug in the kconfig infra. The rule for generating the .config is kind of
spliced into the the usual configure step of a package. It already has a
dependency on the patch step, but it's still missing a dependency on the
dependencies.

 I'll cook an untested patch, could you take that up in your series? It will
allow you to get rid of the _PATCH_DEPENDENCIES.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
