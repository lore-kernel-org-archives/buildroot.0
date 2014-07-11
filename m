From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Fri, 11 Jul 2014 18:21:36 +0200
Subject: [Buildroot] PACKAGE_USERS does not work
In-Reply-To: <53BFE547.70600@posteo.de>
References: <i5np0ra770dn4ujwdmsweh48.1405067942517@email.android.com>
 <CAJtjsKbLN1-yEkBq=cCsoaOx_n+LUYof1P51T3wzOupaxR75JQ@mail.gmail.com>
 <53BFE547.70600@posteo.de>
Message-ID: <CAJtjsKY_h-=R3zL3DJWDvMfozWx3g5+=dP0XkAgEsBEVCMaH5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Fri, Jul 11, 2014 at 3:23 PM, J?rg Krause <jkrause@posteo.de> wrote:
> unfortunatly there is no error message. As I mentioned, I can build upmpdcli
> with success. Here is the contents of my package/upmpdcli/upmpdcli.mk:

How do you build it? using make or make upmpdcli?

For example, if I run make (after selecting ejabberd package), I can
see near the end:
>>>   Generating root filesystem image rootfs.tar
[...]
printf 'ejabberd -1 ejabberd -1 * - - - ejabberd daemon\n' >>
/path/to/buildroot/output/build/_users_table.txt
[...]

and it does appear on /etc/shadow file:
$ grep ejabberd output/target/etc/shadow
ejabberd:*:::::::

Best,
-- 
Johan
