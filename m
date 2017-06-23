From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 23 Jun 2017 15:19:27 +0300
Subject: [Buildroot] [PATCH] lirc-tools: bump to version 0.9.4d
In-Reply-To: <190922362f7ee894f85b971407a1012b0661294f.1498192162.git.baruch@tkos.co.il>
References: <190922362f7ee894f85b971407a1012b0661294f.1498192162.git.baruch@tkos.co.il>
Message-ID: <20170623121927.4j27refc2rxg7tvr@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi list,

On Fri, Jun 23, 2017 at 07:29:22AM +0300, Baruch Siach wrote:
> Drop 0001-tools-make_rel_symlink.py-can-also-use-python2.patch. Build requires
> host-python3 since the previous version bump.
> 
> Drop upstream 0002-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch.
> 
> Set HAVE_WORKING_POLL to skip poll(2) run test that is not compatible with
> cross compilation.
> 
> Add optional dependency on libftdi1.

Unfortunately, this breaks with musl because of a local _POLL_H header guard 
macro definition. Marked as Rejected for now. Will send an updated patch.

> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
