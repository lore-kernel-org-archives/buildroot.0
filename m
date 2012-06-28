From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Jun 2012 09:06:18 -0300
Subject: [Buildroot] RPC support for modern (e)glibc toolchains
In-Reply-To: <20120628135744.09fc059f@skate>
References: <20120627000701.506f534e@skate>
 <359dafd382a8aa5ccaaa5ebbde9b38ff@zacarias.com.ar>
 <20120627145340.34895a74@skate> <4FEC453F.3050309@zacarias.com.ar>
 <20120628135744.09fc059f@skate>
Message-ID: <4FEC48BA.40807@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/28/12 08:57, Thomas Petazzoni wrote:

> Hm? Not sure to understand what you mean here.
> 
> Regardless of whether my option (1) or my option (2) is chosen, the
> number of options will be the same. It is just that:
> 
>  With option (1), if the toolchain does not have native RPC support,
>  then all packages that need RPC support will immediately be visible,
>  and will automatically select the libtirpc package. So it's fully
>  transparent for users.
> 
>  With option (2), if the toolchain does not have native RPC support,
>  then all packages that need RPC support will be hidden, and the user
>  will have to enable the libtirpc package to see them.
> 
> So really, even with option (1) there is no such thing as "RPC options
> all around instead of one place".
> 
> Note: by this, I am not implying that I have a preference for option
> (1), I am just explaining a bit more, because it seems we're not
> seeing the same thing :)

Or i'm still pretty much tired this week still recovering from a severe
cold :)
The first option gives the alternate choice in packages (selecting
libtirpc) hence why i'm not a big fan.
I'd rather keep the solution in the toolchain options for now since
libtirpc is the only available option AFAIK when (e)glibc lacks RPC so
no need to handle it at the moment.

> Do we want to support that? I guess what you meant is that regardless
> of whether the toolchain has RPC support we can always enable
> libtirpc, so that in the ct-ng backend case we don't have to worry
> about this?
> 
> Ultimately, this is what will probably happen: RPC support will no
> longer be seen as a toolchain capability, but just as a normal library.
> But we're not there yet.

Yes that's the idea, but maybe in the future as you say.
AFAIK the "big" benefit of libtirpc for nfs-utils is enabling NFSv4+
support, which needs rpcbind (new) and libnfsidmap (new).
Other than some NAS project i'd say "any RPC" is enough.
Regards.
