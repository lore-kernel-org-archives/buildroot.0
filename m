From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Nov 2016 10:45:54 +0100
Subject: [Buildroot] [PATCH] polarssl: remove on security grounds
In-Reply-To: <63dc6ae9-0886-7960-5e4e-f3a772443221@zacarias.com.ar>
References: <1477661811-32653-1-git-send-email-gustavo@zacarias.com.ar>
 <20161029155030.36f92ec5@free-electrons.com>
 <63dc6ae9-0886-7960-5e4e-f3a772443221@zacarias.com.ar>
Message-ID: <20161102104554.41714b3b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 1 Nov 2016 20:27:04 -0300, Gustavo Zacarias wrote:

> > On Fri, 28 Oct 2016 10:36:51 -0300, Gustavo Zacarias wrote:  
> >> The 1.2.x branch is no longer maintained and the latest release from the
> >> maintained branches (2.3, 2.1, 1.3) were security releases, so more
> >> likely than not 1.2 is affected.
> >> In consequence switch shairport-sync to the openssl backend.  
> >
> > The question that immediately comes to mind is: if 1.2 is no longer
> > security-maintained, why don't we package the newer versions such as
> > 2.3 ?
> >
> > I guess it's because polarssl 2.3 doesn't exist, and it's called
> > mbedtls instead. But it would be good to get your confirmation, and
> > have this written clearly in the commit log, and Config.in.legacy help
> > text.  
> 
> Hi.
> I think we've already talked about this in the past.

Yes, I know, but I can hardly remember all the details about all the
patches and topics floating around.

> The problem is that mbedtls is not a replacement for polarssl - they're 
> not compatible except for a small transitional period during the 1.3.x 
> series, so it has little merit mentioning "switch to mbedtls" since 
> nothing will work as-is.

But still, the commit log and Config.in.legacy message is weird, as you
talk about newer releases 2.3, 2.1, 1.3, and use the fact that there
are new releases to justify the fact that we're removing a package
because its 1.2 version is old and unmaintained. Anyone reading this
will wonder "but why didn't they bump to a newer version to get the
security fixes?". Your commit message and Config.in.legacy help text
should answer this question more clearly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
