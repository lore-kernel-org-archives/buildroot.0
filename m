From: rdkehn at yahoo.com <rdkehn@yahoo.com>
Date: Tue, 16 Feb 2016 20:35:58 -0600
Subject: [Buildroot] [PATCH v8 1/1] package/dhcp: bump version to
	4.3.3-P1
In-Reply-To: <56C38BD7.3000805@mind.be>
References: <1455467044-25072-1-git-send-email-rdkehn@yahoo.com>
 <56c10b7daa3f5_133b16d91c8414fb@ultri2.mail>
 <56C38BD7.3000805@mind.be>
Message-ID: <20160217023557.GA21231@dkarchlinux64.gateway.pace.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, Ricardo,

On Tue, Feb 16, 2016 at 09:51:35PM +0100, Arnout Vandecappelle wrote:
> On 15-02-16 00:19, Ricardo Martincoski wrote:
> > Doug, Arnout,
> > 
> > On Sun, Feb 14, 2016 at 02:24 PM, Doug Kehn <rdkehn@yahoo.com> wrote:
> >> +# bind configure is called via dhcp make instead of dhcp configure. The make env
> >> +# needs extra values for bind configure.
> >> +DHCP_MAKE_ENV = \
> >> +	$(TARGET_CONFIGURE_OPTS) \
> >> +	BUILD_CC="$(HOSTCC)" \
> >> +	BUILD_CFLAGS="$(HOST_CFLAGS)" \
> >> +	BUILD_CPPFLAGS="$(HOST_CXXFLAGS)" \
> > 
> > It is conceptually wrong. Probably a typo.
> > 
> > https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html
> > CXXFLAGS  Extra flags to give to the C++ compiler.
> > CPPFLAGS  Extra flags to give to the C preprocessor and programs that
> >           use it (the C and Fortran compilers).
> > 

Yeah, that is a typo.


> >> +	BUILD_LDFLAGS="$(HOST_LDFLAGS)"
> >> +
> > 
> > 
> > Arnout,
> > Can you confirm this is what you suggested?
> > 
> > DHCP_MAKE_ENV = \
> > 	$(TARGET_CONFIGURE_OPTS) \
> > 	BUILD_CC="$(HOSTCC)" \
> > 	BUILD_CFLAGS="$(HOST_CFLAGS)" \
> > 	BUILD_CPPFLAGS="$(HOST_CPPFLAGS)" \
> > 	BUILD_LDFLAGS="$(HOST_LDFLAGS)"
> 
>  Indeed it was. I shouldn't have told Doug to add my Reviewed-by it seems :-)

It didn't feel right adding a Reviewed-by. I'll make one more
attempt.

Regards,
...doug
