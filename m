From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Mar 2020 15:08:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/lz4: annotate CVE-2014-4715
In-Reply-To: <20200328095138.959798-1-fontaine.fabrice@gmail.com>
References: <20200328095138.959798-1-fontaine.fabrice@gmail.com>
Message-ID: <20200328150827.64a9f714@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Matt Weber and Akshay Bhat to discuss this issue.

On Sat, 28 Mar 2020 10:51:38 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> CVE-2014-4715 is misclassified (by our CVE tracker) as affecting
> version 1.9.2, while in fact this issue has been fixed since lz4-r130:
> https://github.com/lz4/lz4/commit/140e6e72ddb6fc5f7cd28ce0c8ec3812ef4a9c08
> 
> See https://github.com/lz4/lz4/issues/818
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

So I've applied this patch, but what can we do to fix this properly?
The NVD database says that versions < r118 are affected, but of course
with the project having changed its numbering scheme (current version
is 1.9.2), making comparisons is difficult.

Indeed, after r131, the next version was v1.7.3. Can we ask the NVD
maintainers to indicate that versions earlier than v1.7.3 are
vulnerable ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
