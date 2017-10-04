From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 Oct 2017 18:41:45 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain: Add glibc support for ARCv2
In-Reply-To: <1506624636.3713.20.camel@synopsys.com>
References: <20170914221446.13647-1-abrodkin@synopsys.com>
 <20170914221446.13647-3-abrodkin@synopsys.com>
 <1506624636.3713.20.camel@synopsys.com>
Message-ID: <e199b1b7-2c6f-4711-938a-15616d6d85a1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-09-17 20:50, Alexey Brodkin wrote:
> Hi Thomas, Arnout,
> 
> On Fri, 2017-09-15 at 01:14 +0300, Alexey Brodkin wrote:
>> Finally there's working ARC port of glibc thanks to Vineet and Cuper!
>> This port is based on pretty recent glibc's master branch and ARC
>> changes are being reviewed now in glibc's mailing list.
>>
>> Thus we again have to use sources from our GitHub but as soon as there's
>> a glibc release with our patches applied we'll switch to unpstream releases
>> and will drop our glibc GitHub repo alltogether.
>>
>> Note now we cut tags in glibc repo simultaneously with tags
>> in Binutils and GCC repos and so to make sure everything works in the best
>> way we plan to update glibc tag together with Binutils and GCC.
>>
>> Also note as of today ARCompact (AKA ARCv1 ISA) is not supported in glibc
>> but we plan to fix it soonish so for now we make glibc intentionally
>> dependent on archs38.
>>
>> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
>> Cc: Cupertino Miranda <cmiranda@synopsys.com>
>> Cc: Vineet Gupta <vgupta@synopsys.com>
>> Cc: Anton Kolesov <akolesov@synopsys.com>
> 
> This patch was sitting in patchwork for 2 weeks now.
> If there're any complaints an suggestions why don't we merge it?

 Since I merged the bump to glibc 2.26, patch 1 is not correct anymore.

 Would it be useful to instead add patches to our glibc to add ARC support? Or
are the ARC patches too difficult to backport?


> I'd like to see how we ramp-up with glibc toolchain for ARC.
> That said once the patch is applied would be good to add
> a corresponding config for autobuilder.

 You can actually do that yourself by adding a config to
support/config-fragments/autobuild and updating toolchain-configs.csv
in that directory. Something like br-arc-full-internal.config but then with glibc.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
