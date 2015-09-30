From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Sep 2015 12:35:19 +0200
Subject: [Buildroot] [PATCH v2] glmark2: depend on host-python
In-Reply-To: <1443550251-30965-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1443550251-30965-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150930123519.7c64e19c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 29 Sep 2015 19:10:51 +0100, Vicente Olivert Riera wrote:
> The waf build system of glmark2 needs Python 2 as stated on its README
> file:
> 
> python 2.x (>= 2.4) for the build system (waf)
> 
> Building it with a system with Python 3 as the default Python version
> will result on a failure like this one:
> 
> File "waflib/Utils.py", line 199
>     except OSError ,e:
>                    ^
> SyntaxError: invalid syntax
> 
> So, in order to fix this, make this package depending on host-python and
> also run the waf script using $(HOST_DIR)/usr/bin/python2.
> 
> At the same time delete 3 Python environment variables passed to the waf
> script during the configure phase which it seems there aren't needed for
> anything.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/fc6/fc6cd2a90bbb0e6f80f6c4afaae1430f82e54046/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v1 -> v2:
>   - Delete the 3 Python environment variables that are passed to the waf
>     script during the configure phase, as it seems they aren't needed
>     for anything. (Suggested by Thomas Petazzoni)

Applied, thanks. Let's see what happens in the autobuilders :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
