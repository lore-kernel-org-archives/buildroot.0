From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 06 Mar 2014 18:26:23 +0100
Subject: [Buildroot] [PATCH 1/2] python-libconfig: new package
In-Reply-To: <E1CF8EFE2042404B87DE2B6D662128020ED591A9@KUUMEX10.barco.com>
References: <E1CF8EFE2042404B87DE2B6D662128020ED58B96@KUUMEX10.barco.com>
 <53175A9E.3090001@mind.be>
 <E1CF8EFE2042404B87DE2B6D662128020ED591A9@KUUMEX10.barco.com>
Message-ID: <5318AFBF.4000006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/03/14 10:05, Derycke, Johan wrote:
> Hi,
> 
>> -----Original Message-----
>> From: Arnout Vandecappelle [mailto:arnout at mind.be]
>> Sent: woensdag 5 maart 2014 18:11
>> To: Derycke, Johan; buildroot at busybox.net
>> Subject: Re: [Buildroot] [PATCH 1/2] python-libconfig: new package
>>
>> On 04/03/14 09:32, Derycke, Johan wrote:
>>> Python bindings to the C++ library libconfig
>>> https://github.com/cnangel/python-libconfig
>>>
>>> Signed-off-by: Johan Derycke <johan.derycke@barco.com>
>>> ---
>>>  package/python-libconfig/Config.in           |    9 +++++++++
>>>  package/python-libconfig/python-libconfig.mk |   21
>> +++++++++++++++++++++
>>>  2 files changed, 30 insertions(+)
>>>  create mode 100644 package/python-libconfig/Config.in
>>>  create mode 100644 package/python-libconfig/python-libconfig.mk
>>>
>>> diff --git a/package/python-libconfig/Config.in
>>> b/package/python-libconfig/Config.in
>>> new file mode 100644
>>> index 0000000..7e4f317
>>> --- /dev/null
>>> +++ b/package/python-libconfig/Config.in
>>> @@ -0,0 +1,9 @@
>>> +config BR2_PACKAGE_PYTHON_LIBCONFIG
>>> +       bool "python-libconfig"
>>> +       depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
>>> +  select BR2_PACKAGE_BOOST_PYTHON
>>
>>  You should also select BR2_PACKAGE_BOOST.
>>
>>  You should also depend on boost's toolchain dependencies:
>> BR2_INSTALL_LIBSTDCPP, BR2_LARGEFILE, BR2_TOOLCHAIN_HAS_THREADS,
>> and add the corresponding comment.
> 
> Can I use:
> 
> comment "python libconfig needs boost"
>         depends on !BR2_PACKAGE_BOOST
>         depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
> 
> to avoid the boost "bloatware" being installed behind the back?

 No, that's OK. The bloat is only in the source, not in the libary (I
haven't built it yet but I expect it will be in the order of 100K).

 I mainly made the remark to trigger you to consider if it is really
needed. But I think I get it now: boost.Python is an alternative for
something like swig or sip. I first thought it was using some of boost's
standard C++ library alternatives.


 Regards,
 Arnout

> 
>>
>>  It's a crying shame that the python wrapper for something trivial like libconfig
>> requires bloatware like boost :-) but that can't be helped of course.
>>
>>> +       select BR2_PACKAGE_LIBCONFIG
>>> +       help
>>> +           Python bindings to the C++ library libconfig
>>
>>  Perhaps add a bit of the help text of libconfig.
>>
>>  Regards,
>>  Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
