From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 09:48:15 +0200
Subject: [Buildroot] [PATCH] fix broken path in arm_toolchain_defconfig
In-Reply-To: <AANLkTinRRSrYrySzAmiv7zEqUAW_L60IY7bgRH2ZQlHP@mail.gmail.com>
References: <AANLkTikVbjYf9S-NaAT2Op_js9h00nnH020Y-NHTJ7Wc@mail.gmail.com>
	<20100519133428.164d6234@surf>
	<AANLkTinRRSrYrySzAmiv7zEqUAW_L60IY7bgRH2ZQlHP@mail.gmail.com>
Message-ID: <20100521094815.2513c09a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 21 May 2010 15:12:13 +0800
Chih-Min Chao <cmchao@gmail.com> wrote:

> So, should I generate the patch by "git format-patch --signoff
> revision_range" ??

It is usually at commit time that the signed-off line is added, by
doing :

  git commit -s

instead of just

  git commit

Typical very basic work-flow :

 # Assuming you are on master

 # Create a new branch for your work and switch to this branch
 git checkout -b mywork

 # Hack hack hack

 # Commit your work (supposing you want to all changes in a single
 # commit, which may or may not be appropriate)
 git commit -a -s

 # Format the patch (or patches)
 git format-patch master

 # Send the patch
 git send-email --to buildroot at uclibc.org *.patch

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
