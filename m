From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Aug 2013 13:01:19 +0200
Subject: [Buildroot] [PATCH 3 of 6 v2] linux: add support for custom
 Mercurial repository
In-Reply-To: <CAAXf6LW+v5FtM5J3PbsdM3OvRP-0vrpB03+t=CfGnoVAfQ2ePw@mail.gmail.com>
References: <patchbomb.1374650577@BEANTN0L019720>
 <702ce86cc56aec78ac12.1374650580@BEANTN0L019720> <52087CBD.10501@mind.be>
 <CAAXf6LW+v5FtM5J3PbsdM3OvRP-0vrpB03+t=CfGnoVAfQ2ePw@mail.gmail.com>
Message-ID: <5208C07F.9070107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/08/13 12:54, Thomas De Schampheleire wrote:
> Hi Arnout,
>
> On Mon, Aug 12, 2013 at 8:12 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
[snip]
>>   Given that string options can't be propagated from their legacy values,
>> and since the name of an option isn't really that important, I'd keep
>> the _GIT_ names for the mercurial options as well.
>>
>>   If we do rename the option symbol names, then I would make sure that it
>> is propagated:
>>
>>          default BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL if BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL != ""
>>
>> + add a comment to the .legacy file so these hacks can be removed
>> eventually.
>>
>>   Also, you have to change the symbol names in the defconfigs as well
>> (there are already 10 uses of this symbol).
>
> Thanks for your feedback on this series.
>
> Regarding the choice of keeping the _GIT_ option names as-is, or
> changing them with the appropriate legacy handling, I'd like to hear
> the opinion of others.
>
> I understand that the _GIT_ names make the legacy handling easier, but
> I also feel it's awkward to have _GIT_ in your config file when you're
> really using Mercurial. It seems like a hack to me. So my preference
> would be to stick to the renaming as proposed in this patch series,
> but with the additional default in linux/Config.in (and likewise for
> uboot) as you suggested, deprecating this default later. In this case
> I'll also change the defconfigs, as you correctly noted (thanks).

  Sounds OK to me.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
