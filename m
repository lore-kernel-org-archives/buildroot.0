From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 23 May 2014 14:42:50 -0300
Subject: [Buildroot] root password and dhcp
In-Reply-To: <CAMm5YqrLgFpGE4m2Mqi+KoSQtYv7O36A2w3DBtUy0p_uaVZdGA@mail.gmail.com>
References: <CAMm5YqrLgFpGE4m2Mqi+KoSQtYv7O36A2w3DBtUy0p_uaVZdGA@mail.gmail.com>
Message-ID: <537F889A.2030907@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/23/2014 11:10 AM, cem akpolat wrote:

> Dear all,
> 
> I have compiled a new file system via buildroot and modified the .cpio
> according to my requirements, then repack it and run with the linux kernel. 
> 
> My first question how can I access via ssh without root password? For
> instance in openwrt file system, it is possible to access firstly
> through telnet, if required, you can assign a password after the telnet
> connection. Does buildroot provide the same functionality? 

You could probably wrap something up to do that with some scripting.
Why are you editing the cpio by hand?
You could do all your customization in a post build script.

> Secondly, it seems that the dhcp doesn't work well, because even though
> the users connected to hostapd (I can see the messages), the assignment
> of the ip doesn't take place. What could be possible issue here? I am
> using dnsmaq and dhcp packages and all configurations are defined
> actually in dnsmasq.conf.
> 
> Here is the configuration file content:
> 
> dhcp-leasefile=/var/tmp/dnsmasq.leases
> dhcp-range=wlan0,192.168.126.10,192.168.126.250,1m
> resolv-file=/etc/resolv.dnsmasq.conf

Well, you're somewhat light on details so we're left here to guess.
One possibility is that your dnsmasq package has dhcp support disabled,
another possibility is that your wlan0 doesn't belong to a proper
subnet/hasn't got an ip address configured at all to match that range.
Again, i can just guess without some proper information.
Regards.
