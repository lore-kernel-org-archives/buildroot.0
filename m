From: Marc Chalain <marc.chalain@gmail.com>
Date: Sat, 20 Jun 2020 19:29:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/gpiod: add gpiod hardware
 handling daemon
In-Reply-To: <20200620123339.tf7zog3j7zsad7nj@falbala.internal.home.lespocky.de>
References: <20200616164200.6399-1-marc.chalain@gmail.com>
 <20200617223824.0ab717d2@windsurf.home>
 <CAAj6r7oaCxid93ovxKciNNTyGn+MQwvUPG73PjgX5F0ZDTm__w@mail.gmail.com>
 <20200619193946.7hu3b3bo56xg5g5n@falbala.internal.home.lespocky.de>
 <CAAj6r7oxgNt5ATvMhVKVqSxRay5HkN5Y+O-0r+ce-Ksg=q3nDw@mail.gmail.com>
 <20200620123339.tf7zog3j7zsad7nj@falbala.internal.home.lespocky.de>
Message-ID: <CAAj6r7r2tT8VmGVMDodKMHNNrsysqBgc5Dnn+sT=rWGbvWksgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello,
just to speak clearly and explain that I agree with you

compatible = "gpio-keys";
label = "mediakey";
nextkey: gpiokey,next {
label = "next";
gpios = <&gpio 22 1>;
linux,code = <163>; /* 163 KEY_NEXTSONG */
status = "disabled";
};
for me this is a keyboard definition with one key.
I think that we spoke about exactly the same thing.

Le sam. 20 juin 2020 ? 14:33, Alexander Dahl <post@lespocky.de> a ?crit :

> Hei hei,
>
> On Fri, Jun 19, 2020 at 10:25:52PM +0200, Marc Chalain wrote:
> > Le ven. 19 juin 2020 ? 21:39, Alexander Dahl <post@lespocky.de> a ?crit
> :
> > > However, I defined my button in dts as key, not just as gpio, because
> > > it is actually a key and linux has infrastructure for that.
> > > Furthermore there are reliable userspace libraries to not reinvent the
> > > wheel. I was able to build something around libevdev in two days.
> > >
> > This solution may be complicated when you use some buttons for an
> > application,
> > and just another button for a system feature. You have to manage several
> > keyboards,
> >  to name each one by udev (or mdev) to use the good one with each
> > application.
>
> No and no.
>
> There's no keyboard involved, the keycode I used is not even assigned
> to a key usually found on keyboards. The system has neither udev nor
> mdev, the key is ready by just defining it in dts.
>
> > A daemon on GPIO will never replace a keyboard. When you need several
> > events
> > key and a short time response, a keyboard is more powerful.
> > The Daemon is useful for few events in the life of the system, and you
> > don't want
> > modify an application.
>
> This is exactly my usecase, a tiny daemon doing basically nothing but
> waiting for a button press once a year or so.
>
> > > Besides: your gpiod uses the well known libgpiod, but is not part of
> > > that project, right? That is a little puzzling, people will mix that
> > > up.
> > >
> > Yes I'm sorry for the name. I wanted to use direct access to the
> > /dev/gpiochip,
> > and after I saw that libgpiod was a kernel.org project. I should change
> the
> > name
> > but it's the right name for its usage, and it uses libgpiod, then the
> > daemon promotes
> > the library. Another name would have been stupid.
> > I will propose the daemon to the libgpiod developer, when I will be
> ready.
>
> Looking forward to that. :-)
>
> Greets
> Alex
>
> --
> /"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
> \ / CAMPAIGN     | speech censured, the first thought forbidden, the
>  X  AGAINST      | first freedom denied, chains us all irrevocably.?
> / \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200620/0dceda13/attachment.html>
