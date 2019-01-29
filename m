From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 29 Jan 2019 18:02:40 +0100
Subject: [Buildroot] [git commit] ffmpeg: fix static linking build
 failure when using libavutil
In-Reply-To: <0535ae91-47fa-5a31-5ff6-7977c5bbbe8b@mind.be>
References: <20190128233144.1433A8132A@busybox.osuosl.org>
 <2b98573b-12e5-5edb-e14c-bf867162f913@mind.be>
 <5d3cbc8e-e846-65ed-6ef9-6c5f3dcf4933@micronovasrl.com>
 <0535ae91-47fa-5a31-5ff6-7977c5bbbe8b@mind.be>
Message-ID: <c35143e8-0186-06ca-0256-f3a3ec46463c@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Il 29/01/2019 14:39, Arnout Vandecappelle ha scritto:
> 
> 
> On 29/01/2019 13:30, Giulio Benetti wrote:
>> Hi Arnout,
>>
>> Il 29/01/2019 10:03, Arnout Vandecappelle ha scritto:
>>>  ? Oopsie...
>>>
>>> On 29/01/2019 00:16, Arnout Vandecappelle (Essensium/Mind) wrote:
>>>> commit:
>>>> https://git.buildroot.net/buildroot/commit/?id=483db9908985d023b858c0b59d4016f9abb4b6f9
>>>>
>>>> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>>>>
>>>> If a package tries to static link with libavutil it fails due to the
>>>> lack of libavutil private dependencies in libavutil.pc (-ldrm in this
>>>> case).
>>>>
>>>> Add patch to:
>>>> - Check if libdrm is present.
>>>> - Add it to Libs.private: in libavutil.pc if present.
>>>
>>>  ? I didn't want to push this one, it was just a test. The patch no longer applies
>>> to ffmpeg 3.4.5 so this is causing autobuilder breakage. Therefore, I pushed a
>>> revert commit.
>>
>> I've forgot it there pending on patchwork after ffmpeg bump.
> 
>   I've marked it as Changes Requested now.
> 
>>
>>>  ? Giulio, FYI, upstream has added an explicit $LIBDRM but not to Libs.Private, so
>>> the static linking case still breaks for the same reason. The patch just needs
>>> to be rebased (and sent upstream).
>>
>> I've tried several times to discuss this on ffmpeg-devel:
>> [1] http://ffmpeg.org/pipermail/ffmpeg-devel/2018-October/235269.html
>> but they ignored my last patch:
>> [2] http://ffmpeg.org/pipermail/ffmpeg-devel/2018-October/235417.html
>> to fix the previous I've sent:
>> [3] http://ffmpeg.org/pipermail/ffmpeg-devel/2018-October/235269.html
>>
>> I can't understand why they don't want to upstream my last patch[2]...
> 
>   Same as everywhere: too many patches, too few reviewers. The reactions to v1
> seemed to be positive. So if v2 still applies to current ffmpeg master, just
> ping it; if it needs to be rebased, rebase it and resubmit.
> 
>   Regards,
>   Arnout
> 
>>
>> Anyway I'm going to submit the last one for Buildroot asap.
>> I'm going to reproduce it right now.

I've just pinged on ffmpeg-devel about patch[2], I've put you in Cc.

I have also created BR patch and tested against autobuild failure 
substituting 0002- patch.
Do I wait for an answer from ffmpeg-devel before submitting it on BR ML?

Thanks
Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
