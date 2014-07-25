From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 25 Jul 2014 06:31:48 +0300
Subject: [Buildroot] busybox error while building
In-Reply-To: <CABzetm2oeqkBFvXSAGLwzqxYUn3ENxZDmEsow4ZpbyQCN=OoKA@mail.gmail.com>
References: <CABzetm2oeqkBFvXSAGLwzqxYUn3ENxZDmEsow4ZpbyQCN=OoKA@mail.gmail.com>
Message-ID: <20140725033148.GP2478@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rohit,

On Fri, Jul 25, 2014 at 11:41:00AM +0900, Rohit Kumar wrote:
> i copied .config file from previous buildroot to newest buildroot source
> and when i tried to "make "
> i got following error:

[...]

> >>> busybox 1.22.1 Configuring
> /usr/bin/install -D -m 0644 package/busybox/busybox-1.22.x.config
> /home/rohit/Desktop/buildroot/output/build/busybox-1.22.1/.config
> /usr/bin/install: cannot stat ?package/busybox/busybox-1.22.x.config?: No
> such file or directory
> make: ***
> [/home/rohit/Desktop/buildroot/output/build/busybox-1.22.1/.stamp_configured]
> Error 1

Commit b18dca0df8a3 (busybox: support only one version) renamed 
busybox-1.22.x.config to busybox.config. Please set BR2_PACKAGE_BUSYBOX_CONFIG 
to "package/busybox/busybox.config" (this is the default now).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
