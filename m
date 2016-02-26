From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Feb 2016 21:54:36 +0100
Subject: [Buildroot] autofs issue?
In-Reply-To: <0b3201d170d0$541bedc0$fc53c940$@chordia.co.uk>
References: <0b3201d170d0$541bedc0$fc53c940$@chordia.co.uk>
Message-ID: <56D0BB8C.1040409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/26/16 21:00, jerry at chordia.co.uk wrote:
> Using BR 2016-02 with custom kernel (local directory containing linux-stable
> repo). Autofs4 kernel module is built-in.
> 
>  
> 
> Having noted this:
> http://git.buildroot.net/buildroot/commit/?id=b78a95d109ea335406bbac2957c4cc85b98838d4
> I wonder if there is another issue?
> 
>  
> 
> The autofs script that gets added to /etc/init.d seems to be a bash script (?)
> Consequently this is failing on a Busybox system. Have I
> misunderstood/misconfigured something?

 I've looked at it and it looks like it's just the shebang that is wrong. I
couldn't find any bashism in it. Well, actually there is one: the $"" gettext
expansion, but busybox sh will just print the $ which is pretty harmless.

 So, could you try to just replace the /bin/bash with /bin/sh and test if the
script still works correctly? If that works, please submit a package patch that
does that on samples/rc.autofs.in


 Regards,
 Arnout


> 
>  
> 
> Jerry.
> 
>  
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
