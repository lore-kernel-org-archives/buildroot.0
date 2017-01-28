From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 21:46:49 +1300
Subject: [Buildroot] [V3 01/10] janus-gateway: remove unessasary
 dependencies.
In-Reply-To: <20170125134245.12920-1-aduskett@codeblue.com>
References: <20170125134245.12920-1-aduskett@codeblue.com>
Message-ID: <20170128214649.0dd28fa7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Jan 2017 08:42:36 -0500, Adam Duskett wrote:
> Janus gateway currently depends on several dependencies that are not
> necessary.  I removed every select and depend from the config file and
> re-enabled each dependency until I had a list of the bare minimum needed
> to compile the package.  I also removed sofia-sip from the dependency
> list for the following patch.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>
> ---
> v2 - v3:
>  - No changes

I've applied the entire series. One thing that was wrong is that you
added the "select" statements *before* the "bool" statements in the
Config.in file, while we do the opposite in the rest of Buildroot. So
I've fixed that up.

I've also added a commit that fixes an autobuilder issue caused by the
streaming plugin requiring kernel headers >= 3.9 because of
SO_REUSEPORT.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
