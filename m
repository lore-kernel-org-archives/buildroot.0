From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 20 Jun 2014 10:27:43 +0200
Subject: [Buildroot] [PATCH] Makefile: document make <package>-dirclean
In-Reply-To: <20140619182648.GB3534@free.fr>
References: <1403199888-24237-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <20140619182648.GB3534@free.fr>
Message-ID: <53A3F07F.8040006@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

Yann E. MORIN wrote:
> Vivien, All,
>
> On 2014-06-19 13:44 -0400, Vivien Didelot spake thusly:
>> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
>> ---
>>   Makefile | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Makefile b/Makefile
>> index a2681f6..81da5ae 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -849,6 +849,7 @@ help:
>>   	@echo '  toolchain              - build toolchain'
>>   	@echo '  <package>-rebuild      - force recompile <package>'
>>   	@echo '  <package>-reconfigure  - force reconfigure <package>'
>> +	@echo '  <package>-dirclean     - remove the whole <package> build directory'
>
> I'm not specifically opposed to this, but then we are still missing
> quite a few package-specific actions, of which the full list is
> available in the manual:
>      http://buildroot.net/downloads/manual/manual.html#pkg-build-steps
>
> Also, it is explained in details in the manual how (and when) to rebuild
> a package:
>      http://buildroot.net/downloads/manual/manual.html#rebuild-pkg
>
> Excerpt:
>      You can ask buildroot to [remove the package directory] with the
>      "make <package>-dirclean" command.
>
> I believe we should only document the _very important_ commands in the
> 'make help' text, and direct the user to the manual for the others. E.g.
> something like:
>
>      $ make help
>      [...]
>      Build:
>        all                    - make world
>        toolchain              - build toolchain
>        <package>-rebuild      - force recompile <package>
>        <package>-reconfigure  - force reconfigure <package>
>        <package>-graph-depends    - generate graph of the dependency tree for package
>          See the manual [http://buildroot.net/downloads/manual/manual.html] for
>          the complete list of per-package build actions.
>      [...]

I'm not entering the discussion about how many targets to put in make
help, but I agree that adding the manual URL here would be useful.

However I'd put http://buildroot.net/docs.html instead, because:
  - it's more concise;
  - it allows reading in other formats than HTML, and for nightlies too;
  - http://buildroot.net/downloads/manual/manual.html is long and ugly,
    and having the online HTML manual under "downloads" is kind of weird;
    I think we already discuss moving it to e.g. buildroot.net/manual
    or buildroot.net/docs or similar, so it may change in the future,
    while buildroot.net/docs.html is likely to stay for the forseeable
    future.

Maybe Samuel or ThomasDS were involved in that discussion?

-- 
Luca
