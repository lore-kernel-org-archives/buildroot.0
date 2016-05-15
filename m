From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 15 May 2016 08:34:04 +0300
Subject: [Buildroot] [PATCH] libinput: fix missing static_assert symbol
In-Reply-To: <9c014a2f0264db4085efccf537f76e8f1993c27b.1463282640.git.baruch@tkos.co.il>
References: <9c014a2f0264db4085efccf537f76e8f1993c27b.1463282640.git.baruch@tkos.co.il>
Message-ID: <20160515053404.GA658@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot list,

On Sun, May 15, 2016 at 06:24:00AM +0300, Baruch Siach wrote:
> static_assert() in from C++. Don't use it in C code.

This is wrong. As upstream developer Jonas ?dahl pointed out, C11 also defines 
static_assert as a convenience macro for _Static_assert. uClibc{,-ng} however 
that does not provide this macro. Would it make sense to disable libinput for 
uClibc{,-ng}?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
