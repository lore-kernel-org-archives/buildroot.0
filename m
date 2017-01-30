From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 30 Jan 2017 14:28:35 +0200
Subject: [Buildroot] [PATCH v2 1/1] git-crypt: new package
In-Reply-To: <CA+KB-ZbXLs8erLcoxue2VTbr-_h5qkYsidAKJXgGke8R7AwrMA@mail.gmail.com>
References: <20170130002853.76103-1-francesconegri@gmail.com>
 <20170130105808.86147-1-francesconegri@gmail.com>
 <20170130110236.4uabn3nvyz6r4vsm@tarshish>
 <CA+KB-ZZEz1JqXhPZuoCQnoWaC81304JCc-Ae1pf_7t+Lnc9H=A@mail.gmail.com>
 <CA+KB-ZbXLs8erLcoxue2VTbr-_h5qkYsidAKJXgGke8R7AwrMA@mail.gmail.com>
Message-ID: <20170130122835.tupwb77p6webshtp@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francesco,

On Mon, Jan 30, 2017 at 01:08:28PM +0100, Francesco Negri wrote:
> On Mon, Jan 30, 2017 at 12:07 PM, Francesco Negri
> <francesconegri@gmail.com> wrote:
> > I tried using the command suggested by Thomas, but the build fails with:
> 
> I found the error is caused by $(TARGET_CONFIGURE_OPTS) setting
> LDFLAGS="". Setting it to LDFLAGS="-lcrypto" fixes the error. What
> would be the best way to do this in git-crypt.mk?

In that case I think it would be better to do

  $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) ...

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
