From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Dec 2011 20:25:42 +0100
Subject: [Buildroot] [PATCH v4] Add package connman
In-Reply-To: <1323127621-10775-1-git-send-email-zonque@gmail.com> (Daniel
 Mack's message of "Tue, 6 Dec 2011 00:27:01 +0100")
References: <877h2asivx.fsf@macbook.be.48ers.dk>
 <1323127621-10775-1-git-send-email-zonque@gmail.com>
Message-ID: <87iplschft.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:

 Daniel> The ConnMan project provides a daemon for managing internet
 Daniel> connections within embedded devices running the Linux operating
 Daniel> system. The Connection Manager is designed to be slim and to
 Daniel> use as few resources as possible, so it can be easily
 Daniel> integrated. It is a fully modular system that can be extended,
 Daniel> through plug-ins, to support all kinds of wired or wireless
 Daniel> technologies. Also, configuration methods, like DHCP and domain
 Daniel> name resolving, are implemented using plug-ins. The plug-in
 Daniel> approach allows for easy adaption and modification for various
 Daniel> use cases.

Thanks, committed with minor changes:

 - The Kconfig logic to only enable on glibc/eglibc/uclibc snapshot
 - Use start-stop-daemon in initscript
 - Install client/cm to target if --enable-client is used

-- 
Bye, Peter Korsgaard
