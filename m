From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 3 Nov 2016 14:19:07 +0200
Subject: [Buildroot] [PATCH 1/1] berkeleydb: fix build on powerpc64le
In-Reply-To: <20161103055805.z67aqczyccsgmnax@tarshish>
References: <8e91fa81e0236517f95907ca16ac00830306854a.1478151515.git.sam.bobroff@au1.ibm.com>
 <20161103055805.z67aqczyccsgmnax@tarshish>
Message-ID: <20161103121907.3axoqgm4m5ftyiyb@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sam,

On Thu, Nov 03, 2016 at 07:58:05AM +0200, Baruch Siach wrote:
> On Thu, Nov 03, 2016 at 04:38:41PM +1100, Sam Bobroff wrote:
> > ++	  ppc64le-*linux*|powerpc64le-*linux*)
> > ++	    LD="${LD-ld} -m elf64lppc"
> > ++	    ;;
> > + 	  ppc*-*linux*|powerpc*-*linux*)
> 
> This is strange. This older pattern looks like a superset of your new pattern. 
> Why doesn't it work?
> 
> > + 	    LD="${LD-ld} -m elf64ppc"
> > + 	    ;;

I missed the distinction between elf64ppc and elf64lppc.

Sorry for the noise.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
