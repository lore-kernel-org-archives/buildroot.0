From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Oct 2012 11:37:10 +0200
Subject: [Buildroot] [PATCH v9 06/10] cpanminus: new package
In-Reply-To: <1349531633-26717-6-git-send-email-francois.perrad@gadz.org>
References: <1349531633-26717-1-git-send-email-francois.perrad@gadz.org>
 <1349531633-26717-6-git-send-email-francois.perrad@gadz.org>
Message-ID: <20121008113710.4d01376c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Sat,  6 Oct 2012 15:53:49 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                        |    5 ++++
>  package/cpanminus/Config.in              |   36 +++++++++++++++++++++++
>  package/cpanminus/cpanminus.mk           |   46 ++++++++++++++++++++++++++++++
>  package/perl/perl-fix-Module-Build.patch |   16 +++++++++++
>  4 files changed, 103 insertions(+)
>  create mode 100644 package/cpanminus/Config.in
>  create mode 100644 package/cpanminus/cpanminus.mk
>  create mode 100644 package/perl/perl-fix-Module-Build.patch

One thing that I'm wondering with cpanminus is how it interacts with
the Buildroot mechanisms for download.

I.e :

 *) Where does cpanminus downloads the Perl module tarballs?

 *) Does it re-use the downloaded tarballs between rebuilds?

 *) Is there a way to tell it to download its tarballs in $(DL_DIR) ?

 *) Is there a way to have "make source" work properly, i.e ask
    cpanminus to download the tarballs that it will need so that
    offline builds are possible.

 *) Is it possible to make it play nice with BR2_PRIMARY_SITE ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
