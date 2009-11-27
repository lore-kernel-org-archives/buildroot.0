From: Joachim Pihl <jpihl@nevion.com>
Date: Fri, 27 Nov 2009 19:41:43 +0100
Subject: [Buildroot] 2009.11-rc1 build failure
In-Reply-To: <87k4xb6dk2.fsf@macbook.be.48ers.dk>
References: <op.u3z7srteyqa4qb@jap-lappis> <873a419x3e.fsf@macbook.be.48ers.dk>
	<op.u31nbqpqyqa4qb@jap-lappis.nevion.com>
	<87eink70bd.fsf@macbook.be.48ers.dk> <op.u32e97xjyqa4qb@jap-lappis>
	<87k4xb6dk2.fsf@macbook.be.48ers.dk>
Message-ID: <op.u32gvtv4yqa4qb@jap-lappis>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 27 Nov 2009 19:13:49 +0100, Peter Korsgaard <jacmet@uclibc.org>  
wrote:

>>>>>> "Joachim" == Joachim Pihl <jpihl@nevion.com> writes:
>
> [Please keep communication on the list instead of mailing me directly]
>

Sorry for that, the mailing list is set up with reply-to the original  
author. I habitually do NOT send a reply-to-all, and I didn't catch the  
error until a few minutes after I sent it.

>  >> Notice that your kernel headers version doesn't need to be the same  
> as
>  >> the kernel version you're using.
>
>  Joachim> Noted. Tried punching in 2.6.27.x, that failed miserably, but
>  Joachim> 2.6.27.39  worked - all the way up to the next hiccup:
>
> Failed in what way? Please provide more details so we can fix the
> problem if there is one.

...
flex installed:					Ok
gettext installed:				Ok
makeinfo installed:				Ok
patch installed:				Ok
Build system dependencies:			Ok

rm -rf  
/home/jpihl/system_controller/buildroot-2009.11_rc1/output/build/buildroot-config
mkdir -p /home/jpihl/system_controller/buildroot-2009.11_rc1/output/build
cp -dpRf package/config/buildroot-config  
/home/jpihl/system_controller/buildroot-2009.11_rc1/output/build/buildroot-config
--2009-11-27 19:38:34--   
http://www.kernel.org/pub//linux/kernel/v2.6//linux-2.6.27.x.tar.bz2
Resolving www.kernel.org... 130.239.17.4
Connecting to www.kernel.org|130.239.17.4|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2009-11-27 19:38:34 ERROR 404: Not Found.

--2009-11-27 19:38:34--   
http://buildroot.net/downloads/sources//linux-2.6.27.x.tar.bz2
Resolving buildroot.net... 140.211.167.224
Connecting to buildroot.net|140.211.167.224|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2009-11-27 19:38:35 ERROR 404: Not Found.

make: *** [dl/linux-2.6.27.x.tar.bz2] Error 1


I may have misunderstood something here...


>  Joachim> OProfile does not want to build, and a brief search in the
>  Joachim> config menus didn't reveal any options containing "bfd". As
>  Joachim> far as I could tell from the OProfile pages, it should work
>  Joachim> for the PXA processors?
>
> The oprofile package hasn't seen any updates in a very long time (and I
> don't use it myself), so chances are that it is broken.
>
> I'll take a look now.
>


-- 
Using Opera's revolutionary e-mail client: http://www.opera.com/mail/
