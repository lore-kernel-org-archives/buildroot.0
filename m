From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 May 2018 11:50:19 +0200
Subject: [Buildroot] [PATCH 2/2] cups: disable pam support
In-Reply-To: <399e1f6584e1296686974096bc97c027988f3899.1525115956.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 30 Apr 2018 22:19:16 +0300")
References: <91db976709291253cb9914a411a9d75872165f75.1525115956.git.baruch@tkos.co.il>
 <399e1f6584e1296686974096bc97c027988f3899.1525115956.git.baruch@tkos.co.il>
Message-ID: <87zi1jg0x0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Make the build consistent.
 > Cc: Olivier Schonken <olivier.schonken@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 >  package/cups/cups.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/cups/cups.mk b/package/cups/cups.mk
 > index 54271d5fc769..8f33824879ee 100644
 > --- a/package/cups/cups.mk
 > +++ b/package/cups/cups.mk
 > @@ -24,6 +24,7 @@ CUPS_CONF_OPTS = \
 >  	--without-java \
 >  	--without-php \
 >  	--disable-gssapi \
 > +	--disable-pam \

Committed, thanks.

Any specific reason to unconditionally disable this and not enable when
linux-pam is available?

-- 
Bye, Peter Korsgaard
