From: Vadim Kochan <vadim4j@gmail.com>
Date: Fri, 18 Jan 2019 13:49:43 +0200
Subject: [Buildroot] [PATCH v5 1/4] libopenssl: bump version to 1.1.1a
In-Reply-To: <CAKKE0ZG54aPrwtbCiPKogDTHJfgha_x1iR1bBnhVQ4H0bp4q5g@mail.gmail.com>
References: <20190117181608.12644-1-ps.report@gmx.net>
 <CAKKE0ZG54aPrwtbCiPKogDTHJfgha_x1iR1bBnhVQ4H0bp4q5g@mail.gmail.com>
Message-ID: <20190118114943.j5jdw7nzzl2cddnu@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 18, 2019 at 12:27:22PM +0100, Patrick Havelange wrote:
> Hello,
> 
> I'm working on fixing packages that do not work with the new openssl version,
> For the moment I'm preparing an update for the package thrift (still a
> WIP as i type this).
> I've setup a gitlab repo with my current work in progress
> (https://gitlab.com/essensium-mind/buildroot/branches/mind-opensslissues-*).
> 
> Regarding the packages that do fail, some are indeed already known :
> - android tools,
> - softether,
> I've also stumbled across those (for the moment) :
> - pound
> - ibrdtnd
> - thrift (I have a version bump patch ready for this one)
> 
> I also saw that in some cases the new openssl does not build (e.g.
> br-xtensa-full) :
> In file included from crypto/async/arch/../async_locl.h:30:0,
>                  from crypto/async/arch/async_posix.c:11:
> crypto/async/arch/../arch/async_posix.h:32:5: error: unknown type name
> 'ucontext_t'
>      ucontext_t fibre;
>      ^~~~~~~~~~
> 
> This should be fixed before merging.
> 
> Regards,
> 
> Patrick Havelange.
> 

Hi Patrick,

Can you please provide info how to trigger this build for br-xtensa-full locally
to check this compilation issue ?

Thanks,
Vadim Kochan
