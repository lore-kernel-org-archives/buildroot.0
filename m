From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Sat, 14 Nov 2015 17:01:04 +0100
Subject: [Buildroot] [PATCH v2] python3: add patch to fix PEP 3147 issue
 with automake built packages
In-Reply-To: <871tbtlgke.fsf@dell.be.48ers.dk>
References: <1441023704-27725-1-git-send-email-cvubrugier@fastmail.fm>
 <20151104225541.15eef643@free-electrons.com>
 <20151105000420.5abc2ee1@free-electrons.com>
 <20151112163129.4adc5852@PAL-U515208D001>
 <56458B13.2070806@mind.be> <871tbtlgke.fsf@dell.be.48ers.dk>
Message-ID: <20151114170104.191b0f8a@trantor>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, 13 Nov 2015 22:45:05 +0100, Peter Korsgaard wrote :
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:  
> 
> Hi,
> 
>  >> 2/ Simply do not regenerate "importlib.h" because it is not
>  >> used.  
> 
>  >  Most likely, the generated importlib.h doesn't change due to your
>  > patch. So the simplest solution is to do a 'touch
>  > $(@D)/Python/importlib.h' in a post-patch hook (with a large
>  > comment explaining why it is necessary and allowed).  

Well importlib.h is changed because it contains the bytecode
of _bootstrap.py which is patched. However, importlib.h is not
installed in staging and Debian does not ship the header even in
development packages so it's useless.


> Yes, sounds sensible. Christophe, care to send a patch?

Patch sent with subject "[PATCH v3] python3: add patch to fix PEP 3147
issue with automake built packages".

Thanks and best regards,

-- 
Christophe Vu-Brugier
