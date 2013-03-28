From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 28 Mar 2013 21:21:08 +0100
Subject: [Buildroot] [PATCH 1/1] manual: add patch revision and
	versioning section
In-Reply-To: <1364477521-2231-1-git-send-email-viniciustinti@gmail.com>
References: <1364477521-2231-1-git-send-email-viniciustinti@gmail.com>
Message-ID: <CAHXCMML5s9AGLcpWOAFrUsrKhXgc0gM49P-tS=VdUm_0yaqP8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vinicius,

2013/3/28 Vinicius Tinti <viniciustinti@gmail.com>:
> Improve the contribute manual section by adding an explanation about patch
> review and version.
>
> The section now provides advices in how to respond mantainers requests and how
> to proceed on replying them.
>
> Signed-off-by: Vinicius Tinti <viniciustinti@gmail.com>
> ---
>  docs/manual/contribute.txt |   51 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> index 0106df0..2bdfc37 100644
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -62,6 +62,57 @@ Make sure posted *patches are not line-wrapped*, otherwise they cannot
>  easily be applied. In such a case, fix your e-mail client, or better,
>  use +git send-email+ to send your patches.
>
> +Patch revision
> +^^^^^^^^^^^^^^
> +
> +Hardly ever some revisions will be requested to your patch. Whenever
> +it happens make sure to always reply in the same thread and include
> +the changes that have made.
> +
> +Revisions must describe which changes they include. When editing your
> +commit, below the +signed-off-by+ section, add +---+ and your changes.
> ++git+ will automatically ignore lines below +---+ which will not be merged
> +on upstream but will be present for reviewers. For longer series, the
> +changelog should be placed in each commit and the cover letter must contain
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
> ++--subject-prefix+:
> +
> +---------------------
> + $ git format-patch --subject-prefix "PATCH v4" -M -n -s -o outgoing origin/master
> +---------------------
> +
> +Mail clients will handle this automatically reply in the same thread but
> ++git+ won't. Hence the +--in-reply-to+ option in +git-send-email+ must
> +be used. Get the last +Message-ID+ (it can be found your mail client by
> +accessing the raw mail). Then use this message id to send your revision
> +patch:
About the "--in-reply-to" thing (ie. keeping successive revisions of a patch
in the same thread), IMHO, it is more a _nice to have_ than a mandatory
especially when posting patches one by one, but not easily manageable
with pull-requests.

In the latter case (ie. pull-request), it may be good to mark the cover letter
"--in-reply-to" the one of the previous submission...


Another thing that hurts me a bit, is the use of "must".
IMHO, it can be understood that any submission that does not meet these
requirements will be automatically rejected; I hope we are not so rude ;-) ...
but IANA native English speaker, so if no-one else thinks this might be
misunderstood, I can live with it. :)


Regards,

-- 
Samuel
