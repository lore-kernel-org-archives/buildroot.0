From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 07:54:33 +0100
Subject: [Buildroot] [PATCH] wolfssl: new package
In-Reply-To: <20171213060308.gosvafozfwqsdw4p@sapphire.tkos.co.il>
References: <1513098237-18245-1-git-send-email-sergio.prado@e-labworks.com>
 <20171212173206.vablwxvwcpjfrffn@tarshish>
 <CANu7NGt3er0OfSdH-ujY6111fdywdixTpgVRTq7C79HzZXCWvw@mail.gmail.com>
 <20171213060308.gosvafozfwqsdw4p@sapphire.tkos.co.il>
Message-ID: <20171213075433.32baf98f@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Dec 2017 08:03:08 +0200, Baruch Siach wrote:

> > It depends on the option, but in general enables some extra library
> > features that could be used by the specific application.
> > 
> > For example, if you pass --enable-nginx, it will define OPENSSL_EXTRA that
> > will enable the wolfSSL OpenSSL compatibility layer to ease porting wolfSSL
> > into existing applications which had been designed to work with OpenSSL.  
> 
> So --enable-nginx is not nginx specific. It would probably make sense to 
> enable it for other packages as well. What about the --enable-lighty and 
> --enable-wpas options? How large is the target size increase of these options?
> 
> In any case we need a comment that explains all that.

I also agree that the way it's done in the current proposal is very
confusing. I looked at the patch before looking at Baruch answer and
was about to make the exact same comment.

In addition, enabling those features currently doesn't make much sense,
because none of lighttpd, wpa_supplicant or nginx have an optional
dependency on wolfssl.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
