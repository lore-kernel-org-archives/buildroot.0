From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 29 Mar 2013 10:30:22 +0100
Subject: [Buildroot] [PATCH 1/1] manual: add patch revision and
	versioning section
In-Reply-To: <1364477521-2231-1-git-send-email-viniciustinti@gmail.com>
References: <1364477521-2231-1-git-send-email-viniciustinti@gmail.com>
Message-ID: <CAAXf6LUMhwh+pdfubNef2Y0SX0Qp6qEHwWzU4ga6_bEDYhhCfw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vinicius,


On Thu, Mar 28, 2013 at 2:32 PM, Vinicius Tinti <viniciustinti@gmail.com>wrote:

> Improve the contribute manual section by adding an explanation about patch
> review and version.
>
> The section now provides advices in how to respond mantainers requests and
> how
> to proceed on replying them.
>
> Signed-off-by: Vinicius Tinti <viniciustinti@gmail.com>
> ---
>  docs/manual/contribute.txt |   51
> ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> index 0106df0..2bdfc37 100644
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -62,6 +62,57 @@ Make sure posted *patches are not line-wrapped*,
> otherwise they cannot
>  easily be applied. In such a case, fix your e-mail client, or better,
>  use +git send-email+ to send your patches.
>
> +Patch revision
> +^^^^^^^^^^^^^^
> +
> +Hardly ever some revisions will be requested to your patch. Whenever
>

The phrase 'hardly ever' means 'almost never'. I think you mean:
Often some revisions will be requested to your patch.
or even:
Typically, you will receive review comments on your patch. After
discussion, these
comments should be taken into account in a new patch revision.



> +it happens make sure to always reply in the same thread and include
> +the changes that have made.
>

Typically one sends a new patch with git format-patch or in my case 'hg
email'. Are people actually specifying the original mail identification, or
rephrased: Is this a rule we should try to follow?


> +
> +Revisions must describe which changes they include. When editing your
> +commit, below the +signed-off-by+ section, add +---+ and your changes.
> ++git+ will automatically ignore lines below +---+ which will not be merged
> +on upstream but will be present for reviewers. For longer series, the
> +changelog should be placed in each commit and the cover letter must
> contain
> +a summary of these changes. The following suggested layout example
> +is not mandatory.
> +
> +---------------
> +<topic on one line of less than ~80 characters>
> +<empty newline>
> +<more paragraphs describing what it is doing and why>
> +<empty newline>
> +Signed-off-by John Doe <john.doe@noname.org>
> +---
> +Changes v2 -> v3:
> +  - foo bar  (Jane)
> +  - bar buz
> +Changes v1 -> v2:
> +  - alpha bravo  (John)
> +  - charly delta
> +---------------
> +
> +Any patch revision must include the version number. The version number
> +is simply composed by the letter +v+ followed by an +integer+ greater or
> +equal 2 (two) (i.e. PATCH v2, PATCH v3 ...).
> +
> +This can be easly handle in +git-format-patch+ command by using the option
>

This can be easily handled with the +git-format-patch+ ...


> ++--subject-prefix+:
> +
> +---------------------
> + $ git format-patch --subject-prefix "PATCH v4" -M -n -s -o outgoing
> origin/master
> +---------------------
> +
> +Mail clients will handle this automatically reply in the same thread but
> ++git+ won't. Hence the +--in-reply-to+ option in +git-send-email+ must
> +be used. Get the last +Message-ID+ (it can be found your mail client by
> +accessing the raw mail). Then use this message id to send your revision
> +patch:
>

I would suggest:
Without extra information, +git+ cannot know to which thread to reply to.
However,
you can use the +--in-reply-to+ option to +git-send-email+, which takes the
unique
+Message-ID+ of the thread as parameter. This value is present in the mail
headers,
which you can view with your mail client using the 'Message source' or
similar option.
Then use this message id to send your revised patch:



> +
> +---------------------
> + $ git send-email --to buildroot at busybox.net --in-reply-to
> mymsgid at noname.org outgoing/*
> +---------------------
> +
>  Reviewing/Testing patches
>  -------------------------
>
>
Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130329/5bba0cb7/attachment.html>
