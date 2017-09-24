From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 12:53:15 +0200
Subject: [Buildroot] [PATCH 7/9] orbit: mark as only with Lua 5.1
In-Reply-To: <20170924075932.5990-7-francois.perrad@gadz.org>
References: <20170924075932.5990-1-francois.perrad@gadz.org>
 <20170924075932.5990-7-francois.perrad@gadz.org>
Message-ID: <167c5922-9e23-3ac2-45c1-ba7e142108e5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-09-17 09:59, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>


 Applied to master, thanks.

 I was looking for an autobuild failure, but of course we only test Lua 5.1 in
the autobuilders. If you feel up to it, you could add a randomizer for the Lua
version to utils/genrandconfig.

 Regards,
 Arnout

> ---
>  package/orbit/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/orbit/Config.in b/package/orbit/Config.in
> index 2953499e7..c35c475e8 100644
> --- a/package/orbit/Config.in
> +++ b/package/orbit/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_ORBIT
>  	bool "orbit"
> +	depends on BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
>  	# These are runtime dependencies
>  	select BR2_PACKAGE_LPEG
>  	select BR2_PACKAGE_LUAFILESYSTEM
> @@ -9,3 +10,7 @@ config BR2_PACKAGE_ORBIT
>  	  Ruby frameworks such as Camping
>  
>  	  http://keplerproject.github.com/orbit
> +
> +comment "orbit needs a Lua 5.1 interpreter"
> +	depends on !BR2_PACKAGE_LUA_5_1
> +	depends on !BR2_PACKAGE_LUAJIT
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
