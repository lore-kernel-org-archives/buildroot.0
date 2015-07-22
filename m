From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jul 2015 23:01:08 +0200
Subject: [Buildroot] [PATCH] snmppp: extract license text from source
 files
In-Reply-To: <20150721215438.19389da8@free-electrons.com>
References: <1437496184-26203-1-git-send-email-luca@lucaceresoli.net>
 <20150721215438.19389da8@free-electrons.com>
Message-ID: <20150722210108.GB3777@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Luca, All,

On 2015-07-21 21:54 +0200, Thomas Petazzoni spake thusly:
> On Tue, 21 Jul 2015 18:29:44 +0200, Luca Ceresoli wrote:
> > There is no proper license file in the SNMP++ tarballs, so let's
> > extract it from a source file instead of copying it entirely.
> > 
> > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> > ---
> >  package/snmppp/snmppp.mk | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> In many other packages we are using a complete source file as the
> license text. Should we switch to the solution you're proposing instead?
> Another possibility is to do:
> 
> <pkg>_LICENSE_FILES = src/v3.cpp:1:50
> 
> To tell the package infra to extract the text from lines 1 to 50. But
> we would never notice when the lines no longer match.
> 
> I'd like to have a general agreement on this before going further with
> your patch.

My point of view in the case there is no license file in the package:

 1) we should not regenerate a file, neither manually nor automatically:
    - the automatic part (i.e. in the infra) can be easily foiled when a
      package is updated,
    - the manual part (like suggested by Luca) can also, but to a lower
      extent, be broken on updates;

 2) if we refer to a file, it should be an existing file like a source
    file.

But all-in-all, I believe we should not refer to a license file if
there's none in the package.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
