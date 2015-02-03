From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 20:30:19 +0100
Subject: [Buildroot] [PATCH 1/1] dropbear: add extra build customization
 options
In-Reply-To: <54D10B26.9000805@je-eigen-domein.nl>
References: <1410450212-30718-1-git-send-email-bos@je-eigen-domein.nl>
 <20150203150437.7d27225c@free-electrons.com>
 <54D10B26.9000805@je-eigen-domein.nl>
Message-ID: <20150203203019.153a2353@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Tue, 03 Feb 2015 18:53:42 +0100, Floris Bos wrote:

> > We'd however be open to merge the option to install or not the clients,
> > but we do have some comments/questions below.
> >
> >> +ifeq ($(BR2_PACKAGE_DROPBEAR_CLIENT),y)
> >>   DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
> >>   DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
> >>   		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
> >> -
> >> -DROPBEAR_LICENSE = MIT, BSD-2c-like, BSD-2c
> >> -DROPBEAR_LICENSE_FILES = LICENSE
> >> +else
> >> +DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
> >> +DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
> >> +		PROGRAMS="dropbear dropbearkey dropbearconvert scp"
> >> +endif
> > Why is scp part of the server-only installation?
> 
> Because scp is both a client and server program, similar to other 
> programs that can tunnel data over SSH like rsync.
> When using scp on the client, it simply calls the ssh client program to 
> connect to the SSH server and executes scp server-side there with a flag 
> to tell it to play server and read further instructions/data from stdin, 
> send data to stdout.

Ah, ok. Can you indicate that in the commit log, or maybe better, as a
comment in the code above the place where we defined what gets built
for the server-only case vs. server+client case?

> Do could make building scp a seperate Config.in option.

I don't think that's needed.

So, can you cook an updated patch?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
