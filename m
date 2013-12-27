From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 27 Dec 2013 12:01:19 +0200
Subject: [Buildroot] Analysis of build failures, december 26th
In-Reply-To: <20131227103511.2c218d17@skate>
References: <20131227073009.1283F101A83@stock.ovh.net>
 <20131227103511.2c218d17@skate>
Message-ID: <20131227100118.GF3873@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Dec 27, 2013 at 10:35:11AM +0100, Thomas Petazzoni wrote:
> >     xtensa |                      m4-1.4.17 | NOK | 
> >     http://autobuild.buildroot.net/results/75e4b40443852424bf1841c11501de4dcd85cc08/
> 
> uClibc issue on Xtensa? Baruch?
> 
> spawn_faction_addclose.c: In function 'posix_spawn_file_actions_addclose':
> spawn_faction_addclose.c:50:19: error: 'posix_spawn_file_actions_t' has no member named '_used'
> spawn_faction_addclose.c:50:42: error: 'posix_spawn_file_actions_t' has no member named '_allocated'
> spawn_faction_addclose.c:59:24: error: 'posix_spawn_file_actions_t' has no member named '_actions'
> spawn_faction_addclose.c:59:47: error: 'posix_spawn_file_actions_t' has no member named '_used'
> spawn_faction_addclose.c:64:19: error: 'posix_spawn_file_actions_t' has no member named '_used'

Not xtensa specific, but uClibc related (missing -lrt; all uClibc version are 
affected). See http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/72570. 
For some reason, however, the autobuilder selects the m4 package mostly for 
xtensa and sometimes also arc.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
