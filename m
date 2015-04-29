From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 29 Apr 2015 07:30:08 +0300
Subject: [Buildroot] [PATCH] freerdp: fix build with uclibc snapshot and
 uclibc-ng
In-Reply-To: <XnsA48AE66F8143FberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <6282ca49ebfb65c9399eeedcac6a3d69038d2690.1430250053.git.baruch@tkos.co.il>
 <XnsA48AE66F8143FberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20150429043008.GA2258@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Tue, Apr 28, 2015 at 10:39:10PM +0200, Bernd Kuhls wrote:
> Baruch Siach <baruch@tkos.co.il> wrote in
> news:6282ca49ebfb65c9399eeedcac6a3d69038d2690.1430250053.git.baruch at tkos.co.il: 
> > uclibc snapshot and uclibc-ng add support for the eventfd_{read,write}
> > glibc extensions. Refine our uClibc support patch to take this into
> > account, based on upstream suggested PR.
> 
> what about adding eventfd_read() and eventfd_write() to 
> package/uclibc/0.9.33.2/? This function is needed by upcoming Kodi 15.0 
> Isengard as well and will be part[1] of my next RFC-patch series when beta1 
> of the next Kodi version will be released.
> 
> [1] In fact it is the 2nd try ;) http://patchwork.ozlabs.org/patch/402957/

Buildroot generally does not add feature patches to packages. This is 
something to discuss with upstream. Alternatively, you may add 
eventfd_{read,write} to Kodi (upstream) to be used as needed, just like 
freerdp does.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
