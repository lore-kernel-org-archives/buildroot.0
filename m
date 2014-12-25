From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 25 Dec 2014 06:47:59 +0200
Subject: [Buildroot] AC_CHECK_LIB doesn't work for cross-compiling
In-Reply-To: <549B93F3.7020602@infipwr.com>
References: <549B93F3.7020602@infipwr.com>
Message-ID: <20141225044759.GE6400@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Thu, Dec 25, 2014 at 01:34:59PM +0900, Adam Jiang wrote:
> I am trying to add a new package to buildroot. the package is built upon
> autotools. thus, it is supposed to be very easy to make it
> cross-compilable. ever, i got suck at AC_CHECK_LIB macro. it doesn't
> work well at cross-compiling while it does work on normal compiling.
> 
> AC_CHECK_LIB([fcgi], [FCGX_InitRequest], [AC_MSG_WARN("unable to find
> the FCGX_InitRequest() function")])
> 
> always failed even though I do have libfcgi in my configuration. The
> error message looks like
> 
> checking for FCGX_InitRequest in -lfcgi... no
> configure: WARNING: unable to find the FCGX_InitRequest() function
> 
> I don't think AC_CHECK_LIB will not work on cross-compiling because it
> seems there are lots of other target packages in buildroot using the
> macro. Most probably, I am doing something wrong.
> 
> Does AC_CHECK_LIB work in buildroot? If the macro needs some changes,
> how could I do it?

What do you have in config.log for the FCGX_InitRequest check?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
