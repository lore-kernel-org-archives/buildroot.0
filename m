From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 26 Mar 2015 06:57:06 +0200
Subject: [Buildroot] [PATCH] jsoncpp: fix build
In-Reply-To: <20150325004703.17cf63b2@free-electrons.com>
References: <d6210b774fe3742376af62da3878a787570309be.1427214171.git.baruch@tkos.co.il>
 <20150325004703.17cf63b2@free-electrons.com>
Message-ID: <20150326045706.GE2825@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Mar 25, 2015 at 12:47:03AM +0100, Thomas Petazzoni wrote:
> On Tue, 24 Mar 2015 18:22:51 +0200, Baruch Siach wrote:
> > +snprintf() is not in the std namespace. This fixes the build error below:
> > +
> > +src/lib_json/json_writer.cpp:33:18: error: 'snprintf' is not a member of 'std'
> 
> Well, in C++11, snprintf *is* in the std:: namespace. See
> http://en.cppreference.com/w/cpp/io/c/fprintf. However, if we can get
> along without using std::snprintf() and use the C library snprintf()
> instead as a work-around in Buildroot, then it's all great for me.
> 
> But it would require a reworking of your patch, along the lines of:
> 
> std::snprintf() is only available in C++11, which is not provided by
> all compilers. Since the C library snprintf() can easily be used as a
> replacement on Linux systems, this patch changes jsoncpp to use the C
> library snprintf() instead of C++11 std::snprintf().

Thanks for the hint. I'll send an updated pull request, and update this patch.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
