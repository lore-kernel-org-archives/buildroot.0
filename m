From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 11 Mar 2019 14:06:35 +0100
Subject: [Buildroot] [PATCH 0/2] ppsh compatible Qt5 configuration
In-Reply-To: <b764f396-cb7b-0686-57d2-125b716ef9dc@andin.de>
References: <20190309141022.13140-1-anaumann@ultratronik.de>
 <20190309152204.38e20094@windsurf>
 <4dfd5a58-e0dd-0da1-4bf4-985ca7ee3661@mind.be>
 <b764f396-cb7b-0686-57d2-125b716ef9dc@andin.de>
Message-ID: <6dad4b03-56a4-3323-ca35-dbaf471d8cbb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/03/2019 12:17, Andreas Naumann wrote:
> Hi Arnout,
> 
> Am 10.03.19 um 15:57 schrieb Arnout Vandecappelle:
>>
>>
>>
>> ? And maybe also take the opportunity to add qmake infra. That would make changes
>> like this patch a lot easier.
>>
> 
> I'm not quite sure what this means. An extra qmake-package?

 We now have infra for several build systems: autotools, cmake, ...

 We don't have anything for qmake. Instead, qmake packages use the
generic-package instrastructure, with custom commands to call qmake and make.

 My proposal would be to add qmake-package as an infra, similar to e.g.
cmake-package.

 The qmake binary would still be provided by qt5base, and qt5base would
obviously not be a qmake-package.

 Regards,
 Arnout

> 
>> ? Regards,
>> ? Arnout
>>
>>
>>>
>>> I had prepared something like this:
>>> https://github.com/tpetazzoni/buildroot/commit/05e776abf531319a749f5a7d65f265979ea6c4ab,
>>>
>>> but I don't remember if it was working completely or not.
>>>
>>> Thanks,
>>>
>>> Thomas
>>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
