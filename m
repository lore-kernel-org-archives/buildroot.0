From: Francesco Nwokeka <francesco.nwokeka@gmail.com>
Date: Tue, 08 Sep 2015 16:57:13 +0200
Subject: [Buildroot] [PATCH 1/1] docs/website: contribute.txt update
	with useful tips on patch versioning and patch submission
In-Reply-To: <55EEE6BC.4070207@mind.be>
References: <1441718566-6551-1-git-send-email-francesco.nwokeka@gmail.com>
 <55EEE6BC.4070207@mind.be>
Message-ID: <1619019.BvyX3KbBJD@deathstar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 08 September 2015 15:46:36 Arnout Vandecappelle wrote:
> On 08-09-15 15:22, Francesco Nwokeka wrote:
> > Added an alternative on patch versioning (the -v option) and added a tip on how to automatically mark a previous commit as superseded
> > 
> > Signed-off-by: Francesco Nwokeka <francesco.nwokeka@gmail.com>
> > ---
> >  docs/manual/contribute.txt | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> > index 40579f9..1ab8ef8 100644
> > --- a/docs/manual/contribute.txt
> > +++ b/docs/manual/contribute.txt
> > @@ -298,6 +298,12 @@ $ git format-patch --subject-prefix "PATCH v4" \
> >      -M -s -o outgoing origin/master
> >  ---------------------
> >  
> > +or the +-v <n>+ flag (where <n> is the version number):
> > +
> > +---------------------
> > +$ git format-patch -v4 -M -s -o outgoing origin/master
> > +---------------------
> > +
> 
> This option exists since git v1.8.1

Am I to specify the git version on the documentation or was it just a "fyi" statement?


> >  When you provide a new version of a patch, please mark the old one as
> >  superseded in http://patchwork.buildroot.org[patchwork]. You need to
> >  create an account on http://patchwork.buildroot.org[patchwork] to be
> > @@ -306,6 +312,9 @@ the status of patches you submitted yourself, which means the email
> >  address you register in http://patchwork.buildroot.org[patchwork] should
> >  match the one you use for sending patches to the mailing list.
> >  
> > +[NOTE]
> 
>  I don't think this tag is needed.
> 
> > +_You can also add the +--in-reply-to "<previous-version-id>"+ flag when submitting a patch to the mailing list (via git sendmail). The id of the mail to reply to can be found under the "Message Id" tag on the patchwork website. The advantage of *in-reply-to* is that patchwork will automatically mark the previous patch as superseded_
> 
>  Please split lines at 80 columns.
> 
>  The italics is also not needed.
> 
>  <previous-version-id> should be <message-id>.
> 
>  --in-reply-to is an option of format-patch, so there's no need to mention the
> (via git sendmail) (which is anyway wrong, since it's git send-email).

Noted and updated


>  Regards,
>  Arnout
> 
> 
> > +
> >  [[reporting-bugs]]
> >  === Reporting issues/bugs or getting help
> >  
> > 
> 
> 
> 
