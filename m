From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 14 Dec 2017 08:43:10 +0200
Subject: [Buildroot] [PATCH] wolfssl: new package
In-Reply-To: <20171214064359.282d0412@windsurf.png.is.keysight.com>
References: <1513098237-18245-1-git-send-email-sergio.prado@e-labworks.com>
 <20171212173206.vablwxvwcpjfrffn@tarshish>
 <CANu7NGt3er0OfSdH-ujY6111fdywdixTpgVRTq7C79HzZXCWvw@mail.gmail.com>
 <20171213060308.gosvafozfwqsdw4p@sapphire.tkos.co.il>
 <CANu7NGsei4G9mcvMxtRRoyp9C69Yab-n6sa5htL-+==30kLBEw@mail.gmail.com>
 <20171214064359.282d0412@windsurf.png.is.keysight.com>
Message-ID: <20171214064310.zlgeattkdrphujem@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Sergio,

On Thu, Dec 14, 2017 at 06:43:59AM +0100, Thomas Petazzoni wrote:
> On Wed, 13 Dec 2017 15:21:37 -0200, Sergio Prado wrote:
> 
> > I also discovered looking at wolfssl forums that they keep patches to be
> > applied in these applications, so they would work with wolfssl. And these
> > patches are not public [1].
> > 
> > So, from that point of view, it does not make sense to keep these options
> > in the package's makefile, since it is not useful with the upstream version
> > of nginx, lighttpd and wpa_supplicant. What do you think?
> > 
> > [1] https://www.wolfssl.com/forums/topic1015-nginx-wolfssl.html
> 
> Indeed, of you can't build wolfssl against nginx without out of tree
> patches that are not even public, I don't see the point of enabling
> "nginx support" in wolfssl.

While I agree with Thomas, I think that if there is a convenient way to 
control the wolfssl configuration then we should expose it somehow. The list 
of HAVE_* options indicates that many, maybe even most, users will need more 
than the default minimal configuration.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
