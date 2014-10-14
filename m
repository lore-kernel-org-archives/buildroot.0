From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Oct 2014 10:26:05 +0200
Subject: [Buildroot] [PATCH 6/8] package/tvheadend: Enable bundled build
In-Reply-To: <20141012213540.2e0ff685@free-electrons.com>
References: <1413137610-21887-1-git-send-email-bernd.kuhls@t-online.de>
 <1413137610-21887-6-git-send-email-bernd.kuhls@t-online.de>
 <XnsA3C4CEF943036berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20141012213540.2e0ff685@free-electrons.com>
Message-ID: <20141014082604.GH3730@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Bernd, All,

On 2014-10-12 21:35 +0200, Thomas Petazzoni spake thusly:
> Dear Bernd Kuhls,
> 
> On Sun, 12 Oct 2014 20:20:46 +0200, Bernd Kuhls wrote:
> 
> > the alternative is to remove host-python as a dependency and built  
> > /usr/bin/tvheadend without its bundled webinterface, this will reduce build 
> > time.
> > 
> > /usr/share/tvheadend, this is where the unbundled webinterface files are 
> > stored, takes ~8 MB on the target, the bundled binary is ~3 MB bigger due to 
> > the use of the Python gzip module when bundling the web files.
> > 
> > I leave this up for discussion ;)
> 
> Size-wise and simplicity-wise, the bundled option seems like the right
> choice to me. If it doesn't suit someone in the future, it will always
> be time to make it optional if needed.

Agreed.

However, whether we use bundled or unbundled, the webinterface files are
to be present, so the size would be a bit bigger when unbundled, since
files would not be conmpressed (except if the filesystem is itself a
compressed filesystem).

So, bundled seems like the correct option for now.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
