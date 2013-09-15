From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Sep 2013 07:17:19 +0200
Subject: [Buildroot] [PATCHv2 0/4] Add a BR2_EXTERNAL mechanism
In-Reply-To: <20130914223044.GB3444@free.fr>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20130914223044.GB3444@free.fr>
Message-ID: <20130915071719.10f6a24b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 15 Sep 2013 00:30:44 +0200, Yann E. MORIN wrote:

> I see at least one case where it will help. Let's suppose I decide to
> distribute my Buildroot tree *and* my external tree. I decide to do so
> as thus:
>     $ tar tf project.tar
>     project/
>     project/buildroot/
>     project/buildroot/all-buildroot-files-and-dirs
>     project/buildroot/.config
>     project/external/
>     project/external/all-external-files-and-dirs
> 
> and project/buildroot/.config would contain BR2_EXTERNAL="../external"
> so the recipient would just have to run make withour hurdles.

The BR2_EXTERNAL value is *NOT* stored in .config. It must be passed as
an environment variable, so in the case you describe above, you would
have to distribute project.tar, with a small document that says:

""
To build the stuff:

  1/ cd project/buildroot/
  2/ make BR2_EXTERNAL=../external
""

The fact that BR2_EXTERNAL is *not* part of the .config has already
been discussed in the thread of the previous version. The "config
BR2_EXTERNAL" option is prompt-less and therefore the value of this
variable is not stored in .config.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
