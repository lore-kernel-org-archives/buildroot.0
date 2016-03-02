From: Gabe Evans <gabe@hashrabbit.co>
Date: Wed, 02 Mar 2016 18:10:58 +0000
Subject: [Buildroot] [PATCH 09/32] package/systemd: add support for
 specifying NTP servers
In-Reply-To: <20160229225044.5566ab58@free-electrons.com>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
 <1456437341-19025-10-git-send-email-gabe@hashrabbit.co>
 <20160229225044.5566ab58@free-electrons.com>
Message-ID: <CAHsRNLiavGuf_cXUzTbbfXACDuTe4Ko-p=knO9EROLAn5qgwFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Feb 29, 2016 at 1:50 PM Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Gabe Evans,
>
> On Thu, 25 Feb 2016 21:55:18 +0000, Gabe Evans wrote:
>
> > +config BR2_PACKAGE_SYSTEMD_NTP_SERVERS
> > +     string "default NTP servers"
> > +     default "0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org
> 3.pool.ntp.org"
>
> Does this really needs to be a compile time definition? Can't this be
> specified in some configuration file? If so, then I believe it would be
> nicer.
>

I had another look and we should be able to override this in
/etc/systemd/timesyncd.conf. The configure flag just sets FallbackNTP= in
the default /usr/lib/systemd/timesyncd.conf. One of the reasons I chose to
add an option for it is because ntp.org has some restrictions regarding the
use of their servers and wants you to register as a vendor with them if you
plan to ship a product/appliance/distro. What does Buildroot currently use
for other NTP/SNTP packages?

Thanks,
Gabe


>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-- 
Gabe Evans | Co-Founder & CTO
hashrabbit.co ? angel.co/hashrabbit ? github.com/gevans
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160302/d04c62aa/attachment.html>
