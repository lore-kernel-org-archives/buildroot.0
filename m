From: Santhosh Ramani <srcoolz@gmail.com>
Date: Tue, 20 Jan 2015 09:39:20 -0600
Subject: [Buildroot] NFS boot
In-Reply-To: <20150120160257.4d3f53bc@free-electrons.com>
References: <CADKZYYKc9a-2MNu_iS9XUvrh8FPnKQatZbbB4PidvOLVNKgd1g@mail.gmail.com>
 <20150116222247.77a1c18a@free-electrons.com>
 <CADKZYYJxN5Epg9jaCnVnbHfk1=s6MwY2zPwAAQLVv_=iNJqVyQ@mail.gmail.com>
 <20150120160257.4d3f53bc@free-electrons.com>
Message-ID: <CADKZYY+sMporVUC_eDkvu=YQCSLA2v+07v-TPo4h1jFcO-JfNw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Thank you for sharing the link - it was very helpful. Based on the
recommendation it seems the best approach would be to modify the S40network
script to not use udhcp when it's an NFS boot and thus ensuring there is no
change in IP address. This I believe can be done using a post build script,
would that be your recommendation as well?

Thank you for your help.
Regards

Santhosh

On 20 January 2015 at 09:02, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Santhosh Ramani,
>
> On Mon, 19 Jan 2015 17:40:16 -0600, Santhosh Ramani wrote:
>
> > I apologize for the delay in replying back to you. The contents of the
> > /etc/network/interfaces file are:
> >
> > *# Configure Loopback*
> > *auto lo*
> > *iface lo inet loopback*
> >
> > *# The primary network interface - use DHCP to find our address*
> > *auto eth0*
> > *iface eth0 inet dhcp*
>
> Then indeed, if you do DHCP on eth0, your IP address might change
> during the boot process, and your platform running Buildroot is no
> longer able to reach the NFS server.
>
> See also https://bugs.busybox.net/show_bug.cgi?id=4790.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 
Greater the Difficulty....Sweeter is the Victory
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150120/0f7e5a4d/attachment.html>
