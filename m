From: cem akpolat <akpolatcem@gmail.com>
Date: Sat, 24 May 2014 03:36:41 +0200
Subject: [Buildroot] Fwd:  root password and dhcp
References: <839C6E81-EB22-4269-A6B1-CB60169DE097@gmail.com>
Message-ID: <42AE70D0-382C-4931-8B77-18D7E45A659F@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> 
> On 23 May 2014, at 19:42, Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:
> 
>> On 05/23/2014 11:10 AM, cem akpolat wrote:
>> 
>>> Dear all,
>>> 
>>> I have compiled a new file system via buildroot and modified the .cpio
>>> according to my requirements, then repack it and run with the linux kernel. 
>>> 
>>> My first question how can I access via ssh without root password? For
>>> instance in openwrt file system, it is possible to access firstly
>>> through telnet, if required, you can assign a password after the telnet
>>> connection. Does buildroot provide the same functionality? 
>> 
>> You could probably wrap something up to do that with some scripting.
>> Why are you editing the cpio by hand?
>> You could do all your customization in a post build script.
> 
> I will definitely do that, since each time opening the file system costs only time.
>> 
>>> Secondly, it seems that the dhcp doesn't work well, because even though
>>> the users connected to hostapd (I can see the messages), the assignment
>>> of the ip doesn't take place. What could be possible issue here? I am
>>> using dnsmaq and dhcp packages and all configurations are defined
>>> actually in dnsmasq.conf.
>>> 
>>> Here is the configuration file content:
>>> 
>>> dhcp-leasefile=/var/tmp/dnsmasq.leases
>>> dhcp-range=wlan0,192.168.126.10,192.168.126.250,1m
>>> resolv-file=/etc/resolv.dnsmasq.conf
>> 
>> Well, you're somewhat light on details so we're left here to guess.
>> One possibility is that your dnsmasq package has dhcp support disabled,
>> another possibility is that your wlan0 doesn't belong to a proper
>> subnet/hasn't got an ip address configured at all to match that range.
>> Again, i can just guess without some proper information.
>> Regards.
> 
> Regarding dnsmasq configuration, I enabled the dhcp support of dnsmasq, and dnsmasq actually tries to run dhcp, but the following error arises:
> 
> dnsmasq: failed to bind DHCP server socket: Address already in use
> 
> At that point, I wonder is there another dhcp server running at the background? Even if  this could be the case, dnsmasq stops all dhcp server and then restart with respect to the given configurations.
> Apart from dhsmasq package, I added also dhcp-relay and dhcp-server which are under dhcp package. Can dhcp-server lead to the conflict in this case ? 
> 
> Thank you for all recommendations, they helped a lot!
> 
> BR,
> Cem

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140524/aca03fe0/attachment.html>
