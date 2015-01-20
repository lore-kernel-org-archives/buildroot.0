From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jan 2015 16:02:57 +0100
Subject: [Buildroot] NFS boot
In-Reply-To: <CADKZYYJxN5Epg9jaCnVnbHfk1=s6MwY2zPwAAQLVv_=iNJqVyQ@mail.gmail.com>
References: <CADKZYYKc9a-2MNu_iS9XUvrh8FPnKQatZbbB4PidvOLVNKgd1g@mail.gmail.com>
 <20150116222247.77a1c18a@free-electrons.com>
 <CADKZYYJxN5Epg9jaCnVnbHfk1=s6MwY2zPwAAQLVv_=iNJqVyQ@mail.gmail.com>
Message-ID: <20150120160257.4d3f53bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Santhosh Ramani,

On Mon, 19 Jan 2015 17:40:16 -0600, Santhosh Ramani wrote:

> I apologize for the delay in replying back to you. The contents of the
> /etc/network/interfaces file are:
> 
> *# Configure Loopback*
> *auto lo*
> *iface lo inet loopback*
> 
> *# The primary network interface - use DHCP to find our address*
> *auto eth0*
> *iface eth0 inet dhcp*

Then indeed, if you do DHCP on eth0, your IP address might change
during the boot process, and your platform running Buildroot is no
longer able to reach the NFS server.

See also https://bugs.busybox.net/show_bug.cgi?id=4790.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
