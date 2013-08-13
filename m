From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 10:42:40 +0200
Subject: [Buildroot] [PATCH v2] ltrace: Explicit enable/disable of
 libunwind
In-Reply-To: <1376382697-24789-1-git-send-email-jezz@sysmic.org>
References: <1376382697-24789-1-git-send-email-jezz@sysmic.org>
Message-ID: <20130813104240.1b3a3aa2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue, 13 Aug 2013 10:31:37 +0200, J?r?me Pouiller wrote:
> ltrace automatically uses libunwind if detected. So depending if libunwind was
> already compiled or not, ltrace compiles differently. This patch adds explicit
> dependency to libunwind if detected.
> 
> In add, due to limitation of uclibc, ltrace cannot use libunwind with uclibc.
> This patch explicitly compile without libunwind in this case.
> 
> Resolve issues detected here:
>     http://autobuild.buildroot.net/results/79dae85647526cdeddae5050db0339fbc38c9ae6
>     http://autobuild.buildroot.net/results/808569f6bfac059b57eb4f1e692fbc9909e791cf
>     http://autobuild.buildroot.net/results/83d0cd13d64053869708c666e2aa533202af67f7
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Argh, sorry, this was too late. In the mean time, Gustavo submitted a
similar patch, which I committed just minutes ago.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
