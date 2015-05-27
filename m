From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 May 2015 20:08:32 +0200
Subject: [Buildroot] scons and check
In-Reply-To: <5565F4ED.8070705@green-communications.fr>
References: <5565DCA4.5040002@green-communications.fr>
 <CAHXCMMJEh45R-78biuCVpGF2QxLD5FYEEuw=tmkndzKuCJNmew@mail.gmail.com>
 <5565F4ED.8070705@green-communications.fr>
Message-ID: <20150527200832.21bcf81c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sylvain Raybaud,

On Wed, 27 May 2015 18:46:37 +0200, Sylvain Raybaud wrote:

> I made galera dependent on host-check. As a result check is built and
> installed. The header is present in output/host/usr/include/check.h
> and the .pc file in output/host/usr/lib/pkgconfig/check.pc.
> 
> Just to be sure I tried to also make it dependent on target check, it
> didn't work either (check is installed on target but scons cannot find
> it).

Well, the fact that it doesn't find it may also be due to the
SConstruct not doing the right thing. So make sure to really understand
how "check" is used by galera, and only that will allow you to know if
a host "check" or target "check" package is needed.

Installing a host-check just because it makes things "work" might be a
mistake.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
