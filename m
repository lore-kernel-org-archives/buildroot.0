From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 2 May 2020 12:01:45 +0200
Subject: [Buildroot] [PATCH 1/3] package/qemu: Bump to version 4.2.0
In-Reply-To: <87lfp2e30g.fsf@dell.be.48ers.dk>
References: <20200206190416.48560-1-aduskett@gmail.com>
 <87lfp2e30g.fsf@dell.be.48ers.dk>
Message-ID: <0eff2140-f84d-3a66-47a2-bc4ad726a3f3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, Adam, Guo,

Le 16/02/2020 ? 20:38, Peter Korsgaard a ?crit?:
>>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:
> 
>  > From: Adam Duskett <Aduskett@gmail.com>
>  > Other changes:
>  >   - Remove upstream patches
>  >   - Update COPYING.LIB hash as upstream updated the file to match the new LGPL
>  >     2.1 license from upstream. See:
>  >     https://github.com/qemu/qemu/commit/f0d44cc4462f112bce5ec556e87eff4eec682e39
> 
>  > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> 
> Committed after fixing the libssh2/libssh change, thanks.
> 

I just noticed that we have a qemu fork for csky cpus [1] but since this version
bump and libssh2/libssh change the build is broken.

The fork is based on Qemu 3.0.0 and I'm not sure we want to support all old
options. Note the github repository has been removed [2], so the only remaining
archive is located on http://sources.buildroot.net...

What do we do ? Remove the csky fork ? Nobody noticed the problem with 2020.02...

[1]
https://git.buildroot.net/buildroot/commit/?id=f816e5b276f1ef15840bec6667f1e8219717ab7d
[2] https://github.com/c-sky/qemu

Best regards,
Romain
