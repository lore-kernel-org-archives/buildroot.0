From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 00:19:53 +0200
Subject: [Buildroot] Option for debug support in DirectFB package
In-Reply-To: <55760F79.8080501@openmailbox.org>
References: <55760F79.8080501@openmailbox.org>
Message-ID: <20150609001953.1c241187@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear C?dric Marie,

On Mon, 08 Jun 2015 23:56:09 +0200, C?dric Marie wrote:

> DirectFB provides two configure options for debug:
> * --enable-debug (default is no)
> * --enable-debug-support (default is yes)
> The first one enables verbose mode in DirectFB, while the second one
> only provide the functions to print debug information, that might be
> used by an external DirectFB driver.
> 
> When these options are both disabled, the installation path is suffixed
> with -pure (i.e. /usr/lib/directfb-x.y.z-pure instead of
> /usr/lib/directfb-x.y.z).
> 
> Buildroot only gives the possibility to enable/disable the first one
> (with BR2_PACKAGE_DIRECTFB_DEBUG).
> 
> Some external DirectFB driver, when compiled in release mode, would
> expect debug support to be disabled, and would install in the -pure
> suffixed directory.
> 
> Therefore it would be helpful:
> - either to have another option for debug support (and debug option
>    would depend on debug support option, in Config.in)
> - or to disable debug support when debug is disabled: the two options
>    would always be forced to have the same value.
> 
> I believe the first solution is better, but let me know what you
> think... I can provide the patch if you agree with the suggestion.
> 
> That would also prevent DirectFB to compile some useless features
> in release mode.

I am not sure I've made up my mind yet specifically about your
question, but two informations:

 * BR2_PACKAGE_DIRECTFB_DEBUG will most likely be removed, as part of
   a patch series I have to bump the entire DirectFB stack. See:

    http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=directfb-bump

 * --enable-debug / --disable-debug used to be passed to all autotools
   packages, depending on the state of the BR2_ENABLE_DEBUG option.
   This is no longer the case since commit
   http://git.buildroot.net/buildroot/commit/?id=0552a367dbdc27a211daaac3359d81dd537e384f.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
