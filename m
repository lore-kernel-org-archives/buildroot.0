From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Feb 2014 09:03:54 +0100
Subject: [Buildroot] [PATCH 1/6] toolchain: introduce a toolchain knob
 for NPTL
In-Reply-To: <5301B63A.5000304@mind.be>
References: <1392297727-17627-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392297727-17627-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <5301B63A.5000304@mind.be>
Message-ID: <20140217090354.1a2b5c73@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Mon, 17 Feb 2014 08:11:54 +0100, Arnout Vandecappelle wrote:

>  I think there is very little reason left to use NPTL on archs that

I guess you wanted to say "to *NOT* use NPTL".

> support it, isn't there? So I would first remove the option completely
> for these architectures. That would also make adding a comment
> unnecessary (since it becomes an architecture feature rather than a
> toolchain option).

While I definitely agree for the internal toolchain backend, I don't
think this applies nicely with the external toolchain backend. We do
not control how the external toolchains are built, and it is perfectly
possible to build a non-NPTL toolchain on a NPTL-supported architecture
with Crosstool-NG for example.

That being said, our choice could simply be to not support these cases
at all, and check in the external toolchain backend that the toolchain
has NPTL support if the architecture is supposed to support it.

However, this kind of strategy might fail quite quickly for "growing"
architectures. For example, ARC currently does not have NPTL support,
but since they appear to be quite active, maybe they will implement
NPTL support at some point. And at this moment we will have a range of
stable, well-tested toolchains that are non-NPTL, and the possibility
of building NPTL-capable, but not fully tested toolchains.

Thoughts?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
