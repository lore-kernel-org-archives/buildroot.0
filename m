From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 5 Jun 2014 20:05:39 +0300
Subject: [Buildroot] autoconf caching
In-Reply-To: <CAE9DZUT8+z0NF5O6sh=y4svCfQW0bh1Zt4r7OM9fe9nYvk-O0w@mail.gmail.com>
References: <CAE9DZUT8+z0NF5O6sh=y4svCfQW0bh1Zt4r7OM9fe9nYvk-O0w@mail.gmail.com>
Message-ID: <20140605170539.GP4193@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dallas,

On Thu, Jun 05, 2014 at 11:34:41AM -0500, Dallas Clement wrote:
> Hi All - I have seen posts on this subject before.  It looks like things
> flamed out.
> 
> http://lists.gnu.org/archive/html/autoconf/2012-11/msg00022.html
> 
> I'm getting killed by autoconf.  My builds take 1.5 hours even with ccache
> turned on.  Most of the cores in my very impressive build machine are
> sitting on their !#@ while autoconf is running.  Most of my packages rely
> on autotools and it seems that most of the time spent is running configure
> scripts.
> 
> Can anyone offer some advice on how to speed things up with autoconf?  Or
> is it a lost cause?

You may try to enable parallel build which is disabled by default. Look for 
'.NOTPARALLEL:' in the top level Makefile. Make sure to read the comment above 
it.

Hope this helps.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
