From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Jan 2012 09:44:09 +0100
Subject: [Buildroot] [PATCH 02/14] Add the Atom processor in the list of
	supported x86/x86_64 processors
In-Reply-To: <d0643d15e126a270c3d8b60593f620579a4e4b83.1325622133.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 3 Jan 2012 21:22:43 +0100")
References: <cover.1325622133.git.thomas.petazzoni@free-electrons.com>
 <cover.1325622133.git.thomas.petazzoni@free-electrons.com>
 <d0643d15e126a270c3d8b60593f620579a4e4b83.1325622133.git.thomas.petazzoni@free-electrons.com>
Message-ID: <874nwbc0x2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This allows to easily select the corresponding Atom multilib variant
 Thomas> in the Sourcery CodeBench toolchain.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  target/Config.in.arch |   10 ++++++++++
 Thomas>  1 files changed, 10 insertions(+), 0 deletions(-)

 Thomas> diff --git a/target/Config.in.arch b/target/Config.in.arch
 Thomas> index 7faa010..b5ff694 100644
 Thomas> --- a/target/Config.in.arch
 Thomas> +++ b/target/Config.in.arch
 Thomas> @@ -266,6 +266,8 @@ config BR2_x86_nocona
 Thomas>  	bool "nocona"
 Thomas>  config BR2_x86_core2
 Thomas>  	bool "core2"
 Thomas> +config BR2_x86_atom
 Thomas> +	bool "atom"

Atom support was only added to GCC in 4.5, so please add a comment
mentioning this similar to how we do it for Cortex A8/A9.

-- 
Bye, Peter Korsgaard
