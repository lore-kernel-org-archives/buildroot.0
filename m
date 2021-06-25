From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Jun 2021 14:54:47 +0200
Subject: [Buildroot] [PATCH v6 1/5] package/bmap-tools: new package
In-Reply-To: <20210625144509.5b5ea897@windsurf>
References: <20210621210111.363433-1-thomas.petazzoni@bootlin.com>
 <20210621210111.363433-2-thomas.petazzoni@bootlin.com>
 <20210625123514.GB104638@scaer> <20210625144509.5b5ea897@windsurf>
Message-ID: <20210625125447.GH104638@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2021-06-25 14:45 +0200, Thomas Petazzoni spake thusly:
> On Fri, 25 Jun 2021 14:35:14 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > I am not too sure what bmap provides over 'dd conv=sparse'...
[--SNIP--]
> Well, this is precisely avoided by bmaptools I believe. bmaptools is
> not about skipping zeroes, it's about skipping holes in sparse files.
> So if a filesystem utility has explicitly written a huge amount of
> zeroes, it's not a hole in the file, and therefore they will be written
> as expected by bmaptools.
> 
> And with that, there are no risk: block filesystems do not make
> assumptions about the state of the data they have not explicitly
> written/initialized at the time of mkfs.

Ah, bmap-tool is really just about skipping holes. And it is assumed
that the image has no hole where the data is relevant, even if only
zeroes.

Thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
