From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sat, 21 Oct 2017 18:40:12 -0400
Subject: [Buildroot] [PATCH] .gitignore: ignore output*
In-Reply-To: <20171021160404.579c29af@windsurf>
References: <20171021140108.24066-1-gael.portay@savoirfairelinux.com>
 <20171021160404.579c29af@windsurf>
Message-ID: <20171021224012.wohkvesqielavotp@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Oct 21, 2017 at 04:04:04PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 21 Oct 2017 10:01:08 -0400, Ga?l PORTAY wrote:
> > During development, it is often practical to have many output
> > directories.  The output directory is easily specified with O=<output>
> > though is it useful to have a convention of 'output...' e.g.
> > "output-rpi", "output-rpi2", and "output-rpi3-64".
> > 
> > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> > ---
> >  .gitignore | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/.gitignore b/.gitignore
> > index bb02d9f572..ec5768d053 100644
> > --- a/.gitignore
> > +++ b/.gitignore
> > @@ -1,4 +1,4 @@
> > -/output
> > +/output*
> 
> Not sure this is a good idea, it kind of makes an assumption on how
> people would name their output directories.
> 

Yes, that is why I mentionned that it should be "useful to have a convention of
'output...'"; and I think that 'output*' is not too intrusive.
 
> If you're annoyed by your output directories, use make O=../output-rpi2
> instead of make O=output-rpi2, and that's it :-)
> 

It is a good suggestion by the way; but I have many buildroot working copies in
the same directory, and to avoid collision I prefer having the output directory
directly under the working copy.

I will look to the suggestion of Arnout.

King regards,
Gael
