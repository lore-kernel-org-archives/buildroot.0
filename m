From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:47:14 +0200
Subject: [Buildroot] [PATCH v2 1/5] python,
 python3: add patch to prevent distutils from adjusting the shebang
In-Reply-To: <1411034455-19670-2-git-send-email-cvubrugier@fastmail.fm>
References: <1411034455-19670-1-git-send-email-cvubrugier@fastmail.fm>
 <1411034455-19670-2-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <20140921194714.308ca976@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On Thu, 18 Sep 2014 12:00:51 +0200, Christophe Vu-Brugier wrote:
> The copy_scripts() method in distutils copies the scripts listed
> in the setup file and adjusts the first line to refer to the
> current Python interpreter. When cross-compiling, this means that
> the adjusted shebang refers to the host Python interpreter.
> 
> As a consequence, we add a patch for python and python3 that
> force copy_scripts() to preserve the shebang when
> cross-compilation is detected.
> 
> Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> ---
>  ...017-distutils-scripts-dont-adjust-shebang.patch | 25 ++++++++++++++++++++++
>  ...015-distutils-scripts-dont-adjust-shebang.patch | 25 ++++++++++++++++++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 package/python/python-017-distutils-scripts-dont-adjust-shebang.patch
>  create mode 100644 package/python3/python3-015-distutils-scripts-dont-adjust-shebang.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
