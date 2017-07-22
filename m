From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 22 Jul 2017 14:27:01 +0200
Subject: [Buildroot] [PATCH 02/20] core/pkg-generic: add variable to
 skip skeleton dependency
In-Reply-To: <85a6c3a598a517fd0fad2cba0b7c42d746c7830e.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <85a6c3a598a517fd0fad2cba0b7c42d746c7830e.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <e507f13d-b54b-9205-d3e6-853b072744d5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-07-17 19:25, Yann E. MORIN wrote:
> We currently skip the skeleton dependency by checking if the current
> package is the skeleton.
> 
> We are going to introduce more skeleton-related packages, so we
> need a way to exclude the skeleton dependency for those, or we'd
> get a circular dependency, for the same reason we need to skip
> the toolchain dependency.
> 
> Instead of checking for all the skeleton-providing packages in the core
> infra, add a new package options so that packages can express they do
> not need the dependency on the skeleton, like we have an option to avoid
> the depednency on the toolchain. The only packages that will use that
> option are probably the skeletons, so we need not document this
> variable, like we did not document the option to exclude the dependency
> on the toolchain.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Reviewed-by: Romain Naour <romain.naour@gmail.com>

 I absolutely hate adding additional variables that are used for only a few
packages, but I have no better ideas, so

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

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
