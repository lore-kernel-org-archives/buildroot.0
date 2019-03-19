From: Carlos Santos <casantos@datacom.com.br>
Date: Mon, 18 Mar 2019 22:35:27 -0300 (BRT)
Subject: [Buildroot] [PATCH v5] package/pamtester: new package
In-Reply-To: <87lg2vtrcv.fsf@dell.be.48ers.dk>
References: <1549290835-14995-1-git-send-email-matthew.weber@rockwellcollins.com>
 <87lg2vtrcv.fsf@dell.be.48ers.dk>
Message-ID: <639943914.2901998.1552959327484.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Peter Korsgaard" <peter@korsgaard.com>
> To: "Matthew Weber" <matthew.weber@rockwellcollins.com>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Segunda-feira, 4 de fevereiro de 2019 15:07:12
> Subject: Re: [Buildroot] [PATCH v5] package/pamtester: new package

>>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:
> 
> > From: Carlos Santos <casantos@datacom.com.br>
> > Utility for testing pluggable authentication modules (PAM) facility.
> 
> > While specifically designed to help PAM module authors to test their
> > modules, that might also be handy for system administrators interested
> > in building a centralised authentication system using common standards
> > such as NIS, SASL and LDAP.
> 
> > One patch was included from the Debian bugtracker which fixes a
> > spelling error.
> 
> I still don't understand why we need to carry such patch.

Because I'm a maniac and the misspelling puts me nervous.

> > Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > ---
> > Changes
> > v4 -> v5
> >  - fixed title of patch to be package/
> >  - Added signed-offs in Debian patch
> >  - Added license file hash
> >  - Spelling of pamtester in kconfig comment
> >  - DEVELOPERS entry needed fixup
> > ---
> 
> > +++ b/package/pamtester/Config.in
> > @@ -0,0 +1,15 @@
> > +config BR2_PACKAGE_PAMTESTER
> > +	bool "pamtester"
> > +	depends on BR2_PACKAGE_LINUX_PAM
> > +	help
> > +	  A tiny utility for testing pluggable authentication modules
> > +	  (PAM) facility. While specifically designed to help PAM module
> > +	  authors to test their modules, that might also be handy for
> > +	  system administrators interested in building a centralised
> > +	  authentication system using common standards such as NIS, SASL
> > +	  and LDAP.
> > +
> > +	  http://pamtester.sourceforge.net/
> > +
> > +comment "pamtester depends on linux-pam"
> > +	depends on !BR2_PACKAGE_LINUX_PAM
> 
> I'm not sure this comment is really helpful, but OK.
> 
> Committed with the spelling fix patch dropped, thanks.

I accept that as a sad fact of life. Thanks. ;-)

-- 
Carlos Santos (Casantos) - DATACOM, P&D
