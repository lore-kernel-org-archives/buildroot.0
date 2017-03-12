From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 18:29:13 +0100
Subject: [Buildroot] [PATCH 2/2] Makefile: add check of binaries
	architecture
In-Reply-To: <20170312151543.GC3739@free.fr>
References: <1489331191-32663-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1489331191-32663-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170312151543.GC3739@free.fr>
Message-ID: <20170312182913.0c6dc2cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Mar 2017 16:15:43 +0100, Yann E. MORIN wrote:

> That is not possible in all situations.
> 
> For example, I have a board here with a kind of co-processor of a
> different architecture; the firmware for that co-processor is loaded
> at runtime. It is an ELF file, and it is in target/.
> 
> So I don't think it is possible to check that all ELF files are for the
> Buildroot-known target.
> 
> We already discussed this a while ago and came to the same conclusiong
> back then.

I don't think I want to give up that easily on this, especially
considering how many times we get submission for packages that are not
actually cross-compiled.

Could you be more specific about these firmware files? Where are they
located?

Perhaps with a test restricted to {usr,}/{bin,sbin,lib}, we can avoid
testing those firmware files.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
