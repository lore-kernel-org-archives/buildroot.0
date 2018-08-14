From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Aug 2018 01:33:50 +0200
Subject: [Buildroot] pkg-golang: host package not supported
In-Reply-To: <CADHdJwB8QhetJLhJBFh7B=wYgPyrEhJmY6uWci15kMdCdXvicw@mail.gmail.com>
References: <CADHdJwDuaeDU_G0ePRPRrWw+3Vo4W0mSx45OuEDnqrgnsKgZQA@mail.gmail.com>
 <20180810140056.5cf7d9ed@windsurf>
 <CABa6e=q8EfZv0C+E6B_AxwNDw65+u6-VfWDh0ck6eBHv+_nTug@mail.gmail.com>
 <CADHdJwA2GpxG9mCJ9xV0_VxS9bPUax3Uvq-bJ07TTXy5XikuxQ@mail.gmail.com>
 <24764a81-1a68-9432-fbdc-d43aa26ed218@mind.be>
 <CADHdJwB+9juxwRXttOfeizfrFyvvF_gQYuWjpyM3EqN8SsK4wg@mail.gmail.com>
 <214a9eac-afe5-2b4f-72a2-b212968f5992@mind.be>
 <CADHdJwB8QhetJLhJBFh7B=wYgPyrEhJmY6uWci15kMdCdXvicw@mail.gmail.com>
Message-ID: <78f6d5db-dc9b-01b6-3622-c233efd76689@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-08-18 01:22, Mirza Krak wrote:
> On Wed, 15 Aug 2018, 01:13 Arnout Vandecappelle, <arnout@mind.be> wrote:
[snip]
>>  Actually, looking at it now, the real problem is that _SRC_DOMAIN
>> definitions
>> have a single dollar only. Try this:
>>
>> -$(2)_SRC_DOMAIN = $$(call domain,$($(2)_SITE))
>> -$(2)_SRC_VENDOR = $$(word 1,$$(subst /, ,$$(call notdomain,$($(2)_SITE))))
>> -$(2)_SRC_SOFTWARE = $$(word 2,$$(subst /, ,$$(call
>> notdomain,$($(2)_SITE))))
>> +$(2)_SRC_DOMAIN = $$(call domain,$$($(2)_SITE))
>> +$(2)_SRC_VENDOR = $$(word 1,$$(subst /, ,$$(call
>> notdomain,$$($(2)_SITE))))
>> +$(2)_SRC_SOFTWARE = $$(word 2,$$(subst /, ,$$(call
>> notdomain,$$($(2)_SITE))))
>>
> 
> Yeah, Thomas suggested this as well and that got rid of the problems I was
> having. Is this the correct fix?

 Yes.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
