From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 23 May 2014 19:27:58 +0200
Subject: [Buildroot] root password and dhcp
In-Reply-To: <CAMm5YqrLgFpGE4m2Mqi+KoSQtYv7O36A2w3DBtUy0p_uaVZdGA@mail.gmail.com>
References: <CAMm5YqrLgFpGE4m2Mqi+KoSQtYv7O36A2w3DBtUy0p_uaVZdGA@mail.gmail.com>
Message-ID: <CAAXf6LWcd9ZLjUUxhoBfNEP7vAXbyeb1vXyrnNV0CgfYtBhw8w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Cem,

On Fri, May 23, 2014 at 4:10 PM, cem akpolat <akpolatcem@gmail.com> wrote:
> Dear all,
>
> I have compiled a new file system via buildroot and modified the .cpio
> according to my requirements, then repack it and run with the linux kernel.
>
> My first question how can I access via ssh without root password? For
> instance in openwrt file system, it is possible to access firstly through
> telnet, if required, you can assign a password after the telnet connection.
> Does buildroot provide the same functionality?

You can either set the root password in the buildroot configuration
(but it will be stored in the config file in plaintext, so for a
non-personal project that may not be ok) or you can update the
/etc/shadow file from a post-build script, see the presentation
http://elinux.org/images/2/2a/Using-buildroot-real-project.pdf slide
25.

>
> Secondly, it seems that the dhcp doesn't work well, because even though the
> users connected to hostapd (I can see the messages), the assignment of the
> ip doesn't take place. What could be possible issue here? I am using dnsmaq
> and dhcp packages and all configurations are defined actually in
> dnsmasq.conf.
>
> Here is the configuration file content:
>
> dhcp-leasefile=/var/tmp/dnsmasq.leases
> dhcp-range=wlan0,192.168.126.10,192.168.126.250,1m
> resolv-file=/etc/resolv.dnsmasq.conf
>

I don't think I can help you here (no particular dhcp experience in
Buildroot) but I think it is useful for other developers if you could
paste some relevant parts of the log here.

Best regards,
Thomas
