From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 22 Jan 2019 12:23:14 +0100
Subject: [Buildroot] [PATCH v4 1/2] libopenssl: bump version to 1.1.1a
In-Reply-To: <20190117194339.5cb2eb0f@gmx.net>
References: <20190115224239.26125-1-ps.report@gmx.net>
 <20190116135821.pbjzcpixjbuacu3o@vkochan-ThinkPad-T470p>
 <20190117194339.5cb2eb0f@gmx.net>
Message-ID: <ad65c62d-eef9-2113-cfb6-6b5941958285@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/01/2019 19:43, Peter Seiderer wrote:
> Hello Vadim,
> 
> On Wed, 16 Jan 2019 15:58:21 +0200, Vadim Kochan <vadim4j@gmail.com> wrote:
> 
> [...]
>>>
>>>  - Compile checked packages (depending explicit on libopenssl or host-libopenssl):
>>>    O.k:
>>>      - hostapd
>>>      - libpjsip
>>>      - mosquitto
>>>      - wpa_supplicant
>>>
>>>     Failure:
>>>      - softether/host-softether
>>>
>>>  - Compile checked packages (depending on openssl or host-openssl):
>>>     O.k.:
>>>       - alljoyn-base
>>>       - apr
>>>       - apr-util
>>>       - freeswitch
>>>       - openssh
>>>
>>>     Failure:
>>>       - android-tools
>>>       - apache (CMake configure errro, unrelated?)
>>>
>>> [2] http://lists.busybox.net/pipermail/buildroot/2017-August/200859.html
>>> [3] http://lists.busybox.net/pipermail/buildroot/2017-August/200898.html
>>> ---  
>>
>> Just some worries, I was trying to port openssl 1.1.x for one of the
>> project and there were some issues with API compatibility for example
>> for openssh (and mey be some other like curl, wget), it was an year ago
> 
> Openssh and wget are fixed (by update) already, did not yet test curl...but
> I think the situation improves as some major linux distributions did already
> the openssl update (or work on the update)...
> 
>> and may be mostly the packages switched to openssl 1.1.x API but
>> it is not better to make openssl 1.1.x as one of the openssl provider
>> to do not break other packages ?
> 
> Maybe the way to go in case to much packages will fail with openssl 1.1.x...
> 
> Identified ~200 buidlroot packages to (optional) depend on openssl...

 At some point, we'll just have to let an autobuilder detect the issues. Some
issues anyway only become apparent at link time, so when building a dependency
of a dependency...

 We have an autobuilder running on an openssl-bump branch and Patrick is fixing
the issues that come out. But at some point we'll need to just bite the bullet
and accept the whole thing.

 I do hope that it could still go into 2019.02.

 Regards,
 Arnout
