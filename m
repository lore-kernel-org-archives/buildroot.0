From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 3 Jul 2017 21:49:12 +0200
Subject: [Buildroot] [RFC PATCH v5 02/11] package/patchelf: add patch
 for rpath sanitation under a root directory
In-Reply-To: <404844b9-a62b-c931-422b-31d08b474dcd@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-3-git-send-email-wg@grandegger.com>
 <e0092045-3a44-4b99-9220-5e8e05fef090@mind.be>
 <404844b9-a62b-c931-422b-31d08b474dcd@grandegger.com>
Message-ID: <CAHXCMMLy_b6Lcs68YVu6aaR-87ks9O7b3pAw3epBxr3m5Ga+uA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wolfgang,

On Mon, Jul 3, 2017 at 9:38 PM, Wolfgang Grandegger <wg@grandegger.com> wrote:
> Hello,
>
> browsing your comments...
>
> Am 01.07.2017 um 00:13 schrieb Arnout Vandecappelle:
>>
>>   Hi Wolfgang,
>>
>> On 30-06-17 10:36, Wolfgang Grandegger wrote:
>
> [... snip ...]
>>>
>>> +-            if (!libFound)
>>> ++            if (!libFoundInRPath(dirName, neededLibs))
>>> +                 debug("removing directory '%s' from RPATH\n",
>>> dirName.c_str());
>>
>>
>>   For consistency, we should probably honour --no-standard-lib-dirs here
>> as well.
>>
>
> For "--shrink-rpath" it's difficult to decide what is a non standard library
> directory. A path ending with "/lib" or "/usr/lib"?

Yes, exactly.
By standard paths, we mean location browsed by default by the linux
loader (see [1])

[1] http://www.manpages.info/linux/ld.so.8.html

Regards,

-- 
Samuel
