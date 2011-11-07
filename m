From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 7 Nov 2011 13:39:28 +0100
Subject: [Buildroot] Report from the Buildroot Developer Day
In-Reply-To: <20111107132548.33965b56@skate>
References: <20111102160349.4afe5935@skate>
 <20111107120936.GA26160@merkur.ravnborg.org> <20111107132548.33965b56@skate>
Message-ID: <201111071339.28612.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Sam, All,

On Monday 07 November 2011 132548 Thomas Petazzoni wrote:
> Le Mon, 7 Nov 2011 13:09:36 +0100,
> Sam Ravnborg <sam@ravnborg.org> a ?crit :
> 
> > The tags seems to be used in different ways. The way I have understood
> > their usage - and thus the way I have used them is like this:
> > 
> > Acked-by is used when I think that a patch does the right thing.
> > For example when it introduces a a new feature or change something -
> > and which I consider it the right thing to do.
> > 
> > Reviewed-by is stronger in the sense that I have actually taking my
> > time to carefully read the patch line-by-line and that I consider
> > that the patch is correct.
> > I almost never use "Reviewed-by" for patches touching code areas
> > that I am not familiar with - as I do not know if they are correct.
> > Reviewed-by includes an implicit Acked-by as I would not spend time
> > to review something if I did not agree on the patch.
> 
> Interestingly, my understanding is more or less the opposite of yours.
> For me:
> 
>  * Reviewed-by means that you have read the patch and agree with its
>    principle and general implementation, but not that you have actually
>    tested and verified that the patch works. The top-level maintainer
>    will have to do additional testing because you haven't done so.
> 
>  * Acked-by is much stronger, as it means that you fully agree with the
>    patch, that you reviewed it *and* tested it, and that the top-level
>    maintainer does not necessarily need to do additional testing if he
>    trusts you, because Acked-by means that you have actually tested
>    this.

I would tend to agree with Sam here.

- Acked-by is a way to say 'yep, looks good to me'
- Reviewed-by means 'I did some careful analysis, and could not find any
  flaw, good for me'
- Tested-by means 'I did try that stuff, it works for me'.

Here are the corresponding snippets from Documenation/SubmittingPatches:

---8<---
Acked-by: is not as formal as Signed-off-by:. It is a record that the acker
has@least reviewed the patch and has indicated acceptance.  Hence patch
mergers will sometimes manually convert an acker's "yep, looks good to me"
into an Acked-by:.

Reviewed-by:, instead, indicates that the patch has been reviewed and found
acceptable according to the Reviewer's Statement:
(blabla)
     (a) I have carried out a technical review of this patch to
         evaluate its appropriateness and readiness for inclusion into
         the mainline kernel.
     (b) Any problems, concerns, or questions relating to the patch
         have been communicated back to the submitter.  I am satisfied
         with the submitter's response to my comments.

A Tested-by: tag indicates that the patch has been successfully tested (in
some environment) by the person named.  This tag informs maintainers that
some testing has been performed, provides a means to locate testers for
future patches, and ensures credit for the testers.
---8<---

So, in my understanding, Reviewed-by is stronger than Acked-by, because
Reviewed-by means that some technical review has been made (whereas
Acked-by does not specify what type of review was made).

Also, it would be possible to add bith Reviewed-by and Tested-by on a single
patch, whereas Acked-by and Reviewed-by would be equivalent to Reviewed-by
as it is stronger.

For a project like buildroot, we could agree that Acked-by is equivalent
to Reviewed-by, as we could say that the difference is not that important
for buildroot.

But we should emphasise the difference between Tested-by and Reviewed-by,
and we should encourage the users to add their Tested-by as much as possible.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
