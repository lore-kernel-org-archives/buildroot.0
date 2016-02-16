From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 22:45:43 +0100
Subject: [Buildroot] problem adding new package libcapn
In-Reply-To: <56C3970E.5090405@mind.be>
References: <56C10733.8040706@proximus.be>
	<56C3970E.5090405@mind.be>
Message-ID: <20160216224543.6a2a3558@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Feb 2016 22:39:26 +0100, Arnout Vandecappelle wrote:

> > 1) I am not sure how the git submodule update --init is handled in buildroot.
> 
>  If you need it, then you have to:
> 
> - add an EXTRA_DOWNLOADS of the tarball (using the github macro);
> 
> - add a POST_EXTRACT_HOOKS to extract the tarball in the right subdirectory.

I have the impression that this 'git submodule' thing is used more and
more, and that Buildroot not having support to automatically fetch
submodules is causing troubles to a number of people.

Not later than today, a colleague of mine also asked me about this,
since he is packaging something that uses submodules.

But very often, submodules are used to "bundle" libraries that should
rather be packaged as separate packages.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
