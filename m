From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Jan 2021 23:13:43 +0100
Subject: [Buildroot] [PATCH 4/4] package/environment-setup: fix spelling
 of the script file in the manual.
In-Reply-To: <20210103172955.2424617-1-konrad.schwarz@siemens.com>
References: <20201231212949.2415485-2-konrad.schwarz@siemens.com>
 <20210103172955.2424617-1-konrad.schwarz@siemens.com>
Message-ID: <dcff61f6-8fd1-cb59-5417-471d099125c6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/01/2021 18:29, Konrad Schwarz wrote:
> My previous patch of the same name was erroneous;
> the name of the setup file was actually spelled correctly
> in one of two instances, and reversed in the other;
> I mistakingly reversed the order in both instances.
> 
> Signed-off-by: Konrad Schwarz <konrad.schwarz@siemens.com>

 When you fix a patch that hasn't been applied yet, please don't send a patch on
top of the previous one. Instead, squash the two and just send the final patch.
Which in this case would be:

commit 7197b1bc44395cbe927dc56f0b7fc53d8ce07636 (HEAD -> master)
Author: Konrad Schwarz <konrad.schwarz@siemens.com>
Date:   Thu Dec 31 22:29:47 2020

    package/environment-setup: fix spelling of the script file in the manual.

    The manual incorrectly refers to the script file as `setup-environment';
    it is actually called `environment-setup'.

    Signed-off-by: Konrad Schwarz <konrad.schwarz@siemens.com>
    Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
    Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

diff --git a/docs/manual/using-buildroot-toolchain.txt
b/docs/manual/using-buildroot-toolchain.txt
index 110be5939f..09408ef05a 100644
--- a/docs/manual/using-buildroot-toolchain.txt
+++ b/docs/manual/using-buildroot-toolchain.txt
@@ -35,7 +35,7 @@ generating a tarball.

 For your convenience, by selecting the option
 +BR2_PACKAGE_HOST_ENVIRONMENT_SETUP+, you can get a
-+setup-environment+ script installed in +output/host/+ and therefore
++environment-setup+ script installed in +output/host/+ and therefore
 in your SDK.  This script can be sourced with
 +. your/sdk/path/environment-setup+ to export a number of environment
 variables that will help cross-compile your projects using the



 Also, make sure that the commit message doesn't contain "personal" messages
like "I mistakingly reversed the order".


 I fixed all of that and applied to master, thanks.

> ---
> Interdiff:
>   diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.txt
>   index e202c7d09b..09408ef05a 100644
>   --- a/docs/manual/using-buildroot-toolchain.txt
>   +++ b/docs/manual/using-buildroot-toolchain.txt
>   @@ -37,7 +37,7 @@ For your convenience, by selecting the option
>    +BR2_PACKAGE_HOST_ENVIRONMENT_SETUP+, you can get a
>    +environment-setup+ script installed in +output/host/+ and therefore
>    in your SDK.  This script can be sourced with
>   -+. your/sdk/path/setup-environment+ to export a number of environment
>   ++. your/sdk/path/environment-setup+ to export a number of environment
>    variables that will help cross-compile your projects using the
>    Buildroot SDK: the +PATH+ will contain the SDK binaries, standard
>    _autotools_ variables will be defined with the appropriate values, and

 This interdiff is actually interesting - but here you actually just copied the
patch that is just below...


 Regards,
 Arnout

> 
>  docs/manual/using-buildroot-toolchain.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.txt
> index e202c7d09b..09408ef05a 100644
> --- a/docs/manual/using-buildroot-toolchain.txt
> +++ b/docs/manual/using-buildroot-toolchain.txt
> @@ -37,7 +37,7 @@ For your convenience, by selecting the option
>  +BR2_PACKAGE_HOST_ENVIRONMENT_SETUP+, you can get a
>  +environment-setup+ script installed in +output/host/+ and therefore
>  in your SDK.  This script can be sourced with
> -+. your/sdk/path/setup-environment+ to export a number of environment
> ++. your/sdk/path/environment-setup+ to export a number of environment
>  variables that will help cross-compile your projects using the
>  Buildroot SDK: the +PATH+ will contain the SDK binaries, standard
>  _autotools_ variables will be defined with the appropriate values, and
> 
