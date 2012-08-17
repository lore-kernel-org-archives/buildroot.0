From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Aug 2012 16:35:16 +0200
Subject: [Buildroot] [PATCH 07/36] package/celt051: new package
In-Reply-To: <20120817155047.4e94c0dd@skate>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
 <201208171527.29938.yann.morin.1998@free.fr> <20120817155047.4e94c0dd@skate>
Message-ID: <201208171635.16714.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Friday 17 August 2012 15:50:47 Thomas Petazzoni wrote:
> Le Fri, 17 Aug 2012 15:27:29 +0200,
> "Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :
> 
> > > Just curious, for what reason an audio codec is needed as a dependency
> > > of a virtual machine thing? How does it fit in the stack?
> > 
> > celt-0.51 is a hard-depdency for Spice to encode the audio.
> > It's select-ed by BR2_PACKAGE_SPICE in a later patch.
> > 
> > Note that I added all new packages in a row, rather than add them just
> > prior to the requiring qemu feature. Should I re-order the series to make
> > the depedencies clearer?
> 
> No, I understood perfectly that celt was a dependency of spice. My
> question was not Buildroot-specific: I was trying to understand
> what Qemu/Spice had to do with an audio encoder.

Spice is a VNC-like solution, but specificaly designed for use by virtual
machine hypervisors. It can transport video and audio alike, and uses celt
to encode/decode the audio for sending over-the-wire.

I don't know why they choose celt instead of ogg or anything else,
except maybe that celt is developped to be really patent-unencumbered.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
