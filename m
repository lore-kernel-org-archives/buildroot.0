From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Jul 2020 13:57:47 +0200
Subject: [Buildroot] [RFC v9 01/10] cpe-info: new make target
In-Reply-To: <87ftabbrzl.fsf@FE-laptop>
References: <20200616170341.45098-1-matthew.weber@rockwellcollins.com>
 <20200625130055.5062a0a0@windsurf> <87ftabbrzl.fsf@FE-laptop>
Message-ID: <20200701135747.173e509f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 01 Jul 2020 09:43:10 +0200
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> > It's not great because it means adding gazillions of CPE_ID information
> > in packages. But is there any other option ?  
> 
> I am working on a adding a tool allowing to check the cve status of a
> given configuration. I am about to submit it. For now I base my check on
> the buildroot package name as it is done in pkg-stat, but as you know
> there are some mismatch. At a point there will be the need to use the
> CPE information, so I have already had to think on how to manage it.
> 
> I already have to deal with failure when checking if a version was
> affected by a CVE. And for this situation I choose to report that
> failure instead of considering the package being affected or not by
> default. The idea is to, later, be able to fix the failure but in the
> meantime being aware of it.
> 
> For package name I would use a similar approach: if there is no CPE_ID
> provided then try to use the package name but in this case report that
> it has to be checked manually, while if there is a CPE_ID then use it as
> a reliable name. So I am clearly in favor on the second option proposed
> by Thomas. The ultimate goal is to have a CPE_ID information in each
> package but in the meantime there is a path to achieve this.

This all looks sensible to me, so please go ahead and submit the
initial work you have, even without CPE ID support for now.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
