From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Jan 2019 18:07:30 +0100
Subject: [Buildroot] [PATCH v2 1/1] test-pkg: Force checking
 dependencies.
In-Reply-To: <20190102154920.116641-1-aduskett@gmail.com>
References: <20190102154920.116641-1-aduskett@gmail.com>
Message-ID: <20190103180730.40579a47@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 Jan 2019 10:49:20 -0500, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Currently, if a user runs "make" while specifying a specific package
> (IE: make -p foo),  the Makefile logic skips checking to see if all the
> dependencies are selected in the specified packages config file. This behavior
> is useful to test simple packages which do not have "complex" dependencies.
> 
> However; if a developer uses test-pkg -p ${package_name} to check their package,
> the package may pass all the checks, but would have otherwise failed with a
> simple "make" because the developer may have failed to add a select line in
> packages config file, even if there is a new dependency in the packages
> Makefile.
> 
> Pass the environment variable "BR_FORCE_CHECK_DEPENDENCIES"  to the Makefile in
> the test-pkg script,  and check it's value in the Makefile. If the value is
> "YES" force checking for dependency issues.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Change FORCE_CHECK_DEPENDENCIES to BR_FORCE_CHECK_DEPENDENCIES (Thomas)
>   - Only set BR_FORCE_CHECK_DEPENDENCIES=YES on line 155 of test-pkg (Yann)

Applied to master, thanks. Note: for the commit title, please use
"utils/test-pkg" for the prefix, and don't use an uppercase letter
after the prefix. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
