From: =?UTF-8?B?Q8OpZHJpYyBNYXJpZQ==?= <cedric.marie@openmailbox.org>
Date: Mon, 08 Jun 2015 23:56:09 +0200
Subject: [Buildroot] Option for debug support in DirectFB package
Message-ID: <55760F79.8080501@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

DirectFB provides two configure options for debug:
* --enable-debug (default is no)
* --enable-debug-support (default is yes)
The first one enables verbose mode in DirectFB, while the second one
only provide the functions to print debug information, that might be
used by an external DirectFB driver.

When these options are both disabled, the installation path is suffixed
with -pure (i.e. /usr/lib/directfb-x.y.z-pure instead of
/usr/lib/directfb-x.y.z).

Buildroot only gives the possibility to enable/disable the first one
(with BR2_PACKAGE_DIRECTFB_DEBUG).

Some external DirectFB driver, when compiled in release mode, would
expect debug support to be disabled, and would install in the -pure
suffixed directory.

Therefore it would be helpful:
- either to have another option for debug support (and debug option
   would depend on debug support option, in Config.in)
- or to disable debug support when debug is disabled: the two options
   would always be forced to have the same value.

I believe the first solution is better, but let me know what you
think... I can provide the patch if you agree with the suggestion.

That would also prevent DirectFB to compile some useless features
in release mode.

-- 
C?dric
