From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sat, 24 Oct 2015 21:53:42 +0200
Subject: [Buildroot] [git commit] package/swupdate: add patch to fix
 build issue with some toolchains
In-Reply-To: <CAEYzJUGe08AuhCFO4mdOywLQU2Wju=ZaEiFRbwmzGMdmAaNJ5g@mail.gmail.com>
References: <20151019210337.3699681DEC@busybox.osuosl.org>
 <CAEYzJUGe08AuhCFO4mdOywLQU2Wju=ZaEiFRbwmzGMdmAaNJ5g@mail.gmail.com>
Message-ID: <1445716422.1361.2.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sa, 2015-10-24 at 14:01 +0200, Bj?rn Forsman wrote:
> Hi,
> 
> This patch caused an unfortunate regression that prevents any
> handlers
> from being registered (runtime issue).
> This means it cannot perform any update. Upstream has reverted it.
> 
> See discussion:
> https://groups.google.com/d/msg/swupdate/oVIhJmYPT8A/eq3uZvYVDQAJ
> 
> - Bj?rn

Confirmed! Problem is the linker does not care about constructor
functions. I'll check for another solution...

Best regards
J?rg Krause
