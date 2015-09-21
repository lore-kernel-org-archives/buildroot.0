From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 22 Sep 2015 00:49:52 +0200
Subject: [Buildroot] Building system for the Marvell's ARMADA A385 borad
 to resolve the VLAN trunk issue
In-Reply-To: <944894A3EB1D044A9003B2F944389BB20474C34B3C@svr-wa-exch1.atg.lc>
References: <944894A3EB1D044A9003B2F944389BB20474C34B0F@svr-wa-exch1.atg.lc>
 <5600612C.5060300@mind.be>
 <944894A3EB1D044A9003B2F944389BB20474C34B3C@svr-wa-exch1.atg.lc>
Message-ID: <56008990.3010706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22-09-15 00:28, Lee, Tommy wrote:
[snip]
> My Buildroot .config file has following six lines relevant to this subject:
> 
>  
> 
> BR2_ENDIAN="LITTLE"
> 
> BR2_cortex_a9=y
> 
> BR2_LINUX_KERNEL_USE_DEFCONFIG=y
> 
> BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7"
> 
> BR2_LINUX_KERNEL_USE_INTREE_DTS=y
> 
> BR2_LINUX_KERNEL_INTREE_DTS_NAME="armada-385-db-ap"
> 
>  
> 
> My built kernel zImage has a root file system integrated. My U-Boot ?bootz
> 0x02000000 ? 0x01000000? command successfully booted my board. 

 Your original mail sounded like you didn't even manage to boot the board.


> However, to
> enable VLAN for my work, the network interface connected to a local segment,
> used as the VLAN trunk, cannot ping out to a peer system on the segment.     

 So what does that mean? VLAN doesn't work? Or networking doesn't work at all?
Does mvebu_v7 have VLAN enabled?


> I booted up my board using Marvell?s kernel zImage and DTB. There exists no such
> VLAN trunk reachability problem at all.
> 
> Marvells totally gave me three DTB files, I tried my zImage and all them, one at
> time. Unfortunately the VLAN trunk problem still exists. 

 If it's just VLAN and not networking in general, it sounds like a kernel config
issue and not a dts issue.


> With the belief that
> the problem is in the configuration of my kernel,

 Exactly :-)

> Last week I used the ?make
> linux-menuconfig? command and created my kernel .config file using the following
> two lines replacing the above DECONFIG lines.
> 
>  
> 
> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> 
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armada385/.config"
> 
>  
> 
> Because of the discovery I mentioned in my preceding email, I quit the ?make
> linux-menuconfig? process and reported the issue this morning.  

 What discovery?

> 
>  
> 
> Taking your suggestion, I will rebuild my kernel zImage and DTB with
> ?BR2_LINUX_KERNEL_INTREE_DTS_NAME="armada-388-db-ap? setting, to see whether the
> VLAN trunk reachability problem can be resolved.

 Well, that's what you tried before, no?



 Regards,
 Arnout

 PS We prefer non-HTML mails on this list, and also proper quoting in replies.


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
