From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 11 Oct 2018 15:48:14 +0200
Subject: [Buildroot] [PATCH 4/4] webkitgtk: explicitly set
 USE_GSTREAMER_GL build option
In-Reply-To: <20181011084358.43c357ea@windsurf>
References: <20181009220852.4309-1-aperez@igalia.com>
 <20181009220852.4309-5-aperez@igalia.com>	<20181010212630.7f47270e@windsurf>
 <973ec254-aef1-854f-c1ad-dfbe846c6fb1@mind.be>
 <20181011084358.43c357ea@windsurf>
Message-ID: <20181011154814.GB16261@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, 11 Oct 2018 08:43:58 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
 
> On Thu, 11 Oct 2018 00:04:31 +0200, Arnout Vandecappelle wrote:
> 
> > > What is fixing the autobuilder issue exactly? Explicitly disabling
> > > -DUSE_GSTREAMER_GL=OFF when the plugin is not available ? Or having it
> > > enabled by the "imply" ?  
> > 
> >  imply doesn't really enable it, it just changes the default. It is the
> > equivalent of adding 'default y if BR2_PACKAGE_WEBKITGTK_MULTIMEDIA' to
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL. So imply can never fix the issue.
> 
> Yes, of course, I also don't think imply can fix the issue, but that
> was not clear in the commit log, and the fact that the use of imply is
> mixed with the actual bug fix made it even more confusing.

Indeed. What fixes the autobuilder issue is the changes to the .mk file; the
?imply? is not really needed. I'll re-submit the patch with only that change.

> > > This usage of "imply" would be the first in Buildroot. Peter, Arnout,
> > > Yann, anything against it ?  
> > 
> >  Absolute not, this is a great way to use imply.
> 
> Seems like you and Yann disagree :-)

...and once some agreement about whether to start using ?imply? or not in
Buildroot is done, we can always add that bit later :)

Cheers,


-Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181011/e2b06612/attachment.asc>
