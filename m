From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Nov 2017 13:43:48 +0100
Subject: [Buildroot] [PATCH 1/1] ntp: add patch to support for libressl
In-Reply-To: <20171123225155.73a4da45@windsurf.lan>
References: <20171108121143.5411-1-aduskett@gmail.com>
 <20171123225155.73a4da45@windsurf.lan>
Message-ID: <20171125124348.GA2798@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-11-23 22:51 +0100, Thomas Petazzoni spake thusly:
> On Wed,  8 Nov 2017 07:11:43 -0500, Adam Duskett wrote:
> > NTP currently fails to compile against LibreSSL because of checks used
> > to determine the SSL library version.
> > 
> > Upstream-Status: Pending
> > http://bugs.ntp.org/show_bug.cgi?id=3401#c3
> > 
> > Signed-off-by: Adam Duskett <aduskett@gmail.com>
> 
> Arnout, Peter, Yann, I think we discussed this topic during the
> Buildroot meeting, and concluded we didn't want patches in Buildroot to
> enable LibreSSL compatibility with a package. Do we stand on this
> position, and reject Adam's contribution on ntp?

My position is to avoid feature patches. Adding libresl support in a
package is adding a new feature IMHO.

As such, we should not accept it, unless it has *already* been accepted
*and* merged upstream.

Regards,
Yann E. MORIN.

> > + #ifndef OPENSSL_VERSION_NUMBER
> > ++#ifndef LIBRESSL_VERSION_NUMBER
> 
> In addition, this continue to use the LIBRESSL_VERSION_NUMBER approach,
> which will fail when libressl gains support for new APIs.
> 
> Thanks in advance for giving your feedback on this patch. If nobody
> complains, I'll merge :-)
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
