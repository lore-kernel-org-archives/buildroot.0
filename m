From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 18:02:29 +0100
Subject: [Buildroot] preparing for release
In-Reply-To: <e7ecce02-d228-f356-f47b-5de95d8261d4@synopsys.com>
References: <20161130053136.GU14207@waldemar-brodkorb.de>
 <e7ecce02-d228-f356-f47b-5de95d8261d4@synopsys.com>
Message-ID: <20161130180229.448a0160@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Nov 2016 21:43:20 -0800, Vineet Gupta wrote:

> On 11/29/2016 09:31 PM, Waldemar Brodkorb wrote:
> > Hi,
> >
> > I am preparing a release and would like to remove UCLIBC_HAS_LFS
> > before doing it.
> >
> > I believe UCLIBC_HAS_LFS does make the code more complex and
> > the benefit to disable it to save some bytes is not high enough.
> >
> > Most users have UCLIBC_HAS_LFS enabled and it is enabled by default.
> >
> > Attached is a patch.
> >
> > Any comments?
> >
> > best regards
> >  Waldemar  
> 
> I welcome this change - is there going to be impact on downstream projects like
> busybox. What if it some disables CONFIG_LFS inside busybox ?

In Buildroot, we have dropped the ability to disable LFS since March
2015. It was really too annoying to maintain the !LFS case, for no real
benefit.

So I'm completely fine with uClibc-ng dropping !LFS support upstream,
since Buildroot no longer cares about this possibility.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
