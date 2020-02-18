From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 18 Feb 2020 15:55:09 +0100
Subject: [Buildroot] [PATCH 2/4] package/volume_key: add new package
In-Reply-To: <20200218154612.4fc237a6@windsurf>
References: <20200217143030.5031-1-giulio.benetti@benettiengineering.com>
 <20200217143030.5031-3-giulio.benetti@benettiengineering.com>
 <20200217195114.7336e67e@windsurf>
 <20bd5175-2e2c-a2b8-0ff0-350d58e01a9b@benettiengineering.com>
 <20200218154612.4fc237a6@windsurf>
Message-ID: <bc68202d-bbfa-9bba-5bb6-382c4925b680@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2/18/20 3:46 PM, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 18 Feb 2020 14:46:17 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>>>> diff --git a/package/volume_key/0001-configure.ac-remove-po-Makefile.in-entry-from-AC_CON.patch b/package/volume_key/0001-configure.ac-remove-po-Makefile.in-entry-from-AC_CON.patch
>>>> new file mode 100644
>>>> index 0000000000..44d6ee0d4b
>>>> --- /dev/null
>>>> +++ b/package/volume_key/0001-configure.ac-remove-po-Makefile.in-entry-from-AC_CON.patch
>>>> @@ -0,0 +1,28 @@
>>>> +From d1142e667f4f2f2fcd2d36a006919325c1a4377e Mon Sep 17 00:00:00 2001
>>>> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>>> +Date: Sat, 25 Jan 2020 17:24:38 +0100
>>>> +Subject: [PATCH] configure.ac: remove po/Makefile.in entry from
>>>> + AC_CONFIG_FILES
>>>> +
>>>> +AC_CONFIG_FILES should not contain po/Makefile.in file because
>>>> +gettextize will re-add it again causing build failure.
>>>> +
>>>> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>>
>>> Was this reported upstream?
>>
>> Not this patch, because the issue happens only when gettextizing, and if
>> instead you build without getextizing it fails. So I don't think
>> upstream will be interested about it, what do you think?
>> This was a doubt I had while dealing with this.
> 
> Well, it is a problem if one can't autoreconf/gettextize the upstream
> project as-is, no?

Yes, so let's keep it locally.

>>> I see:
>>>
>>> PKG_CHECK_MODULES(blkid, [blkid])
>>>
>>> don't we need the blkid library from util-linux ? I see it is selected
>>> by cryptsetup, which is why it works.
>>
>> Yes, but if cryptsetup already selects it, do I need to repeat it in
>> volume-key dependencies?
> 
> I think since the configure.ac explicitly checks it, it makes sense to
> not rely on the fact that a dependency by chance also uses it.

Ok then, it is the first time I add a package with so many dependencies.

Thank you
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
