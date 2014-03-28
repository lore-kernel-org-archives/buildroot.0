From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Mar 2014 12:07:07 +0100
Subject: [Buildroot] [PATCH v3] Disable o32 ABI for MIPS64 architectures
In-Reply-To: <5335510C.3090006@imgtec.com>
References: <1395843340-18539-1-git-send-email-Vincent.Riera@imgtec.com>
 <53330BEB.3090206@mind.be> <5333165D.90100@imgtec.com>
 <87txakk5tr.fsf@dell.be.48ers.dk> <5333F5E6.1040604@imgtec.com>
 <5334BC27.5000400@gentoo.org> <53354619.70905@imgtec.com>
 <53354EAD.2060907@imgtec.com> <5335510C.3090006@imgtec.com>
Message-ID: <20140328120707.73840d9e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 28 Mar 2014 10:38:04 +0000, Vicente Olivert Riera wrote:

> > That's not a problem is it? It's ok if the line is missing. A
> > missing line means "this option is not available". A line starting
> > with "#" means "the option is available but currently disabled"
> 
> I want to be sure about that, because there are packages which use
> the BR2_MIPS_OABI32 symbol. So, maybe having that line starting with
> "#" means BR2_MIPS_OABI32=n, and everything works fine, and don't
> having that line at all means that symbol is not defined and the
> packages which use that symbol fail because of that. That's what I
> want to know.

BR2_FOO=n never exists. An option is either BR2_FOO=y, or undefined.
And since # indicates comments in .config files, a # BR2_FOO is not set
line is the same as not having BR2_FOO mentioned at all in the .config.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
