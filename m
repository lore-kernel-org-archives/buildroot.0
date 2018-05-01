From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 1 May 2018 14:22:30 +0300
Subject: [Buildroot] [PATCH 2/2] cups: disable pam support
In-Reply-To: <87zi1jg0x0.fsf@dell.be.48ers.dk>
References: <91db976709291253cb9914a411a9d75872165f75.1525115956.git.baruch@tkos.co.il>
 <399e1f6584e1296686974096bc97c027988f3899.1525115956.git.baruch@tkos.co.il>
 <87zi1jg0x0.fsf@dell.be.48ers.dk>
Message-ID: <20180501112230.eac3ejv6vo54jujb@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, May 01, 2018 at 11:50:19AM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > Make the build consistent.
>  > Cc: Olivier Schonken <olivier.schonken@gmail.com>
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>  > ---
>  >  package/cups/cups.mk | 1 +
>  >  1 file changed, 1 insertion(+)
> 
>  > diff --git a/package/cups/cups.mk b/package/cups/cups.mk
>  > index 54271d5fc769..8f33824879ee 100644
>  > --- a/package/cups/cups.mk
>  > +++ b/package/cups/cups.mk
>  > @@ -24,6 +24,7 @@ CUPS_CONF_OPTS = \
>  >  	--without-java \
>  >  	--without-php \
>  >  	--disable-gssapi \
>  > +	--disable-pam \
> 
> Committed, thanks.

Not in master as of 24c1751a002b.

> Any specific reason to unconditionally disable this and not enable when
> linux-pam is available?

I guess that PAM integration takes more than just dependency declaration and 
--enable-pam. But I did not look too deeply into that.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
