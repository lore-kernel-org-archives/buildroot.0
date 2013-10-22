From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue, 22 Oct 2013 08:19:12 -0500
Subject: [Buildroot] Buildroot Package Mirror Script
In-Reply-To: <20131022151011.715ec628@skate>
References: <OF57CE4CB6.E374A8CA-ON86257C0B.0069B646-86257C0B.0069B7CF@rockwellcollins.com>
 <20131021215849.GA3466@free.fr> <20131022151011.715ec628@skate>
Message-ID: <OF1B2465A6.AABEECD2-ON86257C0C.0048E870-86257C0C.004924DF@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas P, Yann, 

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 10/22/2013 
08:10:11 AM:

> Dear Yann E. MORIN,
> 
> On Mon, 21 Oct 2013 22:58:49 +0100, Yann E. MORIN wrote:
> 
> > I'm afraid what you did is what is used to populate sources.b.o.
> > There are no specific 'script' or procedure to do that.
> > 
> > What are the gotchas you're bumped into?
> > 
> > IIRC, there are a few isues yet with some host-packages that are nmot
> > downloaded with 'make sources'. Is that your issue?. I think Thomas P.
> > has a set od chages to fix this issue. Thomas?
> 
> True. As of today, the toolchain packages are not being handled by the
> 'make source' infrastructure, though I've already sent patches to fix
> that.
> 
> Also, I think 'make allyespackageconfig' + 'make source' is inherently
> broken: we have many Config.in "choice" statements, and depending on
> the value of the choice, the tarballs to pull will not be the same
> (packages supporting several versions, X.org big choice on KDrive vs.
> full modular X.org, etc.), so there is in fact no way to simply pull
> *all* possible tarballs. "make source" should guarantee you that it
> downloads all the sources needed for your *current* configuration. But
> there is no entirely full-proof way to download absolutely all possible
> tarballs that Buildroot may need.
 
Thanks for the information, I was hoping there was some magic that was
being done for the buildroot mirror that I was missing. I guess we will
just have to maintain an 'allyespackageconfig' that fixes all of the
gotchas.

Thanks,
-Ryan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131022/89057264/attachment.html>
