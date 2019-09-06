From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 06 Sep 2019 14:49:32 +0300
Subject: [Buildroot] [PATCH] pppd: use uclibc libcrypt instead of openssl
In-Reply-To: <20190906133541.5707ade0@windsurf>
References: <20190906101849.4621-1-alexander.i.mukhin@gmail.com>
 <20190906133541.5707ade0@windsurf>
Message-ID: <871rwtablf.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Sep 06 2019, Thomas Petazzoni wrote:
> On Fri,  6 Sep 2019 13:18:49 +0300
> Alexander Mukhin <alexander.i.mukhin@gmail.com> wrote:
>
>> If building with uclibc, fall back to using its cryptographic routines
>> instead of openssl. This removes unnecessary dependence.
>> 
>> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
>
> I am surprised: which functions are provided by uClibc that glibc
> doesn't provide ?
>
> Also, what about the musl C library that we support ?

pppd has:

	depends on !BR2_TOOLCHAIN_USES_MUSL # Use __P() macro all over the tree

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
