From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 19:42:37 +0100
Subject: [Buildroot] ping and nslookup doesn't work on device
In-Reply-To: <CAJO1S93o=EXpZEAp71FeQXsKFwTshPdBfa1E4e-fopakib1ZLA@mail.gmail.com>
References: <CAJO1S93csWgVZsGX_Qj5HOCgnphzS1R2A_Oaj-RVbmRohkNH7A@mail.gmail.com>
 <20141126220110.15e1b74e@free-electrons.com>
 <CAJO1S93o=EXpZEAp71FeQXsKFwTshPdBfa1E4e-fopakib1ZLA@mail.gmail.com>
Message-ID: <20141127194237.1611ee6b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Kantanu Kumar Mohapatra,

On Thu, 27 Nov 2014 12:59:12 +0530, Kantanu Kumar Mohapatra wrote:

> This is resolv.conf in my device.
> 
> # cat /etc/resolv.conf
> ; DNS configuration
> search private_domain
> nameserver 223.1.4.3
> nameserver 8.8.8.8
> #
> # ping 223.1.4.3
> PING 223.1.4.3 (223.1.4.3): 56 data bytes
> ping: sendto: Network is unreachable
> #
> # ping 8.8.8.8
> PING 8.8.8.8 (8.8.8.8): 56 data bytes
> ping: sendto: Network is unreachable

Well, if you can't reach the DNS servers, then there is no way for DNS
resolution to work. Your network configuration seems to be incorrect.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
