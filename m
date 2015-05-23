From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 23 May 2015 12:02:35 +0200
Subject: [Buildroot] [PATCH] package/iproute2: disable iptables support
 for static build
In-Reply-To: <87vbfl39tk.fsf@dell.be.48ers.dk>
References: <1431982453-17867-1-git-send-email-romain.naour@openwide.fr>
 <87vbfl39tk.fsf@dell.be.48ers.dk>
Message-ID: <5560503B.2060606@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le 21/05/2015 23:22, Peter Korsgaard a ?crit :
>>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:
> 
>  > If iptable support is enabled, it will try to build m_xt.so even
>  > for static build only.
> 
>  > So, disable iptables support for static build and remove
>  > TC_CONFIG_IPSET and TC_CONFIG_XT if previously added by the
>  > configure script.
> 
>  > Fixes:
>  > http://autobuild.buildroot.net/results/3b3/3b37871bdf5766677fc20dca22c13177091d104f/
> 
> FYI, I ended up applying Baruch's patch (and then some followup patches
> of my own). Your two patches were almost identical, but for his patch I
> didn't have to drop the SED lines, and I was lazy ;)

Ok, no problem and sorry for the late answer...

The sed invocation to remove -Werror is just a nop and can also be removed.
See:
http://git.kernel.org/cgit/linux/kernel/git/shemminger/iproute2.git/commit/?id=3140e9a3a343d37a8d828ee27e16ad9f3f9ab389

The real fix would be to write a real autotools configure script but it's
probably too late for the Buildroot release...

See also the note in the commit log ;-)
http://git.kernel.org/cgit/linux/kernel/git/shemminger/iproute2.git/commit/?id=06ec9039c3aa07924f9c23b0daa8885204704a62

Best regards,
Romain

> 
> Thanks!
> 
