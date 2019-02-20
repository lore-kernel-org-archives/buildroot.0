From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Feb 2019 23:39:59 +0100
Subject: [Buildroot] [PATCH 2/2] package/rabbitmq-c: needs dynamic
 library
In-Reply-To: <20190218114434.10741-2-fontaine.fabrice@gmail.com>
References: <20190218114434.10741-1-fontaine.fabrice@gmail.com>
 <20190218114434.10741-2-fontaine.fabrice@gmail.com>
Message-ID: <d320bfd8-9b10-6916-a8c9-bb211ae7a8f5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/02/2019 12:44, Fabrice Fontaine wrote:
> syslog-ng expects that rabbitmq-c is built with openssl support however
> currently we're disabling openssl on rabbitmq-c in static build.
> 
> To fix this issue, add a dependency on dynamic library on rabbitmq-c and
> its reverse dependencies (only BR2_PACKAGE_JANUS_GATEWAY_RABBITMQ as
> php-amqp already depends on dynamic library)

 Actually, janus-gateway also depends on !STATIC already. But the other
transports have the !STATIC dependeny explicitly again, so it makes sense to add
it for rabbitmq too.

 Note that this patch essentially reverts Thomas' attempt to fix static build in
beb6524225f, almost two years ago. I expect Thomas was just fixing autobuild
results and doesn't actually need a statically linked rabbitmq.

Note also that the CMake bug report [1] has seen no progress since then.

 Therefore, applied to master, thanks.

 Regards,
 Arnout

[1] https://gitlab.kitware.com/cmake/cmake/issues/16885.


> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fce91b98fb199a26ad5f5f726c9bdec4f9d64486
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
