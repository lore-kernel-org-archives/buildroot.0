From: Alexander Dahl <post@lespocky.de>
Date: Fri, 19 Jun 2020 21:39:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/gpiod: add gpiod hardware
 handling daemon
In-Reply-To: <CAAj6r7oaCxid93ovxKciNNTyGn+MQwvUPG73PjgX5F0ZDTm__w@mail.gmail.com>
References: <20200616164200.6399-1-marc.chalain@gmail.com>
 <20200617223824.0ab717d2@windsurf.home>
 <CAAj6r7oaCxid93ovxKciNNTyGn+MQwvUPG73PjgX5F0ZDTm__w@mail.gmail.com>
Message-ID: <20200619193946.7hu3b3bo56xg5g5n@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

On Fri, Jun 19, 2020 at 05:37:55PM +0200, Marc Chalain wrote:
> > Thanks a lot for your contribution. I have not reviewed it carefully.
> > However, while it looks potentially interesting, I am personally always
> > a bit concerned in packaging software components that look like
> > "personal projects". This project has only been written by you, there
> > are no contributions from others, no stars, no fork on Github, nothing
> > indicates that anyone but you is using gpiod.
> >
> > This project comes from a professional project. I didn't find any tool
> to launch an application on a switch event. I thought that is stupid to
> write
> code in the application only for that, when there isn't time mandatory.
> This is a personal project, but I hope to reuse it in the future.

I had a similar problem last year. There's triggerhappy which I first
noticed on raspbian, but that was already too heavy and did not
fullfill my needs (pressing a button for five seconds and acting after
that). 

I know OpenWrt has something similar, but I found it was embedded to
deep in their code to just use that part and they stripped out all
that evdev stuff from kernel and userspace (probably to shrink size).

However, I defined my button in dts as key, not just as gpio, because
it is actually a key and linux has infrastructure for that.
Furthermore there are reliable userspace libraries to not reinvent the
wheel. I was able to build something around libevdev in two days.

Besides: your gpiod uses the well known libgpiod, but is not part of
that project, right? That is a little puzzling, people will mix that
up. 

Greets
Alex

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200619/07176cbb/attachment.asc>
