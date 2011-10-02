From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 2 Oct 2011 23:45:08 +0200
Subject: [Buildroot] [PATCH 2/9] toolchain-external: allow specifying
	extra external libraries
In-Reply-To: <59099791edd7c503508d17a882d0b97ead12fcf7.1317583191.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317583191.git.thomas.petazzoni@free-electrons.com>
 <59099791edd7c503508d17a882d0b97ead12fcf7.1317583191.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201110022345.08800.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, All,

On Sunday 02 October 2011 21:20:10 Thomas Petazzoni wrote:
> From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
> 
> Custom toolchains may provide extra libraries that need to be copied to the
> target. This patch adds a configuration option for this.

What kind of libraries are we talking about here? Things such as libz.so,
or like libnss_*.so ?

There are a few cases I can think of:

 - the library/ies are available as standard buildroot package/s
   (eg. libz.so)
   --> then that's a no-no, or there would be conflicts with buildroot's
       own builds

 - the library/ies is/are not part of buildroot, and but is/are used by
   a buildroot package (eg. libwhatever.so)
   --> then we should also copy the headers

 - the library/ies is/are system libs from the toolchain (eg. libnss_*.so)
   --> the library/ies should be copied by a generic toolchain hook, which
       works for all kind of toolchain backends (internal, external, or
       ct-ng)

So, I'm not really sure we should allow that without further explanations.
(and there was no more in Thomas' original post on the suject...)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
