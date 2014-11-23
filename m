From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 23 Nov 2014 18:24:02 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-11-22
In-Reply-To: <20141123073011.CCE601014E6@stock.ovh.net>
References: <20141123073011.CCE601014E6@stock.ovh.net>
Message-ID: <CAHXCMM+JcRY090g3jcYGOzahveW2gYzKu_=QaDGmP2JTBXcRMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 23, 2014 at 8:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2014-11-22
> ===============================
>
>         success : 181
>        failures : 11
>        timeouts : 2
>           TOTAL : 194
>
> Classification of failures by reason
> ====================================
>
>                        unknown | 2
>                qt5webkit-5.3.2 | 2
>                    erlang-17.3 | 1
>                  webkit-1.11.5 | 1
>                    nginx-1.6.2 | 1
>                      radvd-2.8 | 1
>               uemacs-4.0.15-lt | 1
>                   thrift-0.9.1 | 1
>                     ruby-2.1.5 | 1
>                   cppcms-1.0.4 | 1
>                       qt-4.8.6 | 1
>
> Detail of failures
> ===================

[...]

>          arc |                    nginx-1.6.2 | NOK | http://autobuild.buildroot.net/results/730105fc0a89b381b3b29192d07f28ef1f13cbb3/

Nginx failure root cause seems to be a kernel with no sysctl syscall.
This seems to happen only on arc.

Anton, Alexey, is it intended that CONFIG_SYSCTL_SYSCALL is disabled
in the arc kernel config?

Anyway, I posted a fix for this:
http://patchwork.ozlabs.org/patch/413440/

Regards,

-- 
Samuel
