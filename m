From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 23:39:12 +0100
Subject: [Buildroot] [PATCH 1/2] package/linux-tools: add hyperv
 integration services
In-Reply-To: <3684154963-32001@mail.unilogic.nl>
References: <20191206151600.2ea6979e@windsurf>
 <3684154963-32001@mail.unilogic.nl>
Message-ID: <20191206233912.04fa99b1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

It is very difficult to reply to your e-mails, because the plain text
version of your e-mail does not properly quote the text you're replying
to. Could you fix your e-mail client to only send plain text e-mails to
the mailing list, and to properly quote the text you're replying to ?

On Fri, 6 Dec 2019 15:24:31 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> > + ? ? ? Relevant kernel configuration options: 
> > + ? ? ? HYPERV (HYPERVISOR_GUEST X86_LOCAL_APIC ACPI X86)   
>  
> It's not clear what are those options between parenthesis. 
> 
> 
> As stated they are all kernel configuration options, the options between the parenthesis are just dependancies of the dependancy.

I think we shouldn't list the dependencies of dependencies. They risk
changing from kernel versions to others. Just list that it needs
CONFIG_HYPERV and CONFIG_HYPVER_UTILS.

> Did you see my reply on your previous version of the patch, which says 
> that these two variables will never be used, because HV_FCOPY_DAEMON is 
> not a Buildroot package ? 
> 
> I actually modified linux-tools.mk to make that work.

Indeed, I missed it. It should be part of a separate, preliminary patch
in your series.

Could you take into account the few comments that I have given, and
send an updated version of the patch series ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
