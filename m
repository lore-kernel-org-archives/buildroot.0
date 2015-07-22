From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jul 2015 23:47:56 +0200
Subject: [Buildroot] [PATCH] snmppp: extract license text from source
 files
In-Reply-To: <20150722233730.4b9fc845@free-electrons.com>
References: <1437496184-26203-1-git-send-email-luca@lucaceresoli.net>
 <20150721215438.19389da8@free-electrons.com>
 <20150722210108.GB3777@free.fr>
 <20150722232613.149d5890@free-electrons.com>
 <20150722213315.GC3777@free.fr>
 <20150722233730.4b9fc845@free-electrons.com>
Message-ID: <20150722214756.GD3777@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-07-22 23:37 +0200, Thomas Petazzoni spake thusly:
> On Wed, 22 Jul 2015 23:33:15 +0200, Yann E. MORIN wrote:
> > > The v3.cpp file is only 428 lines long, and weights 10260 bytes.
> > > Comparatively, the GPLv2 text is 339 lines long for 18092 bytes, and
> > > the GPLv3 text is 647 lines lon for 35147 bytes.
> > > 
> > > If you're really concerned about the file size used for the license of
> > > snmppp, we could switch to use src/gauge.cpp instead of src/v3.cpp.
> > > gauge.cpp is only 75 lines long, for 2804 bytes, and I'd say two thirds
> > > of the file contents are license stuff.
> > 
> > It's not about the size of the file. It's just that I find it odd to use
> > a source file as a license file.
> 
> If there's nothing better, then using a source file that carries a text
> of the license is good enough to act as a license file, IMO.

In principle, yes. However, consider this case:

  - package is BSD-3c licensed, so redistributing the source is not
    mandatory,

  - the user has a local patch for that package,

  - the user does not want to share those modifications, which he is
    allowed to do as per the BSD-3c,

  - using a source file as license file would "leak" those modifications
    (or part of those) in the legal-info.

So, using a source file is not perfect either.

(Note: I would prefer to live in an ideal world where "Open Source" did
not exist and only "Free-as-in-free-speach Software" did, but that's not
the world I'm living in, so... ;-) )

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
