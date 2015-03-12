From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 Mar 2015 21:26:53 +0100
Subject: [Buildroot] [PATCH] system: add option for standalone telnetd
 on target
In-Reply-To: <20150312161013.4b73baff@free-electrons.com>
References: <1426066527-23021-1-git-send-email-abrodkin@synopsys.com>
 <877funmrkw.fsf@dell.be.48ers.dk> <1426092262.2375.11.camel@synopsys.com>
 <87pp8flblh.fsf@dell.be.48ers.dk> <1426147462.2639.11.camel@synopsys.com>
 <CANPyyuOMod=OMEtv184PQ+tUFW8Gpqj8wpsB9k3cVg43eOMO9w@mail.gmail.com>
 <1426170908.2639.25.camel@synopsys.com>
 <20150312161013.4b73baff@free-electrons.com>
Message-ID: <5501F68D.8060705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/03/15 16:10, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Thu, 12 Mar 2015 14:35:08 +0000, Alexey Brodkin wrote:
> 
>> Even though I may use this hint myself locally I'm afraid it's not the
>> best solution if others want to use the same Buildroot configuration. 
>>
>> Because to make their life easier I'll need to push those SSH keys in
>> public repository - and this won't work for upstreaming the board
>> support in Buildroot.
>>
>> So at least for now SSH doesn't look as an equally simple option as
>> Telnet.
>>
>> Once again - this is because my particular corner-case when rootfs is
>> built in kernel image. If there is some real non-volatile storage on
>> target SSH might be a good option still.
> 
> FWIW, I also do kernel development only with an initramfs, and I still
> use SSH. I simply remove the key from my system using ssh-keygen -R, as
> suggested by modern OpenSSH versions when you connect to a host for
> which you have an invalid key locally.

 I put in my .ssh/config:

Host 192.168.3.1
 HostKeyAlgorithms ssh-rsa
 User root
 ForwardX11 no
 StrictHostKeyChecking no
 CheckHostIP no
 UserKnownHostsFile /dev/null


 But it wouldn't be a bad idea to add an option to dropbear to generate the keys
at build time.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
