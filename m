From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 8 Nov 2011 14:20:57 +0100
Subject: [Buildroot] Report from the Buildroot Developer Day
In-Reply-To: <201111071339.28612.yann.morin.1998@anciens.enib.fr>
References: <20111102160349.4afe5935@skate>
 <20111107120936.GA26160@merkur.ravnborg.org>
 <20111107132548.33965b56@skate>
 <201111071339.28612.yann.morin.1998@anciens.enib.fr>
Message-ID: <CAAXf6LVoKWVEn018FWGqxbCTjx4CtdvMZrkp=baeMGmhHZyciA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Nov 7, 2011 at 1:39 PM, Yann E. MORIN
<yann.morin.1998@anciens.enib.fr> wrote:
> Thomas, Sam, All,
>
> On Monday 07 November 2011 132548 Thomas Petazzoni wrote:
>> Le Mon, 7 Nov 2011 13:09:36 +0100,
>> Sam Ravnborg <sam@ravnborg.org> a ?crit :
>>
>> > The tags seems to be used in different ways. The way I have understood
>> > their usage - and thus the way I have used them is like this:
>> >
>> > Acked-by is used when I think that a patch does the right thing.
>> > For example when it introduces a a new feature or change something -
>> > and which I consider it the right thing to do.
>> >
>> > Reviewed-by is stronger in the sense that I have actually taking my
>> > time to carefully read the patch line-by-line and that I consider
>> > that the patch is correct.
>> > I almost never use "Reviewed-by" for patches touching code areas
>> > that I am not familiar with - as I do not know if they are correct.
>> > Reviewed-by includes an implicit Acked-by as I would not spend time
>> > to review something if I did not agree on the patch.
>>
>> Interestingly, my understanding is more or less the opposite of yours.
>> For me:
>>
>> ?* Reviewed-by means that you have read the patch and agree with its
>> ? ?principle and general implementation, but not that you have actually
>> ? ?tested and verified that the patch works. The top-level maintainer
>> ? ?will have to do additional testing because you haven't done so.
>>
>> ?* Acked-by is much stronger, as it means that you fully agree with the
>> ? ?patch, that you reviewed it *and* tested it, and that the top-level
>> ? ?maintainer does not necessarily need to do additional testing if he
>> ? ?trusts you, because Acked-by means that you have actually tested
>> ? ?this.
>
> I would tend to agree with Sam here.
>
> - Acked-by is a way to say 'yep, looks good to me'
> - Reviewed-by means 'I did some careful analysis, and could not find any
> ?flaw, good for me'
> - Tested-by means 'I did try that stuff, it works for me'.
>
> Here are the corresponding snippets from Documenation/SubmittingPatches:
>
> ---8<---
> Acked-by: is not as formal as Signed-off-by:. It is a record that the acker
> has at least reviewed the patch and has indicated acceptance. ?Hence patch
> mergers will sometimes manually convert an acker's "yep, looks good to me"
> into an Acked-by:.
>
> Reviewed-by:, instead, indicates that the patch has been reviewed and found
> acceptable according to the Reviewer's Statement:
> (blabla)
> ? ? (a) I have carried out a technical review of this patch to
> ? ? ? ? evaluate its appropriateness and readiness for inclusion into
> ? ? ? ? the mainline kernel.
> ? ? (b) Any problems, concerns, or questions relating to the patch
> ? ? ? ? have been communicated back to the submitter. ?I am satisfied
> ? ? ? ? with the submitter's response to my comments.
>
> A Tested-by: tag indicates that the patch has been successfully tested (in
> some environment) by the person named. ?This tag informs maintainers that
> some testing has been performed, provides a means to locate testers for
> future patches, and ensures credit for the testers.
> ---8<---
>
> So, in my understanding, Reviewed-by is stronger than Acked-by, because
> Reviewed-by means that some technical review has been made (whereas
> Acked-by does not specify what type of review was made).

I don't really agree on the last point. Acked-by implies a review
according to the above snippets, and I don't really see the point of
having a review that is not technical. No-one will add the tag
'Reviewed-by' to a patch, if he only checked for typos (unless for
documentation patches).
So, based on this argument, I'd say that Acked-by is stronger than
Reviewed-by. I tend to understand that as well from the kernel docs,
since Acked-by is indicated to be used by subsystem maintainers.

>
> Also, it would be possible to add bith Reviewed-by and Tested-by on a single
> patch, whereas Acked-by and Reviewed-by would be equivalent to Reviewed-by
> as it is stronger.
>
> For a project like buildroot, we could agree that Acked-by is equivalent
> to Reviewed-by, as we could say that the difference is not that important
> for buildroot.
>
> But we should emphasise the difference between Tested-by and Reviewed-by,
> and we should encourage the users to add their Tested-by as much as possible.

Regardless of the names, I can think of the following type of responses:

1. I think the patch addresses a valid problem or proposes a nice
improvement (so I think it or something like it should be included),
but have not tested nor reviewed it.
2. I have read the patch line-by-line, and based on my current
understanding of the buildroot system / make syntax, I think the patch
is correct and looks good. But, I have not checked whether the patch
applies cleanly, nor tested it.
3. The same as above, plus I have integrated your patch in my
buildroot tree and verified that it applies cleanly.
4. I have integrated your patch in my tree and did some form of
testing with it, but have not reviewed it for technical correctness /
compliance with the philosophy of buildroot.

If we can agree on some listing like this, we should simply map words
on them, and document that. This is particularly important as we saw
that Thomas and Sam/Yann use Acked-by and Reviewed-by in an opposite
way.

The difference between 1 and 2 is big enough to create a different
name for it, IMO.

4. would definitely be 'Tested-by'.
2. looks like 'Reviewed-by' to me (and could also be Acked-by if we
accept that we don't have subsystem maintainers and that is the only
difference between the two)
1. doesn't have a name yet, maybe: Liked-by:
3. is very similar to 2. I'm not sure we need a separate category for
that if we trust the submitter. In the rare case he hasn't done his
job, Peter will notice immediately.

Best regards,
Thomas
