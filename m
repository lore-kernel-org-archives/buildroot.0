From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 9 Jun 2019 23:40:21 +0200
Subject: [Buildroot] [PATCH] package/luarocks: fix test file creation on
 br-external
In-Reply-To: <20190609143733.4136-1-francois.perrad@gadz.org>
References: <20190609143733.4136-1-francois.perrad@gadz.org>
Message-ID: <6aa32760-69b5-891f-c67d-bbcf81ac61a4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/06/2019 16:37, Francois Perrad wrote:
> first, add the creation of the needed subdirectories
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/luarocks/buildroot.lua | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/luarocks/buildroot.lua b/package/luarocks/buildroot.lua
> index 39f0fe759..35223c119 100644
> --- a/package/luarocks/buildroot.lua
> +++ b/package/luarocks/buildroot.lua
> @@ -400,6 +400,8 @@ function buildroot.command(flags, rockname, fsname)
>     generate_mk(rockspec, fsname:lower(), licenses)
>     generate_hash(rockspec, fsname:lower(), rock_file, licenses, digest)
>     if has_c_files(rockspec) then
> +      ok, err = fs.make_dir('support/testing/tests/package')
> +      if not ok then return nil, err end
>        generate_test(rockspec, fsname:lower())
>     end
>  
> 
