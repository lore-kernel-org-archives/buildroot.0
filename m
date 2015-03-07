From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Mar 2015 14:01:42 +0100
Subject: [Buildroot] [PATCH 08/10 v7] package/nvidia-tegra23-binaries:
 new package
In-Reply-To: <20150307090354.60c844a3@free-electrons.com>
References: <cover.1423597914.git.yann.morin.1998@free.fr>
 <af61ad6f5736862b334002ce47727c9ce3bb2ab3.1423597914.git.yann.morin.1998@free.fr>
 <20150221234636.50616706@free-electrons.com>
 <20150221225836.GB4246@free.fr>
 <20150223124136.5fb4ea97@nserafini-N550JK>
 <54F7898A.6090601@free.fr> <20150306231558.GE4220@free.fr>
 <20150307090354.60c844a3@free-electrons.com>
Message-ID: <20150307130141.GB4186@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-07 09:03 +0100, Thomas Petazzoni spake thusly:
> On Sat, 7 Mar 2015 00:15:58 +0100, Yann E. MORIN wrote:
[--SNIP--]
> Now the question is: is it possible to offer a version selection for
> the X.org server ? Will an old X.org server build/work fine with recent
> versions of the X.org libraries around it, so that we only have to
> change the version of the X.org server, or will we enter an horrible
> mess of "if the X.org server is at version <foo>, then we must use
> version <bar> of this library, and version <foobar> of this other
> library" ?

Given the feedback from Bernd, I'll see at adding such a version choice.

Let's say we go this route:

  - add a version choice for 1.14.7 (for tegra-binaries) and 1.17.1 (the
    current version), defaulting to 17.1;

  - add hidden symbols for the driver ABI supported by each version;

  - make nvidia-tegra23 depend on the appropriate ABI symbol.

OK?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
