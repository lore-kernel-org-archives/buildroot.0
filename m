From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 24 Feb 2016 21:46:24 +0100
Subject: [Buildroot] [PATCH v3] package/mono: Fixing wrong
	MonoPosixHelper location
In-Reply-To: <56CE13E3.8050603@mind.be>
References: <1456264228-19851-1-git-send-email-angelo.compagnucci@gmail.com>
 <56CCDAD8.5070904@mind.be>
 <CA+TH9VnvmxhZtx9aM0C0CCXo4duH-Y9kQ6yM5Tpia1YWpY8D4g@mail.gmail.com>
 <56CE13E3.8050603@mind.be>
Message-ID: <CA+TH9VkDB+PuPwp3RDOcC8Th=vRF+hYUBLZkdycnJ5hVEBnzqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

2016-02-24 21:34 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
> On 02/23/16 23:29, Angelo Compagnucci wrote:
>> Dear Arnout Vandecappelle,
>>
>> 2016-02-23 23:19 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
>>> On 02/23/16 22:50, Angelo Compagnucci wrote:
>>>> * This patch solves installation problems with monoposixhelper
>>>
>>>  This description should be better, e.g. taking part of the bug description.
>>>
>>> libMonoPosixHelper.so will be searched in the HOST_DIR/usr/lib/ path. This path
>>> and file may exist on my building machine, but not on the target.
>>>
>>> Fixes bug #8651.
>>
>> Have I to resend?
>
>  Depends on the outcome of the discussion below.
>
> [snip]
>>>
>>>  So 6b5f6dd0434b66062110cf764688975ecfed646f doesn't fix it? That would mean
>>> that mono_assembly_getrootdir() is wrong, which is bound to lead to other
>>> problems...
>>
>> That commit is not included in mono-4.2.2.30, could you explain better?
>
>  That commit is from the 4.3 branch (I think, I haven't made a full clone, just
> browsed on github).
>
>> Do you think I have to backport that patch from master? Honestly, if
>> the released a buggy version, we should wait a correct one. I'm
>> reactive about upgrading mono version in buildroot!
>
>  That commit is dated July 23, 2015, so we can wait a long time still :-)
>
>  But I asked the question because your original patch v1 was made on top of the
> 4.3 (or rather, master) branch. So there are two possibilities: either it's
> still broken on master, or you never actually tested the master branch before
> you submitted the patch upstream.
>
>  - If it is not broken on master, then it's better to backport commit
> 6b5f6dd0434b66062110cf764688975ecfed646f from master.
>
>  - If it is still broken on master, then your patch is good for buildroot, but I
> fear there will be other issues lurking in the shadows because it means the
> mono_assembly_getrootdir() function doesn't work correctly in buildroot.

The matter it's really simple. I submitted a wrong patch. You can find
the original (and working patch) attached on
https://bugs.busybox.net/show_bug.cgi?id=8651 . When I prepared the
patch for sending in ML I did the mistake of rebasing on master,
instead of checking out the version 4.2.2.30.

I can assure the patch I submitted solves the problem. In mono
upstream, developers did a refactor of that part and the patch I
previously sent (for master) is simply wrong, cause the refactor
already solves the problem. Indeed I closed the issue on mono github.

As you said previously, mono has a really slow release process, with
many months of delay, so I think we should stick with this latter
patch I sent.

When the new release 4.3.X will be out, I will promptly bump to that
version and remove the unneeded patch.

Sincerely, Angelo

>
>  Regards,
>  Arnout
>
> [snip]
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
