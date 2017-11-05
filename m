From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Nov 2017 13:18:29 +0100
Subject: [Buildroot] [PATCH 1/2] dhcpcd: add SysV start-up script
In-Reply-To: <20171105081028.GA2996@scaer>
References: <20171031223659.6831-1-code@mmayer.net>
 <20171031223659.6831-2-code@mmayer.net> <20171102230602.3c61e8d2@windsurf>
 <20171102221847.GA23314@scaer> <20171102232345.5a434af8@windsurf>
 <3f7fff7b-be5a-42ff-985f-0e860c98acb3@mind.be> <20171105081028.GA2996@scaer>
Message-ID: <28382f3f-71d0-27d3-f78f-66fe47c9186b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-11-17 09:10, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2017-11-04 20:56 +0100, Arnout Vandecappelle spake thusly:
>> On 02-11-17 23:23, Thomas Petazzoni wrote:
>>> Hello,
>>>
>>> On Thu, 2 Nov 2017 23:18:47 +0100, Yann E. MORIN wrote:
>>>
>>>>>  - Same for the configuration file: I prefer a loud error than an init
>>>>>    script that ignores the problem.  
>>>>
>>>> Agreed, too.
>>>>
>>>> However:
>>>>
>>>>   - if the config file is mandatory, then this should be a failure.
>>>>
>>>>   - if the config file is optional, then it missing should be silently
>>>>     ignored and the service started nonetheless.
>>>
>>> So you want explicitly handling for the "missing configuration file"
>>> situation in the init script?
>>>
>>> I wanted to avoid explicit handling, and just let the daemon whine (or
>>> not) if its config file is missing.
>>
>>  I vaguely remember a recently added package where the daemon would silently
>> fail to start if the config file is missing, and which doesn't even have a
>> default config file. So I think checking for existence of the config file in the
>> init script (if the config file is mandatory) makes sense.
> 
> Then it is the responsibility of the package.mk to install one if it is
> mandatory. Otherwise,that means the packaging is incomplete because it
> does not allow the package to work as expected.

 So you mean all packages should do like inadyn: install an example
configuration file even if that is guaranteed not to work.

 Regards,
 Arnout

> 
> And in that case, I side with Thomas' initial suggestion: we should not
> check from the init scripts, because we expect the .mk files to be
> correct.
> 
> Regards,
> Yann E. MORIN.
> 
>>
>>  Regards,
>>  Arnout
>>
>> -- 
>> Arnout Vandecappelle                          arnout at mind be
>> Senior Embedded Software Architect            +32-16-286500
>> Essensium/Mind                                http://www.mind.be
>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
