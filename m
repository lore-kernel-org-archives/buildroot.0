From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Feb 2014 23:51:16 +0100
Subject: [Buildroot] [PATCH 1/6] toolchain: introduce a toolchain knob
 for NPTL
In-Reply-To: <53023FF5.7090703@mind.be>
References: <1392297727-17627-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392297727-17627-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <5301B63A.5000304@mind.be> <20140217090354.1a2b5c73@skate>
 <53023FF5.7090703@mind.be>
Message-ID: <20140217235116.50e59245@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Mon, 17 Feb 2014 17:59:33 +0100, Arnout Vandecappelle wrote:

> >> support it, isn't there? So I would first remove the option completely
> >> for these architectures. That would also make adding a comment
> >> unnecessary (since it becomes an architecture feature rather than a
> >> toolchain option).
> > 
> > While I definitely agree for the internal toolchain backend, I don't
> > think this applies nicely with the external toolchain backend. We do
> > not control how the external toolchains are built, and it is perfectly
> > possible to build a non-NPTL toolchain on a NPTL-supported architecture
> > with Crosstool-NG for example.
> 
>  Yes, but we certainly don't support all of the possible toolchains that
> can be spat out by Crosstool-NG. At least, I don't think so...

We are supposed to support a good number of possible toolchains that
Crosstool-NG generates, even though it's true that we do not support
all the possible funky uClibc configurations that one could create with
Crosstool-NG. We also don't support these in Buildroot, while we do
ensure that the uClibc configuration matches the threading model
selected in the Buildroot configuration.

> > However, this kind of strategy might fail quite quickly for "growing"
> > architectures. For example, ARC currently does not have NPTL support,
> > but since they appear to be quite active, maybe they will implement
> > NPTL support at some point. And at this moment we will have a range of
> > stable, well-tested toolchains that are non-NPTL, and the possibility
> > of building NPTL-capable, but not fully tested toolchains.
> 
>  But that's indeed a very good point that I didn't think of. Indeed, for
> these we'll want to support both NPTL and LinuxThreads, therefore we
> still need the comments.
> 
>  Taking that aspect into consideration, removing the LinuxThreads options
> is not bringing any real advantage. So forget I ever mentioned it :-)

Ok, thanks for your feedback!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
