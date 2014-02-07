From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Feb 2014 11:28:19 +0100
Subject: [Buildroot] [PATCH] host python/python3: conditionally disable
 unicodedata
In-Reply-To: <e06b104c5f166c541741.1391768165@argentina>
References: <e06b104c5f166c541741.1391768165@argentina>
Message-ID: <20140207112819.2fab19a3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 07 Feb 2014 11:16:05 +0100, Thomas De Schampheleire wrote:
> The host python always had --disable-unicodedata, regardless of the
> corresponding configuration option BR2_PACKAGE_PYTHON_UNICODEDATA.
> Since the host python is used to byte-compile python modules, this meant
> that such modules could not contain unicode strings. For example, following
> statement in a python module:
>     print u"\N{SOLIDUS}"
> 
> would cause the byte-compilation to fail with message:
>     SyntaxError: ("(unicode error) \\N escapes not supported (can't load
>     unicodedata module)",
> 
> Instead, conditionally disable unicodedata based on
> BR2_PACKAGE_PYTHON_UNICODEDATA, also for the host python.
> 
> This fixes bug #6542 (https://bugs.busybox.net/show_bug.cgi?id=6542)
> 
> Reported-by: Gernot Vormayr <gvormayr@gmail.com>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

For information, my upcoming patch series that bumps Python uses
--enable-unicodedata unconditionally for the host python, because
recent versions of python-setuptools need unicodedata.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
