From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 10:56:12 +0200
Subject: [Buildroot] [PATCH 1/2] rabbitmq-server: new package
In-Reply-To: <1476215129-29979-1-git-send-email-fhunleth@troodon-software.com>
 (Frank Hunleth's message of "Tue, 11 Oct 2016 15:45:28 -0400")
References: <1476215129-29979-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <87funyt2hf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

 > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
 > ---
 >  package/Config.in                            |  1 +
 >  package/rabbitmq-server/Config.in            | 11 +++++++++++
 >  package/rabbitmq-server/rabbitmq-server.hash |  2 ++
 >  package/rabbitmq-server/rabbitmq-server.mk   | 29 ++++++++++++++++++++++++++++
 >  4 files changed, 43 insertions(+)
 >  create mode 100644 package/rabbitmq-server/Config.in
 >  create mode 100644 package/rabbitmq-server/rabbitmq-server.hash
 >  create mode 100644 package/rabbitmq-server/rabbitmq-server.mk

Thanks. I don't know much about erlang and rabbitmq, but the
installation paths seems kind of odd to me:

find target -type f -perm -u=x -name rabbitmq\*
target/usr/lib/erlang/lib/rabbitmq_server-3.6.1/sbin/rabbitmqctl
target/usr/lib/erlang/lib/rabbitmq_server-3.6.1/sbin/rabbitmq-server
target/usr/lib/erlang/lib/rabbitmq_server-3.6.1/sbin/rabbitmq-env
target/usr/lib/erlang/lib/rabbitmq_server-3.6.1/sbin/rabbitmq-defaults
target/usr/lib/erlang/lib/rabbitmq_server-3.6.1/sbin/rabbitmq-plugins

Looking at the Debian package, they install the programs into /usr/sbin:

https://packages.debian.org/stretch/all/rabbitmq-server/filelist

It would also be good if you could add an init script to the package.

 > +RABBITMQ_SERVER_VERSION = 3.6.1
 > +RABBITMQ_SERVER_SITE = http://www.rabbitmq.com/releases/rabbitmq-server/v$(RABBITMQ_SERVER_VERSION)
 > +RABBITMQ_SERVER_SOURCE = rabbitmq-server-$(RABBITMQ_SERVER_VERSION).tar.xz
 > +RABBITMQ_SERVER_LICENSE = Apache-2.0, BSD-2c, EPL, MIT, MPLv1.1, MPLv2.0
 > +RABBITMQ_SERVER_LICENSE_FILES = LICENSE LICENSE-APACHE2-ExplorerCanvas \
 > +				LICENSE-APL2-Rebar LICENSE-APL2-Stomp-Websocket \
 > +				LICENSE-BSD-base64js LICENSE-BSD-glMatrix \
 > +				LICENSE-EPL-OTP LICENSE-MIT-EJS10 \
 > +				LICENSE-MIT-Flot LICENSE-MIT-jQuery164 \
 > +				LICENSE-MIT-Mochi LICENSE-MIT-Mochiweb \
 > +				LICENSE-MIT-Sammy060 LICENSE-MIT-SockJS \
 > +				LICENSE-MPL2 LICENSE-MPL-RabbitMQ

The license details are quite complicated. Perhaps we should list
MPLv1.1 first as that seems to be the "main" license according to the
LICENSE file.

-- 
Bye, Peter Korsgaard
