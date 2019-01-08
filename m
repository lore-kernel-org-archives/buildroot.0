From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Jan 2019 20:31:05 +0100
Subject: [Buildroot] [PATCH 12/19] infra/pkg-generic: store md5 of
 just-installed files
In-Reply-To: <CAAXf6LV8aKmuieFi2eUo5Zv5ucOCVAjCJwnVftnpXiPrTUo2tg@mail.gmail.com>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <4ccf7565614332a1435f3729936dea4a73d5c4e9.1546898693.git.yann.morin.1998@free.fr>
 <CAAXf6LV8aKmuieFi2eUo5Zv5ucOCVAjCJwnVftnpXiPrTUo2tg@mail.gmail.com>
Message-ID: <20190108193105.GM19623@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas DS, All,

On 2019-01-08 16:13 +0100, Thomas De Schampheleire spake thusly:
> El lun., 7 ene. 2019 a las 23:06, Yann E. MORIN
> (<yann.morin.1998@free.fr>) escribi?:
[--SNIP--]
> >  define step_pkg_size_inner
> >         cd $(2); \
> > -       find . \( -type f -o -type l \) \
> > -               -newer $@_before \
> > -       |sed -r -e 's/$$/\x00$(1)\x00/' \
> > +       { \
> > +               find . -type d -newer $@_before -printf 'directory  %p\n'; \
> > +               find . -xtype f -newer $@_before -print0 \
> Note that the original implementation also used '-xtype' on the
> directory case, I think it's important.

I pondered whether we wanted to restore it for directories too, but
completely messed the conditions in my head, and I missed the whole
picture. If I can recall why I did not do so, I shall write it in the
commit log.

Otherwise, yes, we also want to use -xtype for directories too.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
