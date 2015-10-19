From: Jan Viktorin <viktorin@rehivetech.com>
Date: Tue, 20 Oct 2015 00:10:42 +0200
Subject: [Buildroot] [PATCH 1/4] mkpimage: new host package
In-Reply-To: <CAGduivygV76CehcmUM+TvU=wkWvqbL23zp9k2Y5yaPqJpUBZbQ@mail.gmail.com>
References: <1445271894-22553-1-git-send-email-viktorin@rehivetech.com>
 <1445271894-22553-2-git-send-email-viktorin@rehivetech.com>
 <CAGduivyRx81uOHiT=JVj2=1iUw9jCQhgxUbqAxBJR0Wu9GVVtg@mail.gmail.com>
 <20151019225310.5cf90a28@free-electrons.com>
 <20151019210610.GG3651@free.fr>
 <CAGduivxMZixMLiWcT4UoCf_iQ8soA9zYKtJ2XrkxCn+9exS7Eg@mail.gmail.com>
 <20151019232451.099df4e3@jvn>
 <CAGduivygV76CehcmUM+TvU=wkWvqbL23zp9k2Y5yaPqJpUBZbQ@mail.gmail.com>
Message-ID: <20151020001042.40eb9f88@jvn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 19 Oct 2015 23:36:23 +0200
Maxime Hadjinlian <maxime.hadjinlian@gmail.com> wrote:

> > By the way, there is still the fundamental question. Is the mkpimage
> > really necessary? I can boot the Altera SoC Development Kit without
> > running it. What is the value of doing that? Does it support the secure
> > boot sequence? Does it depend on some DIP switch on the board?
> >  
> As far I can remember you can't boot the SoCFPGA without the SPL being
> "signed" (which is really a simple header with a CRC and some padding so it
> fits a precise size).
> I'm curious how you made one boot without this as per Altera's
> documentation the Boot ROM needs it. Note that in Qsys, it's already done
> in their various scripts, so if you build U-Boot that way, it's done for
> you.
> There's no real added value as far as I could tell, the SoC needs it,
> that's all. And there's no DIP switch which helps you configure that on the
> dev kit. I don't think you can configure it. You have to do it and that's
> pretty much it.

That's strange. I tried it twice today. I am using files generated
directly by Buildroot. No other customizations. It builds the SPL image
of size ~43K. The size of the image with CRC is ~64K. Probably, I am
doing something in a wrong way(?). By the way, this was the reason why
I tried to update the readme.txt. I've created the SD card contents
from scratch to avoid any previous working version there... I'll
recheck it (hopefully) tomorrow with a different SD card.

Jan

-- 
  Jan Viktorin                E-mail: Viktorin at RehiveTech.com
  System Architect            Web:    www.RehiveTech.com
  RehiveTech
  Brno, Czech Republic
