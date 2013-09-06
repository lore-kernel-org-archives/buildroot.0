From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 6 Sep 2013 11:35:39 +0200
Subject: [Buildroot] [RFCv1 02/11] toolchain-crosstool-ng: remove support
In-Reply-To: <1378416469-17708-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378416469-17708-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20130906093539.GB3271@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-09-05 23:27 +0200, Thomas Petazzoni spake thusly:
> In order to avoid the work of converting the toolchain-crosstool-ng
> logic to the package infrastructure, we remove it from Buildroot,
> since it has been deprecated since quite some time.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> If we consider it too early to get rid of the Crosstool-NG backend
> entirely, then it can of course be converted to the package
> infrastructure, with quite a bit of effort (which we wanted to avoid
> for now).

I don't care we remove it.

One of the blocking points that users were concerned about was to be
able to generate glibc/eglibc-based toolchains directly from within
Buildroot, hence some chimed in to keep the crosstool-NG backend.

Now that Buildroot can buid glibc/eglibc-based toolchain with its
internal backend, I see no reason to keep the crosstool-Ng backend at
all. So:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

As I said in a recently-posted patch (changes the manual to state the
crosstool-NG backend was deprecated), people that really want to use
crosstool-Ng can still do so outside of Buildroot, and use that
toolchain as an external toolchain.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
