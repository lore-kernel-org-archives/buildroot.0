From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Mon, 27 Aug 2007 15:48:05 +0200
Subject: [Buildroot] [Fwd: Re: Struggling with undefined reference
	to	`__fgetc_unlocked']
In-Reply-To: <d6cda7730708270633g41662ec3h345cd0fb256756c1@mail.gmail.com>
References: <46CDB91F.80307@st.com>
	<d6cda7730708230953y52b03167t55d124cb50b67603@mail.gmail.com>
	<46CDBC95.7040803@st.com>
	<d6cda7730708231025t391a2263xed883aa16e1a8e84@mail.gmail.com>
	<20070823201759.GO11697@aon.at>
	<1188211076.7840.5.camel@localhost.localdomain>
	<d6cda7730708270633g41662ec3h345cd0fb256756c1@mail.gmail.com>
Message-ID: <1188222485.7840.44.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2007-08-27 at 14:33 +0100, Thiago A. Corr?a wrote:
> Hi,
> 
>     Good to see you around, hopefully we will see some patches closing
> the gap between the svn and atmel buildroot :)
>     Actually current SVN is still unable to build qtopia. To be more
> precise, current SVN fails building the toolchain now *sigh*. But
> -r19700 (4 revisions ago) has the exact same problem, and qtopia4.mk
> haven't been touched in the between. The patch I sent last night to
> the list fixes the build. Also, on the AVR32, for some reason make
> install doesn't copy over qatomic_avr32.h. The patch I sent also
> addresses this, perhaps not in the best way possible, but I can't
> figure out how to do it in a qtopia patch as there is no differences
> between the avr32 and the arm as far as qt build system is concerned.
> They are both in the appropriate folder names and .pri files.

I have a patch for the missing qatomic_avr32.h file, I think I posted it
to this list.

Anyway, I have attached it to this email as well.

>     Still on the Qtopia subject, one has to do LIBS -= -ldl in a
> qtopia project to be able to link. Linker complains about undefined
> symbols. This I have been trying to fix since friday with no success,
> so I took the easy path in my project for now, not linking against
> libdl.so

Weird, I did not have to supply that on my workstation and test server.
(From a completely clean Ubuntu installation (without any AVR32 stuff)).

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
-------------- next part --------------
A non-text attachment was scrubbed...
Name: qtopia-4.2.2-add-avr32-qatomic-header-to-header-list.patch
Type: text/x-patch
Size: 13026 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070827/4730c7d0/attachment-0001.bin 
