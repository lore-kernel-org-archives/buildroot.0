From: Vasanth Ragavendran <ragavendra.2007@gmail.com>
Date: Tue, 26 Jul 2011 14:49:06 +0800
Subject: [Buildroot] Crosstool-ng buildroot installing old version tools
In-Reply-To: <201107260838.25114.yann.morin.1998@anciens.enib.fr>
References: <CADfuMF6B3qLE9oUmsXMiZOSeCjOdXXUh16+8ESzBpufhmt0QUg@mail.gmail.com>
 <CADfuMF4cXaEPhn-M5Wp=pTOuPt6PNR+Aw-oCgy4aMdMNEtFwkA@mail.gmail.com>
 <CADfuMF6guuO9KBrwthACvKQUJbbMakXt8Dx2s6CFBM8tcmDyVA@mail.gmail.com>
 <201107260838.25114.yann.morin.1998@anciens.enib.fr>
Message-ID: <CADfuMF7fTQug5y1QzSBW1eMPsYRBGpsYrd5j2hL_yccg25_Qcw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for responding! And one more thing is i modify the .config of
crosstool-ng manually coz of the versions they use. i changed the kernel to
2.6.38.7 and the default was 2.6.38.4, gcc from 4.4.6 to 4.5.3 etc. so after
making the required changes to .config of crosstool-ng i ran it completely
and then tried to add some packages to buildroot and when i do a make in
buildroot, the crosstool-ng reverts to default configuration and starts
building everything with the older version like kernel 2.6.38.4, gcc 4.4.6
etc. thanks again awaiting your reply.

On Tue, Jul 26, 2011 at 2:38 PM, Yann E. MORIN <
yann.morin.1998@anciens.enib.fr> wrote:

> Vasanth, All,
>
> On Tuesday 26 July 2011 081434 Vasanth Ragavendran wrote:
> > I've another doubt. I'm using crosstool-ng since I need glibc for my
> build.
> > I completely ran and installed crosstool-ng, kernel, filesystem and some
> > packages. if i do a make again after this completes then it just
> generates
> > the root file system and kernel. but if i need to another package i do a
> > make menuconfig and after selecting the required additional package if i
> do
> > a make it starts from beginning and installs crosstool-ng again! Why is
> this
> > happening and how to stop crosstool-ng from installing again everytime a
> new
> > another package is added or some change is made using make menuconfig but
> > the crosstool-ng is untouched. Plz help!
>
> The crosstool-NG backend derives (parts of) its configuration from the
> buildroot configuration. If you change the buildroot config, then the
> probabilities that the crosstool-NG backend's own config did change are
> not null.
>
> The crosstool-NG backend tries its best to avoid this as much as possible,
> butthere might be a hole in there... Last I checked here, it was working.
> I'll check again soon.
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^
>      |
> | --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is
> no  |
> | http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """
>  conspiracy.  |
>
> '------------------------------'-------'------------------'--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110726/18b91e78/attachment-0001.html>
