From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 5 Nov 2016 00:47:04 +0100
Subject: [Buildroot] [PATCH 6/8] python-libxml2: new host package
In-Reply-To: <b36b76d3-1267-b583-1ec5-8884a68f8eac@zacarias.com.ar>
References: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
 <1476321239-13894-6-git-send-email-gustavo@zacarias.com.ar>
 <20161028153255.5c0e15d3@free-electrons.com>
 <b36b76d3-1267-b583-1ec5-8884a68f8eac@zacarias.com.ar>
Message-ID: <cc97f194-ec81-9b44-fe2f-a1467873a279@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-10-16 15:42, Gustavo Zacarias wrote:
> On 28/10/16 10:32, Thomas Petazzoni wrote:
> 
>> We discussed this patch during the Developers meeting, and I believe
>> the general consensus is that we'd instead prefer to introduce hidden
>> Config.in knobs for host packages.
>>
>> This is not only useful for this situation, but also for other
>> situations.
> 
> Hi. Let's see.
> 
>> For this one, I see two possibilities:
>>
>>  * The python/python3 packages gain some hidden host Config.in options
>>    BR2_PACKAGE_HOST_PYTHON(3). The host-libxml2 package then looks at
>>    BR2_PACKAGE_HOST_PYTHON(3) and if enabled, then the python support
>>    in host-libxml2 is enabled.
>>
>>    Drawback of this approach is that if we want to do it right, every
>>    package that uses host-python(3) should start selecting this new
>>    option.
> 
> For me this is the cleanest option, even though it will take a bit more time to
> get it right.

 It can be done gradually however. Add the symbol, select it from some packages
that are easy. The main difficulty is where a host package depends on
host-python - so a Config.in.host symbol has to be introduced there as well...


>>  * The libxml2 package gains a sub-option
>>    BR2_PACKAGE_HOST_LIBXML2_PYTHON, which allows to enable python
>>    support. Of course, later we could add BR2_PACKAGE_HOST_LIBXML2 as
>>    well, and fix the packages that depend on host-libxml2, but it can
>>    be done later.
> 
> We currently have no BR2_PACKAGE_HOST_LIBXML2 option so we should add that and
> make host-libxml2 depend on host-python when the python option is enabled, and
> make packages select host-libxml2 as well (+ python for host-itstool).
> It's basically a half-way to achieving the first point, even though quick i'm
> not a big fan.

 I'm also no big fan. Especially because the first one is where we want to go
eventually, so this would really just be a stop-gap measure.

 Regards,
 Arnout

> I'm in no rush to include evince so waiting for 1 is fine with me, which
> probably won't happen until the next cycle.
> Regards.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
