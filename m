From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 Oct 2016 01:08:32 +0200
Subject: [Buildroot] Interfaces not coming up on DSA
In-Reply-To: <5C6DB3AE-3775-4761-BF1A-9C4B101A7F37@bluecordial.com>
References: <5C6DB3AE-3775-4761-BF1A-9C4B101A7F37@bluecordial.com>
Message-ID: <9f3b6959-c313-836e-ab07-a0ad8831e64c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-09-16 17:03, Paul wrote:
> After upgrading to buildroot 2016.08.1 our dsa interfaces do not automatically
> come up, using an existing 4.5.4 kernel. 

 Do you use a custom skeleton? The system menu entries that manipulate files in
the skeleton (e.g. password, network, getty settings) are no longer available
for a custom skeleton, only for the default skeleton. The idea is that with a
custom skeleton, buildroot has no idea what is there so its manipulations may fail.


> Ifconfig lan1 up brings up the
> interface however not able to route, says destination unreachable. 

 ifconfig only sets the IP address, it doesn't add a default route.

> If we run an
> ifup ?a everything works as normal.

 Hm, so you do have a valid /etc/network/interfaces file. Buildroot installs
/etc/init.d/S40network which will call ifup -a. Perhaps your lan1 interface
doesn't exist yet by the time that script is called?

 Regards,
 Arnout



> This was not the case using a previous
> version of buildroot.
> 
>  
> 
> Kind regards
> 
> Paul Ashford
> 
>  
> 
> *Contact Information: *
> 
> m: +44 (0)7885 469812
> 
> e: paul at bluecordial.com
> 
> skype: paulashford1975
> 
> twitter: @pdashford
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
