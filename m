From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 13 Apr 2010 20:51:47 +0200
Subject: [Buildroot] Question about external toolchain configuration
	"options"
In-Reply-To: <hq2d7t$5ut$1@dough.gmane.org>
References: <hq2d7t$5ut$1@dough.gmane.org>
Message-ID: <201004132051.48176.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Grant, All,

On Tuesday 13 April 2010 20:30:21 Grant Edwards wrote:
> When using an external toolchain, there are a bunch of toolchain 
> toolchain "configuration options" in the buildroot .config file (e.g.
> support for locale/i18n, wchar, ipv6, program_invokation, etc.).
> 
> However, these "options" don't really seem to be options.
> 
> There's only one correct choice for each, and buildroot figures out
> what those correct choices are at build-time and aborts if the user
> has picked the wrong values.
> 
> Why are they presented to the user as "choices" when the user doesn't
> get to choose their values?  They only seem to be user-configurable
> when building a toolchain.  When using an external toolchain, why not
> just determine the correct values and do the build?
> 

Some packages depends on these 'options', so we have to know their values.
The packages are shown/hidden in the menuconfig.

To determine these 'options', we need to know the external toolchain location
first. The external toolchain location is also specified in the menuconfig.

So there is no way to detect those values, and properly show/hide the
affected packages.

Then there is two solutions:
- present toolchain 'options', and have proper package hidding, but implies
  checking the user did not make a mistake in the toolchain 'options',
or:
- present all packages, and then check that selected packages are buildable.

buildroot choosed the first solution. It has the advantage of using the
same package dependency rules as when using the built-in toolchain mechanism.

Maybe the prompts should be reworked with smthg like (when external toolchain
is selected):
  [ ] Toolchain has IPv6
  [ ] Toolchain has locales
and so on...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
