From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 09:52:37 +0200
Subject: [Buildroot] [PATCH v3] qt: Fix musl build
In-Reply-To: <1460702436-2666-1-git-send-email-joerg.krause@embedded.rocks>
References: <1460675461-24046-1-git-send-email-joerg.krause@embedded.rocks>
 <1460702436-2666-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160415095237.14eb5bf8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Apr 2016 08:40:36 +0200, J?rg Krause wrote:
> This helps to make sure that QT_SOCKLEN_T is defined to be 'int' only for legacy
> glibc < 2 and not also for other libraries which may define it as per standards
> but are not glibc, e.g. musl.
> 
> Fixes the following build error:
> In file included from ../../include/QtNetwork/private/qnet_unix_p.h:1:0,
>                  from kernel/qnetworkinterface_unix.cpp:46:
> ../../include/QtNetwork/private/../../../src/network/socket/qnet_unix_p.h: In function 'int qt_safe_accept(int, sockaddr*, int*, int)':
> ../../include/QtNetwork/private/../../../src/network/socket/qnet_unix_p.h:121:76: error: invalid conversion from 'int*' to 'socklen_t* {aka unsigned int*}' [-fpermissive]
> 
> Fixes:
> http://autobuild.buildroot.net/results/709/709d547699596d09b4601a7940677d2010adeedf/
> http://autobuild.buildroot.net/results/f05/f0589e1d06404a7bd57f5734228afe45164e553d/
> 
> Backported from Qt5:
> https://github.com/qtproject/qtbase/commit/813f468a14fb84af43c1f8fc0a1430277358eba2
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> Note: A first version for the package qt to fix the musl build was proposed by
> Bernd Kuhls [1].

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
