From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 15 Dec 2017 10:24:24 +0200
Subject: [Buildroot] [PATCH] wolfssl: new package
In-Reply-To: <87tvwt2rv0.fsf@dell.be.48ers.dk>
References: <1513098237-18245-1-git-send-email-sergio.prado@e-labworks.com>
 <20171212173206.vablwxvwcpjfrffn@tarshish>
 <CANu7NGt3er0OfSdH-ujY6111fdywdixTpgVRTq7C79HzZXCWvw@mail.gmail.com>
 <20171213060308.gosvafozfwqsdw4p@sapphire.tkos.co.il>
 <CANu7NGsei4G9mcvMxtRRoyp9C69Yab-n6sa5htL-+==30kLBEw@mail.gmail.com>
 <20171214064359.282d0412@windsurf.png.is.keysight.com>
 <20171214064310.zlgeattkdrphujem@sapphire.tkos.co.il>
 <CANu7NGu1FYMpNv=Jc0ZRUnwHzuY1Vgra=u==K2xw5=Jod8B2pg@mail.gmail.com>
 <87tvwt2rv0.fsf@dell.be.48ers.dk>
Message-ID: <20171215082424.wz3vq5ysfzp436mk@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, Sergio,

On Thu, Dec 14, 2017 at 05:31:47PM +0100, Peter Korsgaard wrote:
> >>>>> "Sergio" == Sergio Prado <sergio.prado@e-labworks.com> writes:
>  > So I see two possible options:
> 
>  > 1. Completely remove these options.
>  > 2. Keep these options, documenting that to be useful, it needs out of tree
>  > patches that are not public and should be requested via wolfssl website
>  > contact page.
> 
>  > I'm okay with both options, but I think option 2 is better because it will
>  > give Buildroot users the possibility to use wolfssl with
>  > nginx/lighttpd/wpa_supplicant in a way the wolfssl project intended. What
>  > do you think?
> 
> If these options cannot be tested in upstream Buildroot then they imho
> shouldn't be there, so +1 for option 1.

I agree that these package specific options are not useful for Buildroot. But 
judging from the list of HAVE_* defines and configure options in wolfssl build 
documentation chapter[1] it looks like the default build will not be useful to 
many users without customization. Is there a way to expose some of this 
flexibility to Buildroot users without forcing them to manually edit the .mk 
file?

baruch

[1] https://www.wolfssl.com/docs/wolfssl-manual/ch2/

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
