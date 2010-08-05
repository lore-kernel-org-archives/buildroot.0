From: Belisko Marek <marek.belisko@gmail.com>
Date: Thu, 5 Aug 2010 16:17:46 +0200
Subject: [Buildroot] [PATCH]: Added splashy package.
In-Reply-To: <AANLkTikg=u5QWEKin7tQy31T9_uiTGKFs-XRFAPBLihN@mail.gmail.com>
References: <AANLkTikCiu-MEJcq7O-4zCY6ADvPuAaX3AuhBuE-6ucA@mail.gmail.com>
	<AANLkTinHcA5iZ3c-ytGU=vpPkQy3NKH-22m_vfPJZYP5@mail.gmail.com>
	<AANLkTikgFYWJXjwNAsJ-zEbghTHHb-iOm0FXfwMVmx_a@mail.gmail.com>
	<AANLkTikg=u5QWEKin7tQy31T9_uiTGKFs-XRFAPBLihN@mail.gmail.com>
Message-ID: <AANLkTi=Ff8H74StgGeoDpO99wXuL+HckszHMVjv9dQZF@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 5, 2010 at 4:08 PM, Mitch Davis <mjd+buildroot@afork.com> wrote:
> On Fri, Aug 6, 2010 at 12:01 AM, Belisko Marek <marek.belisko@gmail.com> wrote:
>>>>
>> splashy has dependency on libmagic.
>
> I see.
>
>> +++ b/package/splashy/splashy.mk
>> @@ -0,0 +1,21 @@
>> +#############################################################
>> +#
>> +# splashy
>> +#
>> +#############################################################
>> +
>> +SPLASHY_VERSION:=0.3.13
>> +SPLASHY_SITE = https://alioth.debian.org/frs/download.php/2691/
>> +SPLASHY_SOURCE = splashy-$(SPLASHY_VERSION).tar.gz
>> +SPLASHY_LIBTOOL_PATCH = NO
>> +SPLASHY_INSTALL_STAGING = YES
>> +SPLASHY_DEPENDENCIES = directfb libglib2 file libpng
>> +
>> +define LIBMAGIC_INSTALL_STAGING_CMDS
>
> Should this be SPLASHY_INSTALL_STAGING_CMDS?
>
> I try to add also libmagic package but then
>> I find out that file package contain libmagic and also header magic.h
>
> I'm no expert, but your SPLASHY_DEPENDENCIES = directfb libglib2 file
> libpng line should handle this. ?What happens if you just have this
> line, and no special installing in the "file" package?
You will get a compilation error about including magic.h:

splashy_config-functions.c:40:68: error: magic.h: No such file or directory
splashy_config-functions.c: In function 'install_theme':
splashy_config-functions.c:137: error: 'magic_t' undeclared (first use
in this function)
splashy_config-functions.c:137: error: (Each undeclared identifier is
reported only once
splashy_config-functions.c:137: error: for each function it appears in.)
splashy_config-functions.c:137: error: expected ';' before 'cookie'
splashy_config-functions.c:138: error: 'cookie' undeclared (first use
in this function)
cc1: warnings being treated as errors
splashy_config-functions.c:144: error: implicit declaration of
function 'magic_load'
splashy_config-functions.c:146: error: implicit declaration of
function 'magic_error'
splashy_config-functions.c:146: error: format '%s' expects type 'char
*', but argument 3 has type 'int'
splashy_config-functions.c:150: error: implicit declaration of
function 'magic_file'
splashy_config-functions.c:150: error: assignment makes pointer from
integer without a cast
splashy_config-functions.c:172: error: implicit declaration of
function 'magic_close'
splashy_config-functions.c: In function 'check_image':
splashy_config-functions.c:1309: error: 'magic_t' undeclared (first
use in this function)
splashy_config-functions.c:1309: error: expected ';' before 'cookie'
splashy_config-functions.c:1310: error: 'cookie' undeclared (first use
in this function)
splashy_config-functions.c:1318: error: format '%s' expects type 'char
*', but argument 3 has type 'int'
splashy_config-functions.c:1322: error: assignment makes pointer from
integer without a cast
make[2]: *** [splashy_config-splashy_config-functions.o] Error 1
make[2]: Leaving directory
`/home/open-nandra/projects/buildroot/output/build/splashy-0.3.13/src'
make[1]: *** [install-recursive] Error 1


>
> Mitch.
>



-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
