From: cem akpolat <akpolatcem@gmail.com>
Date: Sat, 24 May 2014 03:36:15 +0200
Subject: [Buildroot] Fwd:  root password and dhcp
References: <83E0831E-A969-40BA-9022-B9024D5AB91C@gmail.com>
Message-ID: <4B870E1C-7161-4A44-8B57-243F6845BB3C@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>> Hi Cem,
>> 
>> On Fri, May 23, 2014 at 4:10 PM, cem akpolat <akpolatcem@gmail.com> wrote:
>>> Dear all,
>>> 
>>> I have compiled a new file system via buildroot and modified the .cpio
>>> according to my requirements, then repack it and run with the linux kernel.
>>> 
>>> My first question how can I access via ssh without root password? For
>>> instance in openwrt file system, it is possible to access firstly through
>>> telnet, if required, you can assign a password after the telnet connection.
>>> Does buildroot provide the same functionality?
>> 
>> You can either set the root password in the buildroot configuration
>> (but it will be stored in the config file in plaintext, so for a
>> non-personal project that may not be ok) or you can update the
>> /etc/shadow file from a post-build script, see the presentation
>> http://elinux.org/images/2/2a/Using-buildroot-real-project.pdf slide
>> 25.
> This is exactly the point that I want to know. There are some scripts that I want to add to the file system. It seems that I have to add also them in the system/skeleton and 
> define the required rule in post-build.sh script. This is the whole thing that I understood from the slide :)
> 
> 
>> 
>>> 
>>> Secondly, it seems that the dhcp doesn't work well, because even though the
>>> users connected to hostapd (I can see the messages), the assignment of the
>>> ip doesn't take place. What could be possible issue here? I am using dnsmaq
>>> and dhcp packages and all configurations are defined actually in
>>> dnsmasq.conf.
>>> 
>>> Here is the configuration file content:
>>> 
>>> dhcp-leasefile=/var/tmp/dnsmasq.leases
>>> dhcp-range=wlan0,192.168.126.10,192.168.126.250,1m
>>> resolv-file=/etc/resolv.dnsmasq.conf
>>> 
>> 
>> I don't think I can help you here (no particular dhcp experience in
>> Buildroot) but I think it is useful for other developers if you could
>> paste some relevant parts of the log here.
>> 
> 
> Thank you !
> 
>> Best regards,
>> Thomas
> 
> Best Regards,
> Cem

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140524/376ed0c5/attachment.html>
