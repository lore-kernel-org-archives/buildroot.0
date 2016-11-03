From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 3 Nov 2016 13:19:47 +0200
Subject: [Buildroot] [PATCH 0/2] libcurl: Incorrect fix for CVE-2016-8625
In-Reply-To: <20161103110512.13676-1-jer@airfi.aero>
References: <20161103110512.13676-1-jer@airfi.aero>
Message-ID: <20161103111947.s3t4ucbnmj2ngx7y@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jeroen,

On Thu, Nov 03, 2016 at 12:05:10PM +0100, Jeroen Roovers wrote:
> CVE-2016-8625 (IDNA 2003 makes curl use wrong host) was fixed by switching from
> libidn to libidn2.

I could not find any mention of libidn2 in the CVE-2016-8625 advisor at 
https://curl.haxx.se/docs/adv_20161102K.html .

baruch

> Jeroen Roovers (2):
>   libidn2: new package
>   libcurl: Use libidn2 instead of libidn
> 
>  package/Config.in            |  1 +
>  package/libcurl/libcurl.mk   |  2 +-
>  package/libidn2/Config.in    |  5 +++++
>  package/libidn2/libidn2.hash |  2 ++
>  package/libidn2/libidn2.mk   | 12 ++++++++++++
>  5 files changed, 21 insertions(+), 1 deletion(-)
>  create mode 100644 package/libidn2/Config.in
>  create mode 100644 package/libidn2/libidn2.hash
>  create mode 100644 package/libidn2/libidn2.mk

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
