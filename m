From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jan 2020 10:31:20 +0100
Subject: [Buildroot] [PATCH] infra: add the transient download mechanism
In-Reply-To: <534f269547ead6d86e7a571978b54d79cd24cd0d.camel@orolia.com>
References: <20200115203753.12110-1-yann.morin.1998@free.fr>
 <534f269547ead6d86e7a571978b54d79cd24cd0d.camel@orolia.com>
Message-ID: <20200116103120.7b41295a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Jan 2020 09:11:32 +0000
Nicolas Carrier <nicolas.carrier@orolia.com> wrote:

> One small remark, to be able to reproduce the build, on top of this
> mechanism, there should be:
> * a way to store the actual VCS revision used for the build (to at
> least know what was just built!)

That seems quite easy to do.

> * a way to force the build to re-use a particular set of revisions

I don't see how that can be done however, and how that would work from
a user interface point of view. Sure the first build could store the
exact Git commit used for building each transient package, and store
that "somewhere", and then re-use that for the next build. But how does
the user decide whether what he wants is to re-do the build with the
same commits or not ? Where is that "somewhere" ?

> That's part of why I don't think that this kind of feature is a good
> thing to integrate into buildroot. I prefer to delegate it to tools
> meant for that (using a mix of local packages and OVERRIDE).

Different people/companies have different work flows. We have people
telling us that using local packages and OVERRIDE for their CI is not
very convenient/practical.

> And like said before, I think it's preferable to have a optional
> feature to prevent branches from being used, making the build fail.

The feature proposed by Yann *is* optional, as it's conditional on
having a specific variable set in the package .mk file.

However, one question that is raised by Yann's patch is whether we want
to forbid using branches when TRANSIENT_DOWNLOAD is NO.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
