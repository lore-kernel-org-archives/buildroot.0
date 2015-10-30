From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Oct 2015 17:14:20 +0100
Subject: [Buildroot] Buildroot LTS?
In-Reply-To: <20151030145803.6aeb3c2d@free-electrons.com>
References: <563336DE.4040809@2net.co.uk>
 <20151030145803.6aeb3c2d@free-electrons.com>
Message-ID: <5633975C.7040800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-10-15 14:58, Thomas Petazzoni wrote:
> Hello Chris,
> 
> On Fri, 30 Oct 2015 09:22:38 +0000, Chris Simmonds wrote:
> 
>> Is there a long term support policy for Buildroot? For example, when the
>> next significant bug like heartbleed or shellshock comes along, how do I
>> best incorporate the fix in my Buildroot project?
[snip]
>> I would be interested in any comments on the above. What do Buildroot
>> users do in practice? Does any 3rd party offer LTS support for Buildroot?
> 
> There is currently no long term support policy for the community
> maintained Buildroot. We have discussed this topic a few times during
> our meetings, as I remember raising the question of whether we should
> maintain for a longer period certain specific releases of Buildroot, at
> least to take care of the security problems.
[snip]
> I would personally be happy to take patches against a given fixed
> version of Buildroot, and do regularly some point releases based on
> this version. But there need to be some involvement from the interested
> users.
> 
> As far as security updates provided by third party companies, I guess
> several embedded Linux services company would probably be willing to
> provide such services. But there is no formal/public offering as far as
> I know.

 We (Mind) would be happy to do that. The problem is that you need a certain
critical mass of paying customers before it becomes affordable. Also, it's not
only about security updates, but also a certain level of QA would be required.
Also, most packages don't have stable security branches but just apply security
updates to their single release branch, so the question is if we would do a
complete version bump or maintain patches like real distroes do.

 Another question is if we would take along Buildroot infrastructural changes or
not. These normally only have an impact on the build process, not the runtime,
so it should be OK to take them along in long term support. And it is often
useful because it adds development features, like the BR2_EXTERNAL support. But
of course, it's extra effort to include those as well.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
