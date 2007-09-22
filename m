From: Tom <fivemiletom@gmail.com>
Date: Sat, 22 Sep 2007 02:09:50 -0700
Subject: [Buildroot] Buildroot and perforce.
In-Reply-To: <406A31B117F2734987636D6CCC93EE3CB05B69@ehost011-3.exch011.intermedia.net>
References: <406A31B117F2734987636D6CCC93EE3CB05B69@ehost011-3.exch011.intermedia.net>
Message-ID: <46F4DBDE.4010309@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Leonid wrote:
>>  + any config files your builroot uses which are easiest kept in a
> 
>>  sperate folder, [cfg].
> 
>>
> 
>  
> 
> What files do you mean? Pre-configured stuff for certain boards?

First, there is [br]/.config for the main buildroot configuration. This 
might in turn reference two more files *.config, one for uclibc and one 
for busybox, look in the main .config file.

>>  [br]/target.../..._skeleton.)
> 
>>
> 
>  
> 
> So, ...skeleton plays a role of "static" files which will be simply
> 
> copied into filesystem tree, right?

Right.

> Staging dir will hold toolchain itself (binaries/libraries) as far as I
> 
> know. Normally people won't modify toolchain. I even don't want
> 
> buildroot will create toolchain each and every time - is there an
> 
> "official" way to disable toolchain creation?

There is the "use external toolchain" option.
