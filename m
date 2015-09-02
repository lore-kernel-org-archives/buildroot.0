From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 2 Sep 2015 13:10:35 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-09-01
In-Reply-To: <20150902063014.24B5E101990@stock.ovh.net>
References: <20150902063014.24B5E101990@stock.ovh.net>
Message-ID: <55E6E73B.4070608@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 09/02/2015 07:30 AM, Thomas Petazzoni wrote:
> Build statistics for 2015-09-01

>         mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/8a2cf84cc120db42e098aaabe2b2e93590481dc3/
>         mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/ff084dae46567d3e174992ae3f77d6367682c171/
>     mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/0699ee0963c0f15b6069861f85b2534310a97b77/

Fixed by the patch for the Mentor toolchain (the missing lib-names
headers for soft-float):

http://patchwork.ozlabs.org/patch/507916/

Could we please make a decision on this patch? I know you think it's
ugly, but it makes no sense to just let that patch waiting in the queue.
We need to decide is we accept this patch or not. Added Peter on CC as
he may want to comment something on this.

>         mips |                   udisks-1.0.4 | NOK | http://autobuild.buildroot.net/results/ab36c2a1d2ca41a4d9ec6bab7d8d45678dbc5dcd/
>          arm |                   udisks-1.0.4 | NOK | http://autobuild.buildroot.net/results/e5bf611b6870f55082a892a2e5536cf11af81273/

Fixed by:

http://patchwork.ozlabs.org/patch/513475/
http://patchwork.ozlabs.org/patch/513476/

>     mips64el |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/c8ea1cab0a1ee081f9bca994ff5309ea0117d692/

This issue was reported upstream although nobody patched the code yet:

https://bugs.webkit.org/show_bug.cgi?id=128971

Fixed by:

http://patchwork.ozlabs.org/patch/513505/

Regards,

Vincent.
