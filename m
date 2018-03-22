From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 22 Mar 2018 07:36:05 +0200
Subject: [Buildroot] [V3 2/2] dropbear: unbundle libtomath & libtomcrypt
In-Reply-To: <20180321212255.20f2e2bc@windsurf>
References: <20180321160329.20768-1-francois.perrad@gadz.org>
 <20180321160329.20768-2-francois.perrad@gadz.org>
 <20180321170413.74jd5vq4ygcgbewp@tarshish>
 <20180321211310.50f6410c@windsurf>
 <20180321201608.jrkkauvpiwcla6js@tarshish>
 <20180321212255.20f2e2bc@windsurf>
Message-ID: <20180322053605.ffiwm36hj3z2ikmh@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Mar 21, 2018 at 09:22:55PM +0100, Thomas Petazzoni wrote:
> On Wed, 21 Mar 2018 22:16:08 +0200, Baruch Siach wrote:
> > Here is my full commit on v2:
> > 
> > Since both libraries are static only, this does not reduce the binary size. On
> > the other hand, bundled libraries are more likely to work correctly with any
> > give version of dropbear. The only benefit of using external libraries is when
> > there is a security update to the libraries. But unless there is a known issue
> > now, I'm not sure it's worth it.
> > 
> > Do you see other reasons to prefer unbundling?
> 
> Well, exactly the one you mention: security issues.
> 
> In fact, I think you're putting the problem in the wrong direction. I
> would rather say: "Unless there is a good reason to not use external
> libraries, we should use external libraries rather than bundled ones".

I think we should be more careful in this case. Crypto primitives are 
"hazmat"[1]. dropbear is an actively maintained project. I think we can trust 
dropbear to react immediately when there is a known issue with the crypto 
libraries that affects the dropbear use case. In my opinion, the danger of 
crypto libraries version mismatch resulting from untested crypto library 
update, outweighs the danger of known vulnerability window in a dropbear 
bundled crypto library.

[1] https://cryptography.io/en/latest/hazmat/primitives/

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
