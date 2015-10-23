From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Oct 2015 10:26:45 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: use root-relative -f path for
 /sbin/ldconfig
In-Reply-To: <CAEYzJUEvAp4sfaykkY8dKi8_9G1YGLZ-3U=dgHj9HR3EHsUKXQ@mail.gmail.com>
References: <1445502151-25735-1-git-send-email-bjorn.forsman@gmail.com>
 <562952C7.30708@mind.be>
 <CAEYzJUEvAp4sfaykkY8dKi8_9G1YGLZ-3U=dgHj9HR3EHsUKXQ@mail.gmail.com>
Message-ID: <20151023102645.0b8f3729@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bj?rn Forsman,

On Fri, 23 Oct 2015 09:12:02 +0200, Bj?rn Forsman wrote:

> If you want to completely remove use of (host) /sbin/ldconfig, that's fine too.
> 
> Just tell me what to do :-)

We need to completely remove the ldconfig stuff, since it simply cannot
work. However, there is at least one package (mysql) that installs
libraries in a non-standard location (/usr/lib/mysql) and relies on
ld.so.conf for the dynamic linker to find them. I believe we need to
fix MySQL so that it installs its libraries in /usr/lib, and then get
rid of all the ldconfig/ld.so.conf stuff.

Or, alternatively, see how to get it working with an init script which
runs ldconfig at boot time. But then you have to look at how uClibc and
musl handle this, and implement a solution that works for all three C
libraries.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
