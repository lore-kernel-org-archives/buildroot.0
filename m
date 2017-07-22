From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 22 Jul 2017 15:00:20 +0200
Subject: [Buildroot] [PATCH 05/20] system: provide package-wide system
 variables and macros
In-Reply-To: <fefad53b6c276a29697d5fa2f4b99907355fbc9b.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <fefad53b6c276a29697d5fa2f4b99907355fbc9b.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <12cf7122-8e93-25eb-52d9-140f967edd33@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-07-17 19:25, Yann E. MORIN wrote:
> Some macros, soon some variables, currently defined in the skeleton are
> going to be used by other packages.
> 
> Some of those variables will be used as Makefile conditions (e.g. in
> ifeq() conditiopns), so they *must* be defined before being used.
> 
> Since the skeleton package, starting with an 's', is included quite
> late, those variables would not be available to most packages.
> 
> Offload the existing macros into the new system/system/mk file, that is
                                                        ^.
> included early, before any package is. Rename the macros to appropriate
> names.
> 
> Future commits will add new macros and variables in that file.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
