From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Wed, 19 Feb 2020 11:33:13 +0100
Subject: [Buildroot] CVE tracking for selected packages
In-Reply-To: <3c9541b9-722a-85a5-fe1a-4a374086fcbc@railnova.eu>
References: <CAAXf6LURHBGiU6zTD-KQ85R+MjUxn9vJQc04-ViEXuS1r6HvCQ@mail.gmail.com>
 <3c9541b9-722a-85a5-fe1a-4a374086fcbc@railnova.eu>
Message-ID: <2d3190ec-715f-8770-7b5d-854441f16f25@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello myself, Thomas and all,

On 2/19/20 11:25 AM, Titouan Christophe wrote:
> Hello Thomas and all,
> 
> On 2/19/20 10:21 AM, Thomas De Schampheleire wrote:
>> Hi all,
>>
>> With the recent addition of CVE checks in the pkg-stats script, we
>> have made a great step forward, and anyone can check the list at:
>> http://autobuild.buildroot.org/stats/ to see which packages have which 
>> CVEs.
>>
>> What would be another great improvement, is the possibility to check
>> for a given defconfig in a particular Buildroot tree (i.e. not
>> necessarily the master) which CVEs are not yet solved.
> 
> I'm glad that you come up with this proposal. I also wanted something 
> similar for our builds.
> 
>>
>> Basically something like:
>>
>> ???? make cve-info
>>
>> which would list only those CVEs applicable for the packages selected,
>> so that a user knows directly if action is required or not for their
>> particular case.
>>
>> Alternatively, we could add the info to 'make show-info', but since
>> obtaining the info will also require a download of the CVE databases,
>> I assume this is not desired.
>>
>> For the implementation, I assume we should either create a make target
>> to call pkg-stats with the list of packages required, and perhaps
>> restricting to CVE checking only (instead of also version checking),
>> or extract the CVE logic to another file that can be reused by both
>> pkg-stats as the new thing.
> 
> Extracting this logic into a dedicated script would make sense, as 
> finding the CVEs only requires a list of pairs [(package, version)], and 
> could be run entirely outside of a Buildroot tree.

EDIT: second time I forget about the <pkg>_IGNORE_CVES !

=> Yet the matching could be done with a list of triples
[(package, version, [ignored CVEs])]. The list of ignored CVEs only 
changes when bumping the Buildroot version, so all the rest of my 
message remains valid :)

> 
> In my CI/CD pipelines, I already run `make legal-info` as the last step, 
> and I imagine reusing the CSV output of legal-info (or any other script 
> that generates a "manifest" of the included packages) could be done on a 
> daily basis, like in a nightly build.
> 
>>
>> Feedback welcome!
>>
>> Thomas
>>
> 
> Best regards,
> 
> Titouan
> 
> PS: By the way, I have some code nearly ready to switch to the v1.1 of 
> the NVD feeds. Patch soming soon.
