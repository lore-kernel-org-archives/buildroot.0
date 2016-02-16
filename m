From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Feb 2016 21:51:35 +0100
Subject: [Buildroot] [PATCH v8 1/1] package/dhcp: bump version to
	4.3.3-P1
In-Reply-To: <56c10b7daa3f5_133b16d91c8414fb@ultri2.mail>
References: <1455467044-25072-1-git-send-email-rdkehn@yahoo.com>
 <56c10b7daa3f5_133b16d91c8414fb@ultri2.mail>
Message-ID: <56C38BD7.3000805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15-02-16 00:19, Ricardo Martincoski wrote:
> Doug, Arnout,
> 
> On Sun, Feb 14, 2016 at 02:24 PM, Doug Kehn <rdkehn@yahoo.com> wrote:
>> +# bind configure is called via dhcp make instead of dhcp configure. The make env
>> +# needs extra values for bind configure.
>> +DHCP_MAKE_ENV = \
>> +	$(TARGET_CONFIGURE_OPTS) \
>> +	BUILD_CC="$(HOSTCC)" \
>> +	BUILD_CFLAGS="$(HOST_CFLAGS)" \
>> +	BUILD_CPPFLAGS="$(HOST_CXXFLAGS)" \
> 
> It is conceptually wrong. Probably a typo.
> 
> https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html
> CXXFLAGS  Extra flags to give to the C++ compiler.
> CPPFLAGS  Extra flags to give to the C preprocessor and programs that
>           use it (the C and Fortran compilers).
> 
>> +	BUILD_LDFLAGS="$(HOST_LDFLAGS)"
>> +
> 
> 
> Arnout,
> Can you confirm this is what you suggested?
> 
> DHCP_MAKE_ENV = \
> 	$(TARGET_CONFIGURE_OPTS) \
> 	BUILD_CC="$(HOSTCC)" \
> 	BUILD_CFLAGS="$(HOST_CFLAGS)" \
> 	BUILD_CPPFLAGS="$(HOST_CPPFLAGS)" \
> 	BUILD_LDFLAGS="$(HOST_LDFLAGS)"

 Indeed it was. I shouldn't have told Doug to add my Reviewed-by it seems :-)

 Regards,
 Arnout


> 
> See original reply to [PATCH v7]:
>> On Wed, Feb 10, 2016 at 08:51 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>>  For consistency, we should also pass HOST_CFLAGS, HOST_CPPFLAGS and
>>> HOST_LDFLAGS, but they're actually not so useful. Oh, wait, the HOST_LDFLAGS
>>> are, in case it links with anything in HOST_DIR (which it doesn't, of course).
>>> Still, just to be safe...
> 
> 
> Doug,
> With the typo fixed, you can add my:
> Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> 
> Regards,
> Ricardo
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
