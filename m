From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 16:33:38 +0100
Subject: [Buildroot] [PATCH for-next 2/3] package/google-breakpad:
 switch to the new git repository
In-Reply-To: <1480263400-29605-2-git-send-email-romain.naour@gmail.com>
References: <1480263400-29605-1-git-send-email-romain.naour@gmail.com>
 <1480263400-29605-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20161217163338.09450a8c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Nov 2016 17:16:39 +0100, Romain Naour wrote:
> Google-breakpad moved to a new git repository last year and the old svn
> repository has been deleted. So, the Buildroot archive mirror is used.
> 
> svn: E160013: Unable to connect to a repository at URL 'http://google-breakpad.googlecode.com/svn/trunk'
> svn: E160013: '/svn/trunk' path not found
> --2016-11-27 10:42:34--  http://sources.buildroot.net/google-breakpad-1373.tar.gz
> 
> Swith to the git repository using the git hash corresponding to the
> 1373 svn revision. But there is an issue with the third parties...
> Some of them are not bundled with Google-breakpad or as git submodule.
> Even worst, the google-breakpad source code use #include
> "third_party/lss" directly, so we can't provide missing third parties
> with an external package.
> 
> That's why the linux-syscall-support package was added to Buildroot,
> it provide the missing linux_syscall_support.h file which is must be
> copied to src/third_party/lss/ in the Google-breakpad sources.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Pascal Huerst <pascal.huerst@gmail.com>
> Cc: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/google-breakpad/Config.in            |  3 ++-
>  package/google-breakpad/google-breakpad.hash |  2 ++
>  package/google-breakpad/google-breakpad.mk   | 25 +++++++++++++++++++++----
>  3 files changed, 25 insertions(+), 5 deletions(-)
>  create mode 100644 package/google-breakpad/google-breakpad.hash

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
