From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 15:46:01 +0100
Subject: [Buildroot] [PATCH v5 1/1] gauche: new package
In-Reply-To: <201511041340.tA4DeS3s025833@ms-omx01.plus.so-net.ne.jp>
References: <201511041340.tA4DeS3s025833@ms-omx01.plus.so-net.ne.jp>
Message-ID: <20151104154601.05336c0e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hiroshi Kawashima,

On Wed, 04 Nov 2015 22:40:27 +0900, Hiroshi Kawashima wrote:
> Gauche is an R7RS Scheme implementation developed to be a handy script
> interpreter, which allows programmers and systemadministrators to write
> small to large scripts for their daily chores. Quick startup, built-in
> system interface, native multilingual support are some of its goals.
> 
> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
> Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v4 -> v5 (refelect comment from Thomas)
> - 2 patches for configure and configure.ac -> single patch.
> - improve explanation why we need to specify -std=gnu99 in GAUCHE_CONF_ENV.

Applied, thanks.

Could you:

 1/ Submit the gauche patch to the upstream project?

 2/ Look if all the gauche-* binaries installed on the target are
    really useful? At least gauche-config and gauche-package look
    unnecessary, since gauche-config is used to get compiler/linker
    flags which is not needed on the target as we don't have a
    compiler, and gauche-package is used to build/install additional
    gauche packages, which also isn't possible since we don't have a
    compiler on the target. You can submit a patch that implements a
    post install target hook to remove the non-needed programs.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
