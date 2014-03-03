From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 3 Mar 2014 11:10:27 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140303090219.65a08cc7@skate>
References: <20140303073010.B46B51015B7@stock.ovh.net>
 <20140303090219.65a08cc7@skate>
Message-ID: <20140303091027.GP3874@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Mar 03, 2014 at 09:02:19AM +0100, Thomas Petazzoni wrote:
> On Mon,  3 Mar 2014 08:30:10 +0100 (CET), Thomas Petazzoni wrote:
> 
> >     xtensa |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/bc20297dad0f0e9b7fa79fe835b9754fbce6dfdf/
> 
> spawn_faction_adddup2.c: In function 'posix_spawn_file_actions_adddup2':
> spawn_faction_adddup2.c:50:19: error: 'posix_spawn_file_actions_t' has no member named '_used'
> spawn_faction_adddup2.c:50:42: error: 'posix_spawn_file_actions_t' has no member named '_allocated'
> spawn_faction_adddup2.c:59:24: error: 'posix_spawn_file_actions_t' has no member named '_actions'
> spawn_faction_adddup2.c:59:47: error: 'posix_spawn_file_actions_t' has no member named '_used'
> spawn_faction_adddup2.c:65:19: error: 'posix_spawn_file_actions_t' has no member named '_used'
> make[5]: *** [spawn_faction_adddup2.o] Error 1
> 
> Chris, Baruch, Max, an idea?

This is the same problem coreutils had, which was fixed by commit a728e2fe3 
(coreutils: fix build against uclibc snapshot). Just sent the same fix for 
wget.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
