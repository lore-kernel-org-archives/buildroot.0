From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Oct 2018 18:56:02 +0200
Subject: [Buildroot] [PATCH 3/4] package/spandsp: new package
In-Reply-To: <20181009151421.396cb25a@windsurf>
References: <20181003131358.28002-1-bernd.kuhls@t-online.de>
 <20181003131358.28002-3-bernd.kuhls@t-online.de>
 <20181009151421.396cb25a@windsurf>
Message-ID: <20181012165602.GC31509@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-10-09 15:14 +0200, Thomas Petazzoni spake thusly:
> On Wed,  3 Oct 2018 15:13:57 +0200, Bernd Kuhls wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > [Bernd:
> >  - bumped version to 20180108
> >  - removed 0001-fix-msse4.x.patch, applied upstream
> >  - removed autoreconf after patch removal
> >  - added license hash (Arnout)
> >  - added SPDX license codes (Arnout)]
> > 
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > ---
> >  package/Config.in            |  1 +
> >  package/spandsp/Config.in    |  9 +++++++++
> >  package/spandsp/spandsp.hash |  3 +++
> >  package/spandsp/spandsp.mk   | 27 +++++++++++++++++++++++++++
> >  4 files changed, 40 insertions(+)
> >  create mode 100644 package/spandsp/Config.in
> >  create mode 100644 package/spandsp/spandsp.hash
> >  create mode 100644 package/spandsp/spandsp.mk
> 
> I am wondering why a signal processing library for telephony needs the
> TIFF library, but OK, it seems to be the case.

Because it is more than a simple 'DSP' library: it specialises in
telephony DSP, including FAX generation/recognition.

So, you give it a tiff file, and it generates the sounds to send on the
line. Conversely, when receiving a FAX, you feed it the sound from the
line, and it generates a tiff file. More or less... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
