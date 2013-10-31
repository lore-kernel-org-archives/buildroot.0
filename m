From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 Oct 2013 18:57:47 +0100
Subject: [Buildroot] [PATCH] arch/mips: Set BR2_GCC_TARGET_ARCH for MIPS
In-Reply-To: <CAAXf6LVY7YE0ZmtT7EFouvnvRpja4sqdWV+ceYU_e9-iHVQyqw@mail.gmail.com>
References: <1382970069-16449-1-git-send-email-markos.chandras@imgtec.com>
 <20131030184534.7bf2477b@skate>
 <CAAXf6LVCOqiCdQfy+S_YRiA2c1fzGpip36=hM4c6M+cV=S47og@mail.gmail.com>
 <20131031102253.1aeaea28@skate>
 <CAAXf6LVZW++12ECLBa0MoHUdjFKXdYy0ueoSk4a6WpvxYuAyJA@mail.gmail.com>
 <52722E32.7050307@mind.be> <20131031114727.681766bb@skate>
 <CAAXf6LVY7YE0ZmtT7EFouvnvRpja4sqdWV+ceYU_e9-iHVQyqw@mail.gmail.com>
Message-ID: <52729A1B.7040102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31/10/13 13:45, Thomas De Schampheleire wrote:
> On Thu, Oct 31, 2013 at 11:47 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Arnout Vandecappelle,
>>
>> On Thu, 31 Oct 2013 11:17:22 +0100, Arnout Vandecappelle wrote:
>>
>>>>> Could be a possibility indeed, but it means that I continue to see
>>>>> these patches in patchwork. Admittedly with a different state, but it's
>>>>> not as nice as not having them anymore.
>>>
>>>    I would set it as Superseded, instead of Accepted. The assumption is
>>> that you'll repost the series on the list, not send an empty pull
>>> request, right? Then Superseded is actually the correct state, or
>>> eventually it will be.
>>
>> No, I was not necessarily thinking of resending each patch to the list:
>> all those patches have been on the list, and I've made little to no
>> changes to them. I have also been careful to post my own patches on the
>> list, and only afterwards apply them, so that all patches have been
>> made visible to the list.
>>
>> Of course, if the general opinion is that I should resend all of the
>> patches to the list, then I'm fine with doing that once Peter is back
>> from vacations.
>>
>
> I think we need a single strategy to be used by all maintainer-proxies.

  Of course! And we agreed on it during the developer meeting, but Thomas 
has forgotten it. I'll try to get the report on the Wiki as quickly as 
possible so we can refer to it :-)

  The agreement was that we would resend the patch queue to the list, 
because:

- It's easy for Peter to apply them that way.

- No need to 'git pull --rebase', so if an individual patch doesn't apply 
anymore it can be skipped and it will still show up in patchwork.

- The final version of the patch will always be in patchwork and the 
mailing list, even if you make cosmetic changes.

- You don't need some public git repository to pull from.

- We're already at 2000 mails per month, so 300 more won't hurt :-).

  Well, I didn't write all these reasons in the report, just the 
conclusion, but I remember all of these were mentioned.


> The problem with not resending the patches is that the
> maintainer-proxy (or whatever you want to call it) needs to have a git
> tree accessible by Peter. Although not impossible, I'm not really fond
> of it.
>
> Also, consider this scenario: a developer submits a patch on day 1, a
> maintainer-proxy adds the patch to his branch on day 2. However,
> another contributer gives some remarks on the patch and expects it to
> be reworked. The maintainer-proxy could forget about this when v2 of
> that patch is sent. In this case, v2 is pending in patchwork, and v1
> is on a branch for which a pull request is sent. The actual contents
> of the branch is not visible on the list. This opens a window for
> errors. By sending the patches to the list, there is a bit more
> visibility. The downside is that the list gets additional mails.

  Actually, there's no window for error here: v2 is in patchwork so it 
won't be forgotten. However, you'll get a conflict when you try to apply 
it, since something similar has already been applied.


>
> An additional question is: is there a policy on who takes which
> patches, if certain actions need to be taken on these patches, etc.?
> At this moment, I still don't really see the difference between
> providing an Acked-by: and adding a patch to a for-peter branch,
> except for the fact that incoming patches are prearranged in batches
> for Peter.

  Exactly, that's the idea.

  We actually have two parallel concepts:

- for-peter branches (that are posted to the list)

- in the patchwork website, an overview of how many acks a patch has. 
This has more or less the same effect as for-peter branches, but it 
requires changing patchwork itself so can't be done right away.


  Regards,
  Arnout

>
> Thanks,
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
