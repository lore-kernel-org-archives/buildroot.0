From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Mon, 27 Aug 2007 12:37:56 +0200
Subject: [Buildroot] [Fwd: Re: Struggling with undefined
	reference	to	`__fgetc_unlocked']
In-Reply-To: <20070823201759.GO11697@aon.at>
References: <46CDB91F.80307@st.com>
	<d6cda7730708230953y52b03167t55d124cb50b67603@mail.gmail.com>
	<46CDBC95.7040803@st.com>
	<d6cda7730708231025t391a2263xed883aa16e1a8e84@mail.gmail.com>
	<20070823201759.GO11697@aon.at>
Message-ID: <1188211076.7840.5.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Thu, 2007-08-23 at 22:18 +0200, Bernhard Fischer wrote:
> On Thu, Aug 23, 2007 at 06:25:59PM +0100, Thiago A. Corr?a wrote:
> >Thanks for the help. It was indeed using the uClibc includes with the
> >CXXFLAGS/CFLAGS being set at the qtopia4.mk. I will send a patch as
> >soon as I confirm this is working. But at least so far compilation got
> >past rcc.
> 
> There was talks about qtopia before. IIRC there is no need to compile it
> for the host in the first place.

Correct, only a two-stage build for the target is necessary. But Qtopia
compiles some tools with the host compiler (qmake, moc, rcc and uic). 

Before the late fixes in Qtopia in Buildroot, some bad CFLAGS and
CXXFLAGS was set when configuring, causing the Qtopia build system to
use wrong headers (i.e. target headers when compiling the host tools).

AFAIK everything should be in order in latest SVN.

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
