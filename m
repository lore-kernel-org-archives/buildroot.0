From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Mar 2018 21:47:34 +0100
Subject: [Buildroot] [NEXT 06/26] boa: add CPE id
In-Reply-To: <20180228073827.312a9a6f@windsurf.home>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1519697441-54194-7-git-send-email-matthew.weber@rockwellcollins.com>
 <20180227231718.090c22ef@windsurf.lan>
 <CANQCQpbM3VHid2rGTFAA=HwkhsUfmHRbGw9EDtT2dPUWwQRDog@mail.gmail.com>
 <20180228073827.312a9a6f@windsurf.home>
Message-ID: <3a17ac42-e24b-149d-30d3-654545e8c1eb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-02-18 07:38, Thomas Petazzoni wrote:
>>> The drawback is obviously that all packages will suddenly have a
>>> <pkg>_CPE_ID value, even if this value may potentially be incorrect
>>> because it hasn't been checked. And this may be a real problem, so
>>> probably your solution is better, I just wanted to point out the
>>> (admittedly limited) duplication.  
>> Yeah, eventually I'd argue we could revert back to infra logic and
>> clean it all up once there is a baseline or majority of packages with
>> valid CPE IDs.    However for now, I default those we don't have to
>> unknown so it's clear for a developer to go research or request a new
>> CPE.
> Yes, that is a possibility. As I said, I do realize that my proposal
> has the significant drawback of not allowing to identify clearly which
> package has a correct CPE_ID (voluntarily added by a developer) vs.
> some potentially random CPE_ID (set by default by the package
> infrastructure).

 Well, this in the end boils down to the question: what are you going to do with
that cpe-manifest.csv? I think that whatever script is going to use that file,
it will have to be robust against CPE_IDs that don't actually exist in the CPE
database. Indeed, when someone bumps a package, will they have to verify if the
new CPE ID is still valid? If it isn't, what should be done? Report to NIST, of
course, but while the database isn't updated, should we just remove the CPE_ID
or what?

 To help a bit with deciding on this, it could be nice if you could add an RFC
patch with a script that takes the cpe-manifest.csv and outputs something real -
i.e., a list of open and closed CVEs. The latter will also help to evaluate to
what extent this whole thing is useful. In other words, how accurate is that
generated list? It's a question we had ad the BR developer meeting and which
still remains unanswered IMO.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
