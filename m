From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 17 May 2015 14:08:23 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150517124934.20a9c661@free-electrons.com>
References: <20150517063017.77AD4100D35@stock.ovh.net>
 <20150517124934.20a9c661@free-electrons.com>
Message-ID: <555884B7.5030806@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 17/05/2015 12:49, Thomas Petazzoni a ?crit :
> Hello all,
> 
> On Sun, 17 May 2015 08:30:17 +0200 (CEST), Thomas Petazzoni wrote:
> 

[snip]

> 
>>       xtensa |           enlightenment-0.17.6 | NOK | http://autobuild.buildroot.net/results/c1ef3b4fae3ddf3206ee79141dc36bef50085b6a/
> 
> Max, can you have a look at this one?
> 

There is a patch for this one but with some comment on it:
http://patchwork.ozlabs.org/patch/470073/

The proposal was to disable ptrace for xtensa with uClibc/uClibc-ng toolchains,
but those toolchain can also be fixed by a patch like this one for PowerPC:
http://git.buildroot.net/buildroot/commit/?id=e0a4d9fa6fa68b95181fbaf1babcbb3cf2c9c63b

Or better yet, use the upstream commit made by Baruch Siach:
http://git.uclibc.org/uClibc/commit/?id=de6561f6669308e5d2297589b39a217d4c14df1c

Waldemar, can you have a look for uClibc-ng ?

Best regards,
Romain
