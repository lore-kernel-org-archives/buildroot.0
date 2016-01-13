From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jan 2016 12:45:27 +0100
Subject: [Buildroot] [PATCH 1/1 v3] ypbind-mt: new package
In-Reply-To: <alpine.DEB.2.11.1601130838470.11251@tanhuma.tkos.co.il>
References: <1452516304-6029-1-git-send-email-yba@tkos.co.il>
 <569579C5.1010409@mind.be>
 <alpine.DEB.2.11.1601130838470.11251@tanhuma.tkos.co.il>
Message-ID: <20160113124527.515f79a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jonathan Ben Avraham,

On Wed, 13 Jan 2016 09:43:10 +0200 (IST), Jonathan Ben Avraham wrote:

> Hi Arnout,
> TP explicitly asked to submit yp-tools and ypbind-mt in separate 
> submissions.

No, I said they should be separate *patches*.

You seem to do be aware of the concept of a patch series. See for
example
http://lists.busybox.net/pipermail/buildroot/2016-January/149238.html
and the following e-mails. It is a set of 29 *separate* patches, but
grouped together in a series so that we clearly understand that PATCH 2
needs PATCH 1, that PATCH 3 needs PATCH 2 and so on.

> It is not clear to me how to submit a patch that depends on another 
> pending patch having been applied. The possibilities that I see are:
> 
> 1. Patch against the current origin and ignore the fact that there is a 
> dependency on the yp-tools patch having been applied
> 
> 2. Provide the same line added by the patch for yp-tools as part of this 
> patch. That is, the ypbind-mt patch would add two lines to 
> package/Config.in.
> 
> 3. Provide a patch for ypbind-mt that assumes that the patch for yp-tools 
> has already been applied to the origin.
> 
> What is the correct decision?

Send a patch series. To do so, make N commits in your Git branch. Then
do:

$ git format-patch --cover master

It will generate for you N+1 .patch files, the first one being the
cover letter for the series, the remaining ones being the patches
themselves, one per commit in your branch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
