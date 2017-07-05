From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Jul 2017 10:09:04 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: don't rely on linux-tools
 being sorted alphabetically
In-Reply-To: <20170705072538.GE3499@scaer>
References: <20170704235445.35255-1-code@mmayer.net>
 <20170704235445.35255-2-code@mmayer.net> <20170705072538.GE3499@scaer>
Message-ID: <fc53112d-c7a3-64c9-74ad-277741161711@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-07-17 09:25, Yann E. MORIN wrote:
> Markus, all,
> 
> On 2017-07-04 16:54 -0700, Markus Mayer spake thusly:
>> From: Markus Mayer <mmayer@broadcom.com>
>>
>> The Linux tools master makefile (linux-tools.mk) must be included after
>> all Linux tools sub-makefiles (linux-tool-*.mk). This is currently
>> ensured by sorting all package makefiles alphabetically.
>>
>> In preparation for adding linux-tool-tmon, we cannot keep relying on
>> this mechanism. In the C locale, linux-tool-tmon.mk will be sorted
>> behind linux-tools.mk, which would break the build.
> That is not the case for me:

 Indeed, but it's just the commit message that is wrong. The sort is not done by
the sort program, but by make, and make doesn't get the LC_ALL=C passed to it.
So we indeed need to find a robust solution.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
