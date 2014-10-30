From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 29 Oct 2014 19:48:38 -0500
Subject: [Buildroot] [PATCH 1/1] iptables: fix userspace compilation of
 ip tables with C++
In-Reply-To: <54516922.1070306@zacarias.com.ar>
References: <1413227563-5383-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20141029223413.70abc05b@free-electrons.com>
 <54516922.1070306@zacarias.com.ar>
Message-ID: <CANQCQpbOzrKC+8oi3fkO7knQ_HafbpSbnusc6_STfwnSiU+2ZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Wed, Oct 29, 2014 at 5:24 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
>
> On 10/29/2014 06:34 PM, Thomas Petazzoni wrote:
>
> > Dear Matt Weber,
> >
> > On Mon, 13 Oct 2014 14:12:43 -0500, Matt Weber wrote:
> >>
> >> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> >> ---
> >>  ...ix-userspace-compilation-of-ip_tables_c_h.patch |   43 ++++++++++++++++++++
> >>  1 file changed, 43 insertions(+)
> >>  create mode 100644 package/iptables/iptables-03-fix-userspace-compilation-of-ip_tables_c_h.patch
> >
> > This patch apparently dates back from 2012. Why has it never been
> > merged upstream? Also, I don't really understand the interaction
> > between the kernel headers, and this include/linux/ header in iptables.
> >
> > Has the problem been reported upstream to iptables?
> >
> > Gustavo, an opinion?
>
> It was posted to lkml & linux-netdev at first, Davem told to post to
> netfilter-devel. That was done:
>
> http://marc.info/?t=134904906300003&r=1&w=1
>
> The logic seems right, C++ is more strict and triggers the issue.
> It's an issue when dealing with netfilter rules from custom C++ code.
>
> But it seems to have been rejected without much explanation:
> http://patchwork.ozlabs.org/patch/188216/
>

Should I repost it to netfilter-devel and update my patch to reference
the above information plus the new submission thread?

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
