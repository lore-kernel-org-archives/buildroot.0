From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sat, 21 Oct 2017 18:41:53 -0400
Subject: [Buildroot] [PATCH] .gitignore: ignore output*
In-Reply-To: <4d795892-5e4d-b1b6-fff5-2548874665af@mind.be>
References: <20171021140108.24066-1-gael.portay@savoirfairelinux.com>
 <20171021160404.579c29af@windsurf>
 <4d795892-5e4d-b1b6-fff5-2548874665af@mind.be>
Message-ID: <20171021224152.h65xcotqo4hqrkq6@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sat, Oct 21, 2017 at 08:16:09PM +0200, Arnout Vandecappelle wrote:
> 
> 
> On 21-10-17 16:04, Thomas Petazzoni wrote:
> > Hello,
> > 
> > On Sat, 21 Oct 2017 10:01:08 -0400, Ga?l PORTAY wrote:
> >> During development, it is often practical to have many output
> >> directories.  The output directory is easily specified with O=<output>
> >> though is it useful to have a convention of 'output...' e.g.
> >> "output-rpi", "output-rpi2", and "output-rpi3-64".
> >>
> >> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> >> ---
> >>  .gitignore | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/.gitignore b/.gitignore
> >> index bb02d9f572..ec5768d053 100644
> >> --- a/.gitignore
> >> +++ b/.gitignore
> >> @@ -1,4 +1,4 @@
> >> -/output
> >> +/output*
> > 
> > Not sure this is a good idea, it kind of makes an assumption on how
> > people would name their output directories.
> > 
> > If you're annoyed by your output directories, use make O=../output-rpi2
> > instead of make O=output-rpi2, and that's it :-)
> 
>  You can also add /output* to .git/info/exclude (this is what I do).
> 

Thanks for this suggestion :) I will look at it.

Regards,
Gael
