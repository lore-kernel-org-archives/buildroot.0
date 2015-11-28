From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Nov 2015 23:11:40 +0100
Subject: [Buildroot] [PATCH] support/dependencies: ensure we have 'file'
 on the host
In-Reply-To: <20151128203041.GB2193@tarshish>
References: <1448654529-27021-1-git-send-email-yann.morin.1998@free.fr>
 <20151128203041.GB2193@tarshish>
Message-ID: <20151128221140.GD3816@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-11-28 22:30 +0200, Baruch Siach spake thusly:
> On Fri, Nov 27, 2015 at 09:02:09PM +0100, Yann E. MORIN wrote:
> > When 'file' is missing on the host, libtool fails miserably. Packages
> > that use libtool will suddenly FTBFS, with cryptic error messages, like
> > missing libraries on the linker invocation.
> > 
> > We could ensure that autotools based packages now all depend on
> > host-file. But It itself is an autotools package, so it's again a
> > chicken-n-egg issue. And even non-autotools package may use libtool.
> > 
> > So, just require that 'file' is present on the host.
> 
> The "Mandatory packages" section in docs/manual/prerequisite.txt should 
> mention that.

Yes, sure. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
