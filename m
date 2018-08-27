From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Aug 2018 13:27:48 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-08-26
In-Reply-To: <CALURroSFJESgnrW-ErTQo-A7QhiupELvgsBveWTSOhddXT9UQg@mail.gmail.com>
 (Christopher McCrory's message of "Mon, 27 Aug 2018 03:07:32 -0700")
References: <20180827060019.5834E20789@mail.bootlin.com>
 <CALURroSFJESgnrW-ErTQo-A7QhiupELvgsBveWTSOhddXT9UQg@mail.gmail.com>
Message-ID: <87ftz082x7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christopher" == Christopher McCrory <chrismcc@gmail.com> writes:

Hi,
 > php compile breaks with:

 > ext/mysqlnd/mysqlnd_auth.o: In function `php_mysqlnd_scramble_sha2':
 > mysqlnd_auth.c:(.text+0x1054): undefined reference to `PHP_SHA256Init'
 > mysqlnd_auth.c:(.text+0x1064): undefined reference to `PHP_SHA256Update'
 > mysqlnd_auth.c:(.text+0x1070): undefined reference to `PHP_SHA256Final'
 > mysqlnd_auth.c:(.text+0x1078): undefined reference to `PHP_SHA256Init'
 > mysqlnd_auth.c:(.text+0x1088): undefined reference to `PHP_SHA256Update'
 > mysqlnd_auth.c:(.text+0x1094): undefined reference to `PHP_SHA256Final'
 > mysqlnd_auth.c:(.text+0x109c): undefined reference to `PHP_SHA256Init'
 > mysqlnd_auth.c:(.text+0x10ac): undefined reference to `PHP_SHA256Update'
 > mysqlnd_auth.c:(.text+0x10bc): undefined reference to `PHP_SHA256Update'
 > mysqlnd_auth.c:(.text+0x10c8): undefined reference to `PHP_SHA256Final'


 > It looks like the php mysqli extension needs the hash extension to work.
 > This seems to be a php Make dependany bug.  Something like:

 > diff --git a/package/php/Config.ext b/package/php/Config.ext
 > index 6b3d86925d..60ef1aee7c 100644
 > --- a/package/php/Config.ext
 > +++ b/package/php/Config.ext
 > @@ -113,6 +113,7 @@ endif

 >  config BR2_PACKAGE_PHP_EXT_MYSQLI
 >         bool "Mysqli"
 > +       select BR2_PACKAGE_PHP_EXT_HASH
 >         help
 >           MySQL Improved extension support

 > fixes it on buildroot in the short term

Great, care to send a real patch with your signed-off-by for this?
Thanks!

-- 
Bye, Peter Korsgaard
