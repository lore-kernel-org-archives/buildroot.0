From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Tue, 21 Apr 2020 14:38:36 -0500
Subject: [Buildroot] [External] Re: [PATCH 8/8] package/mongodb: bump to
 version 4.2.4
In-Reply-To: <CAPi7W817eSQBx+6GXyXw7G7KrdayYyQHwLZEzDcs-M_C7tHEFQ@mail.gmail.com>
References: <20200323104909.16765-1-yegorslists@googlemail.com>
 <20200323104909.16765-8-yegorslists@googlemail.com>
 <CAMQcK5L+D_aONSbczyJOtU0TOmUeOMNM-4Raq+Oqgg6_9h3PDQ@mail.gmail.com>
 <CAMQcK5Jeg4iHakW=b1kd_m6A8PAJvke_1P_e3Kr5B8sU25tROw@mail.gmail.com>
 <CAPi7W817eSQBx+6GXyXw7G7KrdayYyQHwLZEzDcs-M_C7tHEFQ@mail.gmail.com>
Message-ID: <CAMQcK5KLD87=HzegqGt8CFeMwtBKUKi3h15bDPoUrhtt27kPJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice/Peter,

On Tue, Apr 21, 2020 at 1:37 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Hi Ryan,
>
> Le mar. 21 avr. 2020 ? 18:06, Ryan Barnett <ryan.barnett@collins.com> a ?crit :
>
> Thanks for this defconfig, I was able to reproduce your issue.
> The patch that fixes it is available here:
> https://patchwork.ozlabs.org/project/buildroot/patch/20200421183543.4135516-1-fontaine.fabrice at gmail.com

The patch fixed the issue I was having. While I investigated the
version mongodb issue, I ran across this buildroot bug which contained
the patch you proposed:

https://bugs.busybox.net/show_bug.cgi?id=12681

Peter - while testing the build of mongodb on the latest LTS tag, I
found that mongodb doesn't build there as well and also requires a
patch to fix the build of that version (given in the bug report). What
approach do we want to take for fixing mongodb on the 2020.02 LTS tag?
Bump the version with the patchset proposed or add a patch to mongodb
to fix building of mongodb version 4.0.12?

Thanks,
-Ryan

---
Ryan Barnett | Sr Systems Engineer | Commercial Avionics
COLLINS AEROSPACE
400 Collins Rd NE, Cedar Rapids, IA 52498 USA
ryan.barnett at collins.com | collinsaerospace.com

CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
