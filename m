From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 24 Feb 2016 21:36:49 +0200
Subject: [Buildroot] Why not perform a shallow clone?
In-Reply-To: <CAF_dkJA0tBn_6x-sBwqF6Hb4x4+Pp3vM+e+rndm24kJe_y6pVg@mail.gmail.com>
References: <CAF_dkJA0tBn_6x-sBwqF6Hb4x4+Pp3vM+e+rndm24kJe_y6pVg@mail.gmail.com>
Message-ID: <20160224193649.GL2225@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Patrick,

On Wed, Feb 24, 2016 at 02:30:58PM -0500, Patrick Doyle wrote:
> So I'm sitting here watching my buildroot make do a complete clone of
> the Linux kernel, where I have told it that I want a specific sha1
> commit and I started wondering...
> 
> Why not do a shallow clone?
> 
> Has it been tried?  Is it a bad idea?

Quoting the support/download/git script:

# Try a shallow clone, since it is faster than a full clone - but that only
# works if the version is a ref (tag or branch). Before trying to do a shallow
# clone we check if ${cset} is in the list provided by git ls-remote. If not
# we fall back on a full clone.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
